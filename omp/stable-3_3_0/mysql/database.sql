-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

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
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,3,3,'2025-07-19 05:17:37'),(2,1,1,3,1,3,2,'2025-07-19 05:17:43'),(3,2,0,1,0,3,3,'2025-07-19 05:18:40'),(4,4,0,1,0,3,1,'2025-07-19 05:19:59'),(5,4,3,2,1,3,3,'2025-07-19 05:20:06'),(6,4,4,3,1,3,2,'2025-07-19 05:20:13'),(7,4,0,4,0,3,7,'2025-07-19 05:20:19'),(8,5,0,1,0,3,1,'2025-07-19 05:20:56'),(9,5,5,2,1,3,3,'2025-07-19 05:21:02'),(10,5,6,3,1,3,2,'2025-07-19 05:21:08'),(11,5,0,4,0,3,7,'2025-07-19 05:21:14'),(12,6,0,1,0,3,1,'2025-07-19 05:22:14'),(13,6,7,2,1,6,15,'2025-07-19 05:22:23'),(14,7,0,1,0,3,3,'2025-07-19 05:23:21'),(15,7,8,3,1,3,2,'2025-07-19 05:23:28'),(16,9,0,1,0,3,1,'2025-07-19 05:24:32'),(17,11,0,1,0,3,1,'2025-07-19 05:25:32'),(18,11,10,2,1,3,3,'2025-07-19 05:25:38'),(19,11,11,3,1,3,2,'2025-07-19 05:26:02'),(20,12,0,1,0,3,1,'2025-07-19 05:26:50'),(21,13,0,1,0,3,1,'2025-07-19 05:27:48'),(22,13,13,2,1,3,3,'2025-07-19 05:27:54'),(23,13,14,3,1,3,2,'2025-07-19 05:28:27'),(24,14,0,1,0,3,1,'2025-07-19 05:29:11'),(25,14,15,2,1,3,3,'2025-07-19 05:29:17'),(26,14,16,3,1,3,2,'2025-07-19 05:29:25'),(27,14,0,4,0,3,7,'2025-07-19 05:29:31'),(28,15,0,1,0,3,3,'2025-07-19 05:30:33'),(29,16,0,1,0,3,3,'2025-07-19 05:31:04'),(30,17,0,1,0,3,1,'2025-07-19 05:32:31');
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
INSERT INTO `email_log` VALUES (1,1048585,1,19,'2025-07-19 05:17:34',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Arthur Clark:<br />\n<br />\nThank you for submitting the manuscript, &quot;The ABCs of Human Survival: A Paradigm for Global Citizenship&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/1\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a><br />\nUsername: aclark<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(2,1048585,1,3,'2025-07-19 05:17:42',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(3,1048585,1,3,'2025-07-19 05:17:43',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Arthur Clark:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"The ABCs of Human Survival: A Paradigm for Global Citizenship\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(4,1048585,2,20,'2025-07-19 05:18:36',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Alvin Finkel:<br />\n<br />\nThank you for submitting the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/2\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/2</a><br />\nUsername: afinkel<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(5,1048585,2,20,'2025-07-19 05:18:36',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(6,1048585,2,3,'2025-07-19 05:18:46',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(7,1048585,2,3,'2025-07-19 05:18:51',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(8,1048585,3,21,'2025-07-19 05:19:17',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Bob Barnetson:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Political Economy of Workplace Injury in Canada&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/3\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/3</a><br />\nUsername: bbarnetson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(9,1048585,4,22,'2025-07-19 05:19:55',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Bart Beaty:<br />\n<br />\nThank you for submitting the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/4\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a><br />\nUsername: bbeaty<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(10,1048585,4,22,'2025-07-19 05:19:55',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(11,1048585,4,3,'2025-07-19 05:20:04',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(12,1048585,4,3,'2025-07-19 05:20:06',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>, \"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"How Canadians Communicate: Contexts of Canadian Popular Culture\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(13,1048585,4,3,'2025-07-19 05:20:11',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(14,1048585,4,3,'2025-07-19 05:20:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>, \"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"How Canadians Communicate: Contexts of Canadian Popular Culture\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(15,1048585,4,3,'2025-07-19 05:20:19',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>, \"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>The editing of your manuscript, \"How Canadians Communicate: Contexts of Canadian Popular Culture,\" is complete. We are now sending it to production.<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(16,1048585,5,23,'2025-07-19 05:20:53',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Chantal Allan:<br />\n<br />\nThank you for submitting the manuscript, &quot;Bomb Canada and Other Unkind Remarks in the American Media&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/5\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a><br />\nUsername: callan<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(17,1048585,5,3,'2025-07-19 05:21:01',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(18,1048585,5,3,'2025-07-19 05:21:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Chantal Allan:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Bomb Canada and Other Unkind Remarks in the American Media\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(19,1048585,5,3,'2025-07-19 05:21:07',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(20,1048585,5,3,'2025-07-19 05:21:09',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Chantal Allan:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Bomb Canada and Other Unkind Remarks in the American Media\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(21,1048585,5,3,'2025-07-19 05:21:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Chantal Allan:<br><br>The editing of your manuscript, \"Bomb Canada and Other Unkind Remarks in the American Media,\" is complete. We are now sending it to production.<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(22,1048585,6,24,'2025-07-19 05:22:10',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>',NULL,'dbuskins@mailinator.com','[JPK] Submission Acknowledgement','Deborah Bernnard:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/6\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/6</a><br />\nUsername: dbernnard<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(23,1048585,6,24,'2025-07-19 05:22:10',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(24,1048585,6,6,'2025-07-19 05:22:23',805306372,'\"Minoti Inoue\" <minoue@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>',NULL,NULL,'[JPK] Editor Recommendation','<p>Daniel Barnes, David Buskins:<br><br>The recommendation regarding the submission to Public Knowledge Press, \"The Information Literacy User’s Guide\" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(25,1048585,7,25,'2025-07-19 05:23:16',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Dietmar Kennepohl:<br />\n<br />\nThank you for submitting the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/7\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a><br />\nUsername: dkennepohl<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(26,1048585,7,25,'2025-07-19 05:23:16',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(27,1048585,7,3,'2025-07-19 05:23:27',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(28,1048585,7,3,'2025-07-19 05:23:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>, \"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Dietmar Kennepohl; Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Accessible Elements: Teaching Science Online and at a Distance\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(29,1048585,8,3,'2025-07-19 05:23:40',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Daniel Barnes:<br />\n<br />\nThank you for submitting the manuscript, &quot;Editorial&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/8\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/8</a><br />\nUsername: dbarnes<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(30,1048585,9,26,'2025-07-19 05:24:27',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>',NULL,'dbuskins@mailinator.com','[JPK] Submission Acknowledgement','Fernando Perini:<br />\n<br />\nThank you for submitting the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/9\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/9</a><br />\nUsername: fperini<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(31,1048585,9,26,'2025-07-19 05:24:27',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(32,1048585,10,27,'2025-07-19 05:25:14',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Jennifer Brower:<br />\n<br />\nThank you for submitting the manuscript, &quot;Lost Tracks: Buffalo National Park, 1909-1939&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/10\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/10</a><br />\nUsername: jbrower<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(33,1048585,11,28,'2025-07-19 05:25:28',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Jonathan Locke Hart:<br />\n<br />\nThank you for submitting the manuscript, &quot;Dreamwork&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/11\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a><br />\nUsername: jlockehart<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(34,1048585,11,3,'2025-07-19 05:25:36',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(35,1048585,11,3,'2025-07-19 05:25:38',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Jonathan Locke Hart:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Dreamwork\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(36,1048585,11,3,'2025-07-19 05:25:42',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(37,1048585,11,3,'2025-07-19 05:25:46',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(38,1048585,11,10,'2025-07-19 05:25:48',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-08-16, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(39,1048585,11,12,'2025-07-19 05:25:54',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-08-16, if not before.<br />\n<br />\nGonzalo Favio<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(40,1048585,11,3,'2025-07-19 05:26:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Jonathan Locke Hart:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Dreamwork\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(41,1048585,12,29,'2025-07-19 05:26:45',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Laurent Elder:<br />\n<br />\nThank you for submitting the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/12\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/12</a><br />\nUsername: lelder<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(42,1048585,12,29,'2025-07-19 05:26:45',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(43,1048585,12,3,'2025-07-19 05:26:56',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(44,1048585,12,3,'2025-07-19 05:27:00',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(45,1048585,12,3,'2025-07-19 05:27:05',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(46,1048585,12,8,'2025-07-19 05:27:08',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-08-16, if not before.<br />\n<br />\nPaul Hudson<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(47,1048585,13,30,'2025-07-19 05:27:43',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Mohamed Ally:<br />\n<br />\nThank you for submitting the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/13\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a><br />\nUsername: mally<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(48,1048585,13,30,'2025-07-19 05:27:43',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(49,1048585,13,3,'2025-07-19 05:27:52',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(50,1048585,13,3,'2025-07-19 05:27:54',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>, \"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Mohamed Ally; John Traxler, Marguerite Koole, Torstein Rekkedal:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Mobile Learning: Transforming the Delivery of Education and Training\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(51,1048585,13,3,'2025-07-19 05:27:59',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(52,1048585,13,3,'2025-07-19 05:28:03',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(53,1048585,13,3,'2025-07-19 05:28:07',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(54,1048585,13,10,'2025-07-19 05:28:10',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-08-16, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(55,1048585,13,12,'2025-07-19 05:28:16',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-08-16, if not before.<br />\n<br />\nGonzalo Favio<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(56,1048585,13,3,'2025-07-19 05:28:27',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>, \"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Mohamed Ally; John Traxler, Marguerite Koole, Torstein Rekkedal:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Mobile Learning: Transforming the Delivery of Education and Training\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(57,1048585,14,31,'2025-07-19 05:29:05',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Michael Dawson:<br />\n<br />\nThank you for submitting the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/14\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a><br />\nUsername: mdawson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(58,1048585,14,31,'2025-07-19 05:29:05',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(59,1048585,14,3,'2025-07-19 05:29:16',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(60,1048585,14,3,'2025-07-19 05:29:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>, \"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(61,1048585,14,3,'2025-07-19 05:29:23',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(62,1048585,14,3,'2025-07-19 05:29:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>, \"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(63,1048585,14,3,'2025-07-19 05:29:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>, \"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>The editing of your manuscript, \"From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots,\" is complete. We are now sending it to production.<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(64,1048585,15,32,'2025-07-19 05:30:29',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Max Foran:<br />\n<br />\nThank you for submitting the manuscript, &quot;Expansive Discourses: Urban Sprawl in Calgary, 1945-1978&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/15\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/15</a><br />\nUsername: mforan<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(65,1048585,16,33,'2025-07-19 05:30:59',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Michael Power:<br />\n<br />\nThank you for submitting the manuscript, &quot;A Designer\'s Log: Case Studies in Instructional Design&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/16\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/16</a><br />\nUsername: mpower<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(66,1048585,16,3,'2025-07-19 05:31:08',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(67,1048585,16,3,'2025-07-19 05:31:12',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(68,1048585,16,3,'2025-07-19 05:31:15',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(69,1048585,16,10,'2025-07-19 05:31:18',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer\'s Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2025-08-16, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(70,1048585,17,34,'2025-07-19 05:32:25',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Matthew Smith:<br />\n<br />\nThank you for submitting the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/17\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/17</a><br />\nUsername: msmith<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(71,1048585,17,34,'2025-07-19 05:32:25',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(72,1048585,17,3,'2025-07-19 05:32:37',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(73,1048585,17,3,'2025-07-19 05:32:42',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2025-08-16 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2025-08-16.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>');
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
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'USER_REGISTER',0,1,NULL,NULL,NULL),(5,'USER_VALIDATE',0,1,NULL,NULL,NULL),(6,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),(7,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(8,'SUBMISSION_ACK',1,1,NULL,65536,1),(9,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),(10,'EDITOR_ASSIGN',1,1,16,16,1),(11,'REVIEW_CANCEL',1,1,16,4096,3),(12,'REVIEW_REINSTATE',1,1,16,4096,3),(13,'REVIEW_REQUEST',1,1,16,4096,3),(14,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),(15,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096,3),(16,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(17,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),(18,'REVIEW_CONFIRM',1,1,4096,16,3),(19,'REVIEW_DECLINE',1,1,4096,16,3),(20,'REVIEW_ACK',1,1,16,4096,3),(21,'REVIEW_REMIND',0,1,16,4096,3),(22,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),(23,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),(24,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(25,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),(26,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),(27,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),(28,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),(29,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),(30,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),(31,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),(32,'EDITOR_RECOMMENDATION',0,1,16,16,3),(33,'COPYEDIT_REQUEST',1,1,16,4097,4),(34,'LAYOUT_REQUEST',1,1,16,4097,5),(35,'LAYOUT_COMPLETE',1,1,4097,16,5),(36,'INDEX_REQUEST',1,1,16,4097,5),(37,'INDEX_COMPLETE',1,1,4097,16,5),(38,'EMAIL_LINK',0,1,1048576,NULL,NULL),(39,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(40,'ANNOUNCEMENT',0,1,16,1048576,NULL),(41,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL),(42,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2025-07-19 05:17:21',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2025-07-19 05:17:21',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2025-07-19 05:17:22',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2025-07-19 05:17:22',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2025-07-19 05:17:22',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2025-07-19 05:17:22',1342177296,'submission.event.fileEdited',0),(7,1048585,1,19,'2025-07-19 05:17:33',268435458,'submission.event.general.metadataUpdated',0),(8,1048585,1,19,'2025-07-19 05:17:34',268435457,'submission.event.submissionSubmitted',0),(9,1048585,1,3,'2025-07-19 05:17:37',805306371,'log.editor.decision',0),(10,515,2,3,'2025-07-19 05:17:37',1342177281,'submission.event.fileUploaded',0),(11,1048585,1,3,'2025-07-19 05:17:37',1342177288,'submission.event.fileRevised',0),(12,1048585,1,3,'2025-07-19 05:17:41',1073741825,'log.review.reviewerAssigned',0),(13,1048585,1,3,'2025-07-19 05:17:43',805306371,'log.editor.decision',0),(14,1048585,1,3,'2025-07-19 05:17:46',268435459,'submission.event.participantAdded',0),(15,1048585,2,20,'2025-07-19 05:17:52',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,20,'2025-07-19 05:17:52',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,20,'2025-07-19 05:17:53',1342177281,'submission.event.fileUploaded',0),(18,1048585,2,20,'2025-07-19 05:17:53',1342177288,'submission.event.fileRevised',0),(19,515,3,20,'2025-07-19 05:17:53',1342177296,'submission.event.fileEdited',0),(20,1048585,2,20,'2025-07-19 05:17:53',1342177296,'submission.event.fileEdited',0),(21,515,4,20,'2025-07-19 05:17:53',1342177281,'submission.event.fileUploaded',0),(22,1048585,2,20,'2025-07-19 05:17:53',1342177288,'submission.event.fileRevised',0),(23,515,4,20,'2025-07-19 05:17:53',1342177296,'submission.event.fileEdited',0),(24,1048585,2,20,'2025-07-19 05:17:53',1342177296,'submission.event.fileEdited',0),(25,515,5,20,'2025-07-19 05:17:53',1342177281,'submission.event.fileUploaded',0),(26,1048585,2,20,'2025-07-19 05:17:54',1342177288,'submission.event.fileRevised',0),(27,515,5,20,'2025-07-19 05:17:54',1342177296,'submission.event.fileEdited',0),(28,1048585,2,20,'2025-07-19 05:17:54',1342177296,'submission.event.fileEdited',0),(29,515,6,20,'2025-07-19 05:17:54',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2025-07-19 05:17:54',1342177288,'submission.event.fileRevised',0),(31,515,6,20,'2025-07-19 05:17:54',1342177296,'submission.event.fileEdited',0),(32,1048585,2,20,'2025-07-19 05:17:54',1342177296,'submission.event.fileEdited',0),(33,1048585,2,20,'2025-07-19 05:17:57',268435458,'submission.event.general.metadataUpdated',0),(34,1048585,2,20,'2025-07-19 05:17:59',268435458,'submission.event.general.metadataUpdated',0),(35,1048585,2,20,'2025-07-19 05:18:01',268435458,'submission.event.general.metadataUpdated',0),(36,1048585,2,20,'2025-07-19 05:18:03',268435458,'submission.event.general.metadataUpdated',0),(37,1048585,2,20,'2025-07-19 05:18:06',268435458,'submission.event.general.metadataUpdated',0),(38,1048585,2,20,'2025-07-19 05:18:08',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,2,20,'2025-07-19 05:18:10',268435458,'submission.event.general.metadataUpdated',0),(40,1048585,2,20,'2025-07-19 05:18:35',268435458,'submission.event.general.metadataUpdated',0),(41,1048585,2,20,'2025-07-19 05:18:36',268435457,'submission.event.submissionSubmitted',0),(42,1048585,2,3,'2025-07-19 05:18:40',805306371,'log.editor.decision',0),(43,1048585,2,3,'2025-07-19 05:18:46',1073741825,'log.review.reviewerAssigned',0),(44,1048585,2,3,'2025-07-19 05:18:51',1073741825,'log.review.reviewerAssigned',0),(45,1048585,3,21,'2025-07-19 05:18:57',268435458,'submission.event.general.metadataUpdated',0),(46,1048585,3,21,'2025-07-19 05:18:57',268435458,'submission.event.general.metadataUpdated',0),(47,515,7,21,'2025-07-19 05:18:57',1342177281,'submission.event.fileUploaded',0),(48,1048585,3,21,'2025-07-19 05:18:57',1342177288,'submission.event.fileRevised',0),(49,515,7,21,'2025-07-19 05:18:58',1342177296,'submission.event.fileEdited',0),(50,1048585,3,21,'2025-07-19 05:18:58',1342177296,'submission.event.fileEdited',0),(51,1048585,3,21,'2025-07-19 05:19:16',268435458,'submission.event.general.metadataUpdated',0),(52,1048585,3,21,'2025-07-19 05:19:17',268435457,'submission.event.submissionSubmitted',0),(53,1048585,4,22,'2025-07-19 05:19:22',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,4,22,'2025-07-19 05:19:22',268435458,'submission.event.general.metadataUpdated',0),(55,515,8,22,'2025-07-19 05:19:23',1342177281,'submission.event.fileUploaded',0),(56,1048585,4,22,'2025-07-19 05:19:23',1342177288,'submission.event.fileRevised',0),(57,515,8,22,'2025-07-19 05:19:23',1342177296,'submission.event.fileEdited',0),(58,1048585,4,22,'2025-07-19 05:19:23',1342177296,'submission.event.fileEdited',0),(59,515,9,22,'2025-07-19 05:19:23',1342177281,'submission.event.fileUploaded',0),(60,1048585,4,22,'2025-07-19 05:19:23',1342177288,'submission.event.fileRevised',0),(61,515,9,22,'2025-07-19 05:19:23',1342177296,'submission.event.fileEdited',0),(62,1048585,4,22,'2025-07-19 05:19:23',1342177296,'submission.event.fileEdited',0),(63,515,10,22,'2025-07-19 05:19:24',1342177281,'submission.event.fileUploaded',0),(64,1048585,4,22,'2025-07-19 05:19:24',1342177288,'submission.event.fileRevised',0),(65,515,10,22,'2025-07-19 05:19:24',1342177296,'submission.event.fileEdited',0),(66,1048585,4,22,'2025-07-19 05:19:24',1342177296,'submission.event.fileEdited',0),(67,515,11,22,'2025-07-19 05:19:24',1342177281,'submission.event.fileUploaded',0),(68,1048585,4,22,'2025-07-19 05:19:24',1342177288,'submission.event.fileRevised',0),(69,515,11,22,'2025-07-19 05:19:24',1342177296,'submission.event.fileEdited',0),(70,1048585,4,22,'2025-07-19 05:19:24',1342177296,'submission.event.fileEdited',0),(71,1048585,4,22,'2025-07-19 05:19:27',268435458,'submission.event.general.metadataUpdated',0),(72,1048585,4,22,'2025-07-19 05:19:30',268435458,'submission.event.general.metadataUpdated',0),(73,1048585,4,22,'2025-07-19 05:19:32',268435458,'submission.event.general.metadataUpdated',0),(74,1048585,4,22,'2025-07-19 05:19:54',268435458,'submission.event.general.metadataUpdated',0),(75,1048585,4,22,'2025-07-19 05:19:55',268435457,'submission.event.submissionSubmitted',0),(76,1048585,4,3,'2025-07-19 05:19:59',805306371,'log.editor.decision',0),(77,515,12,3,'2025-07-19 05:19:59',1342177281,'submission.event.fileUploaded',0),(78,1048585,4,3,'2025-07-19 05:19:59',1342177288,'submission.event.fileRevised',0),(79,515,13,3,'2025-07-19 05:19:59',1342177281,'submission.event.fileUploaded',0),(80,1048585,4,3,'2025-07-19 05:19:59',1342177288,'submission.event.fileRevised',0),(81,515,14,3,'2025-07-19 05:19:59',1342177281,'submission.event.fileUploaded',0),(82,1048585,4,3,'2025-07-19 05:19:59',1342177288,'submission.event.fileRevised',0),(83,515,15,3,'2025-07-19 05:19:59',1342177281,'submission.event.fileUploaded',0),(84,1048585,4,3,'2025-07-19 05:19:59',1342177288,'submission.event.fileRevised',0),(85,1048585,4,3,'2025-07-19 05:20:04',1073741825,'log.review.reviewerAssigned',0),(86,1048585,4,3,'2025-07-19 05:20:06',805306371,'log.editor.decision',0),(87,1048585,4,3,'2025-07-19 05:20:11',1073741825,'log.review.reviewerAssigned',0),(88,1048585,4,3,'2025-07-19 05:20:13',805306371,'log.editor.decision',0),(89,1048585,4,3,'2025-07-19 05:20:17',268435459,'submission.event.participantAdded',0),(90,1048585,4,3,'2025-07-19 05:20:19',805306371,'log.editor.decision',0),(91,1048585,4,3,'2025-07-19 05:20:23',268435459,'submission.event.participantAdded',0),(92,1048585,5,23,'2025-07-19 05:20:29',268435458,'submission.event.general.metadataUpdated',0),(93,1048585,5,23,'2025-07-19 05:20:29',268435458,'submission.event.general.metadataUpdated',0),(94,515,16,23,'2025-07-19 05:20:30',1342177281,'submission.event.fileUploaded',0),(95,1048585,5,23,'2025-07-19 05:20:30',1342177288,'submission.event.fileRevised',0),(96,515,16,23,'2025-07-19 05:20:30',1342177296,'submission.event.fileEdited',0),(97,1048585,5,23,'2025-07-19 05:20:30',1342177296,'submission.event.fileEdited',0),(98,1048585,5,23,'2025-07-19 05:20:52',268435458,'submission.event.general.metadataUpdated',0),(99,1048585,5,23,'2025-07-19 05:20:53',268435457,'submission.event.submissionSubmitted',0),(100,1048585,5,3,'2025-07-19 05:20:56',805306371,'log.editor.decision',0),(101,515,17,3,'2025-07-19 05:20:56',1342177281,'submission.event.fileUploaded',0),(102,1048585,5,3,'2025-07-19 05:20:56',1342177288,'submission.event.fileRevised',0),(103,1048585,5,3,'2025-07-19 05:21:01',1073741825,'log.review.reviewerAssigned',0),(104,1048585,5,3,'2025-07-19 05:21:02',805306371,'log.editor.decision',0),(105,1048585,5,3,'2025-07-19 05:21:07',1073741825,'log.review.reviewerAssigned',0),(106,1048585,5,3,'2025-07-19 05:21:08',805306371,'log.editor.decision',0),(107,1048585,5,3,'2025-07-19 05:21:12',268435459,'submission.event.participantAdded',0),(108,1048585,5,3,'2025-07-19 05:21:14',805306371,'log.editor.decision',0),(109,1048585,5,3,'2025-07-19 05:21:18',268435459,'submission.event.participantAdded',0),(110,1048585,5,3,'2025-07-19 05:21:21',268435459,'submission.event.participantAdded',0),(111,1048585,5,3,'2025-07-19 05:21:24',268435474,'submission.event.publicationFormatCreated',0),(112,515,18,3,'2025-07-19 05:21:26',1342177281,'submission.event.fileUploaded',0),(113,1048585,5,3,'2025-07-19 05:21:26',1342177288,'submission.event.fileRevised',0),(114,1048585,5,3,'2025-07-19 05:21:27',268435464,'submission.event.publicationFormatPublished',0),(115,1048585,5,3,'2025-07-19 05:21:29',268435476,'submission.event.publicationFormatMadeAvailable',0),(116,515,18,3,'2025-07-19 05:21:30',1342177296,'submission.event.fileEdited',0),(117,1048585,5,3,'2025-07-19 05:21:30',1342177296,'submission.event.fileEdited',0),(118,515,18,3,'2025-07-19 05:21:30',1342177287,'submission.event.signoffSignoff',0),(119,1048585,5,3,'2025-07-19 05:21:33',268435462,'publication.event.published',0),(120,1048585,6,24,'2025-07-19 05:21:38',268435458,'submission.event.general.metadataUpdated',0),(121,1048585,6,24,'2025-07-19 05:21:38',268435458,'submission.event.general.metadataUpdated',0),(122,515,19,24,'2025-07-19 05:21:39',1342177281,'submission.event.fileUploaded',0),(123,1048585,6,24,'2025-07-19 05:21:39',1342177288,'submission.event.fileRevised',0),(124,515,19,24,'2025-07-19 05:21:39',1342177296,'submission.event.fileEdited',0),(125,1048585,6,24,'2025-07-19 05:21:39',1342177296,'submission.event.fileEdited',0),(126,515,20,24,'2025-07-19 05:21:39',1342177281,'submission.event.fileUploaded',0),(127,1048585,6,24,'2025-07-19 05:21:39',1342177288,'submission.event.fileRevised',0),(128,515,20,24,'2025-07-19 05:21:40',1342177296,'submission.event.fileEdited',0),(129,1048585,6,24,'2025-07-19 05:21:40',1342177296,'submission.event.fileEdited',0),(130,515,21,24,'2025-07-19 05:21:40',1342177281,'submission.event.fileUploaded',0),(131,1048585,6,24,'2025-07-19 05:21:40',1342177288,'submission.event.fileRevised',0),(132,515,21,24,'2025-07-19 05:21:40',1342177296,'submission.event.fileEdited',0),(133,1048585,6,24,'2025-07-19 05:21:40',1342177296,'submission.event.fileEdited',0),(134,515,22,24,'2025-07-19 05:21:40',1342177281,'submission.event.fileUploaded',0),(135,1048585,6,24,'2025-07-19 05:21:40',1342177288,'submission.event.fileRevised',0),(136,515,22,24,'2025-07-19 05:21:40',1342177296,'submission.event.fileEdited',0),(137,1048585,6,24,'2025-07-19 05:21:40',1342177296,'submission.event.fileEdited',0),(138,1048585,6,24,'2025-07-19 05:21:43',268435458,'submission.event.general.metadataUpdated',0),(139,1048585,6,24,'2025-07-19 05:21:45',268435458,'submission.event.general.metadataUpdated',0),(140,1048585,6,24,'2025-07-19 05:21:48',268435458,'submission.event.general.metadataUpdated',0),(141,1048585,6,24,'2025-07-19 05:22:09',268435458,'submission.event.general.metadataUpdated',0),(142,1048585,6,24,'2025-07-19 05:22:10',268435457,'submission.event.submissionSubmitted',0),(143,1048585,6,3,'2025-07-19 05:22:14',805306371,'log.editor.decision',0),(144,1048585,6,3,'2025-07-19 05:22:18',268435459,'submission.event.participantAdded',0),(145,1048585,6,6,'2025-07-19 05:22:23',805306372,'log.editor.recommendation',0),(146,1048585,7,25,'2025-07-19 05:22:33',268435458,'submission.event.general.metadataUpdated',0),(147,1048585,7,25,'2025-07-19 05:22:33',268435458,'submission.event.general.metadataUpdated',0),(148,515,23,25,'2025-07-19 05:22:34',1342177281,'submission.event.fileUploaded',0),(149,1048585,7,25,'2025-07-19 05:22:34',1342177288,'submission.event.fileRevised',0),(150,515,23,25,'2025-07-19 05:22:34',1342177296,'submission.event.fileEdited',0),(151,1048585,7,25,'2025-07-19 05:22:34',1342177296,'submission.event.fileEdited',0),(152,515,24,25,'2025-07-19 05:22:34',1342177281,'submission.event.fileUploaded',0),(153,1048585,7,25,'2025-07-19 05:22:34',1342177288,'submission.event.fileRevised',0),(154,515,24,25,'2025-07-19 05:22:34',1342177296,'submission.event.fileEdited',0),(155,1048585,7,25,'2025-07-19 05:22:34',1342177296,'submission.event.fileEdited',0),(156,515,25,25,'2025-07-19 05:22:34',1342177281,'submission.event.fileUploaded',0),(157,1048585,7,25,'2025-07-19 05:22:34',1342177288,'submission.event.fileRevised',0),(158,515,25,25,'2025-07-19 05:22:35',1342177296,'submission.event.fileEdited',0),(159,1048585,7,25,'2025-07-19 05:22:35',1342177296,'submission.event.fileEdited',0),(160,515,26,25,'2025-07-19 05:22:35',1342177281,'submission.event.fileUploaded',0),(161,1048585,7,25,'2025-07-19 05:22:35',1342177288,'submission.event.fileRevised',0),(162,515,26,25,'2025-07-19 05:22:35',1342177296,'submission.event.fileEdited',0),(163,1048585,7,25,'2025-07-19 05:22:35',1342177296,'submission.event.fileEdited',0),(164,515,27,25,'2025-07-19 05:22:35',1342177281,'submission.event.fileUploaded',0),(165,1048585,7,25,'2025-07-19 05:22:35',1342177288,'submission.event.fileRevised',0),(166,515,27,25,'2025-07-19 05:22:35',1342177296,'submission.event.fileEdited',0),(167,1048585,7,25,'2025-07-19 05:22:35',1342177296,'submission.event.fileEdited',0),(168,1048585,7,25,'2025-07-19 05:22:38',268435458,'submission.event.general.metadataUpdated',0),(169,1048585,7,25,'2025-07-19 05:22:41',268435458,'submission.event.general.metadataUpdated',0),(170,1048585,7,25,'2025-07-19 05:22:43',268435458,'submission.event.general.metadataUpdated',0),(171,1048585,7,25,'2025-07-19 05:22:46',268435458,'submission.event.general.metadataUpdated',0),(172,1048585,7,25,'2025-07-19 05:23:15',268435458,'submission.event.general.metadataUpdated',0),(173,1048585,7,25,'2025-07-19 05:23:16',268435457,'submission.event.submissionSubmitted',0),(174,1048585,7,3,'2025-07-19 05:23:21',805306371,'log.editor.decision',0),(175,515,28,3,'2025-07-19 05:23:21',1342177281,'submission.event.fileUploaded',0),(176,1048585,7,3,'2025-07-19 05:23:21',1342177288,'submission.event.fileRevised',0),(177,515,29,3,'2025-07-19 05:23:21',1342177281,'submission.event.fileUploaded',0),(178,1048585,7,3,'2025-07-19 05:23:21',1342177288,'submission.event.fileRevised',0),(179,515,30,3,'2025-07-19 05:23:21',1342177281,'submission.event.fileUploaded',0),(180,1048585,7,3,'2025-07-19 05:23:21',1342177288,'submission.event.fileRevised',0),(181,515,31,3,'2025-07-19 05:23:21',1342177281,'submission.event.fileUploaded',0),(182,1048585,7,3,'2025-07-19 05:23:21',1342177288,'submission.event.fileRevised',0),(183,515,32,3,'2025-07-19 05:23:21',1342177281,'submission.event.fileUploaded',0),(184,1048585,7,3,'2025-07-19 05:23:21',1342177288,'submission.event.fileRevised',0),(185,1048585,7,3,'2025-07-19 05:23:27',1073741825,'log.review.reviewerAssigned',0),(186,1048585,7,3,'2025-07-19 05:23:28',805306371,'log.editor.decision',0),(187,1048585,7,3,'2025-07-19 05:23:33',268435459,'submission.event.participantAdded',0),(188,1048585,8,3,'2025-07-19 05:23:38',268435458,'submission.event.general.metadataUpdated',0),(189,1048585,8,3,'2025-07-19 05:23:38',268435458,'submission.event.general.metadataUpdated',0),(190,515,33,3,'2025-07-19 05:23:38',1342177281,'submission.event.fileUploaded',0),(191,1048585,8,3,'2025-07-19 05:23:38',1342177288,'submission.event.fileRevised',0),(192,515,33,3,'2025-07-19 05:23:39',1342177296,'submission.event.fileEdited',0),(193,1048585,8,3,'2025-07-19 05:23:39',1342177296,'submission.event.fileEdited',0),(194,1048585,8,3,'2025-07-19 05:23:40',268435458,'submission.event.general.metadataUpdated',0),(195,1048585,8,3,'2025-07-19 05:23:40',268435457,'submission.event.submissionSubmitted',0),(196,1048585,9,26,'2025-07-19 05:23:46',268435458,'submission.event.general.metadataUpdated',0),(197,1048585,9,26,'2025-07-19 05:23:46',268435458,'submission.event.general.metadataUpdated',0),(198,515,34,26,'2025-07-19 05:23:46',1342177281,'submission.event.fileUploaded',0),(199,1048585,9,26,'2025-07-19 05:23:46',1342177288,'submission.event.fileRevised',0),(200,515,34,26,'2025-07-19 05:23:46',1342177296,'submission.event.fileEdited',0),(201,1048585,9,26,'2025-07-19 05:23:46',1342177296,'submission.event.fileEdited',0),(202,515,35,26,'2025-07-19 05:23:47',1342177281,'submission.event.fileUploaded',0),(203,1048585,9,26,'2025-07-19 05:23:47',1342177288,'submission.event.fileRevised',0),(204,515,35,26,'2025-07-19 05:23:47',1342177296,'submission.event.fileEdited',0),(205,1048585,9,26,'2025-07-19 05:23:47',1342177296,'submission.event.fileEdited',0),(206,515,36,26,'2025-07-19 05:23:47',1342177281,'submission.event.fileUploaded',0),(207,1048585,9,26,'2025-07-19 05:23:47',1342177288,'submission.event.fileRevised',0),(208,515,36,26,'2025-07-19 05:23:47',1342177296,'submission.event.fileEdited',0),(209,1048585,9,26,'2025-07-19 05:23:47',1342177296,'submission.event.fileEdited',0),(210,515,37,26,'2025-07-19 05:23:47',1342177281,'submission.event.fileUploaded',0),(211,1048585,9,26,'2025-07-19 05:23:47',1342177288,'submission.event.fileRevised',0),(212,515,37,26,'2025-07-19 05:23:48',1342177296,'submission.event.fileEdited',0),(213,1048585,9,26,'2025-07-19 05:23:48',1342177296,'submission.event.fileEdited',0),(214,515,38,26,'2025-07-19 05:23:48',1342177281,'submission.event.fileUploaded',0),(215,1048585,9,26,'2025-07-19 05:23:48',1342177288,'submission.event.fileRevised',0),(216,515,38,26,'2025-07-19 05:23:48',1342177296,'submission.event.fileEdited',0),(217,1048585,9,26,'2025-07-19 05:23:48',1342177296,'submission.event.fileEdited',0),(218,1048585,9,26,'2025-07-19 05:23:51',268435458,'submission.event.general.metadataUpdated',0),(219,1048585,9,26,'2025-07-19 05:23:53',268435458,'submission.event.general.metadataUpdated',0),(220,1048585,9,26,'2025-07-19 05:23:55',268435458,'submission.event.general.metadataUpdated',0),(221,1048585,9,26,'2025-07-19 05:23:57',268435458,'submission.event.general.metadataUpdated',0),(222,1048585,9,26,'2025-07-19 05:24:26',268435458,'submission.event.general.metadataUpdated',0),(223,1048585,9,26,'2025-07-19 05:24:27',268435457,'submission.event.submissionSubmitted',0),(224,1048585,9,3,'2025-07-19 05:24:32',805306371,'log.editor.decision',0),(225,515,39,3,'2025-07-19 05:24:32',1342177281,'submission.event.fileUploaded',0),(226,1048585,9,3,'2025-07-19 05:24:32',1342177288,'submission.event.fileRevised',0),(227,515,40,3,'2025-07-19 05:24:32',1342177281,'submission.event.fileUploaded',0),(228,1048585,9,3,'2025-07-19 05:24:32',1342177288,'submission.event.fileRevised',0),(229,515,41,3,'2025-07-19 05:24:32',1342177281,'submission.event.fileUploaded',0),(230,1048585,9,3,'2025-07-19 05:24:32',1342177288,'submission.event.fileRevised',0),(231,515,42,3,'2025-07-19 05:24:32',1342177281,'submission.event.fileUploaded',0),(232,1048585,9,3,'2025-07-19 05:24:32',1342177288,'submission.event.fileRevised',0),(233,515,43,3,'2025-07-19 05:24:32',1342177281,'submission.event.fileUploaded',0),(234,1048585,9,3,'2025-07-19 05:24:32',1342177288,'submission.event.fileRevised',0),(235,1048585,10,27,'2025-07-19 05:24:39',268435458,'submission.event.general.metadataUpdated',0),(236,1048585,10,27,'2025-07-19 05:24:39',268435458,'submission.event.general.metadataUpdated',0),(237,515,44,27,'2025-07-19 05:24:40',1342177281,'submission.event.fileUploaded',0),(238,1048585,10,27,'2025-07-19 05:24:40',1342177288,'submission.event.fileRevised',0),(239,515,44,27,'2025-07-19 05:24:40',1342177296,'submission.event.fileEdited',0),(240,1048585,10,27,'2025-07-19 05:24:40',1342177296,'submission.event.fileEdited',0),(241,1048585,10,27,'2025-07-19 05:25:13',268435458,'submission.event.general.metadataUpdated',0),(242,1048585,10,27,'2025-07-19 05:25:14',268435457,'submission.event.submissionSubmitted',0),(243,1048585,11,28,'2025-07-19 05:25:20',268435458,'submission.event.general.metadataUpdated',0),(244,1048585,11,28,'2025-07-19 05:25:20',268435458,'submission.event.general.metadataUpdated',0),(245,515,45,28,'2025-07-19 05:25:20',1342177281,'submission.event.fileUploaded',0),(246,1048585,11,28,'2025-07-19 05:25:20',1342177288,'submission.event.fileRevised',0),(247,515,45,28,'2025-07-19 05:25:20',1342177296,'submission.event.fileEdited',0),(248,1048585,11,28,'2025-07-19 05:25:20',1342177296,'submission.event.fileEdited',0),(249,1048585,11,28,'2025-07-19 05:25:28',268435458,'submission.event.general.metadataUpdated',0),(250,1048585,11,28,'2025-07-19 05:25:28',268435457,'submission.event.submissionSubmitted',0),(251,1048585,11,3,'2025-07-19 05:25:32',805306371,'log.editor.decision',0),(252,515,46,3,'2025-07-19 05:25:32',1342177281,'submission.event.fileUploaded',0),(253,1048585,11,3,'2025-07-19 05:25:32',1342177288,'submission.event.fileRevised',0),(254,1048585,11,3,'2025-07-19 05:25:36',1073741825,'log.review.reviewerAssigned',0),(255,1048585,11,3,'2025-07-19 05:25:38',805306371,'log.editor.decision',0),(256,1048585,11,3,'2025-07-19 05:25:42',1073741825,'log.review.reviewerAssigned',0),(257,1048585,11,3,'2025-07-19 05:25:45',1073741825,'log.review.reviewerAssigned',0),(258,1048585,11,10,'2025-07-19 05:25:48',1073741830,'log.review.reviewAccepted',0),(259,1048585,11,10,'2025-07-19 05:25:51',1073741848,'log.review.reviewReady',0),(260,1048585,11,12,'2025-07-19 05:25:54',1073741830,'log.review.reviewAccepted',0),(261,1048585,11,12,'2025-07-19 05:25:57',1073741848,'log.review.reviewReady',0),(262,1048585,11,3,'2025-07-19 05:26:02',805306371,'log.editor.decision',0),(263,1048585,12,29,'2025-07-19 05:26:09',268435458,'submission.event.general.metadataUpdated',0),(264,1048585,12,29,'2025-07-19 05:26:09',268435458,'submission.event.general.metadataUpdated',0),(265,515,47,29,'2025-07-19 05:26:09',1342177281,'submission.event.fileUploaded',0),(266,1048585,12,29,'2025-07-19 05:26:09',1342177288,'submission.event.fileRevised',0),(267,515,47,29,'2025-07-19 05:26:09',1342177296,'submission.event.fileEdited',0),(268,1048585,12,29,'2025-07-19 05:26:09',1342177296,'submission.event.fileEdited',0),(269,515,48,29,'2025-07-19 05:26:10',1342177281,'submission.event.fileUploaded',0),(270,1048585,12,29,'2025-07-19 05:26:10',1342177288,'submission.event.fileRevised',0),(271,515,48,29,'2025-07-19 05:26:10',1342177296,'submission.event.fileEdited',0),(272,1048585,12,29,'2025-07-19 05:26:10',1342177296,'submission.event.fileEdited',0),(273,515,49,29,'2025-07-19 05:26:10',1342177281,'submission.event.fileUploaded',0),(274,1048585,12,29,'2025-07-19 05:26:10',1342177288,'submission.event.fileRevised',0),(275,515,49,29,'2025-07-19 05:26:10',1342177296,'submission.event.fileEdited',0),(276,1048585,12,29,'2025-07-19 05:26:10',1342177296,'submission.event.fileEdited',0),(277,1048585,12,29,'2025-07-19 05:26:13',268435458,'submission.event.general.metadataUpdated',0),(278,1048585,12,29,'2025-07-19 05:26:15',268435458,'submission.event.general.metadataUpdated',0),(279,1048585,12,29,'2025-07-19 05:26:17',268435458,'submission.event.general.metadataUpdated',0),(280,1048585,12,29,'2025-07-19 05:26:19',268435458,'submission.event.general.metadataUpdated',0),(281,1048585,12,29,'2025-07-19 05:26:21',268435458,'submission.event.general.metadataUpdated',0),(282,1048585,12,29,'2025-07-19 05:26:24',268435458,'submission.event.general.metadataUpdated',0),(283,1048585,12,29,'2025-07-19 05:26:26',268435458,'submission.event.general.metadataUpdated',0),(284,1048585,12,29,'2025-07-19 05:26:44',268435458,'submission.event.general.metadataUpdated',0),(285,1048585,12,29,'2025-07-19 05:26:45',268435457,'submission.event.submissionSubmitted',0),(286,1048585,12,3,'2025-07-19 05:26:50',805306371,'log.editor.decision',0),(287,515,50,3,'2025-07-19 05:26:50',1342177281,'submission.event.fileUploaded',0),(288,1048585,12,3,'2025-07-19 05:26:50',1342177288,'submission.event.fileRevised',0),(289,515,51,3,'2025-07-19 05:26:50',1342177281,'submission.event.fileUploaded',0),(290,1048585,12,3,'2025-07-19 05:26:50',1342177288,'submission.event.fileRevised',0),(291,515,52,3,'2025-07-19 05:26:50',1342177281,'submission.event.fileUploaded',0),(292,1048585,12,3,'2025-07-19 05:26:50',1342177288,'submission.event.fileRevised',0),(293,1048585,12,3,'2025-07-19 05:26:56',1073741825,'log.review.reviewerAssigned',0),(294,1048585,12,3,'2025-07-19 05:27:00',1073741825,'log.review.reviewerAssigned',0),(295,1048585,12,3,'2025-07-19 05:27:05',1073741825,'log.review.reviewerAssigned',0),(296,1048585,12,8,'2025-07-19 05:27:08',1073741830,'log.review.reviewAccepted',0),(297,1048585,12,8,'2025-07-19 05:27:11',1073741848,'log.review.reviewReady',0),(298,1048585,13,30,'2025-07-19 05:27:17',268435458,'submission.event.general.metadataUpdated',0),(299,1048585,13,30,'2025-07-19 05:27:17',268435458,'submission.event.general.metadataUpdated',0),(300,515,53,30,'2025-07-19 05:27:18',1342177281,'submission.event.fileUploaded',0),(301,1048585,13,30,'2025-07-19 05:27:18',1342177288,'submission.event.fileRevised',0),(302,515,53,30,'2025-07-19 05:27:18',1342177296,'submission.event.fileEdited',0),(303,1048585,13,30,'2025-07-19 05:27:18',1342177296,'submission.event.fileEdited',0),(304,515,54,30,'2025-07-19 05:27:18',1342177281,'submission.event.fileUploaded',0),(305,1048585,13,30,'2025-07-19 05:27:18',1342177288,'submission.event.fileRevised',0),(306,515,54,30,'2025-07-19 05:27:18',1342177296,'submission.event.fileEdited',0),(307,1048585,13,30,'2025-07-19 05:27:18',1342177296,'submission.event.fileEdited',0),(308,515,55,30,'2025-07-19 05:27:18',1342177281,'submission.event.fileUploaded',0),(309,1048585,13,30,'2025-07-19 05:27:18',1342177288,'submission.event.fileRevised',0),(310,515,55,30,'2025-07-19 05:27:19',1342177296,'submission.event.fileEdited',0),(311,1048585,13,30,'2025-07-19 05:27:19',1342177296,'submission.event.fileEdited',0),(312,1048585,13,30,'2025-07-19 05:27:21',268435458,'submission.event.general.metadataUpdated',0),(313,1048585,13,30,'2025-07-19 05:27:23',268435458,'submission.event.general.metadataUpdated',0),(314,1048585,13,30,'2025-07-19 05:27:26',268435458,'submission.event.general.metadataUpdated',0),(315,1048585,13,30,'2025-07-19 05:27:42',268435458,'submission.event.general.metadataUpdated',0),(316,1048585,13,30,'2025-07-19 05:27:43',268435457,'submission.event.submissionSubmitted',0),(317,1048585,13,3,'2025-07-19 05:27:48',805306371,'log.editor.decision',0),(318,515,56,3,'2025-07-19 05:27:48',1342177281,'submission.event.fileUploaded',0),(319,1048585,13,3,'2025-07-19 05:27:48',1342177288,'submission.event.fileRevised',0),(320,515,57,3,'2025-07-19 05:27:48',1342177281,'submission.event.fileUploaded',0),(321,1048585,13,3,'2025-07-19 05:27:48',1342177288,'submission.event.fileRevised',0),(322,515,58,3,'2025-07-19 05:27:48',1342177281,'submission.event.fileUploaded',0),(323,1048585,13,3,'2025-07-19 05:27:48',1342177288,'submission.event.fileRevised',0),(324,1048585,13,3,'2025-07-19 05:27:52',1073741825,'log.review.reviewerAssigned',0),(325,1048585,13,3,'2025-07-19 05:27:54',805306371,'log.editor.decision',0),(326,1048585,13,3,'2025-07-19 05:27:59',1073741825,'log.review.reviewerAssigned',0),(327,1048585,13,3,'2025-07-19 05:28:03',1073741825,'log.review.reviewerAssigned',0),(328,1048585,13,3,'2025-07-19 05:28:07',1073741825,'log.review.reviewerAssigned',0),(329,1048585,13,10,'2025-07-19 05:28:10',1073741830,'log.review.reviewAccepted',0),(330,1048585,13,10,'2025-07-19 05:28:13',1073741848,'log.review.reviewReady',0),(331,1048585,13,12,'2025-07-19 05:28:16',1073741830,'log.review.reviewAccepted',0),(332,1048585,13,12,'2025-07-19 05:28:20',1073741848,'log.review.reviewReady',0),(333,1048585,13,3,'2025-07-19 05:28:27',805306371,'log.editor.decision',0),(334,1048585,14,31,'2025-07-19 05:28:34',268435458,'submission.event.general.metadataUpdated',0),(335,1048585,14,31,'2025-07-19 05:28:34',268435458,'submission.event.general.metadataUpdated',0),(336,515,59,31,'2025-07-19 05:28:34',1342177281,'submission.event.fileUploaded',0),(337,1048585,14,31,'2025-07-19 05:28:34',1342177288,'submission.event.fileRevised',0),(338,515,59,31,'2025-07-19 05:28:35',1342177296,'submission.event.fileEdited',0),(339,1048585,14,31,'2025-07-19 05:28:35',1342177296,'submission.event.fileEdited',0),(340,515,60,31,'2025-07-19 05:28:35',1342177281,'submission.event.fileUploaded',0),(341,1048585,14,31,'2025-07-19 05:28:35',1342177288,'submission.event.fileRevised',0),(342,515,60,31,'2025-07-19 05:28:35',1342177296,'submission.event.fileEdited',0),(343,1048585,14,31,'2025-07-19 05:28:35',1342177296,'submission.event.fileEdited',0),(344,515,61,31,'2025-07-19 05:28:35',1342177281,'submission.event.fileUploaded',0),(345,1048585,14,31,'2025-07-19 05:28:35',1342177288,'submission.event.fileRevised',0),(346,515,61,31,'2025-07-19 05:28:35',1342177296,'submission.event.fileEdited',0),(347,1048585,14,31,'2025-07-19 05:28:35',1342177296,'submission.event.fileEdited',0),(348,515,62,31,'2025-07-19 05:28:35',1342177281,'submission.event.fileUploaded',0),(349,1048585,14,31,'2025-07-19 05:28:35',1342177288,'submission.event.fileRevised',0),(350,515,62,31,'2025-07-19 05:28:36',1342177296,'submission.event.fileEdited',0),(351,1048585,14,31,'2025-07-19 05:28:36',1342177296,'submission.event.fileEdited',0),(352,515,63,31,'2025-07-19 05:28:36',1342177281,'submission.event.fileUploaded',0),(353,1048585,14,31,'2025-07-19 05:28:36',1342177288,'submission.event.fileRevised',0),(354,515,63,31,'2025-07-19 05:28:36',1342177296,'submission.event.fileEdited',0),(355,1048585,14,31,'2025-07-19 05:28:36',1342177296,'submission.event.fileEdited',0),(356,515,64,31,'2025-07-19 05:28:36',1342177281,'submission.event.fileUploaded',0),(357,1048585,14,31,'2025-07-19 05:28:36',1342177288,'submission.event.fileRevised',0),(358,515,64,31,'2025-07-19 05:28:37',1342177296,'submission.event.fileEdited',0),(359,1048585,14,31,'2025-07-19 05:28:37',1342177296,'submission.event.fileEdited',0),(360,1048585,14,31,'2025-07-19 05:28:40',268435458,'submission.event.general.metadataUpdated',0),(361,1048585,14,31,'2025-07-19 05:28:43',268435458,'submission.event.general.metadataUpdated',0),(362,1048585,14,31,'2025-07-19 05:29:04',268435458,'submission.event.general.metadataUpdated',0),(363,1048585,14,31,'2025-07-19 05:29:05',268435457,'submission.event.submissionSubmitted',0),(364,1048585,14,3,'2025-07-19 05:29:11',805306371,'log.editor.decision',0),(365,1048585,14,3,'2025-07-19 05:29:16',1073741825,'log.review.reviewerAssigned',0),(366,1048585,14,3,'2025-07-19 05:29:17',805306371,'log.editor.decision',0),(367,1048585,14,3,'2025-07-19 05:29:23',1073741825,'log.review.reviewerAssigned',0),(368,1048585,14,3,'2025-07-19 05:29:25',805306371,'log.editor.decision',0),(369,1048585,14,3,'2025-07-19 05:29:29',268435459,'submission.event.participantAdded',0),(370,1048585,14,3,'2025-07-19 05:29:31',805306371,'log.editor.decision',0),(371,1048585,14,3,'2025-07-19 05:29:35',268435459,'submission.event.participantAdded',0),(372,1048585,14,3,'2025-07-19 05:29:38',268435459,'submission.event.participantAdded',0),(373,1048585,14,3,'2025-07-19 05:29:42',268435474,'submission.event.publicationFormatCreated',0),(374,515,65,3,'2025-07-19 05:29:47',1342177281,'submission.event.fileUploaded',0),(375,1048585,14,3,'2025-07-19 05:29:47',1342177288,'submission.event.fileRevised',0),(376,515,66,3,'2025-07-19 05:29:47',1342177281,'submission.event.fileUploaded',0),(377,1048585,14,3,'2025-07-19 05:29:47',1342177288,'submission.event.fileRevised',0),(378,515,67,3,'2025-07-19 05:29:47',1342177281,'submission.event.fileUploaded',0),(379,1048585,14,3,'2025-07-19 05:29:47',1342177288,'submission.event.fileRevised',0),(380,515,68,3,'2025-07-19 05:29:47',1342177281,'submission.event.fileUploaded',0),(381,1048585,14,3,'2025-07-19 05:29:47',1342177288,'submission.event.fileRevised',0),(382,515,69,3,'2025-07-19 05:29:47',1342177281,'submission.event.fileUploaded',0),(383,1048585,14,3,'2025-07-19 05:29:47',1342177288,'submission.event.fileRevised',0),(384,515,70,3,'2025-07-19 05:29:47',1342177281,'submission.event.fileUploaded',0),(385,1048585,14,3,'2025-07-19 05:29:47',1342177288,'submission.event.fileRevised',0),(386,1048585,14,3,'2025-07-19 05:29:48',268435464,'submission.event.publicationFormatPublished',0),(387,1048585,14,3,'2025-07-19 05:29:49',268435476,'submission.event.publicationFormatMadeAvailable',0),(388,515,65,3,'2025-07-19 05:29:51',1342177296,'submission.event.fileEdited',0),(389,1048585,14,3,'2025-07-19 05:29:51',1342177296,'submission.event.fileEdited',0),(390,515,65,3,'2025-07-19 05:29:51',1342177287,'submission.event.signoffSignoff',0),(391,515,66,3,'2025-07-19 05:29:54',1342177296,'submission.event.fileEdited',0),(392,1048585,14,3,'2025-07-19 05:29:54',1342177296,'submission.event.fileEdited',0),(393,515,66,3,'2025-07-19 05:29:54',1342177287,'submission.event.signoffSignoff',0),(394,515,67,3,'2025-07-19 05:29:57',1342177296,'submission.event.fileEdited',0),(395,1048585,14,3,'2025-07-19 05:29:57',1342177296,'submission.event.fileEdited',0),(396,515,67,3,'2025-07-19 05:29:57',1342177287,'submission.event.signoffSignoff',0),(397,515,68,3,'2025-07-19 05:30:00',1342177296,'submission.event.fileEdited',0),(398,1048585,14,3,'2025-07-19 05:30:00',1342177296,'submission.event.fileEdited',0),(399,515,68,3,'2025-07-19 05:30:00',1342177287,'submission.event.signoffSignoff',0),(400,515,69,3,'2025-07-19 05:30:04',1342177296,'submission.event.fileEdited',0),(401,1048585,14,3,'2025-07-19 05:30:04',1342177296,'submission.event.fileEdited',0),(402,515,69,3,'2025-07-19 05:30:04',1342177287,'submission.event.signoffSignoff',0),(403,515,70,3,'2025-07-19 05:30:07',1342177296,'submission.event.fileEdited',0),(404,1048585,14,3,'2025-07-19 05:30:07',1342177296,'submission.event.fileEdited',0),(405,515,70,3,'2025-07-19 05:30:07',1342177287,'submission.event.signoffSignoff',0),(406,1048585,14,3,'2025-07-19 05:30:11',268435462,'publication.event.published',0),(407,1048585,15,32,'2025-07-19 05:30:16',268435458,'submission.event.general.metadataUpdated',0),(408,1048585,15,32,'2025-07-19 05:30:16',268435458,'submission.event.general.metadataUpdated',0),(409,515,71,32,'2025-07-19 05:30:16',1342177281,'submission.event.fileUploaded',0),(410,1048585,15,32,'2025-07-19 05:30:16',1342177288,'submission.event.fileRevised',0),(411,515,71,32,'2025-07-19 05:30:17',1342177296,'submission.event.fileEdited',0),(412,1048585,15,32,'2025-07-19 05:30:17',1342177296,'submission.event.fileEdited',0),(413,1048585,15,32,'2025-07-19 05:30:28',268435458,'submission.event.general.metadataUpdated',0),(414,1048585,15,32,'2025-07-19 05:30:29',268435457,'submission.event.submissionSubmitted',0),(415,1048585,15,3,'2025-07-19 05:30:33',805306371,'log.editor.decision',0),(416,515,72,3,'2025-07-19 05:30:33',1342177281,'submission.event.fileUploaded',0),(417,1048585,15,3,'2025-07-19 05:30:33',1342177288,'submission.event.fileRevised',0),(418,1048585,16,33,'2025-07-19 05:30:40',268435458,'submission.event.general.metadataUpdated',0),(419,1048585,16,33,'2025-07-19 05:30:40',268435458,'submission.event.general.metadataUpdated',0),(420,515,73,33,'2025-07-19 05:30:40',1342177281,'submission.event.fileUploaded',0),(421,1048585,16,33,'2025-07-19 05:30:40',1342177288,'submission.event.fileRevised',0),(422,515,73,33,'2025-07-19 05:30:41',1342177296,'submission.event.fileEdited',0),(423,1048585,16,33,'2025-07-19 05:30:41',1342177296,'submission.event.fileEdited',0),(424,1048585,16,33,'2025-07-19 05:30:58',268435458,'submission.event.general.metadataUpdated',0),(425,1048585,16,33,'2025-07-19 05:30:59',268435457,'submission.event.submissionSubmitted',0),(426,1048585,16,3,'2025-07-19 05:31:04',805306371,'log.editor.decision',0),(427,515,74,3,'2025-07-19 05:31:04',1342177281,'submission.event.fileUploaded',0),(428,1048585,16,3,'2025-07-19 05:31:04',1342177288,'submission.event.fileRevised',0),(429,1048585,16,3,'2025-07-19 05:31:08',1073741825,'log.review.reviewerAssigned',0),(430,1048585,16,3,'2025-07-19 05:31:12',1073741825,'log.review.reviewerAssigned',0),(431,1048585,16,3,'2025-07-19 05:31:15',1073741825,'log.review.reviewerAssigned',0),(432,1048585,16,10,'2025-07-19 05:31:18',1073741830,'log.review.reviewAccepted',0),(433,1048585,16,10,'2025-07-19 05:31:21',1073741848,'log.review.reviewReady',0),(434,1048585,17,34,'2025-07-19 05:31:27',268435458,'submission.event.general.metadataUpdated',0),(435,1048585,17,34,'2025-07-19 05:31:27',268435458,'submission.event.general.metadataUpdated',0),(436,515,75,34,'2025-07-19 05:31:28',1342177281,'submission.event.fileUploaded',0),(437,1048585,17,34,'2025-07-19 05:31:28',1342177288,'submission.event.fileRevised',0),(438,515,75,34,'2025-07-19 05:31:28',1342177296,'submission.event.fileEdited',0),(439,1048585,17,34,'2025-07-19 05:31:28',1342177296,'submission.event.fileEdited',0),(440,515,76,34,'2025-07-19 05:31:28',1342177281,'submission.event.fileUploaded',0),(441,1048585,17,34,'2025-07-19 05:31:28',1342177288,'submission.event.fileRevised',0),(442,515,76,34,'2025-07-19 05:31:28',1342177296,'submission.event.fileEdited',0),(443,1048585,17,34,'2025-07-19 05:31:28',1342177296,'submission.event.fileEdited',0),(444,515,77,34,'2025-07-19 05:31:28',1342177281,'submission.event.fileUploaded',0),(445,1048585,17,34,'2025-07-19 05:31:28',1342177288,'submission.event.fileRevised',0),(446,515,77,34,'2025-07-19 05:31:28',1342177296,'submission.event.fileEdited',0),(447,1048585,17,34,'2025-07-19 05:31:29',1342177296,'submission.event.fileEdited',0),(448,515,78,34,'2025-07-19 05:31:29',1342177281,'submission.event.fileUploaded',0),(449,1048585,17,34,'2025-07-19 05:31:29',1342177288,'submission.event.fileRevised',0),(450,515,78,34,'2025-07-19 05:31:29',1342177296,'submission.event.fileEdited',0),(451,1048585,17,34,'2025-07-19 05:31:29',1342177296,'submission.event.fileEdited',0),(452,515,79,34,'2025-07-19 05:31:29',1342177281,'submission.event.fileUploaded',0),(453,1048585,17,34,'2025-07-19 05:31:29',1342177288,'submission.event.fileRevised',0),(454,515,79,34,'2025-07-19 05:31:29',1342177296,'submission.event.fileEdited',0),(455,1048585,17,34,'2025-07-19 05:31:29',1342177296,'submission.event.fileEdited',0),(456,515,80,34,'2025-07-19 05:31:29',1342177281,'submission.event.fileUploaded',0),(457,1048585,17,34,'2025-07-19 05:31:29',1342177288,'submission.event.fileRevised',0),(458,515,80,34,'2025-07-19 05:31:30',1342177296,'submission.event.fileEdited',0),(459,1048585,17,34,'2025-07-19 05:31:30',1342177296,'submission.event.fileEdited',0),(460,1048585,17,34,'2025-07-19 05:31:33',268435458,'submission.event.general.metadataUpdated',0),(461,1048585,17,34,'2025-07-19 05:31:35',268435458,'submission.event.general.metadataUpdated',0),(462,1048585,17,34,'2025-07-19 05:31:37',268435458,'submission.event.general.metadataUpdated',0),(463,1048585,17,34,'2025-07-19 05:31:39',268435458,'submission.event.general.metadataUpdated',0),(464,1048585,17,34,'2025-07-19 05:31:42',268435458,'submission.event.general.metadataUpdated',0),(465,1048585,17,34,'2025-07-19 05:31:44',268435458,'submission.event.general.metadataUpdated',0),(466,1048585,17,34,'2025-07-19 05:31:46',268435458,'submission.event.general.metadataUpdated',0),(467,1048585,17,34,'2025-07-19 05:32:24',268435458,'submission.event.general.metadataUpdated',0),(468,1048585,17,34,'2025-07-19 05:32:25',268435457,'submission.event.submissionSubmitted',0),(469,1048585,17,3,'2025-07-19 05:32:31',805306371,'log.editor.decision',0),(470,515,81,3,'2025-07-19 05:32:31',1342177281,'submission.event.fileUploaded',0),(471,1048585,17,3,'2025-07-19 05:32:31',1342177288,'submission.event.fileRevised',0),(472,515,82,3,'2025-07-19 05:32:31',1342177281,'submission.event.fileUploaded',0),(473,1048585,17,3,'2025-07-19 05:32:31',1342177288,'submission.event.fileRevised',0),(474,515,83,3,'2025-07-19 05:32:31',1342177281,'submission.event.fileUploaded',0),(475,1048585,17,3,'2025-07-19 05:32:31',1342177288,'submission.event.fileRevised',0),(476,515,84,3,'2025-07-19 05:32:31',1342177281,'submission.event.fileUploaded',0),(477,1048585,17,3,'2025-07-19 05:32:31',1342177288,'submission.event.fileRevised',0),(478,515,85,3,'2025-07-19 05:32:31',1342177281,'submission.event.fileUploaded',0),(479,1048585,17,3,'2025-07-19 05:32:31',1342177288,'submission.event.fileRevised',0),(480,515,86,3,'2025-07-19 05:32:31',1342177281,'submission.event.fileUploaded',0),(481,1048585,17,3,'2025-07-19 05:32:31',1342177288,'submission.event.fileRevised',0),(482,1048585,17,3,'2025-07-19 05:32:37',1073741825,'log.review.reviewerAssigned',0),(483,1048585,17,3,'2025-07-19 05:32:42',1073741825,'log.review.reviewerAssigned',0);
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
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(6,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','aclark','string'),(9,'decision','Send to External Review','string'),(9,'editorName','Daniel Barnes','string'),(9,'submissionId','1','int'),(10,'fileId','1','int'),(10,'fileStage','4','int'),(10,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(10,'sourceSubmissionFileId','1','int'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','dbarnes','string'),(11,'fileId','1','int'),(11,'fileStage','4','int'),(11,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(11,'submissionFileId','2','int'),(11,'submissionId','1','int'),(11,'username','dbarnes','string'),(12,'reviewAssignmentId','1','string'),(12,'reviewerName','Gonzalo Favio','string'),(12,'round','1','int'),(12,'stageId','3','int'),(12,'submissionId','1','int'),(13,'decision','Accept Submission','string'),(13,'editorName','Daniel Barnes','string'),(13,'submissionId','1','int'),(14,'name','Sarah Vogt','string'),(14,'userGroupName','Copyeditor','string'),(14,'username','svogt','string'),(17,'fileId','2','int'),(17,'fileStage','2','int'),(17,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','3','int'),(17,'submissionId','2','int'),(17,'username','afinkel','string'),(18,'fileId','2','int'),(18,'fileStage','2','int'),(18,'name','Critical History in Western Canada 1900–.pdf','string'),(18,'submissionFileId','3','int'),(18,'submissionId','2','int'),(18,'username','afinkel','string'),(19,'fileId','2','int'),(19,'fileStage','2','int'),(19,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','2','int'),(19,'username','afinkel','string'),(20,'fileId','2','int'),(20,'fileStage','2','int'),(20,'name','Critical History in Western Canada 1900–.pdf','string'),(20,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','3','int'),(20,'submissionId','2','int'),(20,'username','afinkel','string'),(21,'fileId','3','int'),(21,'fileStage','2','int'),(21,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','4','int'),(21,'submissionId','2','int'),(21,'username','afinkel','string'),(22,'fileId','3','int'),(22,'fileStage','2','int'),(22,'name','Vernacular Currents in Western Canadian .pdf','string'),(22,'submissionFileId','4','int'),(22,'submissionId','2','int'),(22,'username','afinkel','string'),(23,'fileId','3','int'),(23,'fileStage','2','int'),(23,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','4','int'),(23,'submissionId','2','int'),(23,'username','afinkel','string'),(24,'fileId','3','int'),(24,'fileStage','2','int'),(24,'name','Vernacular Currents in Western Canadian .pdf','string'),(24,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(24,'sourceSubmissionFileId',NULL,'string'),(24,'submissionFileId','4','int'),(24,'submissionId','2','int'),(24,'username','afinkel','string'),(25,'fileId','4','int'),(25,'fileStage','2','int'),(25,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','5','int'),(25,'submissionId','2','int'),(25,'username','afinkel','string'),(26,'fileId','4','int'),(26,'fileStage','2','int'),(26,'name','Cree Intellectual Traditions in History.pdf','string'),(26,'submissionFileId','5','int'),(26,'submissionId','2','int'),(26,'username','afinkel','string'),(27,'fileId','4','int'),(27,'fileStage','2','int'),(27,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','5','int'),(27,'submissionId','2','int'),(27,'username','afinkel','string'),(28,'fileId','4','int'),(28,'fileStage','2','int'),(28,'name','Cree Intellectual Traditions in History.pdf','string'),(28,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','5','int'),(28,'submissionId','2','int'),(28,'username','afinkel','string'),(29,'fileId','5','int'),(29,'fileStage','2','int'),(29,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(29,'sourceSubmissionFileId',NULL,'string'),(29,'submissionFileId','6','int'),(29,'submissionId','2','int'),(29,'username','afinkel','string'),(30,'fileId','5','int'),(30,'fileStage','2','int'),(30,'name','Visualizing Space, Race, and History in .pdf','string'),(30,'submissionFileId','6','int'),(30,'submissionId','2','int'),(30,'username','afinkel','string'),(31,'fileId','5','int'),(31,'fileStage','2','int'),(31,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(31,'sourceSubmissionFileId',NULL,'string'),(31,'submissionFileId','6','int'),(31,'submissionId','2','int'),(31,'username','afinkel','string'),(32,'fileId','5','int'),(32,'fileStage','2','int'),(32,'name','Visualizing Space, Race, and History in .pdf','string'),(32,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(32,'sourceSubmissionFileId',NULL,'string'),(32,'submissionFileId','6','int'),(32,'submissionId','2','int'),(32,'username','afinkel','string'),(42,'decision','Send to External Review','string'),(42,'editorName','Daniel Barnes','string'),(42,'submissionId','2','int'),(43,'reviewAssignmentId','2','string'),(43,'reviewerName','Al Zacharia','string'),(43,'round','1','int'),(43,'stageId','3','int'),(43,'submissionId','2','int'),(44,'reviewAssignmentId','3','string'),(44,'reviewerName','Gonzalo Favio','string'),(44,'round','1','int'),(44,'stageId','3','int'),(44,'submissionId','2','int'),(47,'fileId','6','int'),(47,'fileStage','2','int'),(47,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','7','int'),(47,'submissionId','3','int'),(47,'username','bbarnetson','string'),(48,'fileId','6','int'),(48,'fileStage','2','int'),(48,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(48,'submissionFileId','7','int'),(48,'submissionId','3','int'),(48,'username','bbarnetson','string'),(49,'fileId','6','int'),(49,'fileStage','2','int'),(49,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(49,'sourceSubmissionFileId',NULL,'string'),(49,'submissionFileId','7','int'),(49,'submissionId','3','int'),(49,'username','bbarnetson','string'),(50,'fileId','6','int'),(50,'fileStage','2','int'),(50,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(50,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(50,'sourceSubmissionFileId',NULL,'string'),(50,'submissionFileId','7','int'),(50,'submissionId','3','int'),(50,'username','bbarnetson','string'),(55,'fileId','7','int'),(55,'fileStage','2','int'),(55,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','8','int'),(55,'submissionId','4','int'),(55,'username','bbeaty','string'),(56,'fileId','7','int'),(56,'fileStage','2','int'),(56,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(56,'submissionFileId','8','int'),(56,'submissionId','4','int'),(56,'username','bbeaty','string'),(57,'fileId','7','int'),(57,'fileStage','2','int'),(57,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(57,'sourceSubmissionFileId',NULL,'string'),(57,'submissionFileId','8','int'),(57,'submissionId','4','int'),(57,'username','bbeaty','string'),(58,'fileId','7','int'),(58,'fileStage','2','int'),(58,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(58,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','8','int'),(58,'submissionId','4','int'),(58,'username','bbeaty','string'),(59,'fileId','8','int'),(59,'fileStage','2','int'),(59,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(59,'sourceSubmissionFileId',NULL,'string'),(59,'submissionFileId','9','int'),(59,'submissionId','4','int'),(59,'username','bbeaty','string'),(60,'fileId','8','int'),(60,'fileStage','2','int'),(60,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(60,'submissionFileId','9','int'),(60,'submissionId','4','int'),(60,'username','bbeaty','string'),(61,'fileId','8','int'),(61,'fileStage','2','int'),(61,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(61,'sourceSubmissionFileId',NULL,'string'),(61,'submissionFileId','9','int'),(61,'submissionId','4','int'),(61,'username','bbeaty','string'),(62,'fileId','8','int'),(62,'fileStage','2','int'),(62,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(62,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','9','int'),(62,'submissionId','4','int'),(62,'username','bbeaty','string'),(63,'fileId','9','int'),(63,'fileStage','2','int'),(63,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','10','int'),(63,'submissionId','4','int'),(63,'username','bbeaty','string'),(64,'fileId','9','int'),(64,'fileStage','2','int'),(64,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(64,'submissionFileId','10','int'),(64,'submissionId','4','int'),(64,'username','bbeaty','string'),(65,'fileId','9','int'),(65,'fileStage','2','int'),(65,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(65,'sourceSubmissionFileId',NULL,'string'),(65,'submissionFileId','10','int'),(65,'submissionId','4','int'),(65,'username','bbeaty','string'),(66,'fileId','9','int'),(66,'fileStage','2','int'),(66,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(66,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','10','int'),(66,'submissionId','4','int'),(66,'username','bbeaty','string'),(67,'fileId','10','int'),(67,'fileStage','2','int'),(67,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','11','int'),(67,'submissionId','4','int'),(67,'username','bbeaty','string'),(68,'fileId','10','int'),(68,'fileStage','2','int'),(68,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(68,'submissionFileId','11','int'),(68,'submissionId','4','int'),(68,'username','bbeaty','string'),(69,'fileId','10','int'),(69,'fileStage','2','int'),(69,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(69,'sourceSubmissionFileId',NULL,'string'),(69,'submissionFileId','11','int'),(69,'submissionId','4','int'),(69,'username','bbeaty','string'),(70,'fileId','10','int'),(70,'fileStage','2','int'),(70,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(70,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','11','int'),(70,'submissionId','4','int'),(70,'username','bbeaty','string'),(76,'decision','Send to Internal Review','string'),(76,'editorName','Daniel Barnes','string'),(76,'submissionId','4','int'),(77,'fileId','7','int'),(77,'fileStage','19','int'),(77,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(77,'sourceSubmissionFileId','8','int'),(77,'submissionFileId','12','int'),(77,'submissionId','4','int'),(77,'username','dbarnes','string'),(78,'fileId','7','int'),(78,'fileStage','19','int'),(78,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(78,'submissionFileId','12','int'),(78,'submissionId','4','int'),(78,'username','dbarnes','string'),(79,'fileId','8','int'),(79,'fileStage','19','int'),(79,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(79,'sourceSubmissionFileId','9','int'),(79,'submissionFileId','13','int'),(79,'submissionId','4','int'),(79,'username','dbarnes','string'),(80,'fileId','8','int'),(80,'fileStage','19','int'),(80,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(80,'submissionFileId','13','int'),(80,'submissionId','4','int'),(80,'username','dbarnes','string'),(81,'fileId','9','int'),(81,'fileStage','19','int'),(81,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(81,'sourceSubmissionFileId','10','int'),(81,'submissionFileId','14','int'),(81,'submissionId','4','int'),(81,'username','dbarnes','string'),(82,'fileId','9','int'),(82,'fileStage','19','int'),(82,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(82,'submissionFileId','14','int'),(82,'submissionId','4','int'),(82,'username','dbarnes','string'),(83,'fileId','10','int'),(83,'fileStage','19','int'),(83,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(83,'sourceSubmissionFileId','11','int'),(83,'submissionFileId','15','int'),(83,'submissionId','4','int'),(83,'username','dbarnes','string'),(84,'fileId','10','int'),(84,'fileStage','19','int'),(84,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(84,'submissionFileId','15','int'),(84,'submissionId','4','int'),(84,'username','dbarnes','string'),(85,'reviewAssignmentId','4','string'),(85,'reviewerName','Aisla McCrae','string'),(85,'round','1','int'),(85,'stageId','2','int'),(85,'submissionId','4','int'),(86,'decision','Send to External Review','string'),(86,'editorName','Daniel Barnes','string'),(86,'submissionId','4','int'),(87,'reviewAssignmentId','5','string'),(87,'reviewerName','Al Zacharia','string'),(87,'round','1','int'),(87,'stageId','3','int'),(87,'submissionId','4','int'),(88,'decision','Accept Submission','string'),(88,'editorName','Daniel Barnes','string'),(88,'submissionId','4','int'),(89,'name','Maria Fritz','string'),(89,'userGroupName','Copyeditor','string'),(89,'username','mfritz','string'),(90,'decision','Send To Production','string'),(90,'editorName','Daniel Barnes','string'),(90,'submissionId','4','int'),(91,'name','Graham Cox','string'),(91,'userGroupName','Layout Editor','string'),(91,'username','gcox','string'),(94,'fileId','11','int'),(94,'fileStage','2','int'),(94,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(94,'sourceSubmissionFileId',NULL,'string'),(94,'submissionFileId','16','int'),(94,'submissionId','5','int'),(94,'username','callan','string'),(95,'fileId','11','int'),(95,'fileStage','2','int'),(95,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(95,'submissionFileId','16','int'),(95,'submissionId','5','int'),(95,'username','callan','string'),(96,'fileId','11','int'),(96,'fileStage','2','int'),(96,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(96,'sourceSubmissionFileId',NULL,'string'),(96,'submissionFileId','16','int'),(96,'submissionId','5','int'),(96,'username','callan','string'),(97,'fileId','11','int'),(97,'fileStage','2','int'),(97,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(97,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','16','int'),(97,'submissionId','5','int'),(97,'username','callan','string'),(100,'decision','Send to Internal Review','string'),(100,'editorName','Daniel Barnes','string'),(100,'submissionId','5','int'),(101,'fileId','11','int'),(101,'fileStage','19','int'),(101,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(101,'sourceSubmissionFileId','16','int'),(101,'submissionFileId','17','int'),(101,'submissionId','5','int'),(101,'username','dbarnes','string'),(102,'fileId','11','int'),(102,'fileStage','19','int'),(102,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(102,'submissionFileId','17','int'),(102,'submissionId','5','int'),(102,'username','dbarnes','string'),(103,'reviewAssignmentId','6','string'),(103,'reviewerName','Paul Hudson','string'),(103,'round','1','int'),(103,'stageId','2','int'),(103,'submissionId','5','int'),(104,'decision','Send to External Review','string'),(104,'editorName','Daniel Barnes','string'),(104,'submissionId','5','int'),(105,'reviewAssignmentId','7','string'),(105,'reviewerName','Gonzalo Favio','string'),(105,'round','1','int'),(105,'stageId','3','int'),(105,'submissionId','5','int'),(106,'decision','Accept Submission','string'),(106,'editorName','Daniel Barnes','string'),(106,'submissionId','5','int'),(107,'name','Sarah Vogt','string'),(107,'userGroupName','Copyeditor','string'),(107,'username','svogt','string'),(108,'decision','Send To Production','string'),(108,'editorName','Daniel Barnes','string'),(108,'submissionId','5','int'),(109,'name','Stephen Hellier','string'),(109,'userGroupName','Layout Editor','string'),(109,'username','shellier','string'),(110,'name','Catherine Turner','string'),(110,'userGroupName','Proofreader','string'),(110,'username','cturner','string'),(111,'formatName','PDF','string'),(112,'fileId','11','int'),(112,'fileStage','10','int'),(112,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(112,'sourceSubmissionFileId','16','int'),(112,'submissionFileId','18','int'),(112,'submissionId','5','int'),(112,'username','dbarnes','string'),(113,'fileId','11','int'),(113,'fileStage','10','int'),(113,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(113,'submissionFileId','18','int'),(113,'submissionId','5','int'),(113,'username','dbarnes','string'),(114,'publicationFormatName','PDF','string'),(115,'publicationFormatName','PDF','string'),(116,'fileId','11','int'),(116,'fileStage','10','int'),(116,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(116,'sourceSubmissionFileId','16','int'),(116,'submissionFileId','18','int'),(116,'submissionId','5','int'),(116,'username','dbarnes','string'),(117,'fileId','11','int'),(117,'fileStage','10','int'),(117,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(117,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(117,'sourceSubmissionFileId','16','int'),(117,'submissionFileId','18','int'),(117,'submissionId','5','int'),(117,'username','dbarnes','string'),(118,'file','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(118,'name','Daniel Barnes','string'),(118,'username','dbarnes','string'),(122,'fileId','12','int'),(122,'fileStage','2','int'),(122,'originalFileName','Identify: Understanding Your Information.pdf','string'),(122,'sourceSubmissionFileId',NULL,'string'),(122,'submissionFileId','19','int'),(122,'submissionId','6','int'),(122,'username','dbernnard','string'),(123,'fileId','12','int'),(123,'fileStage','2','int'),(123,'name','Identify: Understanding Your Information.pdf','string'),(123,'submissionFileId','19','int'),(123,'submissionId','6','int'),(123,'username','dbernnard','string'),(124,'fileId','12','int'),(124,'fileStage','2','int'),(124,'originalFileName','Identify: Understanding Your Information.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','19','int'),(124,'submissionId','6','int'),(124,'username','dbernnard','string'),(125,'fileId','12','int'),(125,'fileStage','2','int'),(125,'name','Identify: Understanding Your Information.pdf','string'),(125,'originalFileName','Identify: Understanding Your Information.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','19','int'),(125,'submissionId','6','int'),(125,'username','dbernnard','string'),(126,'fileId','13','int'),(126,'fileStage','2','int'),(126,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','20','int'),(126,'submissionId','6','int'),(126,'username','dbernnard','string'),(127,'fileId','13','int'),(127,'fileStage','2','int'),(127,'name','Scope: Knowing What Is Available.pdf','string'),(127,'submissionFileId','20','int'),(127,'submissionId','6','int'),(127,'username','dbernnard','string'),(128,'fileId','13','int'),(128,'fileStage','2','int'),(128,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(128,'sourceSubmissionFileId',NULL,'string'),(128,'submissionFileId','20','int'),(128,'submissionId','6','int'),(128,'username','dbernnard','string'),(129,'fileId','13','int'),(129,'fileStage','2','int'),(129,'name','Scope: Knowing What Is Available.pdf','string'),(129,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','20','int'),(129,'submissionId','6','int'),(129,'username','dbernnard','string'),(130,'fileId','14','int'),(130,'fileStage','2','int'),(130,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','21','int'),(130,'submissionId','6','int'),(130,'username','dbernnard','string'),(131,'fileId','14','int'),(131,'fileStage','2','int'),(131,'name','Plan: Developing Research Strategies.pdf','string'),(131,'submissionFileId','21','int'),(131,'submissionId','6','int'),(131,'username','dbernnard','string'),(132,'fileId','14','int'),(132,'fileStage','2','int'),(132,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','21','int'),(132,'submissionId','6','int'),(132,'username','dbernnard','string'),(133,'fileId','14','int'),(133,'fileStage','2','int'),(133,'name','Plan: Developing Research Strategies.pdf','string'),(133,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','21','int'),(133,'submissionId','6','int'),(133,'username','dbernnard','string'),(134,'fileId','15','int'),(134,'fileStage','2','int'),(134,'originalFileName','Gather: Finding What You Need.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','22','int'),(134,'submissionId','6','int'),(134,'username','dbernnard','string'),(135,'fileId','15','int'),(135,'fileStage','2','int'),(135,'name','Gather: Finding What You Need.pdf','string'),(135,'submissionFileId','22','int'),(135,'submissionId','6','int'),(135,'username','dbernnard','string'),(136,'fileId','15','int'),(136,'fileStage','2','int'),(136,'originalFileName','Gather: Finding What You Need.pdf','string'),(136,'sourceSubmissionFileId',NULL,'string'),(136,'submissionFileId','22','int'),(136,'submissionId','6','int'),(136,'username','dbernnard','string'),(137,'fileId','15','int'),(137,'fileStage','2','int'),(137,'name','Gather: Finding What You Need.pdf','string'),(137,'originalFileName','Gather: Finding What You Need.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','22','int'),(137,'submissionId','6','int'),(137,'username','dbernnard','string'),(143,'decision','Send to Internal Review','string'),(143,'editorName','Daniel Barnes','string'),(143,'submissionId','6','int'),(144,'name','Minoti Inoue','string'),(144,'userGroupName','Series editor','string'),(144,'username','minoue','string'),(145,'decision','Send to External Review','string'),(145,'editorName','Minoti Inoue','string'),(145,'submissionId','6','int'),(148,'fileId','16','int'),(148,'fileStage','2','int'),(148,'originalFileName','Introduction.pdf','string'),(148,'sourceSubmissionFileId',NULL,'string'),(148,'submissionFileId','23','int'),(148,'submissionId','7','int'),(148,'username','dkennepohl','string'),(149,'fileId','16','int'),(149,'fileStage','2','int'),(149,'name','Introduction.pdf','string'),(149,'submissionFileId','23','int'),(149,'submissionId','7','int'),(149,'username','dkennepohl','string'),(150,'fileId','16','int'),(150,'fileStage','2','int'),(150,'originalFileName','Introduction.pdf','string'),(150,'sourceSubmissionFileId',NULL,'string'),(150,'submissionFileId','23','int'),(150,'submissionId','7','int'),(150,'username','dkennepohl','string'),(151,'fileId','16','int'),(151,'fileStage','2','int'),(151,'name','Introduction.pdf','string'),(151,'originalFileName','Introduction.pdf','string'),(151,'sourceSubmissionFileId',NULL,'string'),(151,'submissionFileId','23','int'),(151,'submissionId','7','int'),(151,'username','dkennepohl','string'),(152,'fileId','17','int'),(152,'fileStage','2','int'),(152,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(152,'sourceSubmissionFileId',NULL,'string'),(152,'submissionFileId','24','int'),(152,'submissionId','7','int'),(152,'username','dkennepohl','string'),(153,'fileId','17','int'),(153,'fileStage','2','int'),(153,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(153,'submissionFileId','24','int'),(153,'submissionId','7','int'),(153,'username','dkennepohl','string'),(154,'fileId','17','int'),(154,'fileStage','2','int'),(154,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(154,'sourceSubmissionFileId',NULL,'string'),(154,'submissionFileId','24','int'),(154,'submissionId','7','int'),(154,'username','dkennepohl','string'),(155,'fileId','17','int'),(155,'fileStage','2','int'),(155,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(155,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(155,'sourceSubmissionFileId',NULL,'string'),(155,'submissionFileId','24','int'),(155,'submissionId','7','int'),(155,'username','dkennepohl','string'),(156,'fileId','18','int'),(156,'fileStage','2','int'),(156,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(156,'sourceSubmissionFileId',NULL,'string'),(156,'submissionFileId','25','int'),(156,'submissionId','7','int'),(156,'username','dkennepohl','string'),(157,'fileId','18','int'),(157,'fileStage','2','int'),(157,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(157,'submissionFileId','25','int'),(157,'submissionId','7','int'),(157,'username','dkennepohl','string'),(158,'fileId','18','int'),(158,'fileStage','2','int'),(158,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','25','int'),(158,'submissionId','7','int'),(158,'username','dkennepohl','string'),(159,'fileId','18','int'),(159,'fileStage','2','int'),(159,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(159,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(159,'sourceSubmissionFileId',NULL,'string'),(159,'submissionFileId','25','int'),(159,'submissionId','7','int'),(159,'username','dkennepohl','string'),(160,'fileId','19','int'),(160,'fileStage','2','int'),(160,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(160,'sourceSubmissionFileId',NULL,'string'),(160,'submissionFileId','26','int'),(160,'submissionId','7','int'),(160,'username','dkennepohl','string'),(161,'fileId','19','int'),(161,'fileStage','2','int'),(161,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(161,'submissionFileId','26','int'),(161,'submissionId','7','int'),(161,'username','dkennepohl','string'),(162,'fileId','19','int'),(162,'fileStage','2','int'),(162,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(162,'sourceSubmissionFileId',NULL,'string'),(162,'submissionFileId','26','int'),(162,'submissionId','7','int'),(162,'username','dkennepohl','string'),(163,'fileId','19','int'),(163,'fileStage','2','int'),(163,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(163,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(163,'sourceSubmissionFileId',NULL,'string'),(163,'submissionFileId','26','int'),(163,'submissionId','7','int'),(163,'username','dkennepohl','string'),(164,'fileId','20','int'),(164,'fileStage','2','int'),(164,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(164,'sourceSubmissionFileId',NULL,'string'),(164,'submissionFileId','27','int'),(164,'submissionId','7','int'),(164,'username','dkennepohl','string'),(165,'fileId','20','int'),(165,'fileStage','2','int'),(165,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(165,'submissionFileId','27','int'),(165,'submissionId','7','int'),(165,'username','dkennepohl','string'),(166,'fileId','20','int'),(166,'fileStage','2','int'),(166,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(166,'sourceSubmissionFileId',NULL,'string'),(166,'submissionFileId','27','int'),(166,'submissionId','7','int'),(166,'username','dkennepohl','string'),(167,'fileId','20','int'),(167,'fileStage','2','int'),(167,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(167,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(167,'sourceSubmissionFileId',NULL,'string'),(167,'submissionFileId','27','int'),(167,'submissionId','7','int'),(167,'username','dkennepohl','string'),(174,'decision','Send to External Review','string'),(174,'editorName','Daniel Barnes','string'),(174,'submissionId','7','int'),(175,'fileId','16','int'),(175,'fileStage','4','int'),(175,'originalFileName','Introduction.pdf','string'),(175,'sourceSubmissionFileId','23','int'),(175,'submissionFileId','28','int'),(175,'submissionId','7','int'),(175,'username','dbarnes','string'),(176,'fileId','16','int'),(176,'fileStage','4','int'),(176,'name','Introduction.pdf','string'),(176,'submissionFileId','28','int'),(176,'submissionId','7','int'),(176,'username','dbarnes','string'),(177,'fileId','17','int'),(177,'fileStage','4','int'),(177,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(177,'sourceSubmissionFileId','24','int'),(177,'submissionFileId','29','int'),(177,'submissionId','7','int'),(177,'username','dbarnes','string'),(178,'fileId','17','int'),(178,'fileStage','4','int'),(178,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(178,'submissionFileId','29','int'),(178,'submissionId','7','int'),(178,'username','dbarnes','string'),(179,'fileId','18','int'),(179,'fileStage','4','int'),(179,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(179,'sourceSubmissionFileId','25','int'),(179,'submissionFileId','30','int'),(179,'submissionId','7','int'),(179,'username','dbarnes','string'),(180,'fileId','18','int'),(180,'fileStage','4','int'),(180,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(180,'submissionFileId','30','int'),(180,'submissionId','7','int'),(180,'username','dbarnes','string'),(181,'fileId','19','int'),(181,'fileStage','4','int'),(181,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(181,'sourceSubmissionFileId','26','int'),(181,'submissionFileId','31','int'),(181,'submissionId','7','int'),(181,'username','dbarnes','string'),(182,'fileId','19','int'),(182,'fileStage','4','int'),(182,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(182,'submissionFileId','31','int'),(182,'submissionId','7','int'),(182,'username','dbarnes','string'),(183,'fileId','20','int'),(183,'fileStage','4','int'),(183,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(183,'sourceSubmissionFileId','27','int'),(183,'submissionFileId','32','int'),(183,'submissionId','7','int'),(183,'username','dbarnes','string'),(184,'fileId','20','int'),(184,'fileStage','4','int'),(184,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(184,'submissionFileId','32','int'),(184,'submissionId','7','int'),(184,'username','dbarnes','string'),(185,'reviewAssignmentId','8','string'),(185,'reviewerName','Adela Gallego','string'),(185,'round','1','int'),(185,'stageId','3','int'),(185,'submissionId','7','int'),(186,'decision','Accept Submission','string'),(186,'editorName','Daniel Barnes','string'),(186,'submissionId','7','int'),(187,'name','Maria Fritz','string'),(187,'userGroupName','Copyeditor','string'),(187,'username','mfritz','string'),(190,'fileId','21','int'),(190,'fileStage','2','int'),(190,'originalFileName','Editorial.pdf','string'),(190,'sourceSubmissionFileId',NULL,'string'),(190,'submissionFileId','33','int'),(190,'submissionId','8','int'),(190,'username','dbarnes','string'),(191,'fileId','21','int'),(191,'fileStage','2','int'),(191,'name','Editorial.pdf','string'),(191,'submissionFileId','33','int'),(191,'submissionId','8','int'),(191,'username','dbarnes','string'),(192,'fileId','21','int'),(192,'fileStage','2','int'),(192,'originalFileName','Editorial.pdf','string'),(192,'sourceSubmissionFileId',NULL,'string'),(192,'submissionFileId','33','int'),(192,'submissionId','8','int'),(192,'username','dbarnes','string'),(193,'fileId','21','int'),(193,'fileStage','2','int'),(193,'name','Editorial.pdf','string'),(193,'originalFileName','Editorial.pdf','string'),(193,'sourceSubmissionFileId',NULL,'string'),(193,'submissionFileId','33','int'),(193,'submissionId','8','int'),(193,'username','dbarnes','string'),(198,'fileId','22','int'),(198,'fileStage','2','int'),(198,'originalFileName','Internet, openness and the future of the.pdf','string'),(198,'sourceSubmissionFileId',NULL,'string'),(198,'submissionFileId','34','int'),(198,'submissionId','9','int'),(198,'username','fperini','string'),(199,'fileId','22','int'),(199,'fileStage','2','int'),(199,'name','Internet, openness and the future of the.pdf','string'),(199,'submissionFileId','34','int'),(199,'submissionId','9','int'),(199,'username','fperini','string'),(200,'fileId','22','int'),(200,'fileStage','2','int'),(200,'originalFileName','Internet, openness and the future of the.pdf','string'),(200,'sourceSubmissionFileId',NULL,'string'),(200,'submissionFileId','34','int'),(200,'submissionId','9','int'),(200,'username','fperini','string'),(201,'fileId','22','int'),(201,'fileStage','2','int'),(201,'name','Internet, openness and the future of the.pdf','string'),(201,'originalFileName','Internet, openness and the future of the.pdf','string'),(201,'sourceSubmissionFileId',NULL,'string'),(201,'submissionFileId','34','int'),(201,'submissionId','9','int'),(201,'username','fperini','string'),(202,'fileId','23','int'),(202,'fileStage','2','int'),(202,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(202,'sourceSubmissionFileId',NULL,'string'),(202,'submissionFileId','35','int'),(202,'submissionId','9','int'),(202,'username','fperini','string'),(203,'fileId','23','int'),(203,'fileStage','2','int'),(203,'name','Imagining the Internet: Open, closed or .pdf','string'),(203,'submissionFileId','35','int'),(203,'submissionId','9','int'),(203,'username','fperini','string'),(204,'fileId','23','int'),(204,'fileStage','2','int'),(204,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(204,'sourceSubmissionFileId',NULL,'string'),(204,'submissionFileId','35','int'),(204,'submissionId','9','int'),(204,'username','fperini','string'),(205,'fileId','23','int'),(205,'fileStage','2','int'),(205,'name','Imagining the Internet: Open, closed or .pdf','string'),(205,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(205,'sourceSubmissionFileId',NULL,'string'),(205,'submissionFileId','35','int'),(205,'submissionId','9','int'),(205,'username','fperini','string'),(206,'fileId','24','int'),(206,'fileStage','2','int'),(206,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(206,'sourceSubmissionFileId',NULL,'string'),(206,'submissionFileId','36','int'),(206,'submissionId','9','int'),(206,'username','fperini','string'),(207,'fileId','24','int'),(207,'fileStage','2','int'),(207,'name','The internet in LAC will remain free, pu.pdf','string'),(207,'submissionFileId','36','int'),(207,'submissionId','9','int'),(207,'username','fperini','string'),(208,'fileId','24','int'),(208,'fileStage','2','int'),(208,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(208,'sourceSubmissionFileId',NULL,'string'),(208,'submissionFileId','36','int'),(208,'submissionId','9','int'),(208,'username','fperini','string'),(209,'fileId','24','int'),(209,'fileStage','2','int'),(209,'name','The internet in LAC will remain free, pu.pdf','string'),(209,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(209,'sourceSubmissionFileId',NULL,'string'),(209,'submissionFileId','36','int'),(209,'submissionId','9','int'),(209,'username','fperini','string'),(210,'fileId','25','int'),(210,'fileStage','2','int'),(210,'originalFileName','Free Internet?.pdf','string'),(210,'sourceSubmissionFileId',NULL,'string'),(210,'submissionFileId','37','int'),(210,'submissionId','9','int'),(210,'username','fperini','string'),(211,'fileId','25','int'),(211,'fileStage','2','int'),(211,'name','Free Internet?.pdf','string'),(211,'submissionFileId','37','int'),(211,'submissionId','9','int'),(211,'username','fperini','string'),(212,'fileId','25','int'),(212,'fileStage','2','int'),(212,'originalFileName','Free Internet?.pdf','string'),(212,'sourceSubmissionFileId',NULL,'string'),(212,'submissionFileId','37','int'),(212,'submissionId','9','int'),(212,'username','fperini','string'),(213,'fileId','25','int'),(213,'fileStage','2','int'),(213,'name','Free Internet?.pdf','string'),(213,'originalFileName','Free Internet?.pdf','string'),(213,'sourceSubmissionFileId',NULL,'string'),(213,'submissionFileId','37','int'),(213,'submissionId','9','int'),(213,'username','fperini','string'),(214,'fileId','26','int'),(214,'fileStage','2','int'),(214,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(214,'sourceSubmissionFileId',NULL,'string'),(214,'submissionFileId','38','int'),(214,'submissionId','9','int'),(214,'username','fperini','string'),(215,'fileId','26','int'),(215,'fileStage','2','int'),(215,'name','Risks and challenges for freedom of expr.pdf','string'),(215,'submissionFileId','38','int'),(215,'submissionId','9','int'),(215,'username','fperini','string'),(216,'fileId','26','int'),(216,'fileStage','2','int'),(216,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(216,'sourceSubmissionFileId',NULL,'string'),(216,'submissionFileId','38','int'),(216,'submissionId','9','int'),(216,'username','fperini','string'),(217,'fileId','26','int'),(217,'fileStage','2','int'),(217,'name','Risks and challenges for freedom of expr.pdf','string'),(217,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(217,'sourceSubmissionFileId',NULL,'string'),(217,'submissionFileId','38','int'),(217,'submissionId','9','int'),(217,'username','fperini','string'),(224,'decision','Send to Internal Review','string'),(224,'editorName','Daniel Barnes','string'),(224,'submissionId','9','int'),(225,'fileId','22','int'),(225,'fileStage','19','int'),(225,'originalFileName','Internet, openness and the future of the.pdf','string'),(225,'sourceSubmissionFileId','34','int'),(225,'submissionFileId','39','int'),(225,'submissionId','9','int'),(225,'username','dbarnes','string'),(226,'fileId','22','int'),(226,'fileStage','19','int'),(226,'name','Internet, openness and the future of the.pdf','string'),(226,'submissionFileId','39','int'),(226,'submissionId','9','int'),(226,'username','dbarnes','string'),(227,'fileId','23','int'),(227,'fileStage','19','int'),(227,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(227,'sourceSubmissionFileId','35','int'),(227,'submissionFileId','40','int'),(227,'submissionId','9','int'),(227,'username','dbarnes','string'),(228,'fileId','23','int'),(228,'fileStage','19','int'),(228,'name','Imagining the Internet: Open, closed or .pdf','string'),(228,'submissionFileId','40','int'),(228,'submissionId','9','int'),(228,'username','dbarnes','string'),(229,'fileId','24','int'),(229,'fileStage','19','int'),(229,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(229,'sourceSubmissionFileId','36','int'),(229,'submissionFileId','41','int'),(229,'submissionId','9','int'),(229,'username','dbarnes','string'),(230,'fileId','24','int'),(230,'fileStage','19','int'),(230,'name','The internet in LAC will remain free, pu.pdf','string'),(230,'submissionFileId','41','int'),(230,'submissionId','9','int'),(230,'username','dbarnes','string'),(231,'fileId','25','int'),(231,'fileStage','19','int'),(231,'originalFileName','Free Internet?.pdf','string'),(231,'sourceSubmissionFileId','37','int'),(231,'submissionFileId','42','int'),(231,'submissionId','9','int'),(231,'username','dbarnes','string'),(232,'fileId','25','int'),(232,'fileStage','19','int'),(232,'name','Free Internet?.pdf','string'),(232,'submissionFileId','42','int'),(232,'submissionId','9','int'),(232,'username','dbarnes','string'),(233,'fileId','26','int'),(233,'fileStage','19','int'),(233,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(233,'sourceSubmissionFileId','38','int'),(233,'submissionFileId','43','int'),(233,'submissionId','9','int'),(233,'username','dbarnes','string'),(234,'fileId','26','int'),(234,'fileStage','19','int'),(234,'name','Risks and challenges for freedom of expr.pdf','string'),(234,'submissionFileId','43','int'),(234,'submissionId','9','int'),(234,'username','dbarnes','string'),(237,'fileId','27','int'),(237,'fileStage','2','int'),(237,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(237,'sourceSubmissionFileId',NULL,'string'),(237,'submissionFileId','44','int'),(237,'submissionId','10','int'),(237,'username','jbrower','string'),(238,'fileId','27','int'),(238,'fileStage','2','int'),(238,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(238,'submissionFileId','44','int'),(238,'submissionId','10','int'),(238,'username','jbrower','string'),(239,'fileId','27','int'),(239,'fileStage','2','int'),(239,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(239,'sourceSubmissionFileId',NULL,'string'),(239,'submissionFileId','44','int'),(239,'submissionId','10','int'),(239,'username','jbrower','string'),(240,'fileId','27','int'),(240,'fileStage','2','int'),(240,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(240,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(240,'sourceSubmissionFileId',NULL,'string'),(240,'submissionFileId','44','int'),(240,'submissionId','10','int'),(240,'username','jbrower','string'),(245,'fileId','28','int'),(245,'fileStage','2','int'),(245,'originalFileName','Dreamwork.pdf','string'),(245,'sourceSubmissionFileId',NULL,'string'),(245,'submissionFileId','45','int'),(245,'submissionId','11','int'),(245,'username','jlockehart','string'),(246,'fileId','28','int'),(246,'fileStage','2','int'),(246,'name','Dreamwork.pdf','string'),(246,'submissionFileId','45','int'),(246,'submissionId','11','int'),(246,'username','jlockehart','string'),(247,'fileId','28','int'),(247,'fileStage','2','int'),(247,'originalFileName','Dreamwork.pdf','string'),(247,'sourceSubmissionFileId',NULL,'string'),(247,'submissionFileId','45','int'),(247,'submissionId','11','int'),(247,'username','jlockehart','string'),(248,'fileId','28','int'),(248,'fileStage','2','int'),(248,'name','Dreamwork.pdf','string'),(248,'originalFileName','Dreamwork.pdf','string'),(248,'sourceSubmissionFileId',NULL,'string'),(248,'submissionFileId','45','int'),(248,'submissionId','11','int'),(248,'username','jlockehart','string'),(251,'decision','Send to Internal Review','string'),(251,'editorName','Daniel Barnes','string'),(251,'submissionId','11','int'),(252,'fileId','28','int'),(252,'fileStage','19','int'),(252,'originalFileName','Dreamwork.pdf','string'),(252,'sourceSubmissionFileId','45','int'),(252,'submissionFileId','46','int'),(252,'submissionId','11','int'),(252,'username','dbarnes','string'),(253,'fileId','28','int'),(253,'fileStage','19','int'),(253,'name','Dreamwork.pdf','string'),(253,'submissionFileId','46','int'),(253,'submissionId','11','int'),(253,'username','dbarnes','string'),(254,'reviewAssignmentId','9','string'),(254,'reviewerName','Aisla McCrae','string'),(254,'round','1','int'),(254,'stageId','2','int'),(254,'submissionId','11','int'),(255,'decision','Send to External Review','string'),(255,'editorName','Daniel Barnes','string'),(255,'submissionId','11','int'),(256,'reviewAssignmentId','10','string'),(256,'reviewerName','Adela Gallego','string'),(256,'round','1','int'),(256,'stageId','3','int'),(256,'submissionId','11','int'),(257,'reviewAssignmentId','11','string'),(257,'reviewerName','Gonzalo Favio','string'),(257,'round','1','int'),(257,'stageId','3','int'),(257,'submissionId','11','int'),(258,'reviewAssignmentId','10','int'),(258,'reviewerName','Adela Gallego','string'),(258,'round','1','int'),(258,'submissionId','11','int'),(259,'reviewAssignmentId','10','int'),(259,'reviewerName','Adela Gallego','string'),(259,'round','1','int'),(259,'submissionId','11','int'),(260,'reviewAssignmentId','11','int'),(260,'reviewerName','Gonzalo Favio','string'),(260,'round','1','int'),(260,'submissionId','11','int'),(261,'reviewAssignmentId','11','int'),(261,'reviewerName','Gonzalo Favio','string'),(261,'round','1','int'),(261,'submissionId','11','int'),(262,'decision','Accept Submission','string'),(262,'editorName','Daniel Barnes','string'),(262,'submissionId','11','int'),(265,'fileId','29','int'),(265,'fileStage','2','int'),(265,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(265,'sourceSubmissionFileId',NULL,'string'),(265,'submissionFileId','47','int'),(265,'submissionId','12','int'),(265,'username','lelder','string'),(266,'fileId','29','int'),(266,'fileStage','2','int'),(266,'name','Catalyzing Access through Social and Tec.pdf','string'),(266,'submissionFileId','47','int'),(266,'submissionId','12','int'),(266,'username','lelder','string'),(267,'fileId','29','int'),(267,'fileStage','2','int'),(267,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(267,'sourceSubmissionFileId',NULL,'string'),(267,'submissionFileId','47','int'),(267,'submissionId','12','int'),(267,'username','lelder','string'),(268,'fileId','29','int'),(268,'fileStage','2','int'),(268,'name','Catalyzing Access through Social and Tec.pdf','string'),(268,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(268,'sourceSubmissionFileId',NULL,'string'),(268,'submissionFileId','47','int'),(268,'submissionId','12','int'),(268,'username','lelder','string'),(269,'fileId','30','int'),(269,'fileStage','2','int'),(269,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(269,'sourceSubmissionFileId',NULL,'string'),(269,'submissionFileId','48','int'),(269,'submissionId','12','int'),(269,'username','lelder','string'),(270,'fileId','30','int'),(270,'fileStage','2','int'),(270,'name','Catalyzing Access via Telecommunications.pdf','string'),(270,'submissionFileId','48','int'),(270,'submissionId','12','int'),(270,'username','lelder','string'),(271,'fileId','30','int'),(271,'fileStage','2','int'),(271,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(271,'sourceSubmissionFileId',NULL,'string'),(271,'submissionFileId','48','int'),(271,'submissionId','12','int'),(271,'username','lelder','string'),(272,'fileId','30','int'),(272,'fileStage','2','int'),(272,'name','Catalyzing Access via Telecommunications.pdf','string'),(272,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(272,'sourceSubmissionFileId',NULL,'string'),(272,'submissionFileId','48','int'),(272,'submissionId','12','int'),(272,'username','lelder','string'),(273,'fileId','31','int'),(273,'fileStage','2','int'),(273,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(273,'sourceSubmissionFileId',NULL,'string'),(273,'submissionFileId','49','int'),(273,'submissionId','12','int'),(273,'username','lelder','string'),(274,'fileId','31','int'),(274,'fileStage','2','int'),(274,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(274,'submissionFileId','49','int'),(274,'submissionId','12','int'),(274,'username','lelder','string'),(275,'fileId','31','int'),(275,'fileStage','2','int'),(275,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(275,'sourceSubmissionFileId',NULL,'string'),(275,'submissionFileId','49','int'),(275,'submissionId','12','int'),(275,'username','lelder','string'),(276,'fileId','31','int'),(276,'fileStage','2','int'),(276,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(276,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(276,'sourceSubmissionFileId',NULL,'string'),(276,'submissionFileId','49','int'),(276,'submissionId','12','int'),(276,'username','lelder','string'),(286,'decision','Send to Internal Review','string'),(286,'editorName','Daniel Barnes','string'),(286,'submissionId','12','int'),(287,'fileId','29','int'),(287,'fileStage','19','int'),(287,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(287,'sourceSubmissionFileId','47','int'),(287,'submissionFileId','50','int'),(287,'submissionId','12','int'),(287,'username','dbarnes','string'),(288,'fileId','29','int'),(288,'fileStage','19','int'),(288,'name','Catalyzing Access through Social and Tec.pdf','string'),(288,'submissionFileId','50','int'),(288,'submissionId','12','int'),(288,'username','dbarnes','string'),(289,'fileId','30','int'),(289,'fileStage','19','int'),(289,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(289,'sourceSubmissionFileId','48','int'),(289,'submissionFileId','51','int'),(289,'submissionId','12','int'),(289,'username','dbarnes','string'),(290,'fileId','30','int'),(290,'fileStage','19','int'),(290,'name','Catalyzing Access via Telecommunications.pdf','string'),(290,'submissionFileId','51','int'),(290,'submissionId','12','int'),(290,'username','dbarnes','string'),(291,'fileId','31','int'),(291,'fileStage','19','int'),(291,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(291,'sourceSubmissionFileId','49','int'),(291,'submissionFileId','52','int'),(291,'submissionId','12','int'),(291,'username','dbarnes','string'),(292,'fileId','31','int'),(292,'fileStage','19','int'),(292,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(292,'submissionFileId','52','int'),(292,'submissionId','12','int'),(292,'username','dbarnes','string'),(293,'reviewAssignmentId','12','string'),(293,'reviewerName','Julie Janssen','string'),(293,'round','1','int'),(293,'stageId','2','int'),(293,'submissionId','12','int'),(294,'reviewAssignmentId','13','string'),(294,'reviewerName','Paul Hudson','string'),(294,'round','1','int'),(294,'stageId','2','int'),(294,'submissionId','12','int'),(295,'reviewAssignmentId','14','string'),(295,'reviewerName','Aisla McCrae','string'),(295,'round','1','int'),(295,'stageId','2','int'),(295,'submissionId','12','int'),(296,'reviewAssignmentId','13','int'),(296,'reviewerName','Paul Hudson','string'),(296,'round','1','int'),(296,'submissionId','12','int'),(297,'reviewAssignmentId','13','int'),(297,'reviewerName','Paul Hudson','string'),(297,'round','1','int'),(297,'submissionId','12','int'),(300,'fileId','32','int'),(300,'fileStage','2','int'),(300,'originalFileName','Current State of Mobile Learning.pdf','string'),(300,'sourceSubmissionFileId',NULL,'string'),(300,'submissionFileId','53','int'),(300,'submissionId','13','int'),(300,'username','mally','string'),(301,'fileId','32','int'),(301,'fileStage','2','int'),(301,'name','Current State of Mobile Learning.pdf','string'),(301,'submissionFileId','53','int'),(301,'submissionId','13','int'),(301,'username','mally','string'),(302,'fileId','32','int'),(302,'fileStage','2','int'),(302,'originalFileName','Current State of Mobile Learning.pdf','string'),(302,'sourceSubmissionFileId',NULL,'string'),(302,'submissionFileId','53','int'),(302,'submissionId','13','int'),(302,'username','mally','string'),(303,'fileId','32','int'),(303,'fileStage','2','int'),(303,'name','Current State of Mobile Learning.pdf','string'),(303,'originalFileName','Current State of Mobile Learning.pdf','string'),(303,'sourceSubmissionFileId',NULL,'string'),(303,'submissionFileId','53','int'),(303,'submissionId','13','int'),(303,'username','mally','string'),(304,'fileId','33','int'),(304,'fileStage','2','int'),(304,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(304,'sourceSubmissionFileId',NULL,'string'),(304,'submissionFileId','54','int'),(304,'submissionId','13','int'),(304,'username','mally','string'),(305,'fileId','33','int'),(305,'fileStage','2','int'),(305,'name','A Model for Framing Mobile Learning.pdf','string'),(305,'submissionFileId','54','int'),(305,'submissionId','13','int'),(305,'username','mally','string'),(306,'fileId','33','int'),(306,'fileStage','2','int'),(306,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(306,'sourceSubmissionFileId',NULL,'string'),(306,'submissionFileId','54','int'),(306,'submissionId','13','int'),(306,'username','mally','string'),(307,'fileId','33','int'),(307,'fileStage','2','int'),(307,'name','A Model for Framing Mobile Learning.pdf','string'),(307,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(307,'sourceSubmissionFileId',NULL,'string'),(307,'submissionFileId','54','int'),(307,'submissionId','13','int'),(307,'username','mally','string'),(308,'fileId','34','int'),(308,'fileStage','2','int'),(308,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(308,'sourceSubmissionFileId',NULL,'string'),(308,'submissionFileId','55','int'),(308,'submissionId','13','int'),(308,'username','mally','string'),(309,'fileId','34','int'),(309,'fileStage','2','int'),(309,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(309,'submissionFileId','55','int'),(309,'submissionId','13','int'),(309,'username','mally','string'),(310,'fileId','34','int'),(310,'fileStage','2','int'),(310,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(310,'sourceSubmissionFileId',NULL,'string'),(310,'submissionFileId','55','int'),(310,'submissionId','13','int'),(310,'username','mally','string'),(311,'fileId','34','int'),(311,'fileStage','2','int'),(311,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(311,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(311,'sourceSubmissionFileId',NULL,'string'),(311,'submissionFileId','55','int'),(311,'submissionId','13','int'),(311,'username','mally','string'),(317,'decision','Send to Internal Review','string'),(317,'editorName','Daniel Barnes','string'),(317,'submissionId','13','int'),(318,'fileId','32','int'),(318,'fileStage','19','int'),(318,'originalFileName','Current State of Mobile Learning.pdf','string'),(318,'sourceSubmissionFileId','53','int'),(318,'submissionFileId','56','int'),(318,'submissionId','13','int'),(318,'username','dbarnes','string'),(319,'fileId','32','int'),(319,'fileStage','19','int'),(319,'name','Current State of Mobile Learning.pdf','string'),(319,'submissionFileId','56','int'),(319,'submissionId','13','int'),(319,'username','dbarnes','string'),(320,'fileId','33','int'),(320,'fileStage','19','int'),(320,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(320,'sourceSubmissionFileId','54','int'),(320,'submissionFileId','57','int'),(320,'submissionId','13','int'),(320,'username','dbarnes','string'),(321,'fileId','33','int'),(321,'fileStage','19','int'),(321,'name','A Model for Framing Mobile Learning.pdf','string'),(321,'submissionFileId','57','int'),(321,'submissionId','13','int'),(321,'username','dbarnes','string'),(322,'fileId','34','int'),(322,'fileStage','19','int'),(322,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(322,'sourceSubmissionFileId','55','int'),(322,'submissionFileId','58','int'),(322,'submissionId','13','int'),(322,'username','dbarnes','string'),(323,'fileId','34','int'),(323,'fileStage','19','int'),(323,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(323,'submissionFileId','58','int'),(323,'submissionId','13','int'),(323,'username','dbarnes','string'),(324,'reviewAssignmentId','15','string'),(324,'reviewerName','Paul Hudson','string'),(324,'round','1','int'),(324,'stageId','2','int'),(324,'submissionId','13','int'),(325,'decision','Send to External Review','string'),(325,'editorName','Daniel Barnes','string'),(325,'submissionId','13','int'),(326,'reviewAssignmentId','16','string'),(326,'reviewerName','Adela Gallego','string'),(326,'round','1','int'),(326,'stageId','3','int'),(326,'submissionId','13','int'),(327,'reviewAssignmentId','17','string'),(327,'reviewerName','Al Zacharia','string'),(327,'round','1','int'),(327,'stageId','3','int'),(327,'submissionId','13','int'),(328,'reviewAssignmentId','18','string'),(328,'reviewerName','Gonzalo Favio','string'),(328,'round','1','int'),(328,'stageId','3','int'),(328,'submissionId','13','int'),(329,'reviewAssignmentId','16','int'),(329,'reviewerName','Adela Gallego','string'),(329,'round','1','int'),(329,'submissionId','13','int'),(330,'reviewAssignmentId','16','int'),(330,'reviewerName','Adela Gallego','string'),(330,'round','1','int'),(330,'submissionId','13','int'),(331,'reviewAssignmentId','18','int'),(331,'reviewerName','Gonzalo Favio','string'),(331,'round','1','int'),(331,'submissionId','13','int'),(332,'reviewAssignmentId','18','int'),(332,'reviewerName','Gonzalo Favio','string'),(332,'round','1','int'),(332,'submissionId','13','int'),(333,'decision','Accept Submission','string'),(333,'editorName','Daniel Barnes','string'),(333,'submissionId','13','int'),(336,'fileId','35','int'),(336,'fileStage','2','int'),(336,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(336,'sourceSubmissionFileId',NULL,'string'),(336,'submissionFileId','59','int'),(336,'submissionId','14','int'),(336,'username','mdawson','string'),(337,'fileId','35','int'),(337,'fileStage','2','int'),(337,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(337,'submissionFileId','59','int'),(337,'submissionId','14','int'),(337,'username','mdawson','string'),(338,'fileId','35','int'),(338,'fileStage','2','int'),(338,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(338,'sourceSubmissionFileId',NULL,'string'),(338,'submissionFileId','59','int'),(338,'submissionId','14','int'),(338,'username','mdawson','string'),(339,'fileId','35','int'),(339,'fileStage','2','int'),(339,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(339,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(339,'sourceSubmissionFileId',NULL,'string'),(339,'submissionFileId','59','int'),(339,'submissionId','14','int'),(339,'username','mdawson','string'),(340,'fileId','36','int'),(340,'fileStage','2','int'),(340,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(340,'sourceSubmissionFileId',NULL,'string'),(340,'submissionFileId','60','int'),(340,'submissionId','14','int'),(340,'username','mdawson','string'),(341,'fileId','36','int'),(341,'fileStage','2','int'),(341,'name','Chapter 2: Classical Music and the Class.pdf','string'),(341,'submissionFileId','60','int'),(341,'submissionId','14','int'),(341,'username','mdawson','string'),(342,'fileId','36','int'),(342,'fileStage','2','int'),(342,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(342,'sourceSubmissionFileId',NULL,'string'),(342,'submissionFileId','60','int'),(342,'submissionId','14','int'),(342,'username','mdawson','string'),(343,'fileId','36','int'),(343,'fileStage','2','int'),(343,'name','Chapter 2: Classical Music and the Class.pdf','string'),(343,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(343,'sourceSubmissionFileId',NULL,'string'),(343,'submissionFileId','60','int'),(343,'submissionId','14','int'),(343,'username','mdawson','string'),(344,'fileId','37','int'),(344,'fileStage','2','int'),(344,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(344,'sourceSubmissionFileId',NULL,'string'),(344,'submissionFileId','61','int'),(344,'submissionId','14','int'),(344,'username','mdawson','string'),(345,'fileId','37','int'),(345,'fileStage','2','int'),(345,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(345,'submissionFileId','61','int'),(345,'submissionId','14','int'),(345,'username','mdawson','string'),(346,'fileId','37','int'),(346,'fileStage','2','int'),(346,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(346,'sourceSubmissionFileId',NULL,'string'),(346,'submissionFileId','61','int'),(346,'submissionId','14','int'),(346,'username','mdawson','string'),(347,'fileId','37','int'),(347,'fileStage','2','int'),(347,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(347,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(347,'sourceSubmissionFileId',NULL,'string'),(347,'submissionFileId','61','int'),(347,'submissionId','14','int'),(347,'username','mdawson','string'),(348,'fileId','38','int'),(348,'fileStage','2','int'),(348,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(348,'sourceSubmissionFileId',NULL,'string'),(348,'submissionFileId','62','int'),(348,'submissionId','14','int'),(348,'username','mdawson','string'),(349,'fileId','38','int'),(349,'fileStage','2','int'),(349,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(349,'submissionFileId','62','int'),(349,'submissionId','14','int'),(349,'username','mdawson','string'),(350,'fileId','38','int'),(350,'fileStage','2','int'),(350,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(350,'sourceSubmissionFileId',NULL,'string'),(350,'submissionFileId','62','int'),(350,'submissionId','14','int'),(350,'username','mdawson','string'),(351,'fileId','38','int'),(351,'fileStage','2','int'),(351,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(351,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(351,'sourceSubmissionFileId',NULL,'string'),(351,'submissionFileId','62','int'),(351,'submissionId','14','int'),(351,'username','mdawson','string'),(352,'fileId','39','int'),(352,'fileStage','2','int'),(352,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(352,'sourceSubmissionFileId',NULL,'string'),(352,'submissionFileId','63','int'),(352,'submissionId','14','int'),(352,'username','mdawson','string'),(353,'fileId','39','int'),(353,'fileStage','2','int'),(353,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(353,'submissionFileId','63','int'),(353,'submissionId','14','int'),(353,'username','mdawson','string'),(354,'fileId','39','int'),(354,'fileStage','2','int'),(354,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(354,'sourceSubmissionFileId',NULL,'string'),(354,'submissionFileId','63','int'),(354,'submissionId','14','int'),(354,'username','mdawson','string'),(355,'fileId','39','int'),(355,'fileStage','2','int'),(355,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(355,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(355,'sourceSubmissionFileId',NULL,'string'),(355,'submissionFileId','63','int'),(355,'submissionId','14','int'),(355,'username','mdawson','string'),(356,'fileId','40','int'),(356,'fileStage','2','int'),(356,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(356,'sourceSubmissionFileId',NULL,'string'),(356,'submissionFileId','64','int'),(356,'submissionId','14','int'),(356,'username','mdawson','string'),(357,'fileId','40','int'),(357,'fileStage','2','int'),(357,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(357,'submissionFileId','64','int'),(357,'submissionId','14','int'),(357,'username','mdawson','string'),(358,'fileId','40','int'),(358,'fileStage','2','int'),(358,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(358,'sourceSubmissionFileId',NULL,'string'),(358,'submissionFileId','64','int'),(358,'submissionId','14','int'),(358,'username','mdawson','string'),(359,'fileId','40','int'),(359,'fileStage','2','int'),(359,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(359,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(359,'sourceSubmissionFileId',NULL,'string'),(359,'submissionFileId','64','int'),(359,'submissionId','14','int'),(359,'username','mdawson','string'),(364,'decision','Send to Internal Review','string'),(364,'editorName','Daniel Barnes','string'),(364,'submissionId','14','int'),(365,'reviewAssignmentId','19','string'),(365,'reviewerName','Julie Janssen','string'),(365,'round','1','int'),(365,'stageId','2','int'),(365,'submissionId','14','int'),(366,'decision','Send to External Review','string'),(366,'editorName','Daniel Barnes','string'),(366,'submissionId','14','int'),(367,'reviewAssignmentId','20','string'),(367,'reviewerName','Al Zacharia','string'),(367,'round','1','int'),(367,'stageId','3','int'),(367,'submissionId','14','int'),(368,'decision','Accept Submission','string'),(368,'editorName','Daniel Barnes','string'),(368,'submissionId','14','int'),(369,'name','Maria Fritz','string'),(369,'userGroupName','Copyeditor','string'),(369,'username','mfritz','string'),(370,'decision','Send To Production','string'),(370,'editorName','Daniel Barnes','string'),(370,'submissionId','14','int'),(371,'name','Graham Cox','string'),(371,'userGroupName','Layout Editor','string'),(371,'username','gcox','string'),(372,'name','Sabine Kumar','string'),(372,'userGroupName','Proofreader','string'),(372,'username','skumar','string'),(373,'formatName','PDF','string'),(374,'fileId','35','int'),(374,'fileStage','10','int'),(374,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(374,'sourceSubmissionFileId','59','int'),(374,'submissionFileId','65','int'),(374,'submissionId','14','int'),(374,'username','dbarnes','string'),(375,'fileId','35','int'),(375,'fileStage','10','int'),(375,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(375,'submissionFileId','65','int'),(375,'submissionId','14','int'),(375,'username','dbarnes','string'),(376,'fileId','36','int'),(376,'fileStage','10','int'),(376,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(376,'sourceSubmissionFileId','60','int'),(376,'submissionFileId','66','int'),(376,'submissionId','14','int'),(376,'username','dbarnes','string'),(377,'fileId','36','int'),(377,'fileStage','10','int'),(377,'name','Chapter 2: Classical Music and the Class.pdf','string'),(377,'submissionFileId','66','int'),(377,'submissionId','14','int'),(377,'username','dbarnes','string'),(378,'fileId','37','int'),(378,'fileStage','10','int'),(378,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(378,'sourceSubmissionFileId','61','int'),(378,'submissionFileId','67','int'),(378,'submissionId','14','int'),(378,'username','dbarnes','string'),(379,'fileId','37','int'),(379,'fileStage','10','int'),(379,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(379,'submissionFileId','67','int'),(379,'submissionId','14','int'),(379,'username','dbarnes','string'),(380,'fileId','38','int'),(380,'fileStage','10','int'),(380,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(380,'sourceSubmissionFileId','62','int'),(380,'submissionFileId','68','int'),(380,'submissionId','14','int'),(380,'username','dbarnes','string'),(381,'fileId','38','int'),(381,'fileStage','10','int'),(381,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(381,'submissionFileId','68','int'),(381,'submissionId','14','int'),(381,'username','dbarnes','string'),(382,'fileId','39','int'),(382,'fileStage','10','int'),(382,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(382,'sourceSubmissionFileId','63','int'),(382,'submissionFileId','69','int'),(382,'submissionId','14','int'),(382,'username','dbarnes','string'),(383,'fileId','39','int'),(383,'fileStage','10','int'),(383,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(383,'submissionFileId','69','int'),(383,'submissionId','14','int'),(383,'username','dbarnes','string'),(384,'fileId','40','int'),(384,'fileStage','10','int'),(384,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(384,'sourceSubmissionFileId','64','int'),(384,'submissionFileId','70','int'),(384,'submissionId','14','int'),(384,'username','dbarnes','string'),(385,'fileId','40','int'),(385,'fileStage','10','int'),(385,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(385,'submissionFileId','70','int'),(385,'submissionId','14','int'),(385,'username','dbarnes','string'),(386,'publicationFormatName','PDF','string'),(387,'publicationFormatName','PDF','string'),(388,'fileId','35','int'),(388,'fileStage','10','int'),(388,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(388,'sourceSubmissionFileId','59','int'),(388,'submissionFileId','65','int'),(388,'submissionId','14','int'),(388,'username','dbarnes','string'),(389,'fileId','35','int'),(389,'fileStage','10','int'),(389,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(389,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(389,'sourceSubmissionFileId','59','int'),(389,'submissionFileId','65','int'),(389,'submissionId','14','int'),(389,'username','dbarnes','string'),(390,'file','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(390,'name','Daniel Barnes','string'),(390,'username','dbarnes','string'),(391,'fileId','36','int'),(391,'fileStage','10','int'),(391,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(391,'sourceSubmissionFileId','60','int'),(391,'submissionFileId','66','int'),(391,'submissionId','14','int'),(391,'username','dbarnes','string'),(392,'fileId','36','int'),(392,'fileStage','10','int'),(392,'name','Chapter 2: Classical Music and the Class.pdf','string'),(392,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(392,'sourceSubmissionFileId','60','int'),(392,'submissionFileId','66','int'),(392,'submissionId','14','int'),(392,'username','dbarnes','string'),(393,'file','Chapter 2: Classical Music and the Class.pdf','string'),(393,'name','Daniel Barnes','string'),(393,'username','dbarnes','string'),(394,'fileId','37','int'),(394,'fileStage','10','int'),(394,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(394,'sourceSubmissionFileId','61','int'),(394,'submissionFileId','67','int'),(394,'submissionId','14','int'),(394,'username','dbarnes','string'),(395,'fileId','37','int'),(395,'fileStage','10','int'),(395,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(395,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(395,'sourceSubmissionFileId','61','int'),(395,'submissionFileId','67','int'),(395,'submissionId','14','int'),(395,'username','dbarnes','string'),(396,'file','Chapter 3: Situated Cognition and Bricol.pdf','string'),(396,'name','Daniel Barnes','string'),(396,'username','dbarnes','string'),(397,'fileId','38','int'),(397,'fileStage','10','int'),(397,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(397,'sourceSubmissionFileId','62','int'),(397,'submissionFileId','68','int'),(397,'submissionId','14','int'),(397,'username','dbarnes','string'),(398,'fileId','38','int'),(398,'fileStage','10','int'),(398,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(398,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(398,'sourceSubmissionFileId','62','int'),(398,'submissionFileId','68','int'),(398,'submissionId','14','int'),(398,'username','dbarnes','string'),(399,'file','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(399,'name','Daniel Barnes','string'),(399,'username','dbarnes','string'),(400,'fileId','39','int'),(400,'fileStage','10','int'),(400,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(400,'sourceSubmissionFileId','63','int'),(400,'submissionFileId','69','int'),(400,'submissionId','14','int'),(400,'username','dbarnes','string'),(401,'fileId','39','int'),(401,'fileStage','10','int'),(401,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(401,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(401,'sourceSubmissionFileId','63','int'),(401,'submissionFileId','69','int'),(401,'submissionId','14','int'),(401,'username','dbarnes','string'),(402,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(402,'name','Daniel Barnes','string'),(402,'username','dbarnes','string'),(403,'fileId','40','int'),(403,'fileStage','10','int'),(403,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(403,'sourceSubmissionFileId','64','int'),(403,'submissionFileId','70','int'),(403,'submissionId','14','int'),(403,'username','dbarnes','string'),(404,'fileId','40','int'),(404,'fileStage','10','int'),(404,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(404,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(404,'sourceSubmissionFileId','64','int'),(404,'submissionFileId','70','int'),(404,'submissionId','14','int'),(404,'username','dbarnes','string'),(405,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(405,'name','Daniel Barnes','string'),(405,'username','dbarnes','string'),(409,'fileId','41','int'),(409,'fileStage','2','int'),(409,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(409,'sourceSubmissionFileId',NULL,'string'),(409,'submissionFileId','71','int'),(409,'submissionId','15','int'),(409,'username','mforan','string'),(410,'fileId','41','int'),(410,'fileStage','2','int'),(410,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(410,'submissionFileId','71','int'),(410,'submissionId','15','int'),(410,'username','mforan','string'),(411,'fileId','41','int'),(411,'fileStage','2','int'),(411,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(411,'sourceSubmissionFileId',NULL,'string'),(411,'submissionFileId','71','int'),(411,'submissionId','15','int'),(411,'username','mforan','string'),(412,'fileId','41','int'),(412,'fileStage','2','int'),(412,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(412,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(412,'sourceSubmissionFileId',NULL,'string'),(412,'submissionFileId','71','int'),(412,'submissionId','15','int'),(412,'username','mforan','string'),(415,'decision','Send to External Review','string'),(415,'editorName','Daniel Barnes','string'),(415,'submissionId','15','int'),(416,'fileId','41','int'),(416,'fileStage','4','int'),(416,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(416,'sourceSubmissionFileId','71','int'),(416,'submissionFileId','72','int'),(416,'submissionId','15','int'),(416,'username','dbarnes','string'),(417,'fileId','41','int'),(417,'fileStage','4','int'),(417,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(417,'submissionFileId','72','int'),(417,'submissionId','15','int'),(417,'username','dbarnes','string'),(420,'fileId','42','int'),(420,'fileStage','2','int'),(420,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(420,'sourceSubmissionFileId',NULL,'string'),(420,'submissionFileId','73','int'),(420,'submissionId','16','int'),(420,'username','mpower','string'),(421,'fileId','42','int'),(421,'fileStage','2','int'),(421,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(421,'submissionFileId','73','int'),(421,'submissionId','16','int'),(421,'username','mpower','string'),(422,'fileId','42','int'),(422,'fileStage','2','int'),(422,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(422,'sourceSubmissionFileId',NULL,'string'),(422,'submissionFileId','73','int'),(422,'submissionId','16','int'),(422,'username','mpower','string'),(423,'fileId','42','int'),(423,'fileStage','2','int'),(423,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(423,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(423,'sourceSubmissionFileId',NULL,'string'),(423,'submissionFileId','73','int'),(423,'submissionId','16','int'),(423,'username','mpower','string'),(426,'decision','Send to External Review','string'),(426,'editorName','Daniel Barnes','string'),(426,'submissionId','16','int'),(427,'fileId','42','int'),(427,'fileStage','4','int'),(427,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(427,'sourceSubmissionFileId','73','int'),(427,'submissionFileId','74','int'),(427,'submissionId','16','int'),(427,'username','dbarnes','string'),(428,'fileId','42','int'),(428,'fileStage','4','int'),(428,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(428,'submissionFileId','74','int'),(428,'submissionId','16','int'),(428,'username','dbarnes','string'),(429,'reviewAssignmentId','21','string'),(429,'reviewerName','Adela Gallego','string'),(429,'round','1','int'),(429,'stageId','3','int'),(429,'submissionId','16','int'),(430,'reviewAssignmentId','22','string'),(430,'reviewerName','Al Zacharia','string'),(430,'round','1','int'),(430,'stageId','3','int'),(430,'submissionId','16','int'),(431,'reviewAssignmentId','23','string'),(431,'reviewerName','Gonzalo Favio','string'),(431,'round','1','int'),(431,'stageId','3','int'),(431,'submissionId','16','int'),(432,'reviewAssignmentId','21','int'),(432,'reviewerName','Adela Gallego','string'),(432,'round','1','int'),(432,'submissionId','16','int'),(433,'reviewAssignmentId','21','int'),(433,'reviewerName','Adela Gallego','string'),(433,'round','1','int'),(433,'submissionId','16','int'),(436,'fileId','43','int'),(436,'fileStage','2','int'),(436,'originalFileName','Preface.pdf','string'),(436,'sourceSubmissionFileId',NULL,'string'),(436,'submissionFileId','75','int'),(436,'submissionId','17','int'),(436,'username','msmith','string'),(437,'fileId','43','int'),(437,'fileStage','2','int'),(437,'name','Preface.pdf','string'),(437,'submissionFileId','75','int'),(437,'submissionId','17','int'),(437,'username','msmith','string'),(438,'fileId','43','int'),(438,'fileStage','2','int'),(438,'originalFileName','Preface.pdf','string'),(438,'sourceSubmissionFileId',NULL,'string'),(438,'submissionFileId','75','int'),(438,'submissionId','17','int'),(438,'username','msmith','string'),(439,'fileId','43','int'),(439,'fileStage','2','int'),(439,'name','Preface.pdf','string'),(439,'originalFileName','Preface.pdf','string'),(439,'sourceSubmissionFileId',NULL,'string'),(439,'submissionFileId','75','int'),(439,'submissionId','17','int'),(439,'username','msmith','string'),(440,'fileId','44','int'),(440,'fileStage','2','int'),(440,'originalFileName','Introduction.pdf','string'),(440,'sourceSubmissionFileId',NULL,'string'),(440,'submissionFileId','76','int'),(440,'submissionId','17','int'),(440,'username','msmith','string'),(441,'fileId','44','int'),(441,'fileStage','2','int'),(441,'name','Introduction.pdf','string'),(441,'submissionFileId','76','int'),(441,'submissionId','17','int'),(441,'username','msmith','string'),(442,'fileId','44','int'),(442,'fileStage','2','int'),(442,'originalFileName','Introduction.pdf','string'),(442,'sourceSubmissionFileId',NULL,'string'),(442,'submissionFileId','76','int'),(442,'submissionId','17','int'),(442,'username','msmith','string'),(443,'fileId','44','int'),(443,'fileStage','2','int'),(443,'name','Introduction.pdf','string'),(443,'originalFileName','Introduction.pdf','string'),(443,'sourceSubmissionFileId',NULL,'string'),(443,'submissionFileId','76','int'),(443,'submissionId','17','int'),(443,'username','msmith','string'),(444,'fileId','45','int'),(444,'fileStage','2','int'),(444,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(444,'sourceSubmissionFileId',NULL,'string'),(444,'submissionFileId','77','int'),(444,'submissionId','17','int'),(444,'username','msmith','string'),(445,'fileId','45','int'),(445,'fileStage','2','int'),(445,'name','The Emergence of Open Development in a N.pdf','string'),(445,'submissionFileId','77','int'),(445,'submissionId','17','int'),(445,'username','msmith','string'),(446,'fileId','45','int'),(446,'fileStage','2','int'),(446,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(446,'sourceSubmissionFileId',NULL,'string'),(446,'submissionFileId','77','int'),(446,'submissionId','17','int'),(446,'username','msmith','string'),(447,'fileId','45','int'),(447,'fileStage','2','int'),(447,'name','The Emergence of Open Development in a N.pdf','string'),(447,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(447,'sourceSubmissionFileId',NULL,'string'),(447,'submissionFileId','77','int'),(447,'submissionId','17','int'),(447,'username','msmith','string'),(448,'fileId','46','int'),(448,'fileStage','2','int'),(448,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(448,'sourceSubmissionFileId',NULL,'string'),(448,'submissionFileId','78','int'),(448,'submissionId','17','int'),(448,'username','msmith','string'),(449,'fileId','46','int'),(449,'fileStage','2','int'),(449,'name','Enacting Openness in ICT4D Research.pdf','string'),(449,'submissionFileId','78','int'),(449,'submissionId','17','int'),(449,'username','msmith','string'),(450,'fileId','46','int'),(450,'fileStage','2','int'),(450,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(450,'sourceSubmissionFileId',NULL,'string'),(450,'submissionFileId','78','int'),(450,'submissionId','17','int'),(450,'username','msmith','string'),(451,'fileId','46','int'),(451,'fileStage','2','int'),(451,'name','Enacting Openness in ICT4D Research.pdf','string'),(451,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(451,'sourceSubmissionFileId',NULL,'string'),(451,'submissionFileId','78','int'),(451,'submissionId','17','int'),(451,'username','msmith','string'),(452,'fileId','47','int'),(452,'fileStage','2','int'),(452,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(452,'sourceSubmissionFileId',NULL,'string'),(452,'submissionFileId','79','int'),(452,'submissionId','17','int'),(452,'username','msmith','string'),(453,'fileId','47','int'),(453,'fileStage','2','int'),(453,'name','Transparency and Development: Ethical Co.pdf','string'),(453,'submissionFileId','79','int'),(453,'submissionId','17','int'),(453,'username','msmith','string'),(454,'fileId','47','int'),(454,'fileStage','2','int'),(454,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(454,'sourceSubmissionFileId',NULL,'string'),(454,'submissionFileId','79','int'),(454,'submissionId','17','int'),(454,'username','msmith','string'),(455,'fileId','47','int'),(455,'fileStage','2','int'),(455,'name','Transparency and Development: Ethical Co.pdf','string'),(455,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(455,'sourceSubmissionFileId',NULL,'string'),(455,'submissionFileId','79','int'),(455,'submissionId','17','int'),(455,'username','msmith','string'),(456,'fileId','48','int'),(456,'fileStage','2','int'),(456,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(456,'sourceSubmissionFileId',NULL,'string'),(456,'submissionFileId','80','int'),(456,'submissionId','17','int'),(456,'username','msmith','string'),(457,'fileId','48','int'),(457,'fileStage','2','int'),(457,'name','Open Educational Resources: Opportunitie.pdf','string'),(457,'submissionFileId','80','int'),(457,'submissionId','17','int'),(457,'username','msmith','string'),(458,'fileId','48','int'),(458,'fileStage','2','int'),(458,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(458,'sourceSubmissionFileId',NULL,'string'),(458,'submissionFileId','80','int'),(458,'submissionId','17','int'),(458,'username','msmith','string'),(459,'fileId','48','int'),(459,'fileStage','2','int'),(459,'name','Open Educational Resources: Opportunitie.pdf','string'),(459,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(459,'sourceSubmissionFileId',NULL,'string'),(459,'submissionFileId','80','int'),(459,'submissionId','17','int'),(459,'username','msmith','string'),(469,'decision','Send to Internal Review','string'),(469,'editorName','Daniel Barnes','string'),(469,'submissionId','17','int'),(470,'fileId','43','int'),(470,'fileStage','19','int'),(470,'originalFileName','Preface.pdf','string'),(470,'sourceSubmissionFileId','75','int'),(470,'submissionFileId','81','int'),(470,'submissionId','17','int'),(470,'username','dbarnes','string'),(471,'fileId','43','int'),(471,'fileStage','19','int'),(471,'name','Preface.pdf','string'),(471,'submissionFileId','81','int'),(471,'submissionId','17','int'),(471,'username','dbarnes','string'),(472,'fileId','44','int'),(472,'fileStage','19','int'),(472,'originalFileName','Introduction.pdf','string'),(472,'sourceSubmissionFileId','76','int'),(472,'submissionFileId','82','int'),(472,'submissionId','17','int'),(472,'username','dbarnes','string'),(473,'fileId','44','int'),(473,'fileStage','19','int'),(473,'name','Introduction.pdf','string'),(473,'submissionFileId','82','int'),(473,'submissionId','17','int'),(473,'username','dbarnes','string'),(474,'fileId','45','int'),(474,'fileStage','19','int'),(474,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(474,'sourceSubmissionFileId','77','int'),(474,'submissionFileId','83','int'),(474,'submissionId','17','int'),(474,'username','dbarnes','string'),(475,'fileId','45','int'),(475,'fileStage','19','int'),(475,'name','The Emergence of Open Development in a N.pdf','string'),(475,'submissionFileId','83','int'),(475,'submissionId','17','int'),(475,'username','dbarnes','string'),(476,'fileId','46','int'),(476,'fileStage','19','int'),(476,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(476,'sourceSubmissionFileId','78','int'),(476,'submissionFileId','84','int'),(476,'submissionId','17','int'),(476,'username','dbarnes','string'),(477,'fileId','46','int'),(477,'fileStage','19','int'),(477,'name','Enacting Openness in ICT4D Research.pdf','string'),(477,'submissionFileId','84','int'),(477,'submissionId','17','int'),(477,'username','dbarnes','string'),(478,'fileId','47','int'),(478,'fileStage','19','int'),(478,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(478,'sourceSubmissionFileId','79','int'),(478,'submissionFileId','85','int'),(478,'submissionId','17','int'),(478,'username','dbarnes','string'),(479,'fileId','47','int'),(479,'fileStage','19','int'),(479,'name','Transparency and Development: Ethical Co.pdf','string'),(479,'submissionFileId','85','int'),(479,'submissionId','17','int'),(479,'username','dbarnes','string'),(480,'fileId','48','int'),(480,'fileStage','19','int'),(480,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(480,'sourceSubmissionFileId','80','int'),(480,'submissionFileId','86','int'),(480,'submissionId','17','int'),(480,'username','dbarnes','string'),(481,'fileId','48','int'),(481,'fileStage','19','int'),(481,'name','Open Educational Resources: Opportunitie.pdf','string'),(481,'submissionFileId','86','int'),(481,'submissionId','17','int'),(481,'username','dbarnes','string'),(482,'reviewAssignmentId','24','string'),(482,'reviewerName','Julie Janssen','string'),(482,'round','1','int'),(482,'stageId','2','int'),(482,'submissionId','17','int'),(483,'reviewAssignmentId','25','string'),(483,'reviewerName','Paul Hudson','string'),(483,'round','1','int'),(483,'stageId','2','int'),(483,'submissionId','17','int');
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
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/687b2a627d30e.pdf','application/pdf'),(2,'presses/1/monographs/2/687b2a81549a0.pdf','application/pdf'),(3,'presses/1/monographs/2/687b2a819eaf0.pdf','application/pdf'),(4,'presses/1/monographs/2/687b2a81ebb14.pdf','application/pdf'),(5,'presses/1/monographs/2/687b2a8256dbd.pdf','application/pdf'),(6,'presses/1/monographs/3/687b2ac1cd9e2.pdf','application/pdf'),(7,'presses/1/monographs/4/687b2adb72ccf.pdf','application/pdf'),(8,'presses/1/monographs/4/687b2adbb8889.pdf','application/pdf'),(9,'presses/1/monographs/4/687b2adc112ee.pdf','application/pdf'),(10,'presses/1/monographs/4/687b2adc73747.pdf','application/pdf'),(11,'presses/1/monographs/5/687b2b1e72ac0.pdf','application/pdf'),(12,'presses/1/monographs/6/687b2b6385ad7.pdf','application/pdf'),(13,'presses/1/monographs/6/687b2b63d3f6f.pdf','application/pdf'),(14,'presses/1/monographs/6/687b2b643f228.pdf','application/pdf'),(15,'presses/1/monographs/6/687b2b6490025.pdf','application/pdf'),(16,'presses/1/monographs/7/687b2b9a2a900.pdf','application/pdf'),(17,'presses/1/monographs/7/687b2b9a74e1a.pdf','application/pdf'),(18,'presses/1/monographs/7/687b2b9ac9e24.pdf','application/pdf'),(19,'presses/1/monographs/7/687b2b9b37b93.pdf','application/pdf'),(20,'presses/1/monographs/7/687b2b9b880f5.pdf','application/pdf'),(21,'presses/1/monographs/8/687b2bdad0d34.pdf','application/pdf'),(22,'presses/1/monographs/9/687b2be2bb28e.pdf','application/pdf'),(23,'presses/1/monographs/9/687b2be30b84d.pdf','application/pdf'),(24,'presses/1/monographs/9/687b2be35db64.pdf','application/pdf'),(25,'presses/1/monographs/9/687b2be3baee0.pdf','application/pdf'),(26,'presses/1/monographs/9/687b2be4270bd.pdf','application/pdf'),(27,'presses/1/monographs/10/687b2c189c3e8.pdf','application/pdf'),(28,'presses/1/monographs/11/687b2c40b6c5f.pdf','application/pdf'),(29,'presses/1/monographs/12/687b2c71aec76.pdf','application/pdf'),(30,'presses/1/monographs/12/687b2c7205446.pdf','application/pdf'),(31,'presses/1/monographs/12/687b2c724f1b2.pdf','application/pdf'),(32,'presses/1/monographs/13/687b2cb62ff4e.pdf','application/pdf'),(33,'presses/1/monographs/13/687b2cb67cbcb.pdf','application/pdf'),(34,'presses/1/monographs/13/687b2cb6d8b06.pdf','application/pdf'),(35,'presses/1/monographs/14/687b2d02ce757.pdf','application/pdf'),(36,'presses/1/monographs/14/687b2d0322c18.pdf','application/pdf'),(37,'presses/1/monographs/14/687b2d037f0ce.pdf','application/pdf'),(38,'presses/1/monographs/14/687b2d03d06b8.pdf','application/pdf'),(39,'presses/1/monographs/14/687b2d043e656.pdf','application/pdf'),(40,'presses/1/monographs/14/687b2d04cf324.pdf','application/pdf'),(41,'presses/1/monographs/15/687b2d68db390.pdf','application/pdf'),(42,'presses/1/monographs/16/687b2d80dc265.pdf','application/pdf'),(43,'presses/1/monographs/17/687b2db011083.pdf','application/pdf'),(44,'presses/1/monographs/17/687b2db05ace4.pdf','application/pdf'),(45,'presses/1/monographs/17/687b2db0aa2e5.pdf','application/pdf'),(46,'presses/1/monographs/17/687b2db119462.pdf','application/pdf'),(47,'presses/1/monographs/17/687b2db175362.pdf','application/pdf'),(48,'presses/1/monographs/17/687b2db1ce40a.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),(2,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Author[]'),(6,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(8,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(10,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(13,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter'),(15,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(16,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(17,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(18,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(19,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
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
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'Native XML submission export','plugins.importexport.native.filter.MonographNativeXmlFilter',0,0,0),(3,3,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlMonographFilter',0,0,0),(4,4,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(5,5,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(6,6,0,'Native XML representation export','plugins.importexport.native.filter.PublicationFormatNativeXmlFilter',0,0,0),(7,7,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPublicationFormatFilter',0,0,0),(8,9,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlMonographFileFilter',0,0,0),(9,8,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(10,10,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(11,11,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(12,12,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(13,13,0,'Native XML chapter export','plugins.importexport.native.filter.ChapterNativeXmlFilter',0,0,0),(14,14,0,'Native XML Chapter import','plugins.importexport.native.filter.NativeXmlChapterFilter',0,0,0),(15,15,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(16,16,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(17,17,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(18,18,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(19,19,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0);
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
INSERT INTO `notes` VALUES (1,1048586,1,6,'2025-07-19 05:22:23','2025-07-19 05:22:23','Recommendation','<p>Daniel Barnes, David Buskins:<br><br>The recommendation regarding the submission to Public Knowledge Press, \"The Information Literacy User’s Guide\" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>');
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
INSERT INTO `notifications` VALUES (7,0,1,1,1,'2025-07-19 05:17:16',NULL,0,0),(11,1,3,2,16777217,'2025-07-19 05:17:34',NULL,1048585,1),(12,1,0,2,16777243,'2025-07-19 05:17:34',NULL,1048585,1),(13,1,0,2,16777245,'2025-07-19 05:17:34',NULL,1048585,1),(14,1,0,2,16777236,'2025-07-19 05:17:37','2025-07-19 05:17:38',523,1),(16,1,12,3,16777227,'2025-07-19 05:17:41',NULL,517,1),(18,1,19,2,16777230,'2025-07-19 05:17:43',NULL,1048585,1),(19,1,3,2,16777251,'2025-07-19 05:17:43','2025-07-19 05:17:44',1048585,1),(36,1,3,2,16777217,'2025-07-19 05:18:36',NULL,1048585,2),(37,1,0,2,16777243,'2025-07-19 05:18:36',NULL,1048585,2),(38,1,0,2,16777245,'2025-07-19 05:18:36',NULL,1048585,2),(39,1,0,2,16777236,'2025-07-19 05:18:41','2025-07-19 05:18:42',523,2),(40,1,20,2,16777231,'2025-07-19 05:18:41',NULL,1048585,2),(41,1,11,3,16777227,'2025-07-19 05:18:46',NULL,517,2),(43,1,12,3,16777227,'2025-07-19 05:18:51',NULL,517,3),(50,1,3,2,16777217,'2025-07-19 05:19:17',NULL,1048585,3),(51,1,0,2,16777243,'2025-07-19 05:19:17',NULL,1048585,3),(52,1,0,2,16777245,'2025-07-19 05:19:17',NULL,1048585,3),(64,1,3,2,16777217,'2025-07-19 05:19:55',NULL,1048585,4),(65,1,0,2,16777243,'2025-07-19 05:19:55',NULL,1048585,4),(66,1,0,2,16777245,'2025-07-19 05:19:55','2025-07-19 05:20:20',1048585,4),(67,1,0,2,16777236,'2025-07-19 05:19:59','2025-07-19 05:20:01',523,3),(69,1,9,3,16777227,'2025-07-19 05:20:04',NULL,517,4),(71,1,0,2,16777236,'2025-07-19 05:20:06','2025-07-19 05:20:08',523,4),(73,1,11,3,16777227,'2025-07-19 05:20:11',NULL,517,5),(78,1,22,2,16777235,'2025-07-19 05:20:19',NULL,1048585,4),(79,1,3,2,16777254,'2025-07-19 05:20:19',NULL,1048585,4),(87,1,3,2,16777217,'2025-07-19 05:20:53',NULL,1048585,5),(90,1,0,2,16777236,'2025-07-19 05:20:56','2025-07-19 05:20:58',523,5),(92,1,8,3,16777227,'2025-07-19 05:21:01',NULL,517,6),(94,1,0,2,16777236,'2025-07-19 05:21:02','2025-07-19 05:21:04',523,6),(96,1,12,3,16777227,'2025-07-19 05:21:07',NULL,517,7),(101,1,23,2,16777235,'2025-07-19 05:21:14',NULL,1048585,5),(102,1,3,2,16777254,'2025-07-19 05:21:14',NULL,1048585,5),(105,1,0,2,16777246,'2025-07-19 05:21:33',NULL,1048585,5),(117,1,3,2,16777217,'2025-07-19 05:22:10',NULL,1048585,6),(118,1,4,2,16777217,'2025-07-19 05:22:10',NULL,1048585,6),(119,1,0,2,16777243,'2025-07-19 05:22:10',NULL,1048585,6),(120,1,0,2,16777245,'2025-07-19 05:22:10',NULL,1048585,6),(121,1,0,2,16777236,'2025-07-19 05:22:14','2025-07-19 05:22:16',523,7),(122,1,24,2,16777229,'2025-07-19 05:22:14',NULL,1048585,6),(124,1,3,3,16777249,'2025-07-19 05:22:23',NULL,1048586,1),(125,1,4,3,16777249,'2025-07-19 05:22:23',NULL,1048586,1),(140,1,3,2,16777217,'2025-07-19 05:23:16',NULL,1048585,7),(141,1,0,2,16777243,'2025-07-19 05:23:16',NULL,1048585,7),(142,1,0,2,16777245,'2025-07-19 05:23:16',NULL,1048585,7),(143,1,0,2,16777236,'2025-07-19 05:23:21','2025-07-19 05:23:22',523,8),(145,1,10,3,16777227,'2025-07-19 05:23:27',NULL,517,8),(147,1,25,2,16777230,'2025-07-19 05:23:28',NULL,1048585,7),(148,1,3,2,16777251,'2025-07-19 05:23:28','2025-07-19 05:23:30',1048585,7),(150,1,3,2,16777217,'2025-07-19 05:23:40',NULL,1048585,8),(151,1,0,2,16777243,'2025-07-19 05:23:40',NULL,1048585,8),(152,1,0,2,16777245,'2025-07-19 05:23:40',NULL,1048585,8),(167,1,3,2,16777217,'2025-07-19 05:24:27',NULL,1048585,9),(168,1,4,2,16777217,'2025-07-19 05:24:27',NULL,1048585,9),(169,1,0,2,16777243,'2025-07-19 05:24:27',NULL,1048585,9),(170,1,0,2,16777245,'2025-07-19 05:24:27',NULL,1048585,9),(171,1,0,2,16777236,'2025-07-19 05:24:32','2025-07-19 05:24:34',523,9),(172,1,26,2,16777229,'2025-07-19 05:24:32',NULL,1048585,9),(182,1,3,2,16777217,'2025-07-19 05:25:14',NULL,1048585,10),(183,1,0,2,16777243,'2025-07-19 05:25:14',NULL,1048585,10),(184,1,0,2,16777245,'2025-07-19 05:25:14',NULL,1048585,10),(187,1,3,2,16777217,'2025-07-19 05:25:28',NULL,1048585,11),(188,1,0,2,16777243,'2025-07-19 05:25:28',NULL,1048585,11),(189,1,0,2,16777245,'2025-07-19 05:25:28',NULL,1048585,11),(190,1,0,2,16777236,'2025-07-19 05:25:32','2025-07-19 05:25:33',523,10),(192,1,9,3,16777227,'2025-07-19 05:25:36',NULL,517,9),(194,1,0,2,16777236,'2025-07-19 05:25:38','2025-07-19 05:25:39',523,11),(200,1,3,2,16777219,'2025-07-19 05:25:51',NULL,517,10),(201,1,3,2,16777219,'2025-07-19 05:25:56',NULL,517,11),(202,1,28,2,16777230,'2025-07-19 05:26:02',NULL,1048585,11),(203,1,3,2,16777251,'2025-07-19 05:26:02','2025-07-19 05:26:03',1048585,11),(217,1,3,2,16777217,'2025-07-19 05:26:45',NULL,1048585,12),(218,1,0,2,16777243,'2025-07-19 05:26:45',NULL,1048585,12),(219,1,0,2,16777245,'2025-07-19 05:26:45',NULL,1048585,12),(220,1,0,2,16777236,'2025-07-19 05:26:50','2025-07-19 05:26:52',523,12),(221,1,29,2,16777229,'2025-07-19 05:26:50',NULL,1048585,12),(222,1,7,3,16777227,'2025-07-19 05:26:56',NULL,517,12),(226,1,9,3,16777227,'2025-07-19 05:27:05',NULL,517,14),(228,1,3,2,16777219,'2025-07-19 05:27:11',NULL,517,13),(238,1,3,2,16777217,'2025-07-19 05:27:43',NULL,1048585,13),(239,1,0,2,16777243,'2025-07-19 05:27:43',NULL,1048585,13),(240,1,0,2,16777245,'2025-07-19 05:27:43',NULL,1048585,13),(241,1,0,2,16777236,'2025-07-19 05:27:48','2025-07-19 05:27:49',523,13),(243,1,8,3,16777227,'2025-07-19 05:27:52',NULL,517,15),(245,1,0,2,16777236,'2025-07-19 05:27:54','2025-07-19 05:27:55',523,14),(249,1,11,3,16777227,'2025-07-19 05:28:03',NULL,517,17),(253,1,3,2,16777219,'2025-07-19 05:28:13',NULL,517,16),(254,1,3,2,16777219,'2025-07-19 05:28:20',NULL,517,18),(255,1,30,2,16777230,'2025-07-19 05:28:27',NULL,1048585,13),(256,1,3,2,16777251,'2025-07-19 05:28:27','2025-07-19 05:28:28',1048585,13),(267,1,3,2,16777217,'2025-07-19 05:29:05',NULL,1048585,14),(270,1,0,2,16777236,'2025-07-19 05:29:11','2025-07-19 05:29:12',523,15),(272,1,7,3,16777227,'2025-07-19 05:29:16',NULL,517,19),(274,1,0,2,16777236,'2025-07-19 05:29:18','2025-07-19 05:29:19',523,16),(276,1,11,3,16777227,'2025-07-19 05:29:23',NULL,517,20),(281,1,31,2,16777235,'2025-07-19 05:29:31',NULL,1048585,14),(282,1,3,2,16777254,'2025-07-19 05:29:31',NULL,1048585,14),(285,1,0,2,16777246,'2025-07-19 05:30:11',NULL,1048585,14),(289,1,3,2,16777217,'2025-07-19 05:30:28',NULL,1048585,15),(290,1,0,2,16777243,'2025-07-19 05:30:28',NULL,1048585,15),(291,1,0,2,16777245,'2025-07-19 05:30:28',NULL,1048585,15),(292,1,0,2,16777236,'2025-07-19 05:30:33','2025-07-19 05:30:34',523,17),(293,1,32,2,16777231,'2025-07-19 05:30:33',NULL,1048585,15),(299,1,3,2,16777217,'2025-07-19 05:30:59',NULL,1048585,16),(300,1,0,2,16777243,'2025-07-19 05:30:59',NULL,1048585,16),(301,1,0,2,16777245,'2025-07-19 05:30:59',NULL,1048585,16),(302,1,0,2,16777236,'2025-07-19 05:31:04','2025-07-19 05:31:05',523,18),(303,1,33,2,16777231,'2025-07-19 05:31:04',NULL,1048585,16),(306,1,11,3,16777227,'2025-07-19 05:31:12',NULL,517,22),(308,1,12,3,16777227,'2025-07-19 05:31:15',NULL,517,23),(310,1,3,2,16777219,'2025-07-19 05:31:21',NULL,517,21),(330,1,3,2,16777217,'2025-07-19 05:32:25',NULL,1048585,17),(331,1,0,2,16777243,'2025-07-19 05:32:25',NULL,1048585,17),(332,1,0,2,16777245,'2025-07-19 05:32:25',NULL,1048585,17),(333,1,0,2,16777236,'2025-07-19 05:32:31','2025-07-19 05:32:33',523,19),(334,1,34,2,16777229,'2025-07-19 05:32:31',NULL,1048585,17),(335,1,7,3,16777227,'2025-07-19 05:32:37',NULL,517,24),(337,1,8,3,16777227,'2025-07-19 05:32:42',NULL,517,25);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','687b29bed9d9e','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'en_US','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The West and Beyond: New Perspectives on an Imagined Region'),(2,'fr_CA','abstract',''),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'en_US','abstract','<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The Political Economy of Workplace Injury in Canada'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'en_US','abstract','<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2025'),(5,'en_US','abstract','<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Press'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'en_US','abstract','<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','The Information Literacy User’s Guide'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'en_US','abstract','<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Accessible Elements: Teaching Science Online and at a Distance'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'en_US','abstract','<p>A Note From The Publisher</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Editorial'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'en_US','abstract','<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'en_US','abstract','<p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Lost Tracks: Buffalo National Park, 1909-1939'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'en_US','abstract','<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Dreamwork'),(11,'fr_CA','abstract',''),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'en_US','abstract','<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Connecting ICTs to Development'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'en_US','abstract','<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Mobile Learning: Transforming the Delivery of Education and Training'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2025'),(14,'en_US','abstract','<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Press'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'en_US','abstract','<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'en_US','abstract','<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','A Designer\'s Log: Case Studies in Instructional Design'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'en_US','abstract','<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Open Development: Networked Innovations in International Development'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title','');
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
INSERT INTO `publications` VALUES (1,NULL,'2025-07-19 05:17:33',NULL,1,'pub','publication',0.00,NULL,NULL,1,1,NULL,1),(2,NULL,'2025-07-19 05:18:35',NULL,2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1),(3,NULL,'2025-07-19 05:19:16',NULL,10,'pub','publication',0.00,NULL,NULL,3,1,NULL,1),(4,NULL,'2025-07-19 05:19:54',NULL,11,'pub','publication',0.00,3,NULL,4,1,NULL,1),(5,'2025-07-19','2025-07-19 05:21:33',NULL,15,'pub','publication',0.00,NULL,NULL,5,3,NULL,1),(6,NULL,'2025-07-19 05:22:09',NULL,16,'pub','publication',0.00,1,NULL,6,1,NULL,1),(7,NULL,'2025-07-19 05:23:15',NULL,20,'pub','publication',0.00,4,NULL,7,1,NULL,1),(8,NULL,'2025-07-19 05:23:39',NULL,25,'pub','publication',0.00,NULL,NULL,8,1,NULL,1),(9,NULL,'2025-07-19 05:24:26',NULL,26,'pub','publication',0.00,1,NULL,9,1,NULL,1),(10,NULL,'2025-07-19 05:25:13',NULL,31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1),(11,NULL,'2025-07-19 05:25:28',NULL,32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1),(12,NULL,'2025-07-19 05:26:44',NULL,33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1),(13,NULL,'2025-07-19 05:27:42',NULL,41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1),(14,'2025-07-19','2025-07-19 05:30:10',NULL,45,'pub','publication',0.00,5,NULL,14,3,NULL,1),(15,NULL,'2025-07-19 05:30:28',NULL,48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1),(16,NULL,'2025-07-19 05:30:58',NULL,49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1),(17,NULL,'2025-07-19 05:32:23',NULL,50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1);
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
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2025-07-19 05:17:41','2025-07-19 05:17:41',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:17:41',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,2,11,NULL,NULL,'2025-07-19 05:18:46','2025-07-19 05:18:46',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:18:46',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(3,2,12,NULL,NULL,'2025-07-19 05:18:51','2025-07-19 05:18:51',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:18:51',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(4,4,9,NULL,NULL,'2025-07-19 05:20:04','2025-07-19 05:20:04',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:20:04',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0),(5,4,11,NULL,NULL,'2025-07-19 05:20:11','2025-07-19 05:20:11',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:20:11',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2025-07-19 05:21:01','2025-07-19 05:21:01',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:21:01',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0),(7,5,12,NULL,NULL,'2025-07-19 05:21:07','2025-07-19 05:21:07',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:21:07',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(8,7,10,NULL,NULL,'2025-07-19 05:23:27','2025-07-19 05:23:27',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:23:27',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0),(9,11,9,NULL,NULL,'2025-07-19 05:25:36','2025-07-19 05:25:36',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:25:36',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0),(10,11,10,NULL,0,'2025-07-19 05:25:42','2025-07-19 05:25:42','2025-07-19 05:25:48','2025-07-19 05:25:51',NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:25:51',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(11,11,12,NULL,0,'2025-07-19 05:25:45','2025-07-19 05:25:45','2025-07-19 05:25:54','2025-07-19 05:25:56',NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:25:56',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(12,12,7,NULL,NULL,'2025-07-19 05:26:56','2025-07-19 05:26:56',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:26:56',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(13,12,8,NULL,0,'2025-07-19 05:27:00','2025-07-19 05:27:00','2025-07-19 05:27:08','2025-07-19 05:27:11',NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:27:11',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,NULL,0),(14,12,9,NULL,NULL,'2025-07-19 05:27:05','2025-07-19 05:27:05',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:27:05',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(15,13,8,NULL,NULL,'2025-07-19 05:27:52','2025-07-19 05:27:52',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:27:52',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0),(16,13,10,NULL,0,'2025-07-19 05:27:59','2025-07-19 05:27:59','2025-07-19 05:28:10','2025-07-19 05:28:13',NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:28:13',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(17,13,11,NULL,NULL,'2025-07-19 05:28:03','2025-07-19 05:28:03',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:28:03',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0),(18,13,12,NULL,0,'2025-07-19 05:28:07','2025-07-19 05:28:07','2025-07-19 05:28:16','2025-07-19 05:28:20',NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:28:20',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(19,14,7,NULL,NULL,'2025-07-19 05:29:16','2025-07-19 05:29:16',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:29:16',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0),(20,14,11,NULL,NULL,'2025-07-19 05:29:23','2025-07-19 05:29:23',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:29:23',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0),(21,16,10,NULL,0,'2025-07-19 05:31:08','2025-07-19 05:31:08','2025-07-19 05:31:18','2025-07-19 05:31:21',NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:31:21',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,NULL,0),(22,16,11,NULL,NULL,'2025-07-19 05:31:12','2025-07-19 05:31:12',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:31:12',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(23,16,12,NULL,NULL,'2025-07-19 05:31:15','2025-07-19 05:31:15',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:31:15',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(24,17,7,NULL,NULL,'2025-07-19 05:32:37','2025-07-19 05:32:37',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:32:37',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0),(25,17,8,NULL,NULL,'2025-07-19 05:32:42','2025-07-19 05:32:42',NULL,NULL,NULL,'2025-08-16 00:00:00','2025-08-16 00:00:00','2025-07-19 05:32:42',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0);
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
INSERT INTO `review_files` VALUES (1,2),(4,12),(4,13),(4,14),(4,15),(6,17),(8,28),(8,29),(8,30),(8,31),(8,32),(9,46),(12,50),(12,51),(12,52),(13,50),(13,51),(13,52),(14,50),(14,51),(14,52),(15,56),(15,57),(15,58),(21,74),(22,74),(23,74),(24,81),(24,82),(24,83),(24,84),(24,85),(24,86),(25,81),(25,82),(25,83),(25,84),(25,85),(25,86);
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
INSERT INTO `review_round_files` VALUES (1,1,3,2),(4,3,2,12),(4,3,2,13),(4,3,2,14),(4,3,2,15),(5,5,2,17),(7,8,3,28),(7,8,3,29),(7,8,3,30),(7,8,3,31),(7,8,3,32),(9,9,2,39),(9,9,2,40),(9,9,2,41),(9,9,2,42),(9,9,2,43),(11,10,2,46),(12,12,2,50),(12,12,2,51),(12,12,2,52),(13,13,2,56),(13,13,2,57),(13,13,2,58),(15,17,3,72),(16,18,3,74),(17,19,2,81),(17,19,2,82),(17,19,2,83),(17,19,2,84),(17,19,2,85),(17,19,2,86);
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.PublishSubmissions','2025-07-19 05:14:27'),('lib.pkp.classes.task.ReviewReminder','2025-07-19 05:14:27'),('lib.pkp.classes.task.StatisticsReport','2025-07-19 05:14:27'),('plugins.generic.usageStats.UsageStatsLoader','2025-07-19 05:14:27');
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
INSERT INTO `sessions` VALUES ('0v2v70plgjrle70964nmld09bg',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752903083,1752903163,0,'csrf|a:2:{s:9:\"timestamp\";i:1752903162;s:5:\"token\";s:32:\"7704ed4da317f4535548415890f5eda0\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2he9c4voanl08u28s123ocfk8h',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902065,1752902065,0,'','localhost'),('2vt7p0gvjlghk5l14ul7er8uo6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902910,1752903010,0,'csrf|a:2:{s:9:\"timestamp\";i:1752903010;s:5:\"token\";s:32:\"fc429a421156ccb102dfe6368b0d9b5e\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3osi4re0kcfhjp8js6351i6mcq',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902092,1752902097,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1752902097;s:5:\"token\";s:32:\"88925d5a65a61bb2317ccddd8be8f0de\";}','localhost'),('579c0r6kil9ubk7liqcgg4s814',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902622,1752902674,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902674;s:5:\"token\";s:32:\"3c2f41d74c4ece76e0ec4908eccc7f75\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('6cha91r7pftmqgqh4kfqmj7e5s',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902425,1752902493,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902493;s:5:\"token\";s:32:\"10a7908fe007dd57f30a8c51203888e5\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('8uma3d3etitagn1keb2heknqjv',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902066,1752902077,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1752902078;s:5:\"token\";s:32:\"4959eaeefe142a436f186a61b3a962ec\";}','localhost'),('9n1ulqp29ei1c7fi73ite3rai4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902101,1752902222,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1752902222;s:5:\"token\";s:32:\"2638e789b89fd9a5def5368d357143e8\";}','localhost'),('bdjev9j4o3n16v1roevc2f44q7',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902089,1752902092,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1752902092;s:5:\"token\";s:32:\"9575f9b3f705f91c58bea700222eaf27\";}','localhost'),('c612i7adsg2sotpnb3m1ju4894',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902268,1752902331,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902331;s:5:\"token\";s:32:\"65b2ec2bc41bb9151b5ffffae87c93f6\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('cm58bpv30143cgcamb6urv6ft7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902494,1752902547,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902548;s:5:\"token\";s:32:\"6d9fde477db6e0df38a1c13a98eaf6da\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fpileoebnbn18vs5cmec9rlt8k',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902615,1752902620,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1752902620;s:5:\"token\";s:32:\"7931c76fd01747ada18cc6d07513799a\";}','localhost'),('g5jj9qpgjdiplh0ku82tj245p5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902765,1752902832,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902832;s:5:\"token\";s:32:\"b1c09a9929c44c1ba4095fb35eb6654a\";}username|s:7:\"phudson\";','localhost'),('gqlug9sllsle4dp5u7kc9qsnp6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902833,1752902908,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902909;s:5:\"token\";s:32:\"779fa312c027241a166c0b7b87aecd17\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('h0269pnqtq43h91d9robntqjdb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902078,1752902088,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1752902088;s:5:\"token\";s:32:\"6bbe4915f55a6afd84ed1843808c9734\";}','localhost'),('hfiv4ce93vpfmqncu5knmmog9o',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902675,1752902714,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902714;s:5:\"token\";s:32:\"71047b29ddad313bd4a939735107ce3e\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('ipej524hbdibmfc3tdjhpr3hng',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902097,1752902099,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1752902099;s:5:\"token\";s:32:\"03e29e1c77b7b2eb806ea81f82c755af\";}','localhost'),('jtvga16gv4o67ekpsgl2hia223',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902715,1752902764,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902764;s:5:\"token\";s:32:\"17b1098a65e4a0356581f4452ba26e35\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('k2mlj9q43p5d2m4unip1a7n635',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902358,1752902424,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902424;s:5:\"token\";s:32:\"55be4c3e30de8ff9605f8f94b3344a27\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('rjl0e9kp3ag6fl1vflhjbgb596',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902223,1752902236,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1752902236;s:5:\"token\";s:32:\"8e57aa161540ae8f7b58bda750da1920\";}','localhost'),('siho4hsklgilg581qmr911cu2o',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752903012,1752903035,0,'csrf|a:2:{s:9:\"timestamp\";i:1752903035;s:5:\"token\";s:32:\"156af7a377a2132a94d721215977d744\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('tnrnfgle9bopl6f1167lfvn53c',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752903036,1752903081,0,'csrf|a:2:{s:9:\"timestamp\";i:1752903081;s:5:\"token\";s:32:\"d75511fbd883bad24453f26354784161\";}username|s:8:\"agallego\";','localhost'),('ujebj6o8j7ib5qot28h3p0nq4v',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902333,1752902357,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902357;s:5:\"token\";s:32:\"fc39985a61c2490f3847fff2a3eeb879\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('uki8ok5qtbmu375tbapdo8n82t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902237,1752902267,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902267;s:5:\"token\";s:32:\"9d918e0313abdba10de8a3553396ee5c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('vi57hroflbgcbve6f9pi2bt3s0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1752902549,1752902613,0,'csrf|a:2:{s:9:\"timestamp\";i:1752902613;s:5:\"token\";s:32:\"52d0ba0be233067b6f0a365b380a48b3\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2025-07-19 05:17:21',0,0),(2,1,3,3,'2025-07-19 05:17:34',0,1),(3,1,6,14,'2025-07-19 05:17:46',0,0),(4,2,14,20,'2025-07-19 05:17:52',0,0),(5,2,3,3,'2025-07-19 05:18:36',0,1),(6,3,13,21,'2025-07-19 05:18:57',0,0),(7,3,3,3,'2025-07-19 05:19:17',0,1),(8,4,14,22,'2025-07-19 05:19:22',0,0),(9,4,3,3,'2025-07-19 05:19:55',0,1),(10,4,6,13,'2025-07-19 05:20:17',0,0),(11,4,10,15,'2025-07-19 05:20:23',0,0),(12,5,13,23,'2025-07-19 05:20:29',0,0),(13,5,3,3,'2025-07-19 05:20:53',0,1),(14,5,6,14,'2025-07-19 05:21:12',0,0),(15,5,10,16,'2025-07-19 05:21:18',0,0),(16,5,12,17,'2025-07-19 05:21:21',0,0),(17,6,14,24,'2025-07-19 05:21:38',0,0),(18,6,3,3,'2025-07-19 05:22:10',0,1),(19,6,5,4,'2025-07-19 05:22:10',0,1),(20,6,5,6,'2025-07-19 05:22:18',1,1),(21,7,14,25,'2025-07-19 05:22:33',0,0),(22,7,3,3,'2025-07-19 05:23:16',0,1),(23,7,6,13,'2025-07-19 05:23:33',0,0),(24,8,13,3,'2025-07-19 05:23:38',0,0),(25,8,3,3,'2025-07-19 05:23:40',0,1),(26,9,14,26,'2025-07-19 05:23:46',0,0),(27,9,3,3,'2025-07-19 05:24:27',0,1),(28,9,5,4,'2025-07-19 05:24:27',0,1),(29,10,13,27,'2025-07-19 05:24:39',0,0),(30,10,3,3,'2025-07-19 05:25:14',0,1),(31,11,13,28,'2025-07-19 05:25:20',0,0),(32,11,3,3,'2025-07-19 05:25:28',0,1),(33,12,14,29,'2025-07-19 05:26:09',0,0),(34,12,3,3,'2025-07-19 05:26:45',0,1),(35,13,14,30,'2025-07-19 05:27:17',0,0),(36,13,3,3,'2025-07-19 05:27:43',0,1),(37,14,14,31,'2025-07-19 05:28:34',0,0),(38,14,3,3,'2025-07-19 05:29:05',0,1),(39,14,6,13,'2025-07-19 05:29:29',0,0),(40,14,10,15,'2025-07-19 05:29:35',0,0),(41,14,12,18,'2025-07-19 05:29:38',0,0),(42,15,13,32,'2025-07-19 05:30:16',0,0),(43,15,3,3,'2025-07-19 05:30:28',0,1),(44,16,13,33,'2025-07-19 05:30:40',0,0),(45,16,3,3,'2025-07-19 05:30:59',0,1),(46,17,14,34,'2025-07-19 05:31:27',0,0),(47,17,3,3,'2025-07-19 05:32:25',0,1);
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
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2025-07-19 05:25:51',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2025-07-19 05:25:56',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2025-07-19 05:27:11',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2025-07-19 05:28:13',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2025-07-19 05:28:20',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2025-07-19 05:31:21',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3),(5,5,4),(6,6,5),(7,7,6),(8,8,7),(9,9,8),(10,10,9),(11,11,10),(12,12,7),(13,13,8),(14,14,9),(15,15,10),(16,16,11),(17,17,11),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,18),(26,26,19),(27,27,20),(28,28,16),(29,29,17),(30,30,18),(31,31,19),(32,32,20),(33,33,21),(34,34,22),(35,35,23),(36,36,24),(37,37,25),(38,38,26),(39,39,22),(40,40,23),(41,41,24),(42,42,25),(43,43,26),(44,44,27),(45,45,28),(46,46,28),(47,47,29),(48,48,30),(49,49,31),(50,50,29),(51,51,30),(52,52,31),(53,53,32),(54,54,33),(55,55,34),(56,56,32),(57,57,33),(58,58,34),(59,59,35),(60,60,36),(61,61,37),(62,62,38),(63,63,39),(64,64,40),(65,65,35),(66,66,36),(67,67,37),(68,68,38),(69,69,39),(70,70,40),(71,71,41),(72,72,41),(73,73,42),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,43),(82,82,44),(83,83,45),(84,84,46),(85,85,47),(86,86,48);
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'','chapterId','4','string'),(3,'en_US','name','Critical History in Western Canada 1900–.pdf','string'),(4,'','chapterId','5','string'),(4,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(5,'','chapterId','6','string'),(5,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(6,'','chapterId','7','string'),(6,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(7,'en_US','name','The Political Economy of Workplace Injury in Canada.pdf','string'),(8,'','chapterId','13','string'),(8,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(9,'','chapterId','14','string'),(9,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(10,'','chapterId','15','string'),(10,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(11,'','chapterId','16','string'),(11,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(12,'','chapterId','13','string'),(12,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(13,'','chapterId','14','string'),(13,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(14,'','chapterId','15','string'),(14,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(15,'','chapterId','16','string'),(15,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(16,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(17,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(18,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(19,'','chapterId','23','string'),(19,'en_US','name','Identify: Understanding Your Information.pdf','string'),(20,'','chapterId','24','string'),(20,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(21,'','chapterId','25','string'),(21,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(22,'','chapterId','26','string'),(22,'en_US','name','Gather: Finding What You Need.pdf','string'),(23,'','chapterId','27','string'),(23,'en_US','name','Introduction.pdf','string'),(24,'','chapterId','28','string'),(24,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(25,'','chapterId','29','string'),(25,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(26,'','chapterId','30','string'),(26,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(27,'','chapterId','31','string'),(27,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(28,'','chapterId','27','string'),(28,'en_US','name','Introduction.pdf','string'),(29,'','chapterId','28','string'),(29,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(30,'','chapterId','29','string'),(30,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(31,'','chapterId','30','string'),(31,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(32,'','chapterId','31','string'),(32,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(33,'en_US','name','Editorial.pdf','string'),(34,'','chapterId','32','string'),(34,'en_US','name','Internet, openness and the future of the.pdf','string'),(35,'','chapterId','33','string'),(35,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(36,'','chapterId','34','string'),(36,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(37,'','chapterId','35','string'),(37,'en_US','name','Free Internet?.pdf','string'),(38,'','chapterId','36','string'),(38,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(39,'','chapterId','32','string'),(39,'en_US','name','Internet, openness and the future of the.pdf','string'),(40,'','chapterId','33','string'),(40,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(41,'','chapterId','34','string'),(41,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(42,'','chapterId','35','string'),(42,'en_US','name','Free Internet?.pdf','string'),(43,'','chapterId','36','string'),(43,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(44,'en_US','name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(45,'en_US','name','Dreamwork.pdf','string'),(46,'en_US','name','Dreamwork.pdf','string'),(47,'','chapterId','48','string'),(47,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(48,'','chapterId','49','string'),(48,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(49,'','chapterId','50','string'),(49,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(50,'','chapterId','48','string'),(50,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(51,'','chapterId','49','string'),(51,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(52,'','chapterId','50','string'),(52,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(53,'','chapterId','51','string'),(53,'en_US','name','Current State of Mobile Learning.pdf','string'),(54,'','chapterId','52','string'),(54,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(55,'','chapterId','53','string'),(55,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(56,'','chapterId','51','string'),(56,'en_US','name','Current State of Mobile Learning.pdf','string'),(57,'','chapterId','52','string'),(57,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(58,'','chapterId','53','string'),(58,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(59,'','chapterId','54','string'),(59,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(60,'','chapterId','55','string'),(60,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(61,'','chapterId','56','string'),(61,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(62,'','chapterId','57','string'),(62,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(63,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(64,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(65,'','chapterId','54','string'),(65,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(66,'','chapterId','55','string'),(66,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(67,'','chapterId','56','string'),(67,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(68,'','chapterId','57','string'),(68,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(69,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(70,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(71,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(72,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(73,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(74,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(75,'','chapterId','66','string'),(75,'en_US','name','Preface.pdf','string'),(76,'','chapterId','67','string'),(76,'en_US','name','Introduction.pdf','string'),(77,'','chapterId','68','string'),(77,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(78,'','chapterId','69','string'),(78,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(79,'','chapterId','70','string'),(79,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(80,'','chapterId','71','string'),(80,'en_US','name','Open Educational Resources: Opportunitie.pdf','string'),(81,'','chapterId','66','string'),(81,'en_US','name','Preface.pdf','string'),(82,'','chapterId','67','string'),(82,'en_US','name','Introduction.pdf','string'),(83,'','chapterId','68','string'),(83,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(84,'','chapterId','69','string'),(84,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(85,'','chapterId','70','string'),(85,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(86,'','chapterId','71','string'),(86,'en_US','name','Open Educational Resources: Opportunitie.pdf','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:17:22','2025-07-19 05:17:22',19,NULL,NULL),(2,1,1,1,3,4,NULL,NULL,NULL,'2025-07-19 05:17:37','2025-07-19 05:17:37',19,NULL,NULL),(3,2,2,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:17:53','2025-07-19 05:17:53',20,NULL,NULL),(4,2,3,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:17:53','2025-07-19 05:17:53',20,NULL,NULL),(5,2,4,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:17:53','2025-07-19 05:17:54',20,NULL,NULL),(6,2,5,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:17:54','2025-07-19 05:17:54',20,NULL,NULL),(7,3,6,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:18:57','2025-07-19 05:18:58',21,NULL,NULL),(8,4,7,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:19:23','2025-07-19 05:19:23',22,NULL,NULL),(9,4,8,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:19:23','2025-07-19 05:19:23',22,NULL,NULL),(10,4,9,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:19:24','2025-07-19 05:19:24',22,NULL,NULL),(11,4,10,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:19:24','2025-07-19 05:19:24',22,NULL,NULL),(12,4,7,8,4,19,NULL,NULL,NULL,'2025-07-19 05:19:59','2025-07-19 05:19:59',22,NULL,NULL),(13,4,8,9,4,19,NULL,NULL,NULL,'2025-07-19 05:19:59','2025-07-19 05:19:59',22,NULL,NULL),(14,4,9,10,4,19,NULL,NULL,NULL,'2025-07-19 05:19:59','2025-07-19 05:19:59',22,NULL,NULL),(15,4,10,11,4,19,NULL,NULL,NULL,'2025-07-19 05:19:59','2025-07-19 05:19:59',22,NULL,NULL),(16,5,11,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:20:30','2025-07-19 05:20:30',23,NULL,NULL),(17,5,11,16,3,19,NULL,NULL,NULL,'2025-07-19 05:20:56','2025-07-19 05:20:56',23,NULL,NULL),(18,5,11,16,3,10,'0','openAccess',1,'2025-07-19 05:21:26','2025-07-19 05:21:30',23,521,1),(19,6,12,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:21:39','2025-07-19 05:21:39',24,NULL,NULL),(20,6,13,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:21:39','2025-07-19 05:21:40',24,NULL,NULL),(21,6,14,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:21:40','2025-07-19 05:21:40',24,NULL,NULL),(22,6,15,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:21:40','2025-07-19 05:21:40',24,NULL,NULL),(23,7,16,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:22:34','2025-07-19 05:22:34',25,NULL,NULL),(24,7,17,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:22:34','2025-07-19 05:22:34',25,NULL,NULL),(25,7,18,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:22:34','2025-07-19 05:22:35',25,NULL,NULL),(26,7,19,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:22:35','2025-07-19 05:22:35',25,NULL,NULL),(27,7,20,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:22:35','2025-07-19 05:22:35',25,NULL,NULL),(28,7,16,23,4,4,NULL,NULL,NULL,'2025-07-19 05:23:21','2025-07-19 05:23:21',25,NULL,NULL),(29,7,17,24,4,4,NULL,NULL,NULL,'2025-07-19 05:23:21','2025-07-19 05:23:21',25,NULL,NULL),(30,7,18,25,4,4,NULL,NULL,NULL,'2025-07-19 05:23:21','2025-07-19 05:23:21',25,NULL,NULL),(31,7,19,26,4,4,NULL,NULL,NULL,'2025-07-19 05:23:21','2025-07-19 05:23:21',25,NULL,NULL),(32,7,20,27,4,4,NULL,NULL,NULL,'2025-07-19 05:23:21','2025-07-19 05:23:21',25,NULL,NULL),(33,8,21,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:23:38','2025-07-19 05:23:39',3,NULL,NULL),(34,9,22,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:23:46','2025-07-19 05:23:46',26,NULL,NULL),(35,9,23,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:23:47','2025-07-19 05:23:47',26,NULL,NULL),(36,9,24,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:23:47','2025-07-19 05:23:47',26,NULL,NULL),(37,9,25,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:23:47','2025-07-19 05:23:48',26,NULL,NULL),(38,9,26,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:23:48','2025-07-19 05:23:48',26,NULL,NULL),(39,9,22,34,4,19,NULL,NULL,NULL,'2025-07-19 05:24:32','2025-07-19 05:24:32',26,NULL,NULL),(40,9,23,35,4,19,NULL,NULL,NULL,'2025-07-19 05:24:32','2025-07-19 05:24:32',26,NULL,NULL),(41,9,24,36,4,19,NULL,NULL,NULL,'2025-07-19 05:24:32','2025-07-19 05:24:32',26,NULL,NULL),(42,9,25,37,4,19,NULL,NULL,NULL,'2025-07-19 05:24:32','2025-07-19 05:24:32',26,NULL,NULL),(43,9,26,38,4,19,NULL,NULL,NULL,'2025-07-19 05:24:32','2025-07-19 05:24:32',26,NULL,NULL),(44,10,27,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:24:40','2025-07-19 05:24:40',27,NULL,NULL),(45,11,28,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:25:20','2025-07-19 05:25:20',28,NULL,NULL),(46,11,28,45,3,19,NULL,NULL,NULL,'2025-07-19 05:25:32','2025-07-19 05:25:32',28,NULL,NULL),(47,12,29,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:26:09','2025-07-19 05:26:09',29,NULL,NULL),(48,12,30,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:26:10','2025-07-19 05:26:10',29,NULL,NULL),(49,12,31,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:26:10','2025-07-19 05:26:10',29,NULL,NULL),(50,12,29,47,4,19,NULL,NULL,NULL,'2025-07-19 05:26:50','2025-07-19 05:26:50',29,NULL,NULL),(51,12,30,48,4,19,NULL,NULL,NULL,'2025-07-19 05:26:50','2025-07-19 05:26:50',29,NULL,NULL),(52,12,31,49,4,19,NULL,NULL,NULL,'2025-07-19 05:26:50','2025-07-19 05:26:50',29,NULL,NULL),(53,13,32,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:27:18','2025-07-19 05:27:18',30,NULL,NULL),(54,13,33,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:27:18','2025-07-19 05:27:18',30,NULL,NULL),(55,13,34,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:27:18','2025-07-19 05:27:19',30,NULL,NULL),(56,13,32,53,4,19,NULL,NULL,NULL,'2025-07-19 05:27:48','2025-07-19 05:27:48',30,NULL,NULL),(57,13,33,54,4,19,NULL,NULL,NULL,'2025-07-19 05:27:48','2025-07-19 05:27:48',30,NULL,NULL),(58,13,34,55,4,19,NULL,NULL,NULL,'2025-07-19 05:27:48','2025-07-19 05:27:48',30,NULL,NULL),(59,14,35,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:28:34','2025-07-19 05:28:35',31,NULL,NULL),(60,14,36,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:28:35','2025-07-19 05:28:35',31,NULL,NULL),(61,14,37,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:28:35','2025-07-19 05:28:35',31,NULL,NULL),(62,14,38,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:28:35','2025-07-19 05:28:36',31,NULL,NULL),(63,14,39,NULL,13,2,NULL,NULL,NULL,'2025-07-19 05:28:36','2025-07-19 05:28:36',31,NULL,NULL),(64,14,40,NULL,9,2,NULL,NULL,NULL,'2025-07-19 05:28:36','2025-07-19 05:28:37',31,NULL,NULL),(65,14,35,59,4,10,'0','openAccess',1,'2025-07-19 05:29:47','2025-07-19 05:29:51',31,521,2),(66,14,36,60,4,10,'0','openAccess',1,'2025-07-19 05:29:47','2025-07-19 05:29:54',31,521,2),(67,14,37,61,4,10,'0','openAccess',1,'2025-07-19 05:29:47','2025-07-19 05:29:57',31,521,2),(68,14,38,62,4,10,'0','openAccess',1,'2025-07-19 05:29:47','2025-07-19 05:30:00',31,521,2),(69,14,39,63,13,10,'0','openAccess',1,'2025-07-19 05:29:47','2025-07-19 05:30:04',31,521,2),(70,14,40,64,9,10,'0','openAccess',1,'2025-07-19 05:29:47','2025-07-19 05:30:07',31,521,2),(71,15,41,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:30:16','2025-07-19 05:30:17',32,NULL,NULL),(72,15,41,71,3,4,NULL,NULL,NULL,'2025-07-19 05:30:33','2025-07-19 05:30:33',32,NULL,NULL),(73,16,42,NULL,3,2,NULL,NULL,NULL,'2025-07-19 05:30:40','2025-07-19 05:30:41',33,NULL,NULL),(74,16,42,73,3,4,NULL,NULL,NULL,'2025-07-19 05:31:04','2025-07-19 05:31:04',33,NULL,NULL),(75,17,43,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:31:28','2025-07-19 05:31:28',34,NULL,NULL),(76,17,44,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:31:28','2025-07-19 05:31:28',34,NULL,NULL),(77,17,45,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:31:28','2025-07-19 05:31:28',34,NULL,NULL),(78,17,46,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:31:29','2025-07-19 05:31:29',34,NULL,NULL),(79,17,47,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:31:29','2025-07-19 05:31:29',34,NULL,NULL),(80,17,48,NULL,4,2,NULL,NULL,NULL,'2025-07-19 05:31:29','2025-07-19 05:31:30',34,NULL,NULL),(81,17,43,75,4,19,NULL,NULL,NULL,'2025-07-19 05:32:31','2025-07-19 05:32:31',34,NULL,NULL),(82,17,44,76,4,19,NULL,NULL,NULL,'2025-07-19 05:32:31','2025-07-19 05:32:31',34,NULL,NULL),(83,17,45,77,4,19,NULL,NULL,NULL,'2025-07-19 05:32:31','2025-07-19 05:32:31',34,NULL,NULL),(84,17,46,78,4,19,NULL,NULL,NULL,'2025-07-19 05:32:31','2025-07-19 05:32:31',34,NULL,NULL),(85,17,47,79,4,19,NULL,NULL,NULL,'2025-07-19 05:32:31','2025-07-19 05:32:31',34,NULL,NULL),(86,17,48,80,4,19,NULL,NULL,NULL,'2025-07-19 05:32:31','2025-07-19 05:32:31',34,NULL,NULL);
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
INSERT INTO `submissions` VALUES (1,1,1,'2025-07-19 05:17:46','2025-07-19 05:17:34','2025-07-19 05:17:34',4,'en_US',1,0,2),(2,1,2,'2025-07-19 05:18:51','2025-07-19 05:18:36','2025-07-19 05:18:36',3,'en_US',1,0,1),(3,1,3,'2025-07-19 05:19:17','2025-07-19 05:19:17','2025-07-19 05:19:17',1,'en_US',1,0,2),(4,1,4,'2025-07-19 05:20:23','2025-07-19 05:19:55','2025-07-19 05:19:55',5,'en_US',1,0,1),(5,1,5,'2025-07-19 05:21:33','2025-07-19 05:20:53','2025-07-19 05:20:53',5,'en_US',3,0,2),(6,1,6,'2025-07-19 05:22:23','2025-07-19 05:22:10','2025-07-19 05:22:10',2,'en_US',1,0,1),(7,1,7,'2025-07-19 05:23:33','2025-07-19 05:23:16','2025-07-19 05:23:16',4,'en_US',1,0,1),(8,1,8,'2025-07-19 05:23:40','2025-07-19 05:23:40','2025-07-19 05:23:40',1,'en_US',1,0,2),(9,1,9,'2025-07-19 05:24:32','2025-07-19 05:24:27','2025-07-19 05:24:27',2,'en_US',1,0,1),(10,1,10,'2025-07-19 05:25:14','2025-07-19 05:25:14','2025-07-19 05:25:14',1,'en_US',1,0,2),(11,1,11,'2025-07-19 05:26:02','2025-07-19 05:25:28','2025-07-19 05:25:28',4,'en_US',1,0,2),(12,1,12,'2025-07-19 05:27:11','2025-07-19 05:26:45','2025-07-19 05:26:45',2,'en_US',1,0,1),(13,1,13,'2025-07-19 05:28:27','2025-07-19 05:27:43','2025-07-19 05:27:43',4,'en_US',1,0,1),(14,1,14,'2025-07-19 05:30:11','2025-07-19 05:29:05','2025-07-19 05:29:05',5,'en_US',3,0,1),(15,1,15,'2025-07-19 05:30:33','2025-07-19 05:30:28','2025-07-19 05:30:28',3,'en_US',1,0,2),(16,1,16,'2025-07-19 05:31:21','2025-07-19 05:30:59','2025-07-19 05:30:59',3,'en_US',1,0,2),(17,1,17,'2025-07-19 05:32:42','2025-07-19 05:32:25','2025-07-19 05:32:25',2,'en_US',1,0,1);
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$ozSzHGPFQytg.oVloruSvuLD2JssmPC3hxFDL6MeA9rv7e.LgWGGy','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2025-07-19 05:14:24',NULL,'2025-07-19 05:17:03',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$P6yIJvAFAdy9FOnHKNYEtuhXRxI2Wkkp3.m4aT0yDWWq6/i8cpPcu','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2025-07-19 05:15:06',NULL,'2025-07-19 05:17:01',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$ajAcx8D5H0iIXrWTmfX87.HIGk21WivyTq7LVvXnta3Ox061gBpNq','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2025-07-19 05:15:11',NULL,'2025-07-19 05:32:26',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$eb5fitPnOpU17EaIJdSz5ezE7ok68MtCMJ1manrf6weuJ5kV08EMC','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2025-07-19 05:15:17',NULL,'2025-07-19 05:15:17',0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$vJM9Cu4fP9CmPs36wEqyyeGLK8SPgqDgNEPpZEl9SbmDVE6WX1Y2q','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2025-07-19 05:15:22',NULL,'2025-07-19 05:15:22',0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$3w4XV5mxm38UmOlPOnNsQujonbXRhsfbespfhIaqZn5JX72vseYpC','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2025-07-19 05:15:28',NULL,'2025-07-19 05:22:20',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$8QbY3CTKtJ5WCRlki6AcduY5y5TTGOCdQ26cHuL/JTZH1sfAmet5a','jjanssen@mailinator.com','','','',NULL,'NL','',NULL,NULL,'2025-07-19 05:15:33',NULL,'2025-07-19 05:15:33',0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$LOVFpbrqhgYoB8N/V6wFNeX0K4EOgXO5HZTjC6zbKdHxflU3IOHyq','phudson@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2025-07-19 05:15:39',NULL,'2025-07-19 05:27:06',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$eMHMtS9rriF6ahNoTZSQbup0BTBK/ArXCKiKhYNZDCLbCab6Z8Gca','amccrae@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2025-07-19 05:15:46',NULL,'2025-07-19 05:15:46',0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$O8G/tmE5mM3jDSFRB4kdxusft/HTHrC0y4LffNYQBPX53HBBdQ80y','agallego@mailinator.com','','','',NULL,'US','',NULL,NULL,'2025-07-19 05:15:52',NULL,'2025-07-19 05:31:16',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$sPEsbzvfNERG.95CwreIA.AkvLWkqRZt0FemEtCXILrBYone/KZMq','alzacharia@mailinator.com','','','',NULL,'GH','',NULL,NULL,'2025-07-19 05:15:59',NULL,'2025-07-19 05:15:59',0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$RrJj6WXMu628P19TxEu98e/v3lYIRxeZk8WYyxMJ5Qt0hYGrfVlUm','gfavio@mailinator.com','','','',NULL,'ES','',NULL,NULL,'2025-07-19 05:16:06',NULL,'2025-07-19 05:28:14',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$jNiq9C0pcM6vqL/C2F6TwedZJrDYaO.hUmuLuRTtImy1VPzKhtJ8S','mfritz@mailinator.com','','','',NULL,'BE','',NULL,NULL,'2025-07-19 05:16:14',NULL,'2025-07-19 05:16:14',0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$tZthhOhKxnz1xMbnPhvBu.aqn9xTi8UatcZJi8HaztXSSlfXSTNjm','svogt@mailinator.com','','','',NULL,'CL','',NULL,NULL,'2025-07-19 05:16:21',NULL,'2025-07-19 05:16:21',0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$g49Xo0/hwM1B4lkXb6JMZeEGTeJXLDK8KehHz0ZS4SCik1w3wBcWW','gcox@mailinator.com','','','',NULL,'US','',NULL,NULL,'2025-07-19 05:16:29',NULL,'2025-07-19 05:16:29',0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$68boWOUB.q.bDDeRGSysjOJWXeuNEXmrmN7d8GZju27f6OCl5gkIa','shellier@mailinator.com','','','',NULL,'ZA','',NULL,NULL,'2025-07-19 05:16:37',NULL,'2025-07-19 05:16:37',0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$GJ3O1k.2Lq4pMJIQTzAOkOTi92fKTkFWn94tgUL5M63cWqIrrTl0S','cturner@mailinator.com','','','',NULL,'GB','',NULL,NULL,'2025-07-19 05:16:47',NULL,'2025-07-19 05:16:47',0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$V/xQ.GxobfIFyE32k7zVn.n3ecEba6X3AQn8HJOgR1MoMmvA5O6X.','skumar@mailinator.com','','','',NULL,'SG','',NULL,NULL,'2025-07-19 05:16:55',NULL,'2025-07-19 05:16:55',0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$0qBbF2iD9pSGata9z8O8ZeNImGYZN565wO6HPW75XhqNlV4wmqNle','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:17:19',NULL,'2025-07-19 05:17:19',0,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$psuXEPOw24lAA//IGygu8.3rP7Gv7phg.YubZ7SyshM1zdy2sj.Oa','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:17:50',NULL,'2025-07-19 05:17:50',0,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$hbx4Lw65P3XH9Ui2ar2AievgU0vWzAxmMQdSOJ8qADbgfPqRtGpLW','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:18:55',NULL,'2025-07-19 05:18:55',0,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$RDtRNwDTc0y50bYEHLLFpOAkcrrRSwizfP731DVHEkmWApZVs7ySS','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:19:20',NULL,'2025-07-19 05:19:20',0,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$U7BwPXveZR6vHRcVZTktE.Jqrx.aJS6B67Zaw5yv.VLy3dzMZoB1C','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:20:27',NULL,'2025-07-19 05:20:28',0,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$7hB.ySAWGwKrB4Uzr7J13.Rjbu2Lp9cMiRjm6QfFo9lI/sd.gUtp2','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2025-07-19 05:21:36',NULL,'2025-07-19 05:21:37',0,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$UgJKOOadnbwo4SsWHxbAQOm902yhR9S.z3rMVs7DMc7G4ACJFeFCi','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:22:31',NULL,'2025-07-19 05:22:31',0,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$PjsCiTrPdnr1PnrC1buRAujptGV1.QXMzNSDFQz29FwgNwPWve4zW','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:23:44',NULL,'2025-07-19 05:23:44',0,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$b1eCD/ek3.jGWO2c93uuZeWwaMtc0We6EkdNMJgNLFom8zSJal5wW','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:24:38',NULL,'2025-07-19 05:24:38',0,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$QYT1YKpRakjJzXjnIjyASOF8R6Bow.4MO.ok6g.DNp4eeWeV8/cPG','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:25:18',NULL,'2025-07-19 05:25:18',0,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$m250entbQYzIt30QJ/1aq.czr/n8fxJjva8MsryCf5pA9uFj5lxRq','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:26:07',NULL,'2025-07-19 05:26:07',0,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$Ko350AuC7LNdxOpj7YI9IuX4sEb8GT8/OV7l9YZqapaxmbQifc9Yq','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:27:15',NULL,'2025-07-19 05:27:15',0,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$b5RC1EIU9fkv8vVWadDqyOBa2CTKiM1eMZB/fr9pA6scP8Se/UuF6','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:28:32',NULL,'2025-07-19 05:28:32',0,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$uT/UyvMv.radXDsjeUJ4H.4Gjv3dcRQff9n6L7QpaOCVi5wqzEKrS','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:30:14',NULL,'2025-07-19 05:30:14',0,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$VFbqdsfZNuerFJQHzBMogew7LRJRr4nQio7RI5yvidUyyrShXmYMm','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:30:38',NULL,'2025-07-19 05:30:38',0,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$kBPOwEBlVT.AFs7Z6I/9C.laOndWUUEegXdM1WeEYP0As2D8hLjkO','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-07-19 05:31:25',NULL,'2025-07-19 05:31:25',0,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2025-07-19 05:14:24',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.pubIds','urn','URNPubIdPlugin',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.pubIds','doi','DOIPubIdPlugin',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','acron','',0,1),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,2,0,0,'2025-07-19 05:14:24',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,2,0,0,'2025-07-19 05:14:24',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2025-07-19 05:14:24',1,'plugins.reports','monographReport','',0,0),(2,0,0,0,'2025-07-19 05:14:24',1,'plugins.reports','reviewReport','',0,0),(3,3,0,21,'2025-07-19 05:14:21',1,'core','omp','',0,1);
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

-- Dump completed on 2025-07-19  5:32:44
