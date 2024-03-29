-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
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
  KEY `announcement_type_settings_type_id` (`type_id`)
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
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
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
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
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
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
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
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','CA',NULL),(1,'en_US','affiliation','University of Calgary',NULL),(1,'en_US','familyName','Clark',NULL),(1,'en_US','givenName','Arthur',NULL),(2,'','country','CA',NULL),(2,'en_US','affiliation','Athabasca University',NULL),(2,'en_US','familyName','Finkel',NULL),(2,'en_US','givenName','Alvin',NULL),(3,'','country','CA',NULL),(3,'','orcid','',NULL),(3,'','url','',NULL),(3,'en_US','affiliation','',NULL),(3,'en_US','biography','',NULL),(3,'en_US','familyName','Carter',NULL),(3,'en_US','givenName','Sarah',NULL),(3,'en_US','preferredPublicName','',NULL),(3,'fr_CA','affiliation','',NULL),(3,'fr_CA','biography','',NULL),(3,'fr_CA','familyName','',NULL),(3,'fr_CA','givenName','',NULL),(3,'fr_CA','preferredPublicName','',NULL),(4,'','country','CA',NULL),(4,'','orcid','',NULL),(4,'','url','',NULL),(4,'en_US','affiliation','',NULL),(4,'en_US','biography','',NULL),(4,'en_US','familyName','Fortna',NULL),(4,'en_US','givenName','Peter',NULL),(4,'en_US','preferredPublicName','',NULL),(4,'fr_CA','affiliation','',NULL),(4,'fr_CA','biography','',NULL),(4,'fr_CA','familyName','',NULL),(4,'fr_CA','givenName','',NULL),(4,'fr_CA','preferredPublicName','',NULL),(5,'','country','CA',NULL),(5,'','orcid','',NULL),(5,'','url','',NULL),(5,'en_US','affiliation','',NULL),(5,'en_US','biography','',NULL),(5,'en_US','familyName','Friesen',NULL),(5,'en_US','givenName','Gerald',NULL),(5,'en_US','preferredPublicName','',NULL),(5,'fr_CA','affiliation','',NULL),(5,'fr_CA','biography','',NULL),(5,'fr_CA','familyName','',NULL),(5,'fr_CA','givenName','',NULL),(5,'fr_CA','preferredPublicName','',NULL),(6,'','country','CA',NULL),(6,'','orcid','',NULL),(6,'','url','',NULL),(6,'en_US','affiliation','',NULL),(6,'en_US','biography','',NULL),(6,'en_US','familyName','Dick',NULL),(6,'en_US','givenName','Lyle',NULL),(6,'en_US','preferredPublicName','',NULL),(6,'fr_CA','affiliation','',NULL),(6,'fr_CA','biography','',NULL),(6,'fr_CA','familyName','',NULL),(6,'fr_CA','givenName','',NULL),(6,'fr_CA','preferredPublicName','',NULL),(7,'','country','CA',NULL),(7,'','orcid','',NULL),(7,'','url','',NULL),(7,'en_US','affiliation','',NULL),(7,'en_US','biography','',NULL),(7,'en_US','familyName','Wheeler',NULL),(7,'en_US','givenName','Winona',NULL),(7,'en_US','preferredPublicName','',NULL),(7,'fr_CA','affiliation','',NULL),(7,'fr_CA','biography','',NULL),(7,'fr_CA','familyName','',NULL),(7,'fr_CA','givenName','',NULL),(7,'fr_CA','preferredPublicName','',NULL),(8,'','country','CA',NULL),(8,'','orcid','',NULL),(8,'','url','',NULL),(8,'en_US','affiliation','',NULL),(8,'en_US','biography','',NULL),(8,'en_US','familyName','Dyce',NULL),(8,'en_US','givenName','Matt',NULL),(8,'en_US','preferredPublicName','',NULL),(8,'fr_CA','affiliation','',NULL),(8,'fr_CA','biography','',NULL),(8,'fr_CA','familyName','',NULL),(8,'fr_CA','givenName','',NULL),(8,'fr_CA','preferredPublicName','',NULL),(9,'','country','CA',NULL),(9,'','orcid','',NULL),(9,'','url','',NULL),(9,'en_US','affiliation','',NULL),(9,'en_US','biography','',NULL),(9,'en_US','familyName','Opp',NULL),(9,'en_US','givenName','James',NULL),(9,'en_US','preferredPublicName','',NULL),(9,'fr_CA','affiliation','',NULL),(9,'fr_CA','biography','',NULL),(9,'fr_CA','familyName','',NULL),(9,'fr_CA','givenName','',NULL),(9,'fr_CA','preferredPublicName','',NULL),(10,'','country','CA',NULL),(10,'en_US','affiliation','Athabasca University',NULL),(10,'en_US','familyName','Barnetson',NULL),(10,'en_US','givenName','Bob',NULL),(11,'','country','CA',NULL),(11,'en_US','affiliation','University of British Columbia',NULL),(11,'en_US','familyName','Beaty',NULL),(11,'en_US','givenName','Bart',NULL),(12,'','country','CA',NULL),(12,'','orcid','',NULL),(12,'','url','',NULL),(12,'en_US','affiliation','University of Alberta',NULL),(12,'en_US','biography','',NULL),(12,'en_US','familyName','Miller',NULL),(12,'en_US','givenName','Toby',NULL),(12,'en_US','preferredPublicName','',NULL),(12,'fr_CA','affiliation','',NULL),(12,'fr_CA','biography','',NULL),(12,'fr_CA','familyName','',NULL),(12,'fr_CA','givenName','',NULL),(12,'fr_CA','preferredPublicName','',NULL),(13,'','country','CA',NULL),(13,'','orcid','',NULL),(13,'','url','',NULL),(13,'en_US','affiliation','Athabasca University',NULL),(13,'en_US','biography','',NULL),(13,'en_US','familyName','Wagman',NULL),(13,'en_US','givenName','Ira',NULL),(13,'en_US','preferredPublicName','',NULL),(13,'fr_CA','affiliation','',NULL),(13,'fr_CA','biography','',NULL),(13,'fr_CA','familyName','',NULL),(13,'fr_CA','givenName','',NULL),(13,'fr_CA','preferredPublicName','',NULL),(14,'','country','CA',NULL),(14,'','orcid','',NULL),(14,'','url','',NULL),(14,'en_US','affiliation','University of Calgary',NULL),(14,'en_US','biography','',NULL),(14,'en_US','familyName','Straw',NULL),(14,'en_US','givenName','Will',NULL),(14,'en_US','preferredPublicName','',NULL),(14,'fr_CA','affiliation','',NULL),(14,'fr_CA','biography','',NULL),(14,'fr_CA','familyName','',NULL),(14,'fr_CA','givenName','',NULL),(14,'fr_CA','preferredPublicName','',NULL),(15,'','country','CA',NULL),(15,'en_US','affiliation','University of Southern California',NULL),(15,'en_US','familyName','Allan',NULL),(15,'en_US','givenName','Chantal',NULL),(16,'','country','US',NULL),(16,'en_US','affiliation','SUNY',NULL),(16,'en_US','familyName','Bernnard',NULL),(16,'en_US','givenName','Deborah',NULL),(17,'','country','US',NULL),(17,'','orcid','',NULL),(17,'','url','',NULL),(17,'en_US','affiliation','SUNY',NULL),(17,'en_US','biography','',NULL),(17,'en_US','familyName','Bobish',NULL),(17,'en_US','givenName','Greg',NULL),(17,'en_US','preferredPublicName','',NULL),(17,'fr_CA','affiliation','',NULL),(17,'fr_CA','biography','',NULL),(17,'fr_CA','familyName','',NULL),(17,'fr_CA','givenName','',NULL),(17,'fr_CA','preferredPublicName','',NULL),(18,'','country','US',NULL),(18,'','orcid','',NULL),(18,'','url','',NULL),(18,'en_US','affiliation','SUNY',NULL),(18,'en_US','biography','',NULL),(18,'en_US','familyName','Bullis',NULL),(18,'en_US','givenName','Daryl',NULL),(18,'en_US','preferredPublicName','',NULL),(18,'fr_CA','affiliation','',NULL),(18,'fr_CA','biography','',NULL),(18,'fr_CA','familyName','',NULL),(18,'fr_CA','givenName','',NULL),(18,'fr_CA','preferredPublicName','',NULL),(19,'','country','US',NULL),(19,'','orcid','',NULL),(19,'','url','',NULL),(19,'en_US','affiliation','SUNY',NULL),(19,'en_US','biography','',NULL),(19,'en_US','familyName','Hecker',NULL),(19,'en_US','givenName','Jenna',NULL),(19,'en_US','preferredPublicName','',NULL),(19,'fr_CA','affiliation','',NULL),(19,'fr_CA','biography','',NULL),(19,'fr_CA','familyName','',NULL),(19,'fr_CA','givenName','',NULL),(19,'fr_CA','preferredPublicName','',NULL),(20,'','country','CA',NULL),(20,'en_US','affiliation','Athabasca University',NULL),(20,'en_US','familyName','Kennepohl',NULL),(20,'en_US','givenName','Dietmar',NULL),(21,'','country','CA',NULL),(21,'','orcid','',NULL),(21,'','url','',NULL),(21,'en_US','affiliation','University of Calgary',NULL),(21,'en_US','biography','',NULL),(21,'en_US','familyName','Anderson',NULL),(21,'en_US','givenName','Terry',NULL),(21,'en_US','preferredPublicName','',NULL),(21,'fr_CA','affiliation','',NULL),(21,'fr_CA','biography','',NULL),(21,'fr_CA','familyName','',NULL),(21,'fr_CA','givenName','',NULL),(21,'fr_CA','preferredPublicName','',NULL),(22,'','country','CA',NULL),(22,'','orcid','',NULL),(22,'','url','',NULL),(22,'en_US','affiliation','University of Alberta',NULL),(22,'en_US','biography','',NULL),(22,'en_US','familyName','Gorsky',NULL),(22,'en_US','givenName','Paul',NULL),(22,'en_US','preferredPublicName','',NULL),(22,'fr_CA','affiliation','',NULL),(22,'fr_CA','biography','',NULL),(22,'fr_CA','familyName','',NULL),(22,'fr_CA','givenName','',NULL),(22,'fr_CA','preferredPublicName','',NULL),(23,'','country','CA',NULL),(23,'','orcid','',NULL),(23,'','url','',NULL),(23,'en_US','affiliation','Athabasca University',NULL),(23,'en_US','biography','',NULL),(23,'en_US','familyName','Parchoma',NULL),(23,'en_US','givenName','Gale',NULL),(23,'en_US','preferredPublicName','',NULL),(23,'fr_CA','affiliation','',NULL),(23,'fr_CA','biography','',NULL),(23,'fr_CA','familyName','',NULL),(23,'fr_CA','givenName','',NULL),(23,'fr_CA','preferredPublicName','',NULL),(24,'','country','CA',NULL),(24,'','orcid','',NULL),(24,'','url','',NULL),(24,'en_US','affiliation','University of Alberta',NULL),(24,'en_US','biography','',NULL),(24,'en_US','familyName','Palmer',NULL),(24,'en_US','givenName','Stuart',NULL),(24,'en_US','preferredPublicName','',NULL),(24,'fr_CA','affiliation','',NULL),(24,'fr_CA','biography','',NULL),(24,'fr_CA','familyName','',NULL),(24,'fr_CA','givenName','',NULL),(24,'fr_CA','preferredPublicName','',NULL),(25,'','country','AU',NULL),(25,'','orcid','',NULL),(25,'','url','',NULL),(25,'en_US','affiliation','University of Melbourne',NULL),(25,'en_US','biography','',NULL),(25,'en_US','familyName','Barnes',NULL),(25,'en_US','givenName','Daniel',NULL),(25,'fr_CA','affiliation','',NULL),(25,'fr_CA','biography','',NULL),(25,'fr_CA','familyName','',NULL),(25,'fr_CA','givenName','',NULL),(26,'','country','CA',NULL),(26,'en_US','affiliation','University of Sussex',NULL),(26,'en_US','familyName','Perini',NULL),(26,'en_US','givenName','Fernando',NULL),(27,'','country','GB',NULL),(27,'','orcid','',NULL),(27,'','url','',NULL),(27,'en_US','affiliation','',NULL),(27,'en_US','biography','',NULL),(27,'en_US','familyName','Mansell',NULL),(27,'en_US','givenName','Robin',NULL),(27,'en_US','preferredPublicName','',NULL),(27,'fr_CA','affiliation','',NULL),(27,'fr_CA','biography','',NULL),(27,'fr_CA','familyName','',NULL),(27,'fr_CA','givenName','',NULL),(27,'fr_CA','preferredPublicName','',NULL),(28,'','country','AR',NULL),(28,'','orcid','',NULL),(28,'','url','',NULL),(28,'en_US','affiliation','',NULL),(28,'en_US','biography','',NULL),(28,'en_US','familyName','Galperin',NULL),(28,'en_US','givenName','Hernan',NULL),(28,'en_US','preferredPublicName','',NULL),(28,'fr_CA','affiliation','',NULL),(28,'fr_CA','biography','',NULL),(28,'fr_CA','familyName','',NULL),(28,'fr_CA','givenName','',NULL),(28,'fr_CA','preferredPublicName','',NULL),(29,'','country','CL',NULL),(29,'','orcid','',NULL),(29,'','url','',NULL),(29,'en_US','affiliation','',NULL),(29,'en_US','biography','',NULL),(29,'en_US','familyName','Bello',NULL),(29,'en_US','givenName','Pablo',NULL),(29,'en_US','preferredPublicName','',NULL),(29,'fr_CA','affiliation','',NULL),(29,'fr_CA','biography','',NULL),(29,'fr_CA','familyName','',NULL),(29,'fr_CA','givenName','',NULL),(29,'fr_CA','preferredPublicName','',NULL),(30,'','country','AR',NULL),(30,'','orcid','',NULL),(30,'','url','',NULL),(30,'en_US','affiliation','',NULL),(30,'en_US','biography','',NULL),(30,'en_US','familyName','Rabinovich',NULL),(30,'en_US','givenName','Eleonora',NULL),(30,'en_US','preferredPublicName','',NULL),(30,'fr_CA','affiliation','',NULL),(30,'fr_CA','biography','',NULL),(30,'fr_CA','familyName','',NULL),(30,'fr_CA','givenName','',NULL),(30,'fr_CA','preferredPublicName','',NULL),(31,'','country','CA',NULL),(31,'en_US','affiliation','Buffalo National Park Foundation',NULL),(31,'en_US','familyName','Brower',NULL),(31,'en_US','givenName','Jennifer',NULL),(32,'','country','CA',NULL),(32,'en_US','affiliation','University of Alberta',NULL),(32,'en_US','familyName','Locke Hart',NULL),(32,'en_US','givenName','Jonathan',NULL),(33,'','country','CA',NULL),(33,'en_US','affiliation','International Development Research Centre',NULL),(33,'en_US','familyName','Elder',NULL),(33,'en_US','givenName','Laurent',NULL),(34,'','country','CA',NULL),(34,'','orcid','',NULL),(34,'','url','',NULL),(34,'en_US','affiliation','',NULL),(34,'en_US','biography','',NULL),(34,'en_US','familyName','Emdon',NULL),(34,'en_US','givenName','Heloise',NULL),(34,'en_US','preferredPublicName','',NULL),(34,'fr_CA','affiliation','',NULL),(34,'fr_CA','biography','',NULL),(34,'fr_CA','familyName','',NULL),(34,'fr_CA','givenName','',NULL),(34,'fr_CA','preferredPublicName','',NULL),(35,'','country','CA',NULL),(35,'','orcid','',NULL),(35,'','url','',NULL),(35,'en_US','affiliation','',NULL),(35,'en_US','biography','',NULL),(35,'en_US','familyName','Tulus',NULL),(35,'en_US','givenName','Frank',NULL),(35,'en_US','preferredPublicName','',NULL),(35,'fr_CA','affiliation','',NULL),(35,'fr_CA','biography','',NULL),(35,'fr_CA','familyName','',NULL),(35,'fr_CA','givenName','',NULL),(35,'fr_CA','preferredPublicName','',NULL),(36,'','country','AR',NULL),(36,'','orcid','',NULL),(36,'','url','',NULL),(36,'en_US','affiliation','',NULL),(36,'en_US','biography','',NULL),(36,'en_US','familyName','Hyma',NULL),(36,'en_US','givenName','Raymond',NULL),(36,'en_US','preferredPublicName','',NULL),(36,'fr_CA','affiliation','',NULL),(36,'fr_CA','biography','',NULL),(36,'fr_CA','familyName','',NULL),(36,'fr_CA','givenName','',NULL),(36,'fr_CA','preferredPublicName','',NULL),(37,'','country','CA',NULL),(37,'','orcid','',NULL),(37,'','url','',NULL),(37,'en_US','affiliation','',NULL),(37,'en_US','biography','',NULL),(37,'en_US','familyName','Valk',NULL),(37,'en_US','givenName','John',NULL),(37,'en_US','preferredPublicName','',NULL),(37,'fr_CA','affiliation','',NULL),(37,'fr_CA','biography','',NULL),(37,'fr_CA','familyName','',NULL),(37,'fr_CA','givenName','',NULL),(37,'fr_CA','preferredPublicName','',NULL),(38,'','country','CA',NULL),(38,'','orcid','',NULL),(38,'','url','',NULL),(38,'en_US','affiliation','',NULL),(38,'en_US','biography','',NULL),(38,'en_US','familyName','Fourati',NULL),(38,'en_US','givenName','Khaled',NULL),(38,'en_US','preferredPublicName','',NULL),(38,'fr_CA','affiliation','',NULL),(38,'fr_CA','biography','',NULL),(38,'fr_CA','familyName','',NULL),(38,'fr_CA','givenName','',NULL),(38,'fr_CA','preferredPublicName','',NULL),(39,'','country','CA',NULL),(39,'','orcid','',NULL),(39,'','url','',NULL),(39,'en_US','affiliation','',NULL),(39,'en_US','biography','',NULL),(39,'en_US','familyName','de Beer',NULL),(39,'en_US','givenName','Jeremy',NULL),(39,'en_US','preferredPublicName','',NULL),(39,'fr_CA','affiliation','',NULL),(39,'fr_CA','biography','',NULL),(39,'fr_CA','familyName','',NULL),(39,'fr_CA','givenName','',NULL),(39,'fr_CA','preferredPublicName','',NULL),(40,'','country','CA',NULL),(40,'','orcid','',NULL),(40,'','url','',NULL),(40,'en_US','affiliation','',NULL),(40,'en_US','biography','',NULL),(40,'en_US','familyName','Bannerman',NULL),(40,'en_US','givenName','Sara',NULL),(40,'en_US','preferredPublicName','',NULL),(40,'fr_CA','affiliation','',NULL),(40,'fr_CA','biography','',NULL),(40,'fr_CA','familyName','',NULL),(40,'fr_CA','givenName','',NULL),(40,'fr_CA','preferredPublicName','',NULL),(41,'','country','CA',NULL),(41,'en_US','affiliation','Athabasca University',NULL),(41,'en_US','familyName','Ally',NULL),(41,'en_US','givenName','Mohamed',NULL),(42,'','country','GB',NULL),(42,'','orcid','',NULL),(42,'','url','',NULL),(42,'en_US','affiliation','',NULL),(42,'en_US','biography','',NULL),(42,'en_US','familyName','Traxler',NULL),(42,'en_US','givenName','John',NULL),(42,'en_US','preferredPublicName','',NULL),(42,'fr_CA','affiliation','',NULL),(42,'fr_CA','biography','',NULL),(42,'fr_CA','familyName','',NULL),(42,'fr_CA','givenName','',NULL),(42,'fr_CA','preferredPublicName','',NULL),(43,'','country','CA',NULL),(43,'','orcid','',NULL),(43,'','url','',NULL),(43,'en_US','affiliation','',NULL),(43,'en_US','biography','',NULL),(43,'en_US','familyName','Koole',NULL),(43,'en_US','givenName','Marguerite',NULL),(43,'en_US','preferredPublicName','',NULL),(43,'fr_CA','affiliation','',NULL),(43,'fr_CA','biography','',NULL),(43,'fr_CA','familyName','',NULL),(43,'fr_CA','givenName','',NULL),(43,'fr_CA','preferredPublicName','',NULL),(44,'','country','NO',NULL),(44,'','orcid','',NULL),(44,'','url','',NULL),(44,'en_US','affiliation','',NULL),(44,'en_US','biography','',NULL),(44,'en_US','familyName','Rekkedal',NULL),(44,'en_US','givenName','Torstein',NULL),(44,'en_US','preferredPublicName','',NULL),(44,'fr_CA','affiliation','',NULL),(44,'fr_CA','biography','',NULL),(44,'fr_CA','familyName','',NULL),(44,'fr_CA','givenName','',NULL),(44,'fr_CA','preferredPublicName','',NULL),(45,'','country','CA',NULL),(45,'en_US','affiliation','University of Alberta',NULL),(45,'en_US','familyName','Dawson',NULL),(45,'en_US','givenName','Michael',NULL),(46,'','country','CA',NULL),(46,'','orcid','',NULL),(46,'','url','',NULL),(46,'en_US','affiliation','Athabasca University',NULL),(46,'en_US','biography','',NULL),(46,'en_US','familyName','Dupuis',NULL),(46,'en_US','givenName','Brian',NULL),(46,'en_US','preferredPublicName','',NULL),(46,'fr_CA','affiliation','',NULL),(46,'fr_CA','biography','',NULL),(46,'fr_CA','familyName','',NULL),(46,'fr_CA','givenName','',NULL),(46,'fr_CA','preferredPublicName','',NULL),(47,'','country','CA',NULL),(47,'','orcid','',NULL),(47,'','url','',NULL),(47,'en_US','affiliation','University of Calgary',NULL),(47,'en_US','biography','',NULL),(47,'en_US','familyName','Wilson',NULL),(47,'en_US','givenName','Michael',NULL),(47,'en_US','preferredPublicName','',NULL),(47,'fr_CA','affiliation','',NULL),(47,'fr_CA','biography','',NULL),(47,'fr_CA','familyName','',NULL),(47,'fr_CA','givenName','',NULL),(47,'fr_CA','preferredPublicName','',NULL),(48,'','country','CA',NULL),(48,'en_US','affiliation','University of Calgary',NULL),(48,'en_US','familyName','Foran',NULL),(48,'en_US','givenName','Max',NULL),(49,'','country','CA',NULL),(49,'en_US','affiliation','London School of Economics',NULL),(49,'en_US','familyName','Power',NULL),(49,'en_US','givenName','Michael',NULL),(50,'','country','CA',NULL),(50,'en_US','affiliation','International Development Research Centre',NULL),(50,'en_US','familyName','Smith',NULL),(50,'en_US','givenName','Matthew',NULL),(51,'','country','US',NULL),(51,'','orcid','',NULL),(51,'','url','',NULL),(51,'en_US','affiliation','',NULL),(51,'en_US','biography','',NULL),(51,'en_US','familyName','Benkler',NULL),(51,'en_US','givenName','Yochai',NULL),(51,'en_US','preferredPublicName','',NULL),(51,'fr_CA','affiliation','',NULL),(51,'fr_CA','biography','',NULL),(51,'fr_CA','familyName','',NULL),(51,'fr_CA','givenName','',NULL),(51,'fr_CA','preferredPublicName','',NULL),(52,'','country','CA',NULL),(52,'','orcid','',NULL),(52,'','url','',NULL),(52,'en_US','affiliation','',NULL),(52,'en_US','biography','',NULL),(52,'en_US','familyName','Reilly',NULL),(52,'en_US','givenName','Katherine',NULL),(52,'en_US','preferredPublicName','',NULL),(52,'fr_CA','affiliation','',NULL),(52,'fr_CA','biography','',NULL),(52,'fr_CA','familyName','',NULL),(52,'fr_CA','givenName','',NULL),(52,'fr_CA','preferredPublicName','',NULL),(53,'','country','US',NULL),(53,'','orcid','',NULL),(53,'','url','',NULL),(53,'en_US','affiliation','',NULL),(53,'en_US','biography','',NULL),(53,'en_US','familyName','Loudon',NULL),(53,'en_US','givenName','Melissa',NULL),(53,'en_US','preferredPublicName','',NULL),(53,'fr_CA','affiliation','',NULL),(53,'fr_CA','biography','',NULL),(53,'fr_CA','familyName','',NULL),(53,'fr_CA','givenName','',NULL),(53,'fr_CA','preferredPublicName','',NULL),(54,'','country','ZA',NULL),(54,'','orcid','',NULL),(54,'','url','',NULL),(54,'en_US','affiliation','',NULL),(54,'en_US','biography','',NULL),(54,'en_US','familyName','Rivett',NULL),(54,'en_US','givenName','Ulrike',NULL),(54,'en_US','preferredPublicName','',NULL),(54,'fr_CA','affiliation','',NULL),(54,'fr_CA','biography','',NULL),(54,'fr_CA','familyName','',NULL),(54,'fr_CA','givenName','',NULL),(54,'fr_CA','preferredPublicName','',NULL),(55,'','country','GB',NULL),(55,'','orcid','',NULL),(55,'','url','',NULL),(55,'en_US','affiliation','',NULL),(55,'en_US','biography','',NULL),(55,'en_US','familyName','Graham',NULL),(55,'en_US','givenName','Mark',NULL),(55,'en_US','preferredPublicName','',NULL),(55,'fr_CA','affiliation','',NULL),(55,'fr_CA','biography','',NULL),(55,'fr_CA','familyName','',NULL),(55,'fr_CA','givenName','',NULL),(55,'fr_CA','preferredPublicName','',NULL),(56,'','country','NO',NULL),(56,'','orcid','',NULL),(56,'','url','',NULL),(56,'en_US','affiliation','',NULL),(56,'en_US','biography','',NULL),(56,'en_US','familyName','Haarstad',NULL),(56,'en_US','givenName','Håvard',NULL),(56,'en_US','preferredPublicName','',NULL),(56,'fr_CA','affiliation','',NULL),(56,'fr_CA','biography','',NULL),(56,'fr_CA','familyName','',NULL),(56,'fr_CA','givenName','',NULL),(56,'fr_CA','preferredPublicName','',NULL),(57,'','country','US',NULL),(57,'','orcid','',NULL),(57,'','url','',NULL),(57,'en_US','affiliation','',NULL),(57,'en_US','biography','',NULL),(57,'en_US','familyName','Smith',NULL),(57,'en_US','givenName','Marshall',NULL),(57,'en_US','preferredPublicName','',NULL),(57,'fr_CA','affiliation','',NULL),(57,'fr_CA','biography','',NULL),(57,'fr_CA','familyName','',NULL),(57,'fr_CA','givenName','',NULL),(57,'fr_CA','preferredPublicName','',NULL);
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
  `include_in_browse` tinyint(4) NOT NULL DEFAULT '1',
  `publication_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
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
INSERT INTO `authors` VALUES (1,'aclark@mailinator.com',1,1,NULL,0,13),(2,'afinkel@mailinator.com',1,2,NULL,0,14),(3,'scarter@mailinator.com',1,2,NULL,1,14),(4,'pfortna@mailinator.com',1,2,NULL,2,14),(5,'gfriesen@mailinator.com',1,2,NULL,3,13),(6,'ldick@mailinator.com',1,2,NULL,4,13),(7,'wwheeler@mailinator.com',1,2,NULL,5,13),(8,'mdyce@mailinator.com',1,2,NULL,6,13),(9,'jopp@mailinator.com',1,2,NULL,7,13),(10,'bbarnetson@mailinator.com',1,3,NULL,0,13),(11,'bbeaty@mailinator.com',1,4,NULL,0,14),(12,'tmiller@mailinator.com',1,4,NULL,1,13),(13,'awagman@mailinator.com',1,4,NULL,2,13),(14,'wstraw@mailinator.com',1,4,NULL,3,13),(15,'callan@mailinator.com',1,5,NULL,0,13),(16,'dbernnard@mailinator.com',1,6,NULL,0,14),(17,'gbobish@mailinator.com',1,6,NULL,1,13),(18,'dbullis@mailinator.com',1,6,NULL,2,13),(19,'jhecker@mailinator.com',1,6,NULL,3,13),(20,'dkennepohl@mailinator.com',1,7,NULL,0,14),(21,'tanderson@mailinator.com',1,7,NULL,1,13),(22,'pgorsky@mailinator.com',1,7,NULL,2,13),(23,'gparchoma@mailinator.com',1,7,NULL,3,13),(24,'spalmer@mailinator.com',1,7,NULL,4,13),(25,'dbarnes@mailinator.com',1,8,NULL,0,13),(26,'fperini@mailinator.com',1,9,NULL,0,14),(27,'rmansell@mailinator.com',1,9,NULL,1,13),(28,'hgalperin@mailinator.com',1,9,NULL,2,13),(29,'pbello@mailinator.com',1,9,NULL,3,13),(30,'erabinovich@mailinator.com',1,9,NULL,4,13),(31,'jbrower@mailinator.com',1,10,NULL,0,13),(32,'jlockehart@mailinator.com',1,11,NULL,0,13),(33,'lelder@mailinator.com',1,12,NULL,0,14),(34,'lelder@mailinator.com',1,12,NULL,1,14),(35,'ftulus@mailinator.com',1,12,NULL,2,13),(36,'rhyma@mailinator.com',1,12,NULL,3,13),(37,'jvalk@mailinator.com',1,12,NULL,4,13),(38,'fkourati@mailinator.com',1,12,NULL,5,13),(39,'jdebeer@mailinator.com',1,12,NULL,6,13),(40,'sbannerman@mailinator.com',1,12,NULL,7,13),(41,'mally@mailinator.com',1,13,NULL,0,14),(42,'jtraxler@mailinator.com',1,13,NULL,1,13),(43,'mkoole@mailinator.com',1,13,NULL,2,13),(44,'trekkedal@mailinator.com',1,13,NULL,3,13),(45,'mdawson@mailinator.com',1,14,NULL,0,14),(46,'bdupuis@mailinator.com',1,14,NULL,1,13),(47,'mwilson@mailinator.com',1,14,NULL,2,13),(48,'mforan@mailinator.com',1,15,NULL,0,13),(49,'mpower@mailinator.com',1,16,NULL,0,13),(50,'msmith@mailinator.com',1,17,NULL,0,14),(51,'ybenkler@mailinator.com',1,17,NULL,1,13),(52,'kreilly@mailinator.com',1,17,NULL,2,13),(53,'mloudon@mailinator.com',1,17,NULL,3,13),(54,'urivett@mailinator.com',1,17,NULL,4,13),(55,'mgraham@mailinator.com',1,17,NULL,5,13),(56,'hhaarstad@mailinator.com',1,17,NULL,6,13),(57,'masmith@mailinator.com',1,17,NULL,7,13);
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
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `raw_citation` text,
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
  `amount` double NOT NULL,
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
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,1),(9,2,2),(10,2,3),(11,2,4),(12,2,5),(13,2,6),(14,2,7),(15,3,1),(16,3,2),(17,3,3),(18,4,1),(19,4,2),(20,4,3),(21,4,4),(22,4,5),(23,4,6),(24,4,7),(25,5,1),(26,5,2),(27,5,3),(28,6,1),(29,6,2),(30,6,3),(31,6,4),(32,6,5),(33,6,6),(34,6,7),(35,6,8),(36,6,9),(37,6,10),(38,6,11),(39,6,12),(40,7,1),(41,7,2),(42,19,1),(43,19,2),(44,24,1),(45,24,2),(49,29,1),(50,29,2),(51,29,3),(52,34,1),(53,34,2),(54,39,1),(55,49,1),(56,49,2),(57,49,3),(58,54,1),(59,54,2),(60,54,3),(61,64,1),(62,64,2),(63,69,1),(65,74,1),(66,89,1),(67,89,2);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','name','journal','string'),(2,'','name','issue','string'),(3,'','name','article','string'),(4,'','name','proceeding','string'),(5,'','name','conference','string'),(6,'','name','preprint','string'),(7,'','name','unknown','string'),(8,'','name','book','string'),(9,'','name','bookitem','string'),(10,'','name','proceeding','string'),(11,'','name','conference','string'),(12,'','name','report','string'),(13,'','name','document','string'),(14,'','name','unknown','string'),(15,'','name','personal','string'),(16,'','name','corporate','string'),(17,'','name','conference','string'),(18,'','description','Author','string'),(18,'','name','aut','string'),(19,'','description','Contributor','string'),(19,'','name','ctb','string'),(20,'','description','Editor','string'),(20,'','name','edt','string'),(21,'','description','Illustrator','string'),(21,'','name','ill','string'),(22,'','description','Photographer','string'),(22,'','name','pht','string'),(23,'','description','Sponsor','string'),(23,'','name','spn','string'),(24,'','description','Translator','string'),(24,'','name','trl','string'),(25,'','name','multimedia','string'),(26,'','name','still image','string'),(27,'','name','text','string'),(28,'','name','article','string'),(29,'','name','book','string'),(30,'','name','conference publication','string'),(31,'','name','issue','string'),(32,'','name','journal','string'),(33,'','name','newspaper','string'),(34,'','name','picture','string'),(35,'','name','review','string'),(36,'','name','periodical','string'),(37,'','name','series','string'),(38,'','name','thesis','string'),(39,'','name','web site','string'),(40,'','name','electronic','string'),(41,'','name','print','string'),(42,'en_US','submissionKeyword','Business & Economics','string'),(43,'en_US','submissionKeyword','Political & International Studies','string'),(44,'en_US','submissionKeyword','Canadian Studies','string'),(45,'en_US','submissionKeyword','Communication & Cultural Studies','string'),(49,'en_US','submissionKeyword','Canadian Studies','string'),(50,'en_US','submissionKeyword','Communication & Cultural Studies','string'),(51,'en_US','submissionKeyword','Political & International Studies','string'),(52,'en_US','submissionKeyword','information literacy','string'),(53,'en_US','submissionKeyword','academic libraries','string'),(54,'en_US','submissionKeyword','Education','string'),(55,'en_US','submissionKeyword','Information','string'),(56,'en_US','submissionKeyword','society','string'),(57,'en_US','submissionKeyword','ICT','string'),(58,'en_US','submissionKeyword','Biography & Memoir','string'),(59,'en_US','submissionKeyword','Environmental Studies','string'),(60,'en_US','submissionKeyword','Political & International Studies','string'),(61,'en_US','submissionKeyword','International Development','string'),(62,'en_US','submissionKeyword','ICT','string'),(63,'en_US','submissionKeyword','Educational Technology','string'),(65,'en_US','submissionKeyword','Psychology','string'),(66,'en_US','submissionKeyword','International Development','string'),(67,'en_US','submissionKeyword','ICT','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (8,'interest',0,0),(6,'mods34-genre-marcgt',0,0),(4,'mods34-name-role-roleTerms-marcrelator',0,0),(3,'mods34-name-types',0,0),(7,'mods34-physicalDescription-form-marcform',0,0),(5,'mods34-typeOfResource',0,0),(2,'openurl10-book-genres',0,0),(1,'openurl10-journal-genres',0,0),(13,'submissionAgency',1048588,1),(18,'submissionAgency',1048588,2),(23,'submissionAgency',1048588,3),(28,'submissionAgency',1048588,4),(33,'submissionAgency',1048588,5),(38,'submissionAgency',1048588,6),(43,'submissionAgency',1048588,7),(48,'submissionAgency',1048588,8),(53,'submissionAgency',1048588,9),(58,'submissionAgency',1048588,10),(63,'submissionAgency',1048588,11),(68,'submissionAgency',1048588,12),(73,'submissionAgency',1048588,13),(78,'submissionAgency',1048588,14),(83,'submissionAgency',1048588,15),(88,'submissionAgency',1048588,16),(93,'submissionAgency',1048588,17),(11,'submissionDiscipline',1048588,1),(16,'submissionDiscipline',1048588,2),(21,'submissionDiscipline',1048588,3),(26,'submissionDiscipline',1048588,4),(31,'submissionDiscipline',1048588,5),(36,'submissionDiscipline',1048588,6),(41,'submissionDiscipline',1048588,7),(46,'submissionDiscipline',1048588,8),(51,'submissionDiscipline',1048588,9),(56,'submissionDiscipline',1048588,10),(61,'submissionDiscipline',1048588,11),(66,'submissionDiscipline',1048588,12),(71,'submissionDiscipline',1048588,13),(76,'submissionDiscipline',1048588,14),(81,'submissionDiscipline',1048588,15),(86,'submissionDiscipline',1048588,16),(91,'submissionDiscipline',1048588,17),(9,'submissionKeyword',1048588,1),(14,'submissionKeyword',1048588,2),(19,'submissionKeyword',1048588,3),(24,'submissionKeyword',1048588,4),(29,'submissionKeyword',1048588,5),(34,'submissionKeyword',1048588,6),(39,'submissionKeyword',1048588,7),(44,'submissionKeyword',1048588,8),(49,'submissionKeyword',1048588,9),(54,'submissionKeyword',1048588,10),(59,'submissionKeyword',1048588,11),(64,'submissionKeyword',1048588,12),(69,'submissionKeyword',1048588,13),(74,'submissionKeyword',1048588,14),(79,'submissionKeyword',1048588,15),(84,'submissionKeyword',1048588,16),(89,'submissionKeyword',1048588,17),(12,'submissionLanguage',1048588,1),(17,'submissionLanguage',1048588,2),(22,'submissionLanguage',1048588,3),(27,'submissionLanguage',1048588,4),(32,'submissionLanguage',1048588,5),(37,'submissionLanguage',1048588,6),(42,'submissionLanguage',1048588,7),(47,'submissionLanguage',1048588,8),(52,'submissionLanguage',1048588,9),(57,'submissionLanguage',1048588,10),(62,'submissionLanguage',1048588,11),(67,'submissionLanguage',1048588,12),(72,'submissionLanguage',1048588,13),(77,'submissionLanguage',1048588,14),(82,'submissionLanguage',1048588,15),(87,'submissionLanguage',1048588,16),(92,'submissionLanguage',1048588,17),(10,'submissionSubject',1048588,1),(15,'submissionSubject',1048588,2),(20,'submissionSubject',1048588,3),(25,'submissionSubject',1048588,4),(30,'submissionSubject',1048588,5),(35,'submissionSubject',1048588,6),(40,'submissionSubject',1048588,7),(45,'submissionSubject',1048588,8),(50,'submissionSubject',1048588,9),(55,'submissionSubject',1048588,10),(60,'submissionSubject',1048588,11),(65,'submissionSubject',1048588,12),(70,'submissionSubject',1048588,13),(75,'submissionSubject',1048588,14),(80,'submissionSubject',1048588,15),(85,'submissionSubject',1048588,16),(90,'submissionSubject',1048588,17);
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
  `setting_type` varchar(6) NOT NULL,
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
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
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
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,3,3,'2022-11-05 02:57:36'),(2,1,1,3,1,3,2,'2022-11-05 02:57:46'),(3,2,0,1,0,3,3,'2022-11-05 02:59:52'),(4,4,0,1,0,3,1,'2022-11-05 03:02:31'),(5,4,3,2,1,3,3,'2022-11-05 03:02:45'),(6,4,4,3,1,3,2,'2022-11-05 03:02:59'),(7,4,0,4,0,3,7,'2022-11-05 03:03:13'),(8,5,0,1,0,3,1,'2022-11-05 03:04:18'),(9,5,5,2,1,3,3,'2022-11-05 03:04:28'),(10,5,6,3,1,3,2,'2022-11-05 03:04:39'),(11,5,0,4,0,3,7,'2022-11-05 03:04:50'),(12,6,0,1,0,3,1,'2022-11-05 03:07:01'),(13,6,7,2,1,6,15,'2022-11-05 03:07:22'),(14,7,0,1,0,3,3,'2022-11-05 03:09:40'),(15,7,8,3,1,3,2,'2022-11-05 03:09:55'),(16,9,0,1,0,3,1,'2022-11-05 03:12:25'),(17,11,0,1,0,3,1,'2022-11-05 03:14:02'),(18,11,10,2,1,3,3,'2022-11-05 03:14:11'),(19,11,11,3,1,3,2,'2022-11-05 03:14:54'),(20,12,0,1,0,3,1,'2022-11-05 03:16:37'),(21,13,0,1,0,3,1,'2022-11-05 03:18:36'),(22,13,13,2,1,3,3,'2022-11-05 03:18:48'),(23,13,14,3,1,3,2,'2022-11-05 03:19:50'),(24,14,0,1,0,3,1,'2022-11-05 03:22:04'),(25,14,15,2,1,3,3,'2022-11-05 03:22:19'),(26,14,16,3,1,3,2,'2022-11-05 03:22:34'),(27,14,0,4,0,3,7,'2022-11-05 03:22:48'),(28,15,0,1,0,3,3,'2022-11-05 03:24:50'),(29,16,0,1,0,3,3,'2022-11-05 03:25:40'),(30,17,0,1,0,3,1,'2022-11-05 03:28:57');
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
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
  `email_key` varchar(64) NOT NULL,
  `context_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
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
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL),(7,'REVIEWER_REGISTER',0,1,NULL,NULL),(8,'PUBLISH_NOTIFY',0,1,NULL,NULL),(9,'SUBMISSION_ACK',1,1,NULL,65536),(10,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536),(11,'EDITOR_ASSIGN',1,1,16,16),(12,'REVIEW_CANCEL',1,1,16,4096),(13,'REVIEW_REINSTATE',1,1,16,4096),(14,'REVIEW_REQUEST',1,1,16,4096),(15,'REVIEW_REQUEST_ONECLICK',1,1,16,4096),(16,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096),(17,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(18,'REVIEW_REQUEST_ATTACHED',0,1,16,4096),(19,'REVIEW_CONFIRM',1,1,4096,16),(20,'REVIEW_DECLINE',1,1,4096,16),(21,'REVIEW_ACK',1,1,16,4096),(22,'REVIEW_REMIND',0,1,16,4096),(23,'REVIEW_REMIND_AUTO',0,1,NULL,4096),(24,'REVIEW_REMIND_ONECLICK',0,1,16,4096),(25,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(26,'EDITOR_DECISION_ACCEPT',0,1,16,65536),(27,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536),(28,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536),(29,'EDITOR_DECISION_REVISIONS',0,1,16,65536),(30,'EDITOR_DECISION_RESUBMIT',0,1,16,65536),(31,'EDITOR_DECISION_DECLINE',0,1,16,65536),(32,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536),(33,'EDITOR_RECOMMENDATION',0,1,16,16),(34,'COPYEDIT_REQUEST',1,1,16,4097),(35,'LAYOUT_REQUEST',1,1,16,4097),(36,'LAYOUT_COMPLETE',1,1,4097,16),(37,'INDEX_REQUEST',1,1,16,4097),(38,'INDEX_COMPLETE',1,1,4097,16),(39,'EMAIL_LINK',0,1,1048576,NULL),(40,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17),(41,'ANNOUNCEMENT',0,1,16,1048576),(42,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL),(43,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and click on the File that appears in Step 1.<br />\n3. Consult Copyediting Instructions posted on webpage.<br />\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.<br />\n5. Save copyedited file, and upload to Step 1 of Copyediting.<br />\n6. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Series Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','fr_CA','Requête de révision','{$participantName}:<br />\n<br />\nJ\'aimerais que vous entamiez le processus de révision de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez suivre les étapes suivantes.<br />\n<br />\n1. Cliquez sure le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et cliquez sur le fichier qui apparait à l\'étape 1.<br />\n3. Lisez les instructions de révision publiées sur la page Web.<br />\n4. Ouvrez le fichier téléchargé et débutez le processus de révision, tout en ajoutant des questions pour les auteurs, au besoin.<br />\n5. Sauvegardez le fichier révisé et téléchargez-le à l\'étape 1 de Révision.<br />\n6. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}','Ce courriel est envoyé par le rédacteur en chef d\'une série au réviseur de la soumission afin qu\'il entame de processus de révision, lorsque l\'évaluation par les pairs est terminée. Il explique comment accéder à la soumission.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,','This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.'),('EDITOR_ASSIGN','fr_CA','Travail éditorial','{$editorialContactName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$contextName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$editorUsername}<br />\n<br />\nMerci,','Ce courriel indique au rédacteur en chef d\'une série qu\'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_DECLINE','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\nManuscript URL: {$submissionUrl}\n		','This email is send to the author if the editor declines his submission initially, before the review stage'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission sera envoyée à un évaluateur externe.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your manuscript, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nLa révision de votre manuscrit &quot;{$submissionTitle}&quot; est terminée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission passera à l\'étape de production.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EMAIL_LINK','en_US','Manuscript of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$monographUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.'),('EMAIL_LINK','fr_CA','Manuscrit susceptible d\'intéresser','Nous crayons que l\'article intitulé &quot;{$submissionTitle}&quot; par {$authorName} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$contextName} au &quot;{$monographUrl}&quot; pourrait vous intéresser.','Ce modèle de courriel permet à un lecteur inscrit d\'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.'),('INDEX_COMPLETE','en_US','Index Galleys Complete','{$editorialContactName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.'),('INDEX_COMPLETE','fr_CA','Indexage des épreuves en placard complété','{$editorialContactName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par l\'indexateur au rédacteur en chef d\'une série pour lui indiquer que l\'indexage est terminé.'),('INDEX_REQUEST','en_US','Request Index','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$editorialContactSignature}','This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.'),('INDEX_REQUEST','fr_CA','Requête d\'indexage','{$participantName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$contextName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé à l\'indexateur par le rédacteur en chef d\'une série pour lui indiquer qu\'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.'),('LAYOUT_COMPLETE','en_US','Layout Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','fr_CA','Épreuves en placard complétées','{$editorialContactName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d\'une série pour l\'informer que la mise en page du manuscrit est terminée.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Layout Version file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.','This email from the Series Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','fr_CA','Requête des épreuves en placard','{$participantName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.','Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu\'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the press {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.','This email template is used to notify a press manager contact that a manual payment was requested.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvelle notification de {$siteTitle}','Vous avez reçu une nouvelle notification de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs qui ont demandé qu\'on leur envoie ce type de notification par courriel.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message à propos de la presse {$contextName}','Veuillez saisir votre message.','Le message (vierge) par défaut utilisé par le centre d\'alerte.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$username}<br />\nYour new password: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe vous permettant d\'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d\'utilisateur: {$username}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à un utilisateur lorsque son mot de passe a été réinitialisé après avoir suivi les instructions du courriel \"PASSWORD_RESET_CONFIRM\".'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à un utilisateur lorsqu\'il a indiqué avoir oublié son mot de passe ou être incapable d\'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify the press\' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PUBLISH_NOTIFY','en_US','New Book Published','Readers:<br />\n<br />\n{$contextName} has just published its latest book at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Nouveau livre publié','Chers lecteurs,<br />\n<br />\n{$contextName} a récemment publié son dernier livre au {$contextUrl}. Nous vous invitons à consulter la table des matières ici et à consulter notre site Web afin de lire les monographies et les articles qui vous intéressent.<br />\n<br />\nMerci de l\'intérêt que vous portez à nos publications.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé aux lecteurs par le lien d\'avis aux utilisateurs qui se trouve sur la page du rédacteur en chef. Il indique aux lecteurs que l\'on a récemment publié un nouveau livre et les invite à cliquer sur le lien URL de la presse.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','fr_CA','Inscription à titre d\'évaluateur pour la presse {$contextName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$contextName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.'),('REVIEW_ACK','en_US','Manuscript Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Series Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','fr_CA','Accusé de réception pour l\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\n<br />\nMerci d\'avoir terminé l\'évaluation de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Grâce à vous, nous sommes en mesure de publier des articles de qualité.','Ce courriel est envoyé par le rédacteur en chef d\'une série pour confirmer qu\'il a reçu l\'évaluation finale de l\'article et pour le remercier de sa contribution.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','fr_CA','Annulation de la requête d\'évaluation','{$reviewerName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$contextName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.','Ce courriel est envoyé à un évaluateur qui a entamé le processus d\'évaluation d\'une soumission par le rédacteur en chef d\'une série afin d\'informer l\'évaluateur que la procédure d\'évaluation a été annulée.'),('REVIEW_CONFIRM','en_US','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','fr_CA','En mesure d\'évaluer','Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé au rédacteur en chef d\'une série pour répondre à la requête d\'évaluation. Il a pour but de permettre à l\'évaluateur d\'indiquer au rédacteur en chef qu\'il a accepté d\'évaluer l\'article et qu\'il aura terminé son évaluation dans les délais prescrits.'),('REVIEW_DECLINE','en_US','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.'),('REVIEW_DECLINE','fr_CA','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé par l\'évaluateur au rédacteur en chef d\'une série série pour indiquer qu\'il ne sera pas en mesure d\'évaluer l\'article en question.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','fr_CA','Rappel d\'évaluation','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d\'utilisateur: {$reviewerUserName}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','fr_CA','Rappel d\'évaluation','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REQUEST','en_US','Manuscript Review Request','Dear {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','fr_CA','Requête d\'évaluation d\'un manuscrit','Bonjour {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d\'utilisateur: {$reviewerUserName}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$editorialContactSignature}<br />\n','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse. (Sinon, voir REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Manuscript Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this press are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Series Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','fr_CA','Requête d\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; et nous vous serions reconnaissants si vous acceptiez cette tâche importante. Vous trouverez ci-dessous les lignes directrices de cette presse concernant l\'évaluation. Vous trouverez également la soumission en pièce jointe. Votre évaluation de la soumission et vos recommandations devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez répondre à ce courriel d\'ici le {$weekLaterDate} pour confirmer si vous acceptez d\'évaluer cet article.<br />\n<br />\n<br />\nNous vous remercions à l\'avance et espérons que vous accepterez cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nLignes directrices concernant l\'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n','Ce courriel est envoyé par le rédacteur en chef d\'une série à un évaluateur afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient la soumission en pièce jointe. Ce message est utilisé lorsque vous sélectionnez l\'option Processus d\'évaluation par courriel avec pièce jointe à l\'étape 2 de la Configuration de la presse. (Sinon, voir REVIEW_REQUEST.)'),('REVIEW_REQUEST_ONECLICK','en_US','Manuscript Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','fr_CA','Requête d\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; soumis à la presse {$contextName}. Vous trouverez ci-dessous le résumé de l\'article. J\'espère que vous accepterez cette tâche importante du processus de publication.<br />\n<br />\nVeuillez ouvrir une session sur le site Web d\'ici le {$weekLaterDate} pour indiquer si vous acceptez ou refusez d\'évaluer l\'article. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il fournit des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse, et que l\'on a activé l\'option permettant à l\'évaluateur d\'avoir accès à la soumission en un seul clic.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Manuscript Review Request','Dear {$reviewerName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Manuscript Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accusé de réception d\'une soumission','{$authorName}:<br />\n<br />\nMerci d\'avoir envoyé votre manuscrit &quot;{$submissionTitle}&quot; à la presse {$contextName}. Le système de gestion virtuel de la presse que nous utilisons vous permet de suivre les progrès de votre article tout au long du processus de publication. Il suffit d\'ouvrir une session sur le site Web:<br />\n<br />\nURL du manuscrit: {$submissionUrl}<br />\nNom d\'utilisateur: {$authorUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement à l\'auteur lorsqu\'il soumet son manuscrit à la presse. Il fournit des renseignements sur le suivi de la soumission tout au long du processus de publication et remercie l\'auteur d\'avoir envoyé une soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$contextName}. <br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d\'OMP identifiés pendant le processus de soumission.'),('USER_REGISTER','en_US','Press Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription à la presse','{$userFullName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$contextName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d\'utilisateur et son mot de passe pour ses dossiers.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName}<br />\n<br />\nVous avez ouvert un compte chez {$contextName}. Mais avant de pouvoir l\'utiliser, vous devez confirmer votre adresse courriel. Il suffit de cliquer sur le lien ci-dessous.<br />\n<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel utilisateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.');
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2022-11-05 02:57:07',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,19,'2022-11-05 02:57:13',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,19,'2022-11-05 02:57:15',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2022-11-05 02:57:29',268435458,'submission.event.general.metadataUpdated',0),(5,1048585,1,19,'2022-11-05 02:57:30',268435457,'submission.event.submissionSubmitted',0),(6,1048585,1,3,'2022-11-05 02:57:36',805306371,'log.editor.decision',0),(7,1048585,1,3,'2022-11-05 02:57:44',1073741825,'log.review.reviewerAssigned',0),(8,1048585,1,3,'2022-11-05 02:57:46',805306371,'log.editor.decision',0),(9,1048585,1,3,'2022-11-05 02:57:52',268435459,'submission.event.participantAdded',0),(10,1048585,2,20,'2022-11-05 02:58:00',268435458,'submission.event.general.metadataUpdated',0),(11,515,3,20,'2022-11-05 02:58:06',1342177281,'submission.event.fileUploaded',0),(12,1048585,2,20,'2022-11-05 02:58:08',1342177281,'submission.event.fileUploaded',0),(13,515,4,20,'2022-11-05 02:58:14',1342177281,'submission.event.fileUploaded',0),(14,1048585,2,20,'2022-11-05 02:58:17',1342177281,'submission.event.fileUploaded',0),(15,515,5,20,'2022-11-05 02:58:23',1342177281,'submission.event.fileUploaded',0),(16,1048585,2,20,'2022-11-05 02:58:25',1342177281,'submission.event.fileUploaded',0),(17,515,6,20,'2022-11-05 02:58:32',1342177281,'submission.event.fileUploaded',0),(18,1048585,2,20,'2022-11-05 02:58:34',1342177281,'submission.event.fileUploaded',0),(19,1048585,2,20,'2022-11-05 02:59:40',268435458,'submission.event.general.metadataUpdated',0),(20,1048585,2,20,'2022-11-05 02:59:42',268435457,'submission.event.submissionSubmitted',0),(21,1048585,2,3,'2022-11-05 02:59:52',805306371,'log.editor.decision',0),(22,1048585,2,3,'2022-11-05 03:00:03',1073741825,'log.review.reviewerAssigned',0),(23,1048585,2,3,'2022-11-05 03:00:10',1073741825,'log.review.reviewerAssigned',0),(24,1048585,3,21,'2022-11-05 03:00:19',268435458,'submission.event.general.metadataUpdated',0),(25,515,11,21,'2022-11-05 03:00:24',1342177281,'submission.event.fileUploaded',0),(26,1048585,3,21,'2022-11-05 03:00:26',1342177281,'submission.event.fileUploaded',0),(27,1048585,3,21,'2022-11-05 03:00:51',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,3,21,'2022-11-05 03:00:52',268435457,'submission.event.submissionSubmitted',0),(29,1048585,4,22,'2022-11-05 03:00:59',268435458,'submission.event.general.metadataUpdated',0),(30,515,12,22,'2022-11-05 03:01:05',1342177281,'submission.event.fileUploaded',0),(31,1048585,4,22,'2022-11-05 03:01:07',1342177281,'submission.event.fileUploaded',0),(32,515,13,22,'2022-11-05 03:01:13',1342177281,'submission.event.fileUploaded',0),(33,1048585,4,22,'2022-11-05 03:01:16',1342177281,'submission.event.fileUploaded',0),(34,515,14,22,'2022-11-05 03:01:22',1342177281,'submission.event.fileUploaded',0),(35,1048585,4,22,'2022-11-05 03:01:24',1342177281,'submission.event.fileUploaded',0),(36,515,15,22,'2022-11-05 03:01:31',1342177281,'submission.event.fileUploaded',0),(37,1048585,4,22,'2022-11-05 03:01:33',1342177281,'submission.event.fileUploaded',0),(38,1048585,4,22,'2022-11-05 03:02:21',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,4,22,'2022-11-05 03:02:22',268435457,'submission.event.submissionSubmitted',0),(40,1048585,4,3,'2022-11-05 03:02:31',805306371,'log.editor.decision',0),(41,1048585,4,3,'2022-11-05 03:02:42',1073741825,'log.review.reviewerAssigned',0),(42,1048585,4,3,'2022-11-05 03:02:45',805306371,'log.editor.decision',0),(43,1048585,4,3,'2022-11-05 03:02:56',1073741825,'log.review.reviewerAssigned',0),(44,1048585,4,3,'2022-11-05 03:02:59',805306371,'log.editor.decision',0),(45,1048585,4,3,'2022-11-05 03:03:09',268435459,'submission.event.participantAdded',0),(46,1048585,4,3,'2022-11-05 03:03:13',805306371,'log.editor.decision',0),(47,1048585,4,3,'2022-11-05 03:03:23',268435459,'submission.event.participantAdded',0),(48,1048585,5,23,'2022-11-05 03:03:32',268435458,'submission.event.general.metadataUpdated',0),(49,515,20,23,'2022-11-05 03:03:37',1342177281,'submission.event.fileUploaded',0),(50,1048585,5,23,'2022-11-05 03:03:39',1342177281,'submission.event.fileUploaded',0),(51,1048585,5,23,'2022-11-05 03:04:09',268435458,'submission.event.general.metadataUpdated',0),(52,1048585,5,23,'2022-11-05 03:04:10',268435457,'submission.event.submissionSubmitted',0),(53,1048585,5,3,'2022-11-05 03:04:18',805306371,'log.editor.decision',0),(54,1048585,5,3,'2022-11-05 03:04:26',1073741825,'log.review.reviewerAssigned',0),(55,1048585,5,3,'2022-11-05 03:04:28',805306371,'log.editor.decision',0),(56,1048585,5,3,'2022-11-05 03:04:37',1073741825,'log.review.reviewerAssigned',0),(57,1048585,5,3,'2022-11-05 03:04:39',805306371,'log.editor.decision',0),(58,1048585,5,3,'2022-11-05 03:04:47',268435459,'submission.event.participantAdded',0),(59,1048585,5,3,'2022-11-05 03:04:50',805306371,'log.editor.decision',0),(60,1048585,5,3,'2022-11-05 03:04:58',268435459,'submission.event.participantAdded',0),(61,1048585,5,3,'2022-11-05 03:05:03',268435459,'submission.event.participantAdded',0),(62,1048585,5,3,'2022-11-05 03:05:09',268435474,'submission.event.publicationFormatCreated',0),(63,1048585,5,3,'2022-11-05 03:05:14',268435464,'submission.event.publicationFormatPublished',0),(64,1048585,5,3,'2022-11-05 03:05:16',268435476,'submission.event.publicationFormatMadeAvailable',0),(65,515,22,3,'2022-11-05 03:05:18',1342177287,'submission.event.signoffSignoff',0),(66,1048585,5,3,'2022-11-05 03:05:23',268435462,'publication.event.published',0),(67,1048585,6,24,'2022-11-05 03:05:32',268435458,'submission.event.general.metadataUpdated',0),(68,515,23,24,'2022-11-05 03:05:37',1342177281,'submission.event.fileUploaded',0),(69,1048585,6,24,'2022-11-05 03:05:39',1342177281,'submission.event.fileUploaded',0),(70,515,24,24,'2022-11-05 03:05:46',1342177281,'submission.event.fileUploaded',0),(71,1048585,6,24,'2022-11-05 03:05:48',1342177281,'submission.event.fileUploaded',0),(72,515,25,24,'2022-11-05 03:05:54',1342177281,'submission.event.fileUploaded',0),(73,1048585,6,24,'2022-11-05 03:05:57',1342177281,'submission.event.fileUploaded',0),(74,515,26,24,'2022-11-05 03:06:03',1342177281,'submission.event.fileUploaded',0),(75,1048585,6,24,'2022-11-05 03:06:06',1342177281,'submission.event.fileUploaded',0),(76,1048585,6,24,'2022-11-05 03:06:50',268435458,'submission.event.general.metadataUpdated',0),(77,1048585,6,24,'2022-11-05 03:06:52',268435457,'submission.event.submissionSubmitted',0),(78,1048585,6,3,'2022-11-05 03:07:01',805306371,'log.editor.decision',0),(79,1048585,6,3,'2022-11-05 03:07:10',268435459,'submission.event.participantAdded',0),(80,1048585,6,6,'2022-11-05 03:07:22',805306372,'log.editor.recommendation',0),(81,1048585,7,25,'2022-11-05 03:07:41',268435458,'submission.event.general.metadataUpdated',0),(82,515,31,25,'2022-11-05 03:07:46',1342177281,'submission.event.fileUploaded',0),(83,1048585,7,25,'2022-11-05 03:07:49',1342177281,'submission.event.fileUploaded',0),(84,515,32,25,'2022-11-05 03:07:55',1342177281,'submission.event.fileUploaded',0),(85,1048585,7,25,'2022-11-05 03:07:57',1342177281,'submission.event.fileUploaded',0),(86,515,33,25,'2022-11-05 03:08:04',1342177281,'submission.event.fileUploaded',0),(87,1048585,7,25,'2022-11-05 03:08:06',1342177281,'submission.event.fileUploaded',0),(88,515,34,25,'2022-11-05 03:08:13',1342177281,'submission.event.fileUploaded',0),(89,1048585,7,25,'2022-11-05 03:08:15',1342177281,'submission.event.fileUploaded',0),(90,515,35,25,'2022-11-05 03:08:22',1342177281,'submission.event.fileUploaded',0),(91,1048585,7,25,'2022-11-05 03:08:24',1342177281,'submission.event.fileUploaded',0),(92,1048585,7,25,'2022-11-05 03:09:27',268435458,'submission.event.general.metadataUpdated',0),(93,1048585,7,25,'2022-11-05 03:09:29',268435457,'submission.event.submissionSubmitted',0),(94,1048585,7,3,'2022-11-05 03:09:40',805306371,'log.editor.decision',0),(95,1048585,7,3,'2022-11-05 03:09:51',1073741825,'log.review.reviewerAssigned',0),(96,1048585,7,3,'2022-11-05 03:09:55',805306371,'log.editor.decision',0),(97,1048585,7,3,'2022-11-05 03:10:03',268435459,'submission.event.participantAdded',0),(98,1048585,8,3,'2022-11-05 03:10:12',268435458,'submission.event.general.metadataUpdated',0),(99,515,41,3,'2022-11-05 03:10:18',1342177281,'submission.event.fileUploaded',0),(100,1048585,8,3,'2022-11-05 03:10:20',1342177281,'submission.event.fileUploaded',0),(101,1048585,8,3,'2022-11-05 03:10:22',268435458,'submission.event.general.metadataUpdated',0),(102,1048585,8,3,'2022-11-05 03:10:23',268435457,'submission.event.submissionSubmitted',0),(103,1048585,9,26,'2022-11-05 03:10:30',268435458,'submission.event.general.metadataUpdated',0),(104,515,42,26,'2022-11-05 03:10:35',1342177281,'submission.event.fileUploaded',0),(105,1048585,9,26,'2022-11-05 03:10:37',1342177281,'submission.event.fileUploaded',0),(106,515,43,26,'2022-11-05 03:10:44',1342177281,'submission.event.fileUploaded',0),(107,1048585,9,26,'2022-11-05 03:10:46',1342177281,'submission.event.fileUploaded',0),(108,515,44,26,'2022-11-05 03:10:53',1342177281,'submission.event.fileUploaded',0),(109,1048585,9,26,'2022-11-05 03:10:55',1342177281,'submission.event.fileUploaded',0),(110,515,45,26,'2022-11-05 03:11:02',1342177281,'submission.event.fileUploaded',0),(111,1048585,9,26,'2022-11-05 03:11:04',1342177281,'submission.event.fileUploaded',0),(112,515,46,26,'2022-11-05 03:11:11',1342177281,'submission.event.fileUploaded',0),(113,1048585,9,26,'2022-11-05 03:11:13',1342177281,'submission.event.fileUploaded',0),(114,1048585,9,26,'2022-11-05 03:12:13',268435458,'submission.event.general.metadataUpdated',0),(115,1048585,9,26,'2022-11-05 03:12:15',268435457,'submission.event.submissionSubmitted',0),(116,1048585,9,3,'2022-11-05 03:12:25',805306371,'log.editor.decision',0),(117,1048585,10,27,'2022-11-05 03:12:37',268435458,'submission.event.general.metadataUpdated',0),(118,515,47,27,'2022-11-05 03:12:42',1342177281,'submission.event.fileUploaded',0),(119,1048585,10,27,'2022-11-05 03:12:45',1342177281,'submission.event.fileUploaded',0),(120,1048585,10,27,'2022-11-05 03:13:28',268435458,'submission.event.general.metadataUpdated',0),(121,1048585,10,27,'2022-11-05 03:13:29',268435457,'submission.event.submissionSubmitted',0),(122,1048585,11,28,'2022-11-05 03:13:36',268435458,'submission.event.general.metadataUpdated',0),(123,515,48,28,'2022-11-05 03:13:42',1342177281,'submission.event.fileUploaded',0),(124,1048585,11,28,'2022-11-05 03:13:44',1342177281,'submission.event.fileUploaded',0),(125,1048585,11,28,'2022-11-05 03:13:54',268435458,'submission.event.general.metadataUpdated',0),(126,1048585,11,28,'2022-11-05 03:13:55',268435457,'submission.event.submissionSubmitted',0),(127,1048585,11,3,'2022-11-05 03:14:02',805306371,'log.editor.decision',0),(128,1048585,11,3,'2022-11-05 03:14:09',1073741825,'log.review.reviewerAssigned',0),(129,1048585,11,3,'2022-11-05 03:14:11',805306371,'log.editor.decision',0),(130,1048585,11,3,'2022-11-05 03:14:19',1073741825,'log.review.reviewerAssigned',0),(131,1048585,11,3,'2022-11-05 03:14:25',1073741825,'log.review.reviewerAssigned',0),(132,1048585,11,10,'2022-11-05 03:14:30',1073741830,'log.review.reviewAccepted',0),(133,1048585,11,10,'2022-11-05 03:14:33',1073741848,'log.review.reviewReady',0),(134,1048585,11,12,'2022-11-05 03:14:39',1073741830,'log.review.reviewAccepted',0),(135,1048585,11,12,'2022-11-05 03:14:43',1073741848,'log.review.reviewReady',0),(136,1048585,11,3,'2022-11-05 03:14:54',805306371,'log.editor.decision',0),(137,1048585,12,29,'2022-11-05 03:15:05',268435458,'submission.event.general.metadataUpdated',0),(138,515,50,29,'2022-11-05 03:15:10',1342177281,'submission.event.fileUploaded',0),(139,1048585,12,29,'2022-11-05 03:15:13',1342177281,'submission.event.fileUploaded',0),(140,515,51,29,'2022-11-05 03:15:19',1342177281,'submission.event.fileUploaded',0),(141,1048585,12,29,'2022-11-05 03:15:21',1342177281,'submission.event.fileUploaded',0),(142,515,52,29,'2022-11-05 03:15:28',1342177281,'submission.event.fileUploaded',0),(143,1048585,12,29,'2022-11-05 03:15:30',1342177281,'submission.event.fileUploaded',0),(144,1048585,12,29,'2022-11-05 03:16:24',268435458,'submission.event.general.metadataUpdated',0),(145,1048585,12,29,'2022-11-05 03:16:26',268435457,'submission.event.submissionSubmitted',0),(146,1048585,12,3,'2022-11-05 03:16:37',805306371,'log.editor.decision',0),(147,1048585,12,3,'2022-11-05 03:16:48',1073741825,'log.review.reviewerAssigned',0),(148,1048585,12,3,'2022-11-05 03:16:55',1073741825,'log.review.reviewerAssigned',0),(149,1048585,12,3,'2022-11-05 03:17:02',1073741825,'log.review.reviewerAssigned',0),(150,1048585,12,8,'2022-11-05 03:17:09',1073741830,'log.review.reviewAccepted',0),(151,1048585,12,8,'2022-11-05 03:17:14',1073741848,'log.review.reviewReady',0),(152,1048585,13,30,'2022-11-05 03:17:23',268435458,'submission.event.general.metadataUpdated',0),(153,515,56,30,'2022-11-05 03:17:28',1342177281,'submission.event.fileUploaded',0),(154,1048585,13,30,'2022-11-05 03:17:31',1342177281,'submission.event.fileUploaded',0),(155,515,57,30,'2022-11-05 03:17:37',1342177281,'submission.event.fileUploaded',0),(156,1048585,13,30,'2022-11-05 03:17:39',1342177281,'submission.event.fileUploaded',0),(157,515,58,30,'2022-11-05 03:17:46',1342177281,'submission.event.fileUploaded',0),(158,1048585,13,30,'2022-11-05 03:17:48',1342177281,'submission.event.fileUploaded',0),(159,1048585,13,30,'2022-11-05 03:18:24',268435458,'submission.event.general.metadataUpdated',0),(160,1048585,13,30,'2022-11-05 03:18:26',268435457,'submission.event.submissionSubmitted',0),(161,1048585,13,3,'2022-11-05 03:18:36',805306371,'log.editor.decision',0),(162,1048585,13,3,'2022-11-05 03:18:45',1073741825,'log.review.reviewerAssigned',0),(163,1048585,13,3,'2022-11-05 03:18:48',805306371,'log.editor.decision',0),(164,1048585,13,3,'2022-11-05 03:18:58',1073741825,'log.review.reviewerAssigned',0),(165,1048585,13,3,'2022-11-05 03:19:05',1073741825,'log.review.reviewerAssigned',0),(166,1048585,13,3,'2022-11-05 03:19:11',1073741825,'log.review.reviewerAssigned',0),(167,1048585,13,10,'2022-11-05 03:19:18',1073741830,'log.review.reviewAccepted',0),(168,1048585,13,10,'2022-11-05 03:19:23',1073741848,'log.review.reviewReady',0),(169,1048585,13,12,'2022-11-05 03:19:31',1073741830,'log.review.reviewAccepted',0),(170,1048585,13,12,'2022-11-05 03:19:36',1073741848,'log.review.reviewReady',0),(171,1048585,13,3,'2022-11-05 03:19:50',805306371,'log.editor.decision',0),(172,1048585,14,31,'2022-11-05 03:20:04',268435458,'submission.event.general.metadataUpdated',0),(173,515,62,31,'2022-11-05 03:20:09',1342177281,'submission.event.fileUploaded',0),(174,1048585,14,31,'2022-11-05 03:20:11',1342177281,'submission.event.fileUploaded',0),(175,515,63,31,'2022-11-05 03:20:18',1342177281,'submission.event.fileUploaded',0),(176,1048585,14,31,'2022-11-05 03:20:20',1342177281,'submission.event.fileUploaded',0),(177,515,64,31,'2022-11-05 03:20:27',1342177281,'submission.event.fileUploaded',0),(178,1048585,14,31,'2022-11-05 03:20:29',1342177281,'submission.event.fileUploaded',0),(179,515,65,31,'2022-11-05 03:20:36',1342177281,'submission.event.fileUploaded',0),(180,1048585,14,31,'2022-11-05 03:20:38',1342177281,'submission.event.fileUploaded',0),(181,515,66,31,'2022-11-05 03:20:45',1342177281,'submission.event.fileUploaded',0),(182,1048585,14,31,'2022-11-05 03:20:49',1342177281,'submission.event.fileUploaded',0),(183,515,67,31,'2022-11-05 03:20:56',1342177281,'submission.event.fileUploaded',0),(184,1048585,14,31,'2022-11-05 03:21:06',1342177281,'submission.event.fileUploaded',0),(185,1048585,14,31,'2022-11-05 03:21:52',268435458,'submission.event.general.metadataUpdated',0),(186,1048585,14,31,'2022-11-05 03:21:54',268435457,'submission.event.submissionSubmitted',0),(187,1048585,14,3,'2022-11-05 03:22:04',805306371,'log.editor.decision',0),(188,1048585,14,3,'2022-11-05 03:22:16',1073741825,'log.review.reviewerAssigned',0),(189,1048585,14,3,'2022-11-05 03:22:19',805306371,'log.editor.decision',0),(190,1048585,14,3,'2022-11-05 03:22:30',1073741825,'log.review.reviewerAssigned',0),(191,1048585,14,3,'2022-11-05 03:22:34',805306371,'log.editor.decision',0),(192,1048585,14,3,'2022-11-05 03:22:43',268435459,'submission.event.participantAdded',0),(193,1048585,14,3,'2022-11-05 03:22:48',805306371,'log.editor.decision',0),(194,1048585,14,3,'2022-11-05 03:22:58',268435459,'submission.event.participantAdded',0),(195,1048585,14,3,'2022-11-05 03:23:05',268435459,'submission.event.participantAdded',0),(196,1048585,14,3,'2022-11-05 03:23:12',268435474,'submission.event.publicationFormatCreated',0),(197,1048585,14,3,'2022-11-05 03:23:23',268435464,'submission.event.publicationFormatPublished',0),(198,1048585,14,3,'2022-11-05 03:23:26',268435476,'submission.event.publicationFormatMadeAvailable',0),(199,515,74,3,'2022-11-05 03:23:29',1342177287,'submission.event.signoffSignoff',0),(200,515,75,3,'2022-11-05 03:23:36',1342177287,'submission.event.signoffSignoff',0),(201,515,76,3,'2022-11-05 03:23:42',1342177287,'submission.event.signoffSignoff',0),(202,515,77,3,'2022-11-05 03:23:49',1342177287,'submission.event.signoffSignoff',0),(203,515,78,3,'2022-11-05 03:23:56',1342177287,'submission.event.signoffSignoff',0),(204,515,79,3,'2022-11-05 03:24:03',1342177287,'submission.event.signoffSignoff',0),(205,1048585,14,3,'2022-11-05 03:24:10',268435462,'publication.event.published',0),(206,1048585,15,32,'2022-11-05 03:24:18',268435458,'submission.event.general.metadataUpdated',0),(207,515,80,32,'2022-11-05 03:24:24',1342177281,'submission.event.fileUploaded',0),(208,1048585,15,32,'2022-11-05 03:24:26',1342177281,'submission.event.fileUploaded',0),(209,1048585,15,32,'2022-11-05 03:24:41',268435458,'submission.event.general.metadataUpdated',0),(210,1048585,15,32,'2022-11-05 03:24:42',268435457,'submission.event.submissionSubmitted',0),(211,1048585,15,3,'2022-11-05 03:24:50',805306371,'log.editor.decision',0),(212,1048585,16,33,'2022-11-05 03:25:00',268435458,'submission.event.general.metadataUpdated',0),(213,515,82,33,'2022-11-05 03:25:05',1342177281,'submission.event.fileUploaded',0),(214,1048585,16,33,'2022-11-05 03:25:08',1342177281,'submission.event.fileUploaded',0),(215,1048585,16,33,'2022-11-05 03:25:30',268435458,'submission.event.general.metadataUpdated',0),(216,1048585,16,33,'2022-11-05 03:25:31',268435457,'submission.event.submissionSubmitted',0),(217,1048585,16,3,'2022-11-05 03:25:40',805306371,'log.editor.decision',0),(218,1048585,16,3,'2022-11-05 03:25:48',1073741825,'log.review.reviewerAssigned',0),(219,1048585,16,3,'2022-11-05 03:25:53',1073741825,'log.review.reviewerAssigned',0),(220,1048585,16,3,'2022-11-05 03:25:58',1073741825,'log.review.reviewerAssigned',0),(221,1048585,16,10,'2022-11-05 03:26:04',1073741830,'log.review.reviewAccepted',0),(222,1048585,16,10,'2022-11-05 03:26:08',1073741848,'log.review.reviewReady',0),(223,1048585,17,34,'2022-11-05 03:26:16',268435458,'submission.event.general.metadataUpdated',0),(224,515,84,34,'2022-11-05 03:26:21',1342177281,'submission.event.fileUploaded',0),(225,1048585,17,34,'2022-11-05 03:26:24',1342177281,'submission.event.fileUploaded',0),(226,515,85,34,'2022-11-05 03:26:30',1342177281,'submission.event.fileUploaded',0),(227,1048585,17,34,'2022-11-05 03:26:32',1342177281,'submission.event.fileUploaded',0),(228,515,86,34,'2022-11-05 03:26:39',1342177281,'submission.event.fileUploaded',0),(229,1048585,17,34,'2022-11-05 03:26:41',1342177281,'submission.event.fileUploaded',0),(230,515,87,34,'2022-11-05 03:26:48',1342177281,'submission.event.fileUploaded',0),(231,1048585,17,34,'2022-11-05 03:26:50',1342177281,'submission.event.fileUploaded',0),(232,515,88,34,'2022-11-05 03:26:57',1342177281,'submission.event.fileUploaded',0),(233,1048585,17,34,'2022-11-05 03:26:59',1342177281,'submission.event.fileUploaded',0),(234,515,89,34,'2022-11-05 03:27:06',1342177281,'submission.event.fileUploaded',0),(235,1048585,17,34,'2022-11-05 03:27:08',1342177281,'submission.event.fileUploaded',0),(236,1048585,17,34,'2022-11-05 03:28:41',268435458,'submission.event.general.metadataUpdated',0),(237,1048585,17,34,'2022-11-05 03:28:43',268435457,'submission.event.submissionSubmitted',0),(238,1048585,17,3,'2022-11-05 03:28:57',805306371,'log.editor.decision',0),(239,1048585,17,3,'2022-11-05 03:29:10',1073741825,'log.review.reviewerAssigned',0),(240,1048585,17,3,'2022-11-05 03:29:18',1073741825,'log.review.reviewerAssigned',0);
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileRevision','1','int'),(2,'fileStage','2','int'),(2,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'revisedFileId',NULL,'string'),(2,'submissionId','1','int'),(2,'username','aclark','string'),(3,'fileId','1','int'),(3,'fileRevision','1','int'),(3,'fileStage','2','int'),(3,'name','aclark, The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(6,'decision','Send to External Review','string'),(6,'editorName','Daniel Barnes','string'),(6,'submissionId','1','int'),(7,'reviewAssignmentId','1','int'),(7,'reviewerName','Gonzalo Favio','string'),(7,'round','1','int'),(7,'stageId','3','int'),(7,'submissionId','1','int'),(8,'decision','Accept Submission','string'),(8,'editorName','Daniel Barnes','string'),(8,'submissionId','1','int'),(9,'name','Sarah Vogt','string'),(9,'userGroupName','Copyeditor','string'),(9,'username','svogt','string'),(11,'fileId','3','int'),(11,'fileRevision','1','int'),(11,'fileStage','2','int'),(11,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(11,'revisedFileId',NULL,'string'),(11,'submissionId','2','int'),(11,'username','afinkel','string'),(12,'fileId','3','int'),(12,'fileRevision','1','int'),(12,'fileStage','2','int'),(12,'name','afinkel, Critical History in Western Canada 1900–.pdf','string'),(12,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(12,'submissionId','2','int'),(12,'username','afinkel','string'),(13,'fileId','4','int'),(13,'fileRevision','1','int'),(13,'fileStage','2','int'),(13,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(13,'revisedFileId',NULL,'string'),(13,'submissionId','2','int'),(13,'username','afinkel','string'),(14,'fileId','4','int'),(14,'fileRevision','1','int'),(14,'fileStage','2','int'),(14,'name','afinkel, Vernacular Currents in Western Canadian .pdf','string'),(14,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(14,'submissionId','2','int'),(14,'username','afinkel','string'),(15,'fileId','5','int'),(15,'fileRevision','1','int'),(15,'fileStage','2','int'),(15,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(15,'revisedFileId',NULL,'string'),(15,'submissionId','2','int'),(15,'username','afinkel','string'),(16,'fileId','5','int'),(16,'fileRevision','1','int'),(16,'fileStage','2','int'),(16,'name','afinkel, Cree Intellectual Traditions in History.pdf','string'),(16,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(16,'submissionId','2','int'),(16,'username','afinkel','string'),(17,'fileId','6','int'),(17,'fileRevision','1','int'),(17,'fileStage','2','int'),(17,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(17,'revisedFileId',NULL,'string'),(17,'submissionId','2','int'),(17,'username','afinkel','string'),(18,'fileId','6','int'),(18,'fileRevision','1','int'),(18,'fileStage','2','int'),(18,'name','afinkel, Visualizing Space, Race, and History in .pdf','string'),(18,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(18,'submissionId','2','int'),(18,'username','afinkel','string'),(21,'decision','Send to External Review','string'),(21,'editorName','Daniel Barnes','string'),(21,'submissionId','2','int'),(22,'reviewAssignmentId','2','int'),(22,'reviewerName','Al Zacharia','string'),(22,'round','1','int'),(22,'stageId','3','int'),(22,'submissionId','2','int'),(23,'reviewAssignmentId','3','int'),(23,'reviewerName','Gonzalo Favio','string'),(23,'round','1','int'),(23,'stageId','3','int'),(23,'submissionId','2','int'),(25,'fileId','11','int'),(25,'fileRevision','1','int'),(25,'fileStage','2','int'),(25,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(25,'revisedFileId',NULL,'string'),(25,'submissionId','3','int'),(25,'username','bbarnetson','string'),(26,'fileId','11','int'),(26,'fileRevision','1','int'),(26,'fileStage','2','int'),(26,'name','bbarnetson, The Political Economy of Workplace Injury in Canada.pdf','string'),(26,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(26,'submissionId','3','int'),(26,'username','bbarnetson','string'),(30,'fileId','12','int'),(30,'fileRevision','1','int'),(30,'fileStage','2','int'),(30,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(30,'revisedFileId',NULL,'string'),(30,'submissionId','4','int'),(30,'username','bbeaty','string'),(31,'fileId','12','int'),(31,'fileRevision','1','int'),(31,'fileStage','2','int'),(31,'name','bbeaty, Introduction: Contexts of Popular Cultur.pdf','string'),(31,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(31,'submissionId','4','int'),(31,'username','bbeaty','string'),(32,'fileId','13','int'),(32,'fileRevision','1','int'),(32,'fileStage','2','int'),(32,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(32,'revisedFileId',NULL,'string'),(32,'submissionId','4','int'),(32,'username','bbeaty','string'),(33,'fileId','13','int'),(33,'fileRevision','1','int'),(33,'fileStage','2','int'),(33,'name','bbeaty, Chapter 1. A Future for Media Studies: C.pdf','string'),(33,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(33,'submissionId','4','int'),(33,'username','bbeaty','string'),(34,'fileId','14','int'),(34,'fileRevision','1','int'),(34,'fileStage','2','int'),(34,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(34,'revisedFileId',NULL,'string'),(34,'submissionId','4','int'),(34,'username','bbeaty','string'),(35,'fileId','14','int'),(35,'fileRevision','1','int'),(35,'fileStage','2','int'),(35,'name','bbeaty, Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(35,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(35,'submissionId','4','int'),(35,'username','bbeaty','string'),(36,'fileId','15','int'),(36,'fileRevision','1','int'),(36,'fileStage','2','int'),(36,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(36,'revisedFileId',NULL,'string'),(36,'submissionId','4','int'),(36,'username','bbeaty','string'),(37,'fileId','15','int'),(37,'fileRevision','1','int'),(37,'fileStage','2','int'),(37,'name','bbeaty, Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(37,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(37,'submissionId','4','int'),(37,'username','bbeaty','string'),(40,'decision','Send to Internal Review','string'),(40,'editorName','Daniel Barnes','string'),(40,'submissionId','4','int'),(41,'reviewAssignmentId','4','int'),(41,'reviewerName','Aisla McCrae','string'),(41,'round','1','int'),(41,'stageId','2','int'),(41,'submissionId','4','int'),(42,'decision','Send to External Review','string'),(42,'editorName','Daniel Barnes','string'),(42,'submissionId','4','int'),(43,'reviewAssignmentId','5','int'),(43,'reviewerName','Al Zacharia','string'),(43,'round','1','int'),(43,'stageId','3','int'),(43,'submissionId','4','int'),(44,'decision','Accept Submission','string'),(44,'editorName','Daniel Barnes','string'),(44,'submissionId','4','int'),(45,'name','Maria Fritz','string'),(45,'userGroupName','Copyeditor','string'),(45,'username','mfritz','string'),(46,'decision','Send To Production','string'),(46,'editorName','Daniel Barnes','string'),(46,'submissionId','4','int'),(47,'name','Graham Cox','string'),(47,'userGroupName','Layout Editor','string'),(47,'username','gcox','string'),(49,'fileId','20','int'),(49,'fileRevision','1','int'),(49,'fileStage','2','int'),(49,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(49,'revisedFileId',NULL,'string'),(49,'submissionId','5','int'),(49,'username','callan','string'),(50,'fileId','20','int'),(50,'fileRevision','1','int'),(50,'fileStage','2','int'),(50,'name','callan, Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(50,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(50,'submissionId','5','int'),(50,'username','callan','string'),(53,'decision','Send to Internal Review','string'),(53,'editorName','Daniel Barnes','string'),(53,'submissionId','5','int'),(54,'reviewAssignmentId','6','int'),(54,'reviewerName','Paul Hudson','string'),(54,'round','1','int'),(54,'stageId','2','int'),(54,'submissionId','5','int'),(55,'decision','Send to External Review','string'),(55,'editorName','Daniel Barnes','string'),(55,'submissionId','5','int'),(56,'reviewAssignmentId','7','int'),(56,'reviewerName','Gonzalo Favio','string'),(56,'round','1','int'),(56,'stageId','3','int'),(56,'submissionId','5','int'),(57,'decision','Accept Submission','string'),(57,'editorName','Daniel Barnes','string'),(57,'submissionId','5','int'),(58,'name','Sarah Vogt','string'),(58,'userGroupName','Copyeditor','string'),(58,'username','svogt','string'),(59,'decision','Send To Production','string'),(59,'editorName','Daniel Barnes','string'),(59,'submissionId','5','int'),(60,'name','Stephen Hellier','string'),(60,'userGroupName','Layout Editor','string'),(60,'username','shellier','string'),(61,'name','Catherine Turner','string'),(61,'userGroupName','Proofreader','string'),(61,'username','cturner','string'),(62,'formatName','PDF','string'),(63,'publicationFormatName','PDF','string'),(64,'publicationFormatName','PDF','string'),(65,'file','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(65,'name','Daniel Barnes','string'),(65,'username','dbarnes','string'),(68,'fileId','23','int'),(68,'fileRevision','1','int'),(68,'fileStage','2','int'),(68,'originalFileName','Identify: Understanding Your Information.pdf','string'),(68,'revisedFileId',NULL,'string'),(68,'submissionId','6','int'),(68,'username','dbernnard','string'),(69,'fileId','23','int'),(69,'fileRevision','1','int'),(69,'fileStage','2','int'),(69,'name','dbernnard, Identify: Understanding Your Information.pdf','string'),(69,'originalFileName','Identify: Understanding Your Information.pdf','string'),(69,'submissionId','6','int'),(69,'username','dbernnard','string'),(70,'fileId','24','int'),(70,'fileRevision','1','int'),(70,'fileStage','2','int'),(70,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(70,'revisedFileId',NULL,'string'),(70,'submissionId','6','int'),(70,'username','dbernnard','string'),(71,'fileId','24','int'),(71,'fileRevision','1','int'),(71,'fileStage','2','int'),(71,'name','dbernnard, Scope: Knowing What Is Available.pdf','string'),(71,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(71,'submissionId','6','int'),(71,'username','dbernnard','string'),(72,'fileId','25','int'),(72,'fileRevision','1','int'),(72,'fileStage','2','int'),(72,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(72,'revisedFileId',NULL,'string'),(72,'submissionId','6','int'),(72,'username','dbernnard','string'),(73,'fileId','25','int'),(73,'fileRevision','1','int'),(73,'fileStage','2','int'),(73,'name','dbernnard, Plan: Developing Research Strategies.pdf','string'),(73,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(73,'submissionId','6','int'),(73,'username','dbernnard','string'),(74,'fileId','26','int'),(74,'fileRevision','1','int'),(74,'fileStage','2','int'),(74,'originalFileName','Gather: Finding What You Need.pdf','string'),(74,'revisedFileId',NULL,'string'),(74,'submissionId','6','int'),(74,'username','dbernnard','string'),(75,'fileId','26','int'),(75,'fileRevision','1','int'),(75,'fileStage','2','int'),(75,'name','dbernnard, Gather: Finding What You Need.pdf','string'),(75,'originalFileName','Gather: Finding What You Need.pdf','string'),(75,'submissionId','6','int'),(75,'username','dbernnard','string'),(78,'decision','Send to Internal Review','string'),(78,'editorName','Daniel Barnes','string'),(78,'submissionId','6','int'),(79,'name','Minoti Inoue','string'),(79,'userGroupName','Series editor','string'),(79,'username','minoue','string'),(80,'decision','Send to External Review','string'),(80,'editorName','Minoti Inoue','string'),(80,'submissionId','6','int'),(82,'fileId','31','int'),(82,'fileRevision','1','int'),(82,'fileStage','2','int'),(82,'originalFileName','Introduction.pdf','string'),(82,'revisedFileId',NULL,'string'),(82,'submissionId','7','int'),(82,'username','dkennepohl','string'),(83,'fileId','31','int'),(83,'fileRevision','1','int'),(83,'fileStage','2','int'),(83,'name','dkennepohl, Introduction.pdf','string'),(83,'originalFileName','Introduction.pdf','string'),(83,'submissionId','7','int'),(83,'username','dkennepohl','string'),(84,'fileId','32','int'),(84,'fileRevision','1','int'),(84,'fileStage','2','int'),(84,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(84,'revisedFileId',NULL,'string'),(84,'submissionId','7','int'),(84,'username','dkennepohl','string'),(85,'fileId','32','int'),(85,'fileRevision','1','int'),(85,'fileStage','2','int'),(85,'name','dkennepohl, Chapter 1: Interactions Affording Distan.pdf','string'),(85,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(85,'submissionId','7','int'),(85,'username','dkennepohl','string'),(86,'fileId','33','int'),(86,'fileRevision','1','int'),(86,'fileStage','2','int'),(86,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(86,'revisedFileId',NULL,'string'),(86,'submissionId','7','int'),(86,'username','dkennepohl','string'),(87,'fileId','33','int'),(87,'fileRevision','1','int'),(87,'fileStage','2','int'),(87,'name','dkennepohl, Chapter 2: Learning Science at a Distanc.pdf','string'),(87,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(87,'submissionId','7','int'),(87,'username','dkennepohl','string'),(88,'fileId','34','int'),(88,'fileRevision','1','int'),(88,'fileStage','2','int'),(88,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(88,'revisedFileId',NULL,'string'),(88,'submissionId','7','int'),(88,'username','dkennepohl','string'),(89,'fileId','34','int'),(89,'fileRevision','1','int'),(89,'fileStage','2','int'),(89,'name','dkennepohl, Chapter 3: Leadership Strategies for Coo.pdf','string'),(89,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(89,'submissionId','7','int'),(89,'username','dkennepohl','string'),(90,'fileId','35','int'),(90,'fileRevision','1','int'),(90,'fileStage','2','int'),(90,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(90,'revisedFileId',NULL,'string'),(90,'submissionId','7','int'),(90,'username','dkennepohl','string'),(91,'fileId','35','int'),(91,'fileRevision','1','int'),(91,'fileStage','2','int'),(91,'name','dkennepohl, Chapter 4: Toward New Models of Flexible.pdf','string'),(91,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(91,'submissionId','7','int'),(91,'username','dkennepohl','string'),(94,'decision','Send to External Review','string'),(94,'editorName','Daniel Barnes','string'),(94,'submissionId','7','int'),(95,'reviewAssignmentId','8','int'),(95,'reviewerName','Adela Gallego','string'),(95,'round','1','int'),(95,'stageId','3','int'),(95,'submissionId','7','int'),(96,'decision','Accept Submission','string'),(96,'editorName','Daniel Barnes','string'),(96,'submissionId','7','int'),(97,'name','Maria Fritz','string'),(97,'userGroupName','Copyeditor','string'),(97,'username','mfritz','string'),(99,'fileId','41','int'),(99,'fileRevision','1','int'),(99,'fileStage','2','int'),(99,'originalFileName','Editorial.pdf','string'),(99,'revisedFileId',NULL,'string'),(99,'submissionId','8','int'),(99,'username','dbarnes','string'),(100,'fileId','41','int'),(100,'fileRevision','1','int'),(100,'fileStage','2','int'),(100,'name','dbarnes, Editorial.pdf','string'),(100,'originalFileName','Editorial.pdf','string'),(100,'submissionId','8','int'),(100,'username','dbarnes','string'),(104,'fileId','42','int'),(104,'fileRevision','1','int'),(104,'fileStage','2','int'),(104,'originalFileName','Internet, openness and the future of the.pdf','string'),(104,'revisedFileId',NULL,'string'),(104,'submissionId','9','int'),(104,'username','fperini','string'),(105,'fileId','42','int'),(105,'fileRevision','1','int'),(105,'fileStage','2','int'),(105,'name','fperini, Internet, openness and the future of the.pdf','string'),(105,'originalFileName','Internet, openness and the future of the.pdf','string'),(105,'submissionId','9','int'),(105,'username','fperini','string'),(106,'fileId','43','int'),(106,'fileRevision','1','int'),(106,'fileStage','2','int'),(106,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(106,'revisedFileId',NULL,'string'),(106,'submissionId','9','int'),(106,'username','fperini','string'),(107,'fileId','43','int'),(107,'fileRevision','1','int'),(107,'fileStage','2','int'),(107,'name','fperini, Imagining the Internet: Open, closed or .pdf','string'),(107,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(107,'submissionId','9','int'),(107,'username','fperini','string'),(108,'fileId','44','int'),(108,'fileRevision','1','int'),(108,'fileStage','2','int'),(108,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(108,'revisedFileId',NULL,'string'),(108,'submissionId','9','int'),(108,'username','fperini','string'),(109,'fileId','44','int'),(109,'fileRevision','1','int'),(109,'fileStage','2','int'),(109,'name','fperini, The internet in LAC will remain free, pu.pdf','string'),(109,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(109,'submissionId','9','int'),(109,'username','fperini','string'),(110,'fileId','45','int'),(110,'fileRevision','1','int'),(110,'fileStage','2','int'),(110,'originalFileName','Free Internet?.pdf','string'),(110,'revisedFileId',NULL,'string'),(110,'submissionId','9','int'),(110,'username','fperini','string'),(111,'fileId','45','int'),(111,'fileRevision','1','int'),(111,'fileStage','2','int'),(111,'name','fperini, Free Internet?.pdf','string'),(111,'originalFileName','Free Internet?.pdf','string'),(111,'submissionId','9','int'),(111,'username','fperini','string'),(112,'fileId','46','int'),(112,'fileRevision','1','int'),(112,'fileStage','2','int'),(112,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(112,'revisedFileId',NULL,'string'),(112,'submissionId','9','int'),(112,'username','fperini','string'),(113,'fileId','46','int'),(113,'fileRevision','1','int'),(113,'fileStage','2','int'),(113,'name','fperini, Risks and challenges for freedom of expr.pdf','string'),(113,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(113,'submissionId','9','int'),(113,'username','fperini','string'),(116,'decision','Send to Internal Review','string'),(116,'editorName','Daniel Barnes','string'),(116,'submissionId','9','int'),(118,'fileId','47','int'),(118,'fileRevision','1','int'),(118,'fileStage','2','int'),(118,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(118,'revisedFileId',NULL,'string'),(118,'submissionId','10','int'),(118,'username','jbrower','string'),(119,'fileId','47','int'),(119,'fileRevision','1','int'),(119,'fileStage','2','int'),(119,'name','jbrower, Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(119,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(119,'submissionId','10','int'),(119,'username','jbrower','string'),(123,'fileId','48','int'),(123,'fileRevision','1','int'),(123,'fileStage','2','int'),(123,'originalFileName','Dreamwork.pdf','string'),(123,'revisedFileId',NULL,'string'),(123,'submissionId','11','int'),(123,'username','jlockehart','string'),(124,'fileId','48','int'),(124,'fileRevision','1','int'),(124,'fileStage','2','int'),(124,'name','jlockehart, Dreamwork.pdf','string'),(124,'originalFileName','Dreamwork.pdf','string'),(124,'submissionId','11','int'),(124,'username','jlockehart','string'),(127,'decision','Send to Internal Review','string'),(127,'editorName','Daniel Barnes','string'),(127,'submissionId','11','int'),(128,'reviewAssignmentId','9','int'),(128,'reviewerName','Aisla McCrae','string'),(128,'round','1','int'),(128,'stageId','2','int'),(128,'submissionId','11','int'),(129,'decision','Send to External Review','string'),(129,'editorName','Daniel Barnes','string'),(129,'submissionId','11','int'),(130,'reviewAssignmentId','10','int'),(130,'reviewerName','Adela Gallego','string'),(130,'round','1','int'),(130,'stageId','3','int'),(130,'submissionId','11','int'),(131,'reviewAssignmentId','11','int'),(131,'reviewerName','Gonzalo Favio','string'),(131,'round','1','int'),(131,'stageId','3','int'),(131,'submissionId','11','int'),(132,'reviewAssignmentId','10','int'),(132,'reviewerName','Adela Gallego','string'),(132,'round','1','int'),(132,'submissionId','11','int'),(133,'reviewAssignmentId','10','int'),(133,'reviewerName','Adela Gallego','string'),(133,'round','1','int'),(133,'submissionId','11','int'),(134,'reviewAssignmentId','11','int'),(134,'reviewerName','Gonzalo Favio','string'),(134,'round','1','int'),(134,'submissionId','11','int'),(135,'reviewAssignmentId','11','int'),(135,'reviewerName','Gonzalo Favio','string'),(135,'round','1','int'),(135,'submissionId','11','int'),(136,'decision','Accept Submission','string'),(136,'editorName','Daniel Barnes','string'),(136,'submissionId','11','int'),(138,'fileId','50','int'),(138,'fileRevision','1','int'),(138,'fileStage','2','int'),(138,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(138,'revisedFileId',NULL,'string'),(138,'submissionId','12','int'),(138,'username','lelder','string'),(139,'fileId','50','int'),(139,'fileRevision','1','int'),(139,'fileStage','2','int'),(139,'name','lelder, Catalyzing Access through Social and Tec.pdf','string'),(139,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(139,'submissionId','12','int'),(139,'username','lelder','string'),(140,'fileId','51','int'),(140,'fileRevision','1','int'),(140,'fileStage','2','int'),(140,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(140,'revisedFileId',NULL,'string'),(140,'submissionId','12','int'),(140,'username','lelder','string'),(141,'fileId','51','int'),(141,'fileRevision','1','int'),(141,'fileStage','2','int'),(141,'name','lelder, Catalyzing Access via Telecommunications.pdf','string'),(141,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(141,'submissionId','12','int'),(141,'username','lelder','string'),(142,'fileId','52','int'),(142,'fileRevision','1','int'),(142,'fileStage','2','int'),(142,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(142,'revisedFileId',NULL,'string'),(142,'submissionId','12','int'),(142,'username','lelder','string'),(143,'fileId','52','int'),(143,'fileRevision','1','int'),(143,'fileStage','2','int'),(143,'name','lelder, Access to Knowledge as a New Paradigm fo.pdf','string'),(143,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(143,'submissionId','12','int'),(143,'username','lelder','string'),(146,'decision','Send to Internal Review','string'),(146,'editorName','Daniel Barnes','string'),(146,'submissionId','12','int'),(147,'reviewAssignmentId','12','int'),(147,'reviewerName','Julie Janssen','string'),(147,'round','1','int'),(147,'stageId','2','int'),(147,'submissionId','12','int'),(148,'reviewAssignmentId','13','int'),(148,'reviewerName','Paul Hudson','string'),(148,'round','1','int'),(148,'stageId','2','int'),(148,'submissionId','12','int'),(149,'reviewAssignmentId','14','int'),(149,'reviewerName','Aisla McCrae','string'),(149,'round','1','int'),(149,'stageId','2','int'),(149,'submissionId','12','int'),(150,'reviewAssignmentId','13','int'),(150,'reviewerName','Paul Hudson','string'),(150,'round','1','int'),(150,'submissionId','12','int'),(151,'reviewAssignmentId','13','int'),(151,'reviewerName','Paul Hudson','string'),(151,'round','1','int'),(151,'submissionId','12','int'),(153,'fileId','56','int'),(153,'fileRevision','1','int'),(153,'fileStage','2','int'),(153,'originalFileName','Current State of Mobile Learning.pdf','string'),(153,'revisedFileId',NULL,'string'),(153,'submissionId','13','int'),(153,'username','mally','string'),(154,'fileId','56','int'),(154,'fileRevision','1','int'),(154,'fileStage','2','int'),(154,'name','mally, Current State of Mobile Learning.pdf','string'),(154,'originalFileName','Current State of Mobile Learning.pdf','string'),(154,'submissionId','13','int'),(154,'username','mally','string'),(155,'fileId','57','int'),(155,'fileRevision','1','int'),(155,'fileStage','2','int'),(155,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(155,'revisedFileId',NULL,'string'),(155,'submissionId','13','int'),(155,'username','mally','string'),(156,'fileId','57','int'),(156,'fileRevision','1','int'),(156,'fileStage','2','int'),(156,'name','mally, A Model for Framing Mobile Learning.pdf','string'),(156,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(156,'submissionId','13','int'),(156,'username','mally','string'),(157,'fileId','58','int'),(157,'fileRevision','1','int'),(157,'fileStage','2','int'),(157,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(157,'revisedFileId',NULL,'string'),(157,'submissionId','13','int'),(157,'username','mally','string'),(158,'fileId','58','int'),(158,'fileRevision','1','int'),(158,'fileStage','2','int'),(158,'name','mally, Mobile Distance Learning with PDAs: Deve.pdf','string'),(158,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(158,'submissionId','13','int'),(158,'username','mally','string'),(161,'decision','Send to Internal Review','string'),(161,'editorName','Daniel Barnes','string'),(161,'submissionId','13','int'),(162,'reviewAssignmentId','15','int'),(162,'reviewerName','Paul Hudson','string'),(162,'round','1','int'),(162,'stageId','2','int'),(162,'submissionId','13','int'),(163,'decision','Send to External Review','string'),(163,'editorName','Daniel Barnes','string'),(163,'submissionId','13','int'),(164,'reviewAssignmentId','16','int'),(164,'reviewerName','Adela Gallego','string'),(164,'round','1','int'),(164,'stageId','3','int'),(164,'submissionId','13','int'),(165,'reviewAssignmentId','17','int'),(165,'reviewerName','Al Zacharia','string'),(165,'round','1','int'),(165,'stageId','3','int'),(165,'submissionId','13','int'),(166,'reviewAssignmentId','18','int'),(166,'reviewerName','Gonzalo Favio','string'),(166,'round','1','int'),(166,'stageId','3','int'),(166,'submissionId','13','int'),(167,'reviewAssignmentId','16','int'),(167,'reviewerName','Adela Gallego','string'),(167,'round','1','int'),(167,'submissionId','13','int'),(168,'reviewAssignmentId','16','int'),(168,'reviewerName','Adela Gallego','string'),(168,'round','1','int'),(168,'submissionId','13','int'),(169,'reviewAssignmentId','18','int'),(169,'reviewerName','Gonzalo Favio','string'),(169,'round','1','int'),(169,'submissionId','13','int'),(170,'reviewAssignmentId','18','int'),(170,'reviewerName','Gonzalo Favio','string'),(170,'round','1','int'),(170,'submissionId','13','int'),(171,'decision','Accept Submission','string'),(171,'editorName','Daniel Barnes','string'),(171,'submissionId','13','int'),(173,'fileId','62','int'),(173,'fileRevision','1','int'),(173,'fileStage','2','int'),(173,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(173,'revisedFileId',NULL,'string'),(173,'submissionId','14','int'),(173,'username','mdawson','string'),(174,'fileId','62','int'),(174,'fileRevision','1','int'),(174,'fileStage','2','int'),(174,'name','mdawson, Chapter 1: Mind Control—Internal or Exte.pdf','string'),(174,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(174,'submissionId','14','int'),(174,'username','mdawson','string'),(175,'fileId','63','int'),(175,'fileRevision','1','int'),(175,'fileStage','2','int'),(175,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(175,'revisedFileId',NULL,'string'),(175,'submissionId','14','int'),(175,'username','mdawson','string'),(176,'fileId','63','int'),(176,'fileRevision','1','int'),(176,'fileStage','2','int'),(176,'name','mdawson, Chapter 2: Classical Music and the Class.pdf','string'),(176,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(176,'submissionId','14','int'),(176,'username','mdawson','string'),(177,'fileId','64','int'),(177,'fileRevision','1','int'),(177,'fileStage','2','int'),(177,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(177,'revisedFileId',NULL,'string'),(177,'submissionId','14','int'),(177,'username','mdawson','string'),(178,'fileId','64','int'),(178,'fileRevision','1','int'),(178,'fileStage','2','int'),(178,'name','mdawson, Chapter 3: Situated Cognition and Bricol.pdf','string'),(178,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(178,'submissionId','14','int'),(178,'username','mdawson','string'),(179,'fileId','65','int'),(179,'fileRevision','1','int'),(179,'fileStage','2','int'),(179,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(179,'revisedFileId',NULL,'string'),(179,'submissionId','14','int'),(179,'username','mdawson','string'),(180,'fileId','65','int'),(180,'fileRevision','1','int'),(180,'fileStage','2','int'),(180,'name','mdawson, Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(180,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(180,'submissionId','14','int'),(180,'username','mdawson','string'),(181,'fileId','66','int'),(181,'fileRevision','1','int'),(181,'fileStage','2','int'),(181,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(181,'revisedFileId',NULL,'string'),(181,'submissionId','14','int'),(181,'username','mdawson','string'),(182,'fileId','66','int'),(182,'fileRevision','1','int'),(182,'fileStage','2','int'),(182,'name','mdawson, Segmentation of Vascular Ultrasound Imag.pdf','string'),(182,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(182,'submissionId','14','int'),(182,'username','mdawson','string'),(183,'fileId','67','int'),(183,'fileRevision','1','int'),(183,'fileStage','2','int'),(183,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(183,'revisedFileId',NULL,'string'),(183,'submissionId','14','int'),(183,'username','mdawson','string'),(184,'fileId','67','int'),(184,'fileRevision','1','int'),(184,'fileStage','2','int'),(184,'name','mdawson, The Canadian Nutrient File: Nutrient Val.pdf','string'),(184,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(184,'submissionId','14','int'),(184,'username','mdawson','string'),(187,'decision','Send to Internal Review','string'),(187,'editorName','Daniel Barnes','string'),(187,'submissionId','14','int'),(188,'reviewAssignmentId','19','int'),(188,'reviewerName','Julie Janssen','string'),(188,'round','1','int'),(188,'stageId','2','int'),(188,'submissionId','14','int'),(189,'decision','Send to External Review','string'),(189,'editorName','Daniel Barnes','string'),(189,'submissionId','14','int'),(190,'reviewAssignmentId','20','int'),(190,'reviewerName','Al Zacharia','string'),(190,'round','1','int'),(190,'stageId','3','int'),(190,'submissionId','14','int'),(191,'decision','Accept Submission','string'),(191,'editorName','Daniel Barnes','string'),(191,'submissionId','14','int'),(192,'name','Maria Fritz','string'),(192,'userGroupName','Copyeditor','string'),(192,'username','mfritz','string'),(193,'decision','Send To Production','string'),(193,'editorName','Daniel Barnes','string'),(193,'submissionId','14','int'),(194,'name','Graham Cox','string'),(194,'userGroupName','Layout Editor','string'),(194,'username','gcox','string'),(195,'name','Sabine Kumar','string'),(195,'userGroupName','Proofreader','string'),(195,'username','skumar','string'),(196,'formatName','PDF','string'),(197,'publicationFormatName','PDF','string'),(198,'publicationFormatName','PDF','string'),(199,'file','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(199,'name','Daniel Barnes','string'),(199,'username','dbarnes','string'),(200,'file','Chapter 2: Classical Music and the Class.pdf','string'),(200,'name','Daniel Barnes','string'),(200,'username','dbarnes','string'),(201,'file','Chapter 3: Situated Cognition and Bricol.pdf','string'),(201,'name','Daniel Barnes','string'),(201,'username','dbarnes','string'),(202,'file','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(202,'name','Daniel Barnes','string'),(202,'username','dbarnes','string'),(203,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(203,'name','Daniel Barnes','string'),(203,'username','dbarnes','string'),(204,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(204,'name','Daniel Barnes','string'),(204,'username','dbarnes','string'),(207,'fileId','80','int'),(207,'fileRevision','1','int'),(207,'fileStage','2','int'),(207,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(207,'revisedFileId',NULL,'string'),(207,'submissionId','15','int'),(207,'username','mforan','string'),(208,'fileId','80','int'),(208,'fileRevision','1','int'),(208,'fileStage','2','int'),(208,'name','mforan, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(208,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(208,'submissionId','15','int'),(208,'username','mforan','string'),(211,'decision','Send to External Review','string'),(211,'editorName','Daniel Barnes','string'),(211,'submissionId','15','int'),(213,'fileId','82','int'),(213,'fileRevision','1','int'),(213,'fileStage','2','int'),(213,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(213,'revisedFileId',NULL,'string'),(213,'submissionId','16','int'),(213,'username','mpower','string'),(214,'fileId','82','int'),(214,'fileRevision','1','int'),(214,'fileStage','2','int'),(214,'name','mpower, A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(214,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(214,'submissionId','16','int'),(214,'username','mpower','string'),(217,'decision','Send to External Review','string'),(217,'editorName','Daniel Barnes','string'),(217,'submissionId','16','int'),(218,'reviewAssignmentId','21','int'),(218,'reviewerName','Adela Gallego','string'),(218,'round','1','int'),(218,'stageId','3','int'),(218,'submissionId','16','int'),(219,'reviewAssignmentId','22','int'),(219,'reviewerName','Al Zacharia','string'),(219,'round','1','int'),(219,'stageId','3','int'),(219,'submissionId','16','int'),(220,'reviewAssignmentId','23','int'),(220,'reviewerName','Gonzalo Favio','string'),(220,'round','1','int'),(220,'stageId','3','int'),(220,'submissionId','16','int'),(221,'reviewAssignmentId','21','int'),(221,'reviewerName','Adela Gallego','string'),(221,'round','1','int'),(221,'submissionId','16','int'),(222,'reviewAssignmentId','21','int'),(222,'reviewerName','Adela Gallego','string'),(222,'round','1','int'),(222,'submissionId','16','int'),(224,'fileId','84','int'),(224,'fileRevision','1','int'),(224,'fileStage','2','int'),(224,'originalFileName','Preface.pdf','string'),(224,'revisedFileId',NULL,'string'),(224,'submissionId','17','int'),(224,'username','msmith','string'),(225,'fileId','84','int'),(225,'fileRevision','1','int'),(225,'fileStage','2','int'),(225,'name','msmith, Preface.pdf','string'),(225,'originalFileName','Preface.pdf','string'),(225,'submissionId','17','int'),(225,'username','msmith','string'),(226,'fileId','85','int'),(226,'fileRevision','1','int'),(226,'fileStage','2','int'),(226,'originalFileName','Introduction.pdf','string'),(226,'revisedFileId',NULL,'string'),(226,'submissionId','17','int'),(226,'username','msmith','string'),(227,'fileId','85','int'),(227,'fileRevision','1','int'),(227,'fileStage','2','int'),(227,'name','msmith, Introduction.pdf','string'),(227,'originalFileName','Introduction.pdf','string'),(227,'submissionId','17','int'),(227,'username','msmith','string'),(228,'fileId','86','int'),(228,'fileRevision','1','int'),(228,'fileStage','2','int'),(228,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(228,'revisedFileId',NULL,'string'),(228,'submissionId','17','int'),(228,'username','msmith','string'),(229,'fileId','86','int'),(229,'fileRevision','1','int'),(229,'fileStage','2','int'),(229,'name','msmith, The Emergence of Open Development in a N.pdf','string'),(229,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(229,'submissionId','17','int'),(229,'username','msmith','string'),(230,'fileId','87','int'),(230,'fileRevision','1','int'),(230,'fileStage','2','int'),(230,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(230,'revisedFileId',NULL,'string'),(230,'submissionId','17','int'),(230,'username','msmith','string'),(231,'fileId','87','int'),(231,'fileRevision','1','int'),(231,'fileStage','2','int'),(231,'name','msmith, Enacting Openness in ICT4D Research.pdf','string'),(231,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(231,'submissionId','17','int'),(231,'username','msmith','string'),(232,'fileId','88','int'),(232,'fileRevision','1','int'),(232,'fileStage','2','int'),(232,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(232,'revisedFileId',NULL,'string'),(232,'submissionId','17','int'),(232,'username','msmith','string'),(233,'fileId','88','int'),(233,'fileRevision','1','int'),(233,'fileStage','2','int'),(233,'name','msmith, Transparency and Development: Ethical Co.pdf','string'),(233,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(233,'submissionId','17','int'),(233,'username','msmith','string'),(234,'fileId','89','int'),(234,'fileRevision','1','int'),(234,'fileStage','2','int'),(234,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(234,'revisedFileId',NULL,'string'),(234,'submissionId','17','int'),(234,'username','msmith','string'),(235,'fileId','89','int'),(235,'fileRevision','1','int'),(235,'fileStage','2','int'),(235,'name','msmith, Open Educational Resources: Opportunitie.pdf','string'),(235,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(235,'submissionId','17','int'),(235,'username','msmith','string'),(238,'decision','Send to Internal Review','string'),(238,'editorName','Daniel Barnes','string'),(238,'submissionId','17','int'),(239,'reviewAssignmentId','24','int'),(239,'reviewerName','Julie Janssen','string'),(239,'round','1','int'),(239,'stageId','2','int'),(239,'submissionId','17','int'),(240,'reviewAssignmentId','25','int'),(240,'reviewerName','Paul Hudson','string'),(240,'round','1','int'),(240,'stageId','2','int'),(240,'submissionId','17','int');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),(2,'mods34=>mods34-xml','plugins.metadata.mods34.mods34XmlOutput.displayName','plugins.metadata.mods34.mods34XmlOutput.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(*)','xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),(3,'monograph=>mods34','plugins.metadata.mods34.monographAdapter.displayName','plugins.metadata.mods34.monographAdapter.description','class::classes.monograph.Monograph','metadata::plugins.metadata.mods34.schema.Mods34Schema(MONOGRAPH)'),(4,'mods34=>monograph','plugins.metadata.mods34.monographAdapter.displayName','plugins.metadata.mods34.monographAdapter.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(MONOGRAPH)','class::classes.monograph.Monograph'),(5,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(6,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(7,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(8,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(9,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Monograph[]'),(11,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Author[]'),(13,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(15,'SubmissionArtworkFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionArtworkFile','xml::schema(plugins/importexport/native/native.xsd)'),(16,'SupplementaryFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SupplementaryFile','xml::schema(plugins/importexport/native/native.xsd)'),(17,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(18,'native-xml=>SubmissionArtworkFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionArtworkFile'),(19,'native-xml=>SupplementaryFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SupplementaryFile'),(20,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(21,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(22,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(23,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(24,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(25,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter');
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
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'MODS 3.4','lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter',0,0,0),(3,3,0,'Extract metadata from a(n) Monograph','plugins.metadata.mods34.filter.Mods34SchemaMonographAdapter',0,0,0),(4,4,0,'Inject metadata into a(n) Monograph','plugins.metadata.mods34.filter.Mods34SchemaMonographAdapter',0,0,0),(5,5,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(6,6,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(7,7,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(8,8,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(9,9,0,'Native XML submission export','plugins.importexport.native.filter.MonographNativeXmlFilter',0,0,0),(10,10,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlMonographFilter',0,0,0),(11,11,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(12,12,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(13,13,0,'Native XML representation export','plugins.importexport.native.filter.PublicationFormatNativeXmlFilter',0,0,0),(14,14,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPublicationFormatFilter',0,0,0),(15,20,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlMonographFileFilter',0,0,0),(16,18,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArtworkFileFilter',0,0,0),(17,19,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter',0,0,0),(18,17,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(19,15,0,'Native XML submission file export','plugins.importexport.native.filter.ArtworkFileNativeXmlFilter',0,0,0),(20,16,0,'Native XML submission file export','plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter',0,0,0),(21,21,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(22,22,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(23,23,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(24,24,0,'Native XML chapter export','plugins.importexport.native.filter.ChapterNativeXmlFilter',0,0,0),(25,25,0,'Native XML Chapter import','plugins.importexport.native.filter.NativeXmlChapterFilter',0,0,0);
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
  `setting_type` varchar(6) NOT NULL,
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
  `seq` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` tinyint(4) NOT NULL DEFAULT '0',
  `supplementary` tinyint(4) DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
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
  `setting_type` varchar(6) NOT NULL,
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
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` tinyint(4) DEFAULT '0',
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
  `file_type` tinyint(4) DEFAULT NULL,
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
  `url` varchar(255) DEFAULT '',
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
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,NULL,'NMI_TYPE_CATALOG'),(16,1,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(17,1,NULL,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(21,1,NULL,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,NULL,'NMI_TYPE_SEARCH');
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
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
INSERT INTO `notes` VALUES (1,1048586,1,6,'2022-11-05 03:07:22','2022-11-05 03:07:22','Recommendation','<p>Daniel Barnes:<br><br>The recommendation regarding the submission to Public Knowledge Press, \"The Information Literacy User’s Guide\" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>');
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
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
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
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (11,1,3,2,16777217,'2022-11-05 02:57:30',NULL,1048585,1),(13,1,0,2,16777243,'2022-11-05 02:57:30',NULL,1048585,1),(14,1,0,2,16777245,'2022-11-05 02:57:30',NULL,1048585,1),(16,1,0,2,16777236,'2022-11-05 02:57:36','2022-11-05 02:57:39',523,1),(18,1,12,3,16777227,'2022-11-05 02:57:44',NULL,517,1),(22,1,19,2,16777230,'2022-11-05 02:57:46',NULL,1048585,1),(23,1,3,2,16777251,'2022-11-05 02:57:46','2022-11-05 02:57:48',1048585,1),(40,1,3,2,16777217,'2022-11-05 02:59:42',NULL,1048585,2),(42,1,0,2,16777243,'2022-11-05 02:59:42',NULL,1048585,2),(43,1,0,2,16777245,'2022-11-05 02:59:42',NULL,1048585,2),(46,1,0,2,16777236,'2022-11-05 02:59:52','2022-11-05 02:59:56',523,2),(47,1,20,2,16777231,'2022-11-05 02:59:52',NULL,1048585,2),(48,1,11,3,16777227,'2022-11-05 03:00:03',NULL,517,2),(51,1,12,3,16777227,'2022-11-05 03:00:10',NULL,517,3),(59,1,3,2,16777217,'2022-11-05 03:00:52',NULL,1048585,3),(61,1,0,2,16777243,'2022-11-05 03:00:52',NULL,1048585,3),(62,1,0,2,16777245,'2022-11-05 03:00:52',NULL,1048585,3),(75,1,3,2,16777217,'2022-11-05 03:02:22',NULL,1048585,4),(77,1,0,2,16777243,'2022-11-05 03:02:22',NULL,1048585,4),(78,1,0,2,16777245,'2022-11-05 03:02:22','2022-11-05 03:03:18',1048585,4),(81,1,0,2,16777236,'2022-11-05 03:02:31','2022-11-05 03:02:35',523,3),(83,1,9,3,16777227,'2022-11-05 03:02:42',NULL,517,4),(86,1,0,2,16777236,'2022-11-05 03:02:45','2022-11-05 03:02:49',523,4),(89,1,11,3,16777227,'2022-11-05 03:02:56',NULL,517,5),(97,1,22,2,16777235,'2022-11-05 03:03:13',NULL,1048585,4),(98,1,3,2,16777254,'2022-11-05 03:03:13',NULL,1048585,4),(106,1,3,2,16777217,'2022-11-05 03:04:10',NULL,1048585,5),(111,1,0,2,16777236,'2022-11-05 03:04:18','2022-11-05 03:04:21',523,5),(113,1,8,3,16777227,'2022-11-05 03:04:26',NULL,517,6),(116,1,0,2,16777236,'2022-11-05 03:04:28','2022-11-05 03:04:31',523,6),(119,1,12,3,16777227,'2022-11-05 03:04:37',NULL,517,7),(127,1,23,2,16777235,'2022-11-05 03:04:50',NULL,1048585,5),(128,1,3,2,16777254,'2022-11-05 03:04:50',NULL,1048585,5),(131,1,0,2,16777246,'2022-11-05 03:05:23',NULL,1048585,5),(143,1,3,2,16777217,'2022-11-05 03:06:52',NULL,1048585,6),(145,1,0,2,16777243,'2022-11-05 03:06:52',NULL,1048585,6),(146,1,0,2,16777245,'2022-11-05 03:06:52',NULL,1048585,6),(149,1,0,2,16777236,'2022-11-05 03:07:01','2022-11-05 03:07:05',523,7),(150,1,24,2,16777229,'2022-11-05 03:07:01',NULL,1048585,6),(153,1,3,3,16777249,'2022-11-05 03:07:22',NULL,1048586,1),(169,1,3,2,16777217,'2022-11-05 03:09:29',NULL,1048585,7),(171,1,0,2,16777243,'2022-11-05 03:09:29',NULL,1048585,7),(172,1,0,2,16777245,'2022-11-05 03:09:29',NULL,1048585,7),(175,1,0,2,16777236,'2022-11-05 03:09:40','2022-11-05 03:09:44',523,8),(177,1,10,3,16777227,'2022-11-05 03:09:51',NULL,517,8),(181,1,25,2,16777230,'2022-11-05 03:09:55',NULL,1048585,7),(182,1,3,2,16777251,'2022-11-05 03:09:55','2022-11-05 03:09:58',1048585,7),(184,1,3,2,16777217,'2022-11-05 03:10:23',NULL,1048585,8),(186,1,0,2,16777243,'2022-11-05 03:10:23',NULL,1048585,8),(187,1,0,2,16777245,'2022-11-05 03:10:23',NULL,1048585,8),(203,1,3,2,16777217,'2022-11-05 03:12:14',NULL,1048585,9),(205,1,0,2,16777243,'2022-11-05 03:12:14',NULL,1048585,9),(206,1,0,2,16777245,'2022-11-05 03:12:15',NULL,1048585,9),(209,1,0,2,16777236,'2022-11-05 03:12:25','2022-11-05 03:12:29',523,9),(210,1,26,2,16777229,'2022-11-05 03:12:25',NULL,1048585,9),(220,1,3,2,16777217,'2022-11-05 03:13:29',NULL,1048585,10),(222,1,0,2,16777243,'2022-11-05 03:13:29',NULL,1048585,10),(223,1,0,2,16777245,'2022-11-05 03:13:29',NULL,1048585,10),(227,1,3,2,16777217,'2022-11-05 03:13:54',NULL,1048585,11),(229,1,0,2,16777243,'2022-11-05 03:13:55',NULL,1048585,11),(230,1,0,2,16777245,'2022-11-05 03:13:55',NULL,1048585,11),(232,1,0,2,16777236,'2022-11-05 03:14:02','2022-11-05 03:14:04',523,10),(234,1,9,3,16777227,'2022-11-05 03:14:09',NULL,517,9),(237,1,0,2,16777236,'2022-11-05 03:14:11','2022-11-05 03:14:14',523,11),(247,1,3,2,16777219,'2022-11-05 03:14:33',NULL,517,10),(250,1,3,2,16777219,'2022-11-05 03:14:43',NULL,517,11),(253,1,28,2,16777230,'2022-11-05 03:14:54',NULL,1048585,11),(254,1,3,2,16777251,'2022-11-05 03:14:54','2022-11-05 03:14:57',1048585,11),(268,1,3,2,16777217,'2022-11-05 03:16:26',NULL,1048585,12),(270,1,0,2,16777243,'2022-11-05 03:16:26',NULL,1048585,12),(271,1,0,2,16777245,'2022-11-05 03:16:26',NULL,1048585,12),(274,1,0,2,16777236,'2022-11-05 03:16:37','2022-11-05 03:16:41',523,12),(275,1,29,2,16777229,'2022-11-05 03:16:37',NULL,1048585,12),(276,1,7,3,16777227,'2022-11-05 03:16:48',NULL,517,12),(282,1,9,3,16777227,'2022-11-05 03:17:02',NULL,517,14),(286,1,3,2,16777219,'2022-11-05 03:17:14',NULL,517,13),(297,1,3,2,16777217,'2022-11-05 03:18:25',NULL,1048585,13),(299,1,0,2,16777243,'2022-11-05 03:18:25',NULL,1048585,13),(300,1,0,2,16777245,'2022-11-05 03:18:25',NULL,1048585,13),(303,1,0,2,16777236,'2022-11-05 03:18:36','2022-11-05 03:18:39',523,13),(305,1,8,3,16777227,'2022-11-05 03:18:45',NULL,517,15),(308,1,0,2,16777236,'2022-11-05 03:18:48','2022-11-05 03:18:52',523,14),(314,1,11,3,16777227,'2022-11-05 03:19:05',NULL,517,17),(321,1,3,2,16777219,'2022-11-05 03:19:23',NULL,517,16),(324,1,3,2,16777219,'2022-11-05 03:19:35',NULL,517,18),(327,1,30,2,16777230,'2022-11-05 03:19:50',NULL,1048585,13),(328,1,3,2,16777251,'2022-11-05 03:19:50','2022-11-05 03:19:54',1048585,13),(339,1,3,2,16777217,'2022-11-05 03:21:53',NULL,1048585,14),(345,1,0,2,16777236,'2022-11-05 03:22:04','2022-11-05 03:22:09',523,15),(347,1,7,3,16777227,'2022-11-05 03:22:16',NULL,517,19),(350,1,0,2,16777236,'2022-11-05 03:22:19','2022-11-05 03:22:23',523,16),(353,1,11,3,16777227,'2022-11-05 03:22:30',NULL,517,20),(361,1,31,2,16777235,'2022-11-05 03:22:48',NULL,1048585,14),(362,1,3,2,16777254,'2022-11-05 03:22:48',NULL,1048585,14),(365,1,0,2,16777246,'2022-11-05 03:24:10',NULL,1048585,14),(369,1,3,2,16777217,'2022-11-05 03:24:42',NULL,1048585,15),(371,1,0,2,16777243,'2022-11-05 03:24:42',NULL,1048585,15),(372,1,0,2,16777245,'2022-11-05 03:24:42',NULL,1048585,15),(374,1,0,2,16777236,'2022-11-05 03:24:50','2022-11-05 03:24:53',523,17),(375,1,32,2,16777231,'2022-11-05 03:24:50',NULL,1048585,15),(381,1,3,2,16777217,'2022-11-05 03:25:31',NULL,1048585,16),(383,1,0,2,16777243,'2022-11-05 03:25:31',NULL,1048585,16),(384,1,0,2,16777245,'2022-11-05 03:25:31',NULL,1048585,16),(386,1,0,2,16777236,'2022-11-05 03:25:40','2022-11-05 03:25:42',523,18),(387,1,33,2,16777231,'2022-11-05 03:25:40',NULL,1048585,16),(391,1,11,3,16777227,'2022-11-05 03:25:53',NULL,517,22),(394,1,12,3,16777227,'2022-11-05 03:25:58',NULL,517,23),(398,1,3,2,16777219,'2022-11-05 03:26:08',NULL,517,21),(419,1,3,2,16777217,'2022-11-05 03:28:43',NULL,1048585,17),(421,1,0,2,16777243,'2022-11-05 03:28:43',NULL,1048585,17),(422,1,0,2,16777245,'2022-11-05 03:28:43',NULL,1048585,17),(425,1,0,2,16777236,'2022-11-05 03:28:57','2022-11-05 03:29:02',523,19),(426,1,34,2,16777229,'2022-11-05 03:28:57',NULL,1048585,17),(427,1,7,3,16777227,'2022-11-05 03:29:10',NULL,517,24),(430,1,8,3,16777227,'2022-11-05 03:29:18',NULL,517,25);
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','a:9:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:2;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:3;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:4;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:5;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:6;a:3:{s:9:\"className\";s:35:\"lib.pkp.classes.task.ReviewReminder\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:7;a:3:{s:9:\"className\";s:39:\"lib.pkp.classes.task.PublishSubmissions\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:8;a:3:{s:9:\"className\";s:37:\"lib.pkp.classes.task.StatisticsReport\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}}','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','6365d031e5202','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','supportedFormLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportedLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportedSubmissionLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en_US','acronym','JPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','name','Public Knowledge Press',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:163:\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:79:\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:242:\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\" target=\"_blank\">Author Guidelines</a>, which is found in About the Press.\";}}',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:175:\"Cette soumission n\'a jamais été publiée et n\'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:68:\"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:83:\"Les adresses URL des références ont été fournies si elles étaient disponibles.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:320:\"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu\'à la fin.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:293:\"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\" target=\"_blank\">lignes directrices à l\'intention des auteurs</a>, disponibles dans la rubrique À propos de cette presse.\";}}',NULL);
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
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presses`
--

LOCK TABLES `presses` WRITE;
/*!40000 ALTER TABLE `presses` DISABLE KEYS */;
INSERT INTO `presses` VALUES (1,'publicknowledge',1,'en_US',1);
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
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `publication_format_settings_pkey` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_formats` (
  `publication_format_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `physical_format` tinyint(4) DEFAULT '1',
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
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
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `is_available` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_format_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
INSERT INTO `publication_formats` VALUES (1,5,NULL,0,'DA',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1),(2,14,NULL,0,'DA',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1);
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
  KEY `publication_settings_publication_id` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','a:0:{}'),(1,'en_US','abstract','<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','a:0:{}'),(2,'en_US','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The West and Beyond: New Perspectives on an Imagined Region'),(2,'fr_CA','abstract',''),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','a:0:{}'),(3,'en_US','abstract','<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The Political Economy of Workplace Injury in Canada'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','a:0:{}'),(4,'en_US','abstract','<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','a:0:{}'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Press'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','a:0:{}'),(6,'en_US','abstract','<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','The Information Literacy User’s Guide'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','a:0:{}'),(7,'en_US','abstract','<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Accessible Elements: Teaching Science Online and at a Distance'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','a:0:{}'),(8,'en_US','abstract','<p>A Note From The Publisher</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Editorial'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','a:0:{}'),(9,'en_US','abstract','<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','a:0:{}'),(10,'en_US','abstract','<p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Lost Tracks: Buffalo National Park, 1909-1939'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','a:0:{}'),(11,'en_US','abstract','<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Dreamwork'),(11,'fr_CA','abstract',''),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','a:0:{}'),(12,'en_US','abstract','<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Connecting ICTs to Development'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','a:0:{}'),(13,'en_US','abstract','<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Mobile Learning: Transforming the Delivery of Education and Training'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','a:0:{}'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Press'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','a:0:{}'),(15,'en_US','abstract','<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','a:0:{}'),(16,'en_US','abstract','<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','A Designer\'s Log: Case Studies in Instructional Design'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','a:0:{}'),(17,'en_US','abstract','<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Open Development: Networked Innovations in International Development'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title','');
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
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double NOT NULL DEFAULT '0',
  `series_id` bigint(20) DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2022-11-05 02:57:29','en_US',1,'pub','publication',0,NULL,NULL,1,1,NULL,1),(2,NULL,'2022-11-05 02:59:40','en_US',2,'pub','publication',0,NULL,NULL,2,1,NULL,1),(3,NULL,'2022-11-05 03:00:51','en_US',10,'pub','publication',0,NULL,NULL,3,1,NULL,1),(4,NULL,'2022-11-05 03:02:21','en_US',11,'pub','publication',0,NULL,NULL,4,1,NULL,1),(5,'2022-11-05','2022-11-05 03:05:23','en_US',15,'pub','publication',0,NULL,NULL,5,3,NULL,1),(6,NULL,'2022-11-05 03:06:50','en_US',16,'pub','publication',0,NULL,NULL,6,1,NULL,1),(7,NULL,'2022-11-05 03:09:27','en_US',20,'pub','publication',0,NULL,NULL,7,1,NULL,1),(8,NULL,'2022-11-05 03:10:22','en_US',25,'pub','publication',0,NULL,NULL,8,1,NULL,1),(9,NULL,'2022-11-05 03:12:13','en_US',26,'pub','publication',0,NULL,NULL,9,1,NULL,1),(10,NULL,'2022-11-05 03:13:28','en_US',31,'pub','publication',0,NULL,NULL,10,1,NULL,1),(11,NULL,'2022-11-05 03:13:54','en_US',32,'pub','publication',0,NULL,NULL,11,1,NULL,1),(12,NULL,'2022-11-05 03:16:24','en_US',33,'pub','publication',0,NULL,NULL,12,1,NULL,1),(13,NULL,'2022-11-05 03:18:24','en_US',41,'pub','publication',0,NULL,NULL,13,1,NULL,1),(14,'2022-11-05','2022-11-05 03:24:10','en_US',45,'pub','publication',0,NULL,NULL,14,3,NULL,1),(15,NULL,'2022-11-05 03:24:41','en_US',48,'pub','publication',0,NULL,NULL,15,1,NULL,1),(16,NULL,'2022-11-05 03:25:30','en_US',49,'pub','publication',0,NULL,NULL,16,1,NULL,1),(17,NULL,'2022-11-05 03:28:41','en_US',50,'pub','publication',0,NULL,NULL,17,1,NULL,1);
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
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
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
INSERT INTO `queries` VALUES (1,1048585,6,2,1,NULL,NULL,0);
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
  `is_supplier` tinyint(4) NOT NULL DEFAULT '1',
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
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2022-11-05 02:57:44','2022-11-05 02:57:44',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 02:57:44',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,2,11,NULL,NULL,'2022-11-05 03:00:03','2022-11-05 03:00:03',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:00:03',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(3,2,12,NULL,NULL,'2022-11-05 03:00:10','2022-11-05 03:00:10',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:00:10',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(4,4,9,NULL,NULL,'2022-11-05 03:02:42','2022-11-05 03:02:42',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:02:42',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0),(5,4,11,NULL,NULL,'2022-11-05 03:02:56','2022-11-05 03:02:56',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:02:56',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2022-11-05 03:04:26','2022-11-05 03:04:26',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:04:26',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0),(7,5,12,NULL,NULL,'2022-11-05 03:04:37','2022-11-05 03:04:37',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:04:37',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(8,7,10,NULL,NULL,'2022-11-05 03:09:51','2022-11-05 03:09:51',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:09:51',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0),(9,11,9,NULL,NULL,'2022-11-05 03:14:09','2022-11-05 03:14:09',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:14:09',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0),(10,11,10,NULL,0,'2022-11-05 03:14:19','2022-11-05 03:14:19','2022-11-05 03:14:30','2022-11-05 03:14:33',NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:14:33',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,0,0),(11,11,12,NULL,0,'2022-11-05 03:14:25','2022-11-05 03:14:25','2022-11-05 03:14:39','2022-11-05 03:14:43',NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:14:43',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,0,0),(12,12,7,NULL,NULL,'2022-11-05 03:16:48','2022-11-05 03:16:48',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:16:48',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(13,12,8,NULL,0,'2022-11-05 03:16:55','2022-11-05 03:16:55','2022-11-05 03:17:09','2022-11-05 03:17:14',NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:17:14',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,0,0),(14,12,9,NULL,NULL,'2022-11-05 03:17:02','2022-11-05 03:17:02',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:17:02',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(15,13,8,NULL,NULL,'2022-11-05 03:18:45','2022-11-05 03:18:45',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:18:45',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0),(16,13,10,NULL,0,'2022-11-05 03:18:58','2022-11-05 03:18:58','2022-11-05 03:19:18','2022-11-05 03:19:23',NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:19:23',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,0,0),(17,13,11,NULL,NULL,'2022-11-05 03:19:05','2022-11-05 03:19:05',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:19:05',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0),(18,13,12,NULL,0,'2022-11-05 03:19:11','2022-11-05 03:19:11','2022-11-05 03:19:31','2022-11-05 03:19:35',NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:19:35',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,0,0),(19,14,7,NULL,NULL,'2022-11-05 03:22:16','2022-11-05 03:22:16',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:22:16',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0),(20,14,11,NULL,NULL,'2022-11-05 03:22:30','2022-11-05 03:22:30',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:22:30',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0),(21,16,10,NULL,0,'2022-11-05 03:25:48','2022-11-05 03:25:48','2022-11-05 03:26:04','2022-11-05 03:26:08',NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:26:08',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,0,0),(22,16,11,NULL,NULL,'2022-11-05 03:25:53','2022-11-05 03:25:53',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:25:53',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(23,16,12,NULL,NULL,'2022-11-05 03:25:58','2022-11-05 03:25:58',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:25:58',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(24,17,7,NULL,NULL,'2022-11-05 03:29:10','2022-11-05 03:29:10',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:29:10',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0),(25,17,8,NULL,NULL,'2022-11-05 03:29:18','2022-11-05 03:29:18',NULL,NULL,NULL,'2022-12-03 00:00:00','2022-12-03 00:00:00','2022-11-05 03:29:18',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0);
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
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,2),(2,7),(2,8),(2,9),(2,10),(3,7),(3,8),(3,9),(3,10),(4,16),(4,17),(4,18),(4,19),(6,21),(8,36),(8,37),(8,38),(8,39),(8,40),(9,49),(12,53),(12,54),(12,55),(13,53),(13,54),(13,55),(14,53),(14,54),(14,55),(15,59),(15,60),(15,61),(19,68),(19,69),(19,70),(19,71),(19,72),(19,73),(21,83),(22,83),(23,83);
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
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
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
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT '1',
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,3,2,1),(2,2,3,7,1),(2,2,3,8,1),(2,2,3,9,1),(2,2,3,10,1),(4,3,2,16,1),(4,3,2,17,1),(4,3,2,18,1),(4,3,2,19,1),(5,5,2,21,1),(6,7,2,27,1),(6,7,2,28,1),(6,7,2,29,1),(6,7,2,30,1),(7,8,3,36,1),(7,8,3,37,1),(7,8,3,38,1),(7,8,3,39,1),(7,8,3,40,1),(11,10,2,49,1),(12,12,2,53,1),(12,12,2,54,1),(12,12,2,55,1),(13,13,2,59,1),(13,13,2,60,1),(13,13,2,61,1),(14,15,2,68,1),(14,15,2,69,1),(14,15,2,70,1),(14,15,2,71,1),(14,15,2,72,1),(14,15,2,73,1),(15,17,3,81,1),(16,18,3,83,1);
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
  `round` tinyint(4) NOT NULL,
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
  `row_setting` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.PublishSubmissions','2022-11-05 02:53:26'),('lib.pkp.classes.task.ReviewReminder','2022-11-05 02:53:26'),('lib.pkp.classes.task.StatisticsReport','2022-11-05 02:53:26'),('plugins.generic.usageStats.UsageStatsLoader','2022-11-05 02:53:26');
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
  `seq` double DEFAULT '0',
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `image` text,
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
INSERT INTO `series` VALUES (1,1,NULL,0,0,0,'lis','a:0:{}'),(2,1,NULL,0,0,0,'pe','a:0:{}'),(3,1,NULL,0,0,0,'his','a:0:{}'),(4,1,NULL,0,0,0,'ed','a:0:{}'),(5,1,NULL,0,0,0,'psy','a:0:{}');
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `series_settings_pkey` (`series_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
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
INSERT INTO `sessions` VALUES ('1f9r2anas5ndh0nua57kuj9508',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616836,1667616842,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667616842;s:5:\"token\";s:32:\"ef7e5544b13e822ece004b38d75c256c\";}','localhost'),('1juu44rdum4op0qj1pqfpsdgja',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616806,1667616817,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667616817;s:5:\"token\";s:32:\"4a4d195c51e07a7f7f22f8a0f66b2645\";}','localhost'),('1mlvq081dp6q1he3tn7p6um7k9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617254,1667617405,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617405;s:5:\"token\";s:32:\"3fb952ca57bfb072dfb08a5483023118\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('2843gu2p4b8ngnnt0026m68f4f',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618011,1667618098,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618098;s:5:\"token\";s:32:\"3ff26fe2268594ba8fe1ccfc29ff5a8d\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('2j947qkvs8nnntdftmkp9eo13d',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616842,1667616846,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667616846;s:5:\"token\";s:32:\"2bc36cd0b6d97caa02b59a545dba79df\";}','localhost'),('55irnqcls0jgvo3f44rd77ep52',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617075,1667617211,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617211;s:5:\"token\";s:32:\"c93ef897f9ab760ece01489bee680997\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('77dhrj5cr203td0u38ehqcuca4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616804,1667616805,0,'','localhost'),('7qd05an48kd25g59l8bpnosduv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617825,1667617950,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617950;s:5:\"token\";s:32:\"aa58dd199d85fbadb9860e0c3e8c89f6\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('981l48mvqs47ug6ap7rhpb6qvn',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617526,1667617653,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617653;s:5:\"token\";s:32:\"c8e4da92e414c38458bb9b0ff2f66148\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('9n88ft0dub3815q79dqttm1j3i',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618238,1667618395,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618395;s:5:\"token\";s:32:\"df80c96b1661104bc22b9e55d7e57f8a\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('ctu34gt7h5r0o13fsetel2a1u2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616847,1667616997,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1667616997;s:5:\"token\";s:32:\"1aebcf2e9e40b010e27b5024b4d937c6\";}','localhost'),('e1sgfo9lbqcgq9i2hvmdr5vslj',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617213,1667617252,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617252;s:5:\"token\";s:32:\"123d5d451005c4362037b3cb43239f3d\";}username|s:10:\"bbarnetson\";userId|s:2:\"21\";','localhost'),('e4ndfq8r9p0ngsi58ogf93nt7s',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617952,1667618009,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618009;s:5:\"token\";s:32:\"b2a79fcab01908b6c7e6cf467b7c41d1\";}username|s:7:\"jbrower\";userId|s:2:\"27\";','localhost'),('gf3hbvupe6l1t5qnrmf1hnn1pc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618695,1667618769,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618769;s:5:\"token\";s:32:\"07bb3ce0aa11a9fd3d2a47fc68f5a057\";}username|s:8:\"agallego\";','localhost'),('iai68amlmte8g9he6ep3p3mn79',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616999,1667617021,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667617021;s:5:\"token\";s:32:\"8e31dbd68861b6d3fa7b4f1f640783b2\";}','localhost'),('neimq1e4f53cj9d72c97i3f4rk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618654,1667618693,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618693;s:5:\"token\";s:32:\"0c3171a07ef40e0fc198c88dd2e15315\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('njv880r39omb9kf6i9dc6r65mm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617407,1667617524,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617523;s:5:\"token\";s:32:\"fb9aa1fe0bfc0cf793da2a9f659a1234\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('ob1cuobbsp1m5lgk7mm8iml3ef',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617656,1667617806,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617806;s:5:\"token\";s:32:\"77c7cf0cbda30d49fffaac3b43041056\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('p83tjt4u5ei57839u6opeovjhg',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618398,1667618652,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618650;s:5:\"token\";s:32:\"2a85e8f863bc96c7f3805bb565d53b74\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('s9ikb5bv3c16h5p91brqiq1kb3',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616817,1667616829,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667616829;s:5:\"token\";s:32:\"70da73bc5489e3a99e70bc9c145d5140\";}','localhost'),('tjdscbhb1qujs94mq60j0mnsci',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618100,1667618235,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618235;s:5:\"token\";s:32:\"8595ac410bf9d5a9a1ee606d5fe47e9b\";}username|s:7:\"phudson\";','localhost'),('u3omlmr7c57pbbsnqcaip9k4q4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667618771,1667618959,0,'csrf|a:2:{s:9:\"timestamp\";i:1667618959;s:5:\"token\";s:32:\"fb0be46b3ffbd743d36bce710704cad0\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('ubpeh03l2n8fafjbppq16d6jrq',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617808,1667617823,0,'userId|s:1:\"3\";username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1667617823;s:5:\"token\";s:32:\"2ce28a008dafe6d4860c750fe9b5c7f4\";}','localhost'),('ughbhpt1ffd1speoiv0r1on3vg',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667616830,1667616835,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667616835;s:5:\"token\";s:32:\"a75ca3bbe6192d9e25e183088904ce7f\";}','localhost'),('vrr5flgrqe608c2hi36ssbqdqr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667617022,1667617073,0,'csrf|a:2:{s:9:\"timestamp\";i:1667617073;s:5:\"token\";s:32:\"fb580011a4365988102bb0e9066d29d5\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(1024) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en_US',6,'a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL);
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
  `setting_type` varchar(6) NOT NULL,
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
  `recommend_only` tinyint(4) NOT NULL DEFAULT '0',
  `can_change_metadata` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2022-11-05 02:57:07',0,0),(2,1,3,3,'2022-11-05 02:57:30',0,1),(3,1,6,14,'2022-11-05 02:57:52',0,0),(4,2,14,20,'2022-11-05 02:58:00',0,0),(5,2,3,3,'2022-11-05 02:59:42',0,1),(6,3,13,21,'2022-11-05 03:00:19',0,0),(7,3,3,3,'2022-11-05 03:00:52',0,1),(8,4,14,22,'2022-11-05 03:00:59',0,0),(9,4,3,3,'2022-11-05 03:02:22',0,1),(10,4,6,13,'2022-11-05 03:03:09',0,0),(11,4,10,15,'2022-11-05 03:03:23',0,0),(12,5,13,23,'2022-11-05 03:03:32',0,0),(13,5,3,3,'2022-11-05 03:04:10',0,1),(14,5,6,14,'2022-11-05 03:04:47',0,0),(15,5,10,16,'2022-11-05 03:04:58',0,0),(16,5,12,17,'2022-11-05 03:05:03',0,0),(17,6,14,24,'2022-11-05 03:05:32',0,0),(18,6,3,3,'2022-11-05 03:06:52',0,1),(19,6,5,6,'2022-11-05 03:07:10',1,1),(20,7,14,25,'2022-11-05 03:07:41',0,0),(21,7,3,3,'2022-11-05 03:09:29',0,1),(22,7,6,13,'2022-11-05 03:10:03',0,0),(23,8,13,3,'2022-11-05 03:10:12',0,0),(24,8,3,3,'2022-11-05 03:10:23',0,1),(25,9,14,26,'2022-11-05 03:10:30',0,0),(26,9,3,3,'2022-11-05 03:12:14',0,1),(27,10,13,27,'2022-11-05 03:12:37',0,0),(28,10,3,3,'2022-11-05 03:13:29',0,1),(29,11,13,28,'2022-11-05 03:13:36',0,0),(30,11,3,3,'2022-11-05 03:13:54',0,1),(31,12,14,29,'2022-11-05 03:15:05',0,0),(32,12,3,3,'2022-11-05 03:16:26',0,1),(33,13,14,30,'2022-11-05 03:17:23',0,0),(34,13,3,3,'2022-11-05 03:18:25',0,1),(35,14,14,31,'2022-11-05 03:20:04',0,0),(36,14,3,3,'2022-11-05 03:21:53',0,1),(37,14,6,13,'2022-11-05 03:22:43',0,0),(38,14,10,15,'2022-11-05 03:22:58',0,0),(39,14,12,18,'2022-11-05 03:23:05',0,0),(40,15,13,32,'2022-11-05 03:24:18',0,0),(41,15,3,3,'2022-11-05 03:24:42',0,1),(42,16,13,33,'2022-11-05 03:25:00',0,0),(43,16,3,3,'2022-11-05 03:25:31',0,1),(44,17,14,34,'2022-11-05 03:26:16',0,0),(45,17,3,3,'2022-11-05 03:28:43',0,1);
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
  `setting_type` varchar(6) NOT NULL,
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
  `user_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`user_id`,`assoc_type`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_type`,`assoc_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,4,530),(1,2,5,530);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_artwork_files`
--

DROP TABLE IF EXISTS `submission_artwork_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text,
  `permission_terms` text,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_artwork_files`
--

LOCK TABLES `submission_artwork_files` WRITE;
/*!40000 ALTER TABLE `submission_artwork_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_artwork_files` ENABLE KEYS */;
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
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0),(1,2,0,0),(1,3,0,0),(5,4,0,0),(6,5,0,0),(7,6,0,0),(8,7,0,0),(9,7,0,1),(10,8,0,0),(10,9,0,0),(10,10,0,0),(10,11,0,0),(10,12,0,0),(11,13,0,0),(12,14,0,0),(13,15,0,0),(14,16,0,0),(15,17,0,0),(15,18,0,0),(15,19,0,0),(15,20,0,0),(15,21,0,0),(15,22,0,0),(16,23,0,0),(17,24,0,0),(18,25,0,0),(19,26,0,0),(20,27,0,0),(21,28,0,0),(22,29,0,0),(23,30,0,0),(24,31,0,0),(26,32,0,0),(27,33,0,0),(28,34,0,0),(29,35,0,0),(30,36,0,0),(31,37,0,0),(31,38,0,0),(31,39,0,0),(31,40,0,0),(31,41,0,0),(31,42,0,0),(31,43,0,0),(31,44,0,0),(31,45,0,0),(32,46,0,0),(32,47,0,0),(35,48,0,0),(36,48,0,1),(37,49,0,0),(38,49,0,1),(39,50,0,0),(40,50,0,1),(42,51,0,0),(43,52,0,0),(44,53,0,0),(45,54,0,0),(45,57,0,0),(46,55,0,0),(47,56,0,0),(48,58,0,0),(48,59,0,0),(48,60,0,0),(49,61,0,0),(49,62,0,0),(49,63,0,0),(49,64,0,0),(49,65,0,0),(50,67,0,0),(50,68,0,0),(51,66,0,0),(52,67,0,1),(52,68,0,1),(53,69,0,0),(54,69,0,1),(55,70,0,0),(56,70,0,1),(57,71,0,0);
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_chapter_settings_pkey` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapters` (
  `chapter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`chapter_id`),
  KEY `chapters_chapter_id` (`chapter_id`),
  KEY `chapters_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapters`
--

LOCK TABLES `submission_chapters` WRITE;
/*!40000 ALTER TABLE `submission_chapters` DISABLE KEYS */;
INSERT INTO `submission_chapters` VALUES (1,NULL,1,1),(2,NULL,1,2),(3,NULL,1,3),(4,NULL,2,1),(5,NULL,2,2),(6,NULL,2,3),(7,NULL,2,4),(8,NULL,3,1),(9,NULL,3,2),(10,NULL,3,3),(11,NULL,3,4),(12,NULL,3,5),(13,NULL,4,1),(14,NULL,4,2),(15,NULL,4,3),(16,NULL,4,4),(17,NULL,5,1),(18,NULL,5,2),(19,NULL,5,3),(20,NULL,5,4),(21,NULL,5,5),(22,NULL,5,6),(23,NULL,6,1),(24,NULL,6,2),(25,NULL,6,3),(26,NULL,6,4),(27,NULL,7,1),(28,NULL,7,2),(29,NULL,7,3),(30,NULL,7,4),(31,NULL,7,5),(32,NULL,9,1),(33,NULL,9,2),(34,NULL,9,3),(35,NULL,9,4),(36,NULL,9,5),(37,NULL,10,1),(38,NULL,10,2),(39,NULL,10,3),(40,NULL,10,4),(41,NULL,10,5),(42,NULL,10,6),(43,NULL,10,7),(44,NULL,10,8),(45,NULL,10,9),(46,NULL,11,1),(47,NULL,11,2),(48,NULL,12,1),(49,NULL,12,2),(50,NULL,12,3),(51,NULL,13,1),(52,NULL,13,2),(53,NULL,13,3),(54,NULL,14,1),(55,NULL,14,2),(56,NULL,14,3),(57,NULL,14,4),(58,NULL,15,1),(59,NULL,15,2),(60,NULL,15,3),(61,NULL,16,1),(62,NULL,16,2),(63,NULL,16,3),(64,NULL,16,4),(65,NULL,16,5),(66,NULL,17,1),(67,NULL,17,2),(68,NULL,17,3),(69,NULL,17,4),(70,NULL,17,5),(71,NULL,17,6);
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
  `comment_title` text,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2022-11-05 03:14:33',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2022-11-05 03:14:43',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2022-11-05 03:17:14',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2022-11-05 03:19:23',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2022-11-05 03:19:35',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2022-11-05 03:26:08',NULL,1);
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','aclark, The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','Book Manuscript, The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'fr_CA','name','','string'),(3,'','chapterId','4','int'),(3,'en_US','name','afinkel, Critical History in Western Canada 1900–.pdf','string'),(3,'fr_CA','name','','string'),(4,'','chapterId','5','int'),(4,'en_US','name','afinkel, Vernacular Currents in Western Canadian .pdf','string'),(4,'fr_CA','name','','string'),(5,'','chapterId','6','int'),(5,'en_US','name','afinkel, Cree Intellectual Traditions in History.pdf','string'),(5,'fr_CA','name','','string'),(6,'','chapterId','7','int'),(6,'en_US','name','afinkel, Visualizing Space, Race, and History in .pdf','string'),(6,'fr_CA','name','','string'),(7,'','chapterId','4','int'),(7,'en_US','name','Chapter Manuscript, Critical History in Western Canada 1900–.pdf','string'),(7,'fr_CA','name','','string'),(8,'','chapterId','5','int'),(8,'en_US','name','Chapter Manuscript, Vernacular Currents in Western Canadian .pdf','string'),(8,'fr_CA','name','','string'),(9,'','chapterId','6','int'),(9,'en_US','name','Chapter Manuscript, Cree Intellectual Traditions in History.pdf','string'),(9,'fr_CA','name','','string'),(10,'','chapterId','7','int'),(10,'en_US','name','Chapter Manuscript, Visualizing Space, Race, and History in .pdf','string'),(10,'fr_CA','name','','string'),(11,'en_US','name','bbarnetson, The Political Economy of Workplace Injury in Canada.pdf','string'),(11,'fr_CA','name','','string'),(12,'','chapterId','13','int'),(12,'en_US','name','bbeaty, Introduction: Contexts of Popular Cultur.pdf','string'),(12,'fr_CA','name','','string'),(13,'','chapterId','14','int'),(13,'en_US','name','bbeaty, Chapter 1. A Future for Media Studies: C.pdf','string'),(13,'fr_CA','name','','string'),(14,'','chapterId','15','int'),(14,'en_US','name','bbeaty, Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(14,'fr_CA','name','','string'),(15,'','chapterId','16','int'),(15,'en_US','name','bbeaty, Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(15,'fr_CA','name','','string'),(16,'','chapterId','13','int'),(16,'en_US','name','Chapter Manuscript, Introduction: Contexts of Popular Cultur.pdf','string'),(16,'fr_CA','name','','string'),(17,'','chapterId','14','int'),(17,'en_US','name','Chapter Manuscript, Chapter 1. A Future for Media Studies: C.pdf','string'),(17,'fr_CA','name','','string'),(18,'','chapterId','15','int'),(18,'en_US','name','Chapter Manuscript, Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(18,'fr_CA','name','','string'),(19,'','chapterId','16','int'),(19,'en_US','name','Chapter Manuscript, Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(19,'fr_CA','name','','string'),(20,'en_US','name','callan, Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(20,'fr_CA','name','','string'),(21,'en_US','name','Book Manuscript, Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(21,'fr_CA','name','','string'),(22,'en_US','name','callan, Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(22,'fr_CA','name','','string'),(23,'','chapterId','23','int'),(23,'en_US','name','dbernnard, Identify: Understanding Your Information.pdf','string'),(23,'fr_CA','name','','string'),(24,'','chapterId','24','int'),(24,'en_US','name','dbernnard, Scope: Knowing What Is Available.pdf','string'),(24,'fr_CA','name','','string'),(25,'','chapterId','25','int'),(25,'en_US','name','dbernnard, Plan: Developing Research Strategies.pdf','string'),(25,'fr_CA','name','','string'),(26,'','chapterId','26','int'),(26,'en_US','name','dbernnard, Gather: Finding What You Need.pdf','string'),(26,'fr_CA','name','','string'),(27,'','chapterId','23','int'),(27,'en_US','name','Chapter Manuscript, Identify: Understanding Your Information.pdf','string'),(27,'fr_CA','name','','string'),(28,'','chapterId','24','int'),(28,'en_US','name','Chapter Manuscript, Scope: Knowing What Is Available.pdf','string'),(28,'fr_CA','name','','string'),(29,'','chapterId','25','int'),(29,'en_US','name','Chapter Manuscript, Plan: Developing Research Strategies.pdf','string'),(29,'fr_CA','name','','string'),(30,'','chapterId','26','int'),(30,'en_US','name','Chapter Manuscript, Gather: Finding What You Need.pdf','string'),(30,'fr_CA','name','','string'),(31,'','chapterId','27','int'),(31,'en_US','name','dkennepohl, Introduction.pdf','string'),(31,'fr_CA','name','','string'),(32,'','chapterId','28','int'),(32,'en_US','name','dkennepohl, Chapter 1: Interactions Affording Distan.pdf','string'),(32,'fr_CA','name','','string'),(33,'','chapterId','29','int'),(33,'en_US','name','dkennepohl, Chapter 2: Learning Science at a Distanc.pdf','string'),(33,'fr_CA','name','','string'),(34,'','chapterId','30','int'),(34,'en_US','name','dkennepohl, Chapter 3: Leadership Strategies for Coo.pdf','string'),(34,'fr_CA','name','','string'),(35,'','chapterId','31','int'),(35,'en_US','name','dkennepohl, Chapter 4: Toward New Models of Flexible.pdf','string'),(35,'fr_CA','name','','string'),(36,'','chapterId','27','int'),(36,'en_US','name','Chapter Manuscript, Introduction.pdf','string'),(36,'fr_CA','name','','string'),(37,'','chapterId','28','int'),(37,'en_US','name','Chapter Manuscript, Chapter 1: Interactions Affording Distan.pdf','string'),(37,'fr_CA','name','','string'),(38,'','chapterId','29','int'),(38,'en_US','name','Chapter Manuscript, Chapter 2: Learning Science at a Distanc.pdf','string'),(38,'fr_CA','name','','string'),(39,'','chapterId','30','int'),(39,'en_US','name','Chapter Manuscript, Chapter 3: Leadership Strategies for Coo.pdf','string'),(39,'fr_CA','name','','string'),(40,'','chapterId','31','int'),(40,'en_US','name','Chapter Manuscript, Chapter 4: Toward New Models of Flexible.pdf','string'),(40,'fr_CA','name','','string'),(41,'en_US','name','dbarnes, Editorial.pdf','string'),(41,'fr_CA','name','','string'),(42,'','chapterId','32','int'),(42,'en_US','name','fperini, Internet, openness and the future of the.pdf','string'),(42,'fr_CA','name','','string'),(43,'','chapterId','33','int'),(43,'en_US','name','fperini, Imagining the Internet: Open, closed or .pdf','string'),(43,'fr_CA','name','','string'),(44,'','chapterId','34','int'),(44,'en_US','name','fperini, The internet in LAC will remain free, pu.pdf','string'),(44,'fr_CA','name','','string'),(45,'','chapterId','35','int'),(45,'en_US','name','fperini, Free Internet?.pdf','string'),(45,'fr_CA','name','','string'),(46,'','chapterId','36','int'),(46,'en_US','name','fperini, Risks and challenges for freedom of expr.pdf','string'),(46,'fr_CA','name','','string'),(47,'en_US','name','jbrower, Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(47,'fr_CA','name','','string'),(48,'en_US','name','jlockehart, Dreamwork.pdf','string'),(48,'fr_CA','name','','string'),(49,'en_US','name','Book Manuscript, Dreamwork.pdf','string'),(49,'fr_CA','name','','string'),(50,'','chapterId','48','int'),(50,'en_US','name','lelder, Catalyzing Access through Social and Tec.pdf','string'),(50,'fr_CA','name','','string'),(51,'','chapterId','49','int'),(51,'en_US','name','lelder, Catalyzing Access via Telecommunications.pdf','string'),(51,'fr_CA','name','','string'),(52,'','chapterId','50','int'),(52,'en_US','name','lelder, Access to Knowledge as a New Paradigm fo.pdf','string'),(52,'fr_CA','name','','string'),(53,'','chapterId','48','int'),(53,'en_US','name','Chapter Manuscript, Catalyzing Access through Social and Tec.pdf','string'),(53,'fr_CA','name','','string'),(54,'','chapterId','49','int'),(54,'en_US','name','Chapter Manuscript, Catalyzing Access via Telecommunications.pdf','string'),(54,'fr_CA','name','','string'),(55,'','chapterId','50','int'),(55,'en_US','name','Chapter Manuscript, Access to Knowledge as a New Paradigm fo.pdf','string'),(55,'fr_CA','name','','string'),(56,'','chapterId','51','int'),(56,'en_US','name','mally, Current State of Mobile Learning.pdf','string'),(56,'fr_CA','name','','string'),(57,'','chapterId','52','int'),(57,'en_US','name','mally, A Model for Framing Mobile Learning.pdf','string'),(57,'fr_CA','name','','string'),(58,'','chapterId','53','int'),(58,'en_US','name','mally, Mobile Distance Learning with PDAs: Deve.pdf','string'),(58,'fr_CA','name','','string'),(59,'','chapterId','51','int'),(59,'en_US','name','Chapter Manuscript, Current State of Mobile Learning.pdf','string'),(59,'fr_CA','name','','string'),(60,'','chapterId','52','int'),(60,'en_US','name','Chapter Manuscript, A Model for Framing Mobile Learning.pdf','string'),(60,'fr_CA','name','','string'),(61,'','chapterId','53','int'),(61,'en_US','name','Chapter Manuscript, Mobile Distance Learning with PDAs: Deve.pdf','string'),(61,'fr_CA','name','','string'),(62,'','chapterId','54','int'),(62,'en_US','name','mdawson, Chapter 1: Mind Control—Internal or Exte.pdf','string'),(62,'fr_CA','name','','string'),(63,'','chapterId','55','int'),(63,'en_US','name','mdawson, Chapter 2: Classical Music and the Class.pdf','string'),(63,'fr_CA','name','','string'),(64,'','chapterId','56','int'),(64,'en_US','name','mdawson, Chapter 3: Situated Cognition and Bricol.pdf','string'),(64,'fr_CA','name','','string'),(65,'','chapterId','57','int'),(65,'en_US','name','mdawson, Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(65,'fr_CA','name','','string'),(66,'','dateCreated','','string'),(66,'','language','en','string'),(66,'en_US','creator','Baris Kanber','string'),(66,'en_US','description','A presentation entitled \"Segmentation of Vascular Ultrasound Image Sequences\".','string'),(66,'en_US','name','mdawson, Segmentation of Vascular Ultrasound Imag.pdf','string'),(66,'en_US','publisher','','string'),(66,'en_US','source','','string'),(66,'en_US','sponsor','','string'),(66,'en_US','subject','','string'),(66,'fr_CA','creator','','string'),(66,'fr_CA','description','','string'),(66,'fr_CA','name','','string'),(66,'fr_CA','publisher','','string'),(66,'fr_CA','source','','string'),(66,'fr_CA','sponsor','','string'),(66,'fr_CA','subject','','string'),(67,'','dateCreated','2013-05-23','string'),(67,'','language','en','string'),(67,'en_US','creator','Health Canada','string'),(67,'en_US','description','Published by Health Canada, the Nutrient Value of Some Common Foods (NVSCF) provides Canadians with a resource that lists 19 nutrients for 1000 of the most commonly consumed foods in Canada. Use this quick and easy reference to help make informed food choices through an understanding of the nutrient content of the foods you eat. For further information, a booklet is available on this site in a downloadable or printable pdf format.','string'),(67,'en_US','name','mdawson, The Canadian Nutrient File: Nutrient Val.pdf','string'),(67,'en_US','publisher','Health Canada','string'),(67,'en_US','source','http://open.canada.ca/data/en/dataset/a289fd54-060c-4a96-9fcf-b1c6e706426f','string'),(67,'en_US','sponsor','','string'),(67,'en_US','subject','Health and Safety','string'),(67,'fr_CA','creator','','string'),(67,'fr_CA','description','','string'),(67,'fr_CA','name','','string'),(67,'fr_CA','publisher','','string'),(67,'fr_CA','source','','string'),(67,'fr_CA','sponsor','','string'),(67,'fr_CA','subject','','string'),(68,'','chapterId','54','int'),(68,'en_US','name','Chapter Manuscript, Chapter 1: Mind Control—Internal or Exte.pdf','string'),(68,'fr_CA','name','','string'),(69,'','chapterId','55','int'),(69,'en_US','name','Chapter Manuscript, Chapter 2: Classical Music and the Class.pdf','string'),(69,'fr_CA','name','','string'),(70,'','chapterId','56','int'),(70,'en_US','name','Chapter Manuscript, Chapter 3: Situated Cognition and Bricol.pdf','string'),(70,'fr_CA','name','','string'),(71,'','chapterId','57','int'),(71,'en_US','name','Chapter Manuscript, Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(71,'fr_CA','name','','string'),(72,'','dateCreated','','string'),(72,'','language','en','string'),(72,'en_US','creator','Baris Kanber','string'),(72,'en_US','description','A presentation entitled \"Segmentation of Vascular Ultrasound Image Sequences\".','string'),(72,'en_US','name','Other, Segmentation of Vascular Ultrasound Imag.pdf','string'),(72,'en_US','publisher','','string'),(72,'en_US','source','','string'),(72,'en_US','sponsor','','string'),(72,'en_US','subject','','string'),(72,'fr_CA','creator','','string'),(72,'fr_CA','description','','string'),(72,'fr_CA','name','','string'),(72,'fr_CA','publisher','','string'),(72,'fr_CA','source','','string'),(72,'fr_CA','sponsor','','string'),(72,'fr_CA','subject','','string'),(73,'','dateCreated','2013-05-23','string'),(73,'','language','en','string'),(73,'en_US','creator','Health Canada','string'),(73,'en_US','description','Published by Health Canada, the Nutrient Value of Some Common Foods (NVSCF) provides Canadians with a resource that lists 19 nutrients for 1000 of the most commonly consumed foods in Canada. Use this quick and easy reference to help make informed food choices through an understanding of the nutrient content of the foods you eat. For further information, a booklet is available on this site in a downloadable or printable pdf format.','string'),(73,'en_US','name','Other, The Canadian Nutrient File: Nutrient Val.pdf','string'),(73,'en_US','publisher','Health Canada','string'),(73,'en_US','source','http://open.canada.ca/data/en/dataset/a289fd54-060c-4a96-9fcf-b1c6e706426f','string'),(73,'en_US','sponsor','','string'),(73,'en_US','subject','Health and Safety','string'),(73,'fr_CA','creator','','string'),(73,'fr_CA','description','','string'),(73,'fr_CA','name','','string'),(73,'fr_CA','publisher','','string'),(73,'fr_CA','source','','string'),(73,'fr_CA','sponsor','','string'),(73,'fr_CA','subject','','string'),(74,'','chapterId','54','int'),(74,'en_US','name','mdawson, Chapter 1: Mind Control—Internal or Exte.pdf','string'),(74,'fr_CA','name','','string'),(75,'','chapterId','55','int'),(75,'en_US','name','mdawson, Chapter 2: Classical Music and the Class.pdf','string'),(75,'fr_CA','name','','string'),(76,'','chapterId','56','int'),(76,'en_US','name','mdawson, Chapter 3: Situated Cognition and Bricol.pdf','string'),(76,'fr_CA','name','','string'),(77,'','chapterId','57','int'),(77,'en_US','name','mdawson, Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(77,'fr_CA','name','','string'),(78,'','dateCreated','','string'),(78,'','language','en','string'),(78,'en_US','creator','Baris Kanber','string'),(78,'en_US','description','A presentation entitled \"Segmentation of Vascular Ultrasound Image Sequences\".','string'),(78,'en_US','name','mdawson, Segmentation of Vascular Ultrasound Imag.pdf','string'),(78,'en_US','publisher','','string'),(78,'en_US','source','','string'),(78,'en_US','sponsor','','string'),(78,'en_US','subject','','string'),(78,'fr_CA','creator','','string'),(78,'fr_CA','description','','string'),(78,'fr_CA','name','','string'),(78,'fr_CA','publisher','','string'),(78,'fr_CA','source','','string'),(78,'fr_CA','sponsor','','string'),(78,'fr_CA','subject','','string'),(79,'','dateCreated','2013-05-23','string'),(79,'','language','en','string'),(79,'en_US','creator','Health Canada','string'),(79,'en_US','description','Published by Health Canada, the Nutrient Value of Some Common Foods (NVSCF) provides Canadians with a resource that lists 19 nutrients for 1000 of the most commonly consumed foods in Canada. Use this quick and easy reference to help make informed food choices through an understanding of the nutrient content of the foods you eat. For further information, a booklet is available on this site in a downloadable or printable pdf format.','string'),(79,'en_US','name','mdawson, The Canadian Nutrient File: Nutrient Val.pdf','string'),(79,'en_US','publisher','Health Canada','string'),(79,'en_US','source','http://open.canada.ca/data/en/dataset/a289fd54-060c-4a96-9fcf-b1c6e706426f','string'),(79,'en_US','sponsor','','string'),(79,'en_US','subject','Health and Safety','string'),(79,'fr_CA','creator','','string'),(79,'fr_CA','description','','string'),(79,'fr_CA','name','','string'),(79,'fr_CA','publisher','','string'),(79,'fr_CA','source','','string'),(79,'fr_CA','sponsor','','string'),(79,'fr_CA','subject','','string'),(80,'en_US','name','mforan, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(80,'fr_CA','name','','string'),(81,'en_US','name','Book Manuscript, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(81,'fr_CA','name','','string'),(82,'en_US','name','mpower, A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(82,'fr_CA','name','','string'),(83,'en_US','name','Book Manuscript, A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(83,'fr_CA','name','','string'),(84,'','chapterId','66','int'),(84,'en_US','name','msmith, Preface.pdf','string'),(84,'fr_CA','name','','string'),(85,'','chapterId','67','int'),(85,'en_US','name','msmith, Introduction.pdf','string'),(85,'fr_CA','name','','string'),(86,'','chapterId','68','int'),(86,'en_US','name','msmith, The Emergence of Open Development in a N.pdf','string'),(86,'fr_CA','name','','string'),(87,'','chapterId','69','int'),(87,'en_US','name','msmith, Enacting Openness in ICT4D Research.pdf','string'),(87,'fr_CA','name','','string'),(88,'','chapterId','70','int'),(88,'en_US','name','msmith, Transparency and Development: Ethical Co.pdf','string'),(88,'fr_CA','name','','string'),(89,'','chapterId','71','int'),(89,'en_US','name','msmith, Open Educational Resources: Opportunitie.pdf','string'),(89,'fr_CA','name','','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,NULL,NULL,1,'application/pdf',3,14572,'The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf',2,NULL,NULL,1,'2022-11-05 02:57:13','2022-11-05 02:57:13',19,NULL,NULL),(2,1,1,1,1,'application/pdf',3,14572,'The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf',4,NULL,NULL,1,'2022-11-05 02:57:13','2022-11-05 02:57:36',19,NULL,NULL),(3,1,NULL,NULL,2,'application/pdf',4,14572,'Critical History in Western Canada 1900–.pdf',2,NULL,NULL,1,'2022-11-05 02:58:06','2022-11-05 02:58:06',20,NULL,NULL),(4,1,NULL,NULL,2,'application/pdf',4,14572,'Vernacular Currents in Western Canadian .pdf',2,NULL,NULL,1,'2022-11-05 02:58:14','2022-11-05 02:58:14',20,NULL,NULL),(5,1,NULL,NULL,2,'application/pdf',4,14572,'Cree Intellectual Traditions in History.pdf',2,NULL,NULL,1,'2022-11-05 02:58:23','2022-11-05 02:58:23',20,NULL,NULL),(6,1,NULL,NULL,2,'application/pdf',4,14572,'Visualizing Space, Race, and History in .pdf',2,NULL,NULL,1,'2022-11-05 02:58:32','2022-11-05 02:58:32',20,NULL,NULL),(7,1,3,1,2,'application/pdf',4,14572,'Critical History in Western Canada 1900–.pdf',4,NULL,NULL,1,'2022-11-05 02:58:06','2022-11-05 02:59:52',20,NULL,NULL),(8,1,4,1,2,'application/pdf',4,14572,'Vernacular Currents in Western Canadian .pdf',4,NULL,NULL,1,'2022-11-05 02:58:14','2022-11-05 02:59:52',20,NULL,NULL),(9,1,5,1,2,'application/pdf',4,14572,'Cree Intellectual Traditions in History.pdf',4,NULL,NULL,1,'2022-11-05 02:58:23','2022-11-05 02:59:52',20,NULL,NULL),(10,1,6,1,2,'application/pdf',4,14572,'Visualizing Space, Race, and History in .pdf',4,NULL,NULL,1,'2022-11-05 02:58:32','2022-11-05 02:59:52',20,NULL,NULL),(11,1,NULL,NULL,3,'application/pdf',3,14572,'The Political Economy of Workplace Injury in Canada.pdf',2,NULL,NULL,1,'2022-11-05 03:00:24','2022-11-05 03:00:24',21,NULL,NULL),(12,1,NULL,NULL,4,'application/pdf',4,14572,'Introduction: Contexts of Popular Cultur.pdf',2,NULL,NULL,1,'2022-11-05 03:01:05','2022-11-05 03:01:05',22,NULL,NULL),(13,1,NULL,NULL,4,'application/pdf',4,14572,'Chapter 1. A Future for Media Studies: C.pdf',2,NULL,NULL,1,'2022-11-05 03:01:13','2022-11-05 03:01:13',22,NULL,NULL),(14,1,NULL,NULL,4,'application/pdf',4,14572,'Chapter 2. Log On, Goof Off, and Look Up.pdf',2,NULL,NULL,1,'2022-11-05 03:01:22','2022-11-05 03:01:22',22,NULL,NULL),(15,1,NULL,NULL,4,'application/pdf',4,14572,'Chapter 3. Hawkers and Public Space: Fre.pdf',2,NULL,NULL,1,'2022-11-05 03:01:31','2022-11-05 03:01:31',22,NULL,NULL),(16,1,12,1,4,'application/pdf',4,14572,'Introduction: Contexts of Popular Cultur.pdf',4,NULL,NULL,1,'2022-11-05 03:01:05','2022-11-05 03:02:31',22,NULL,NULL),(17,1,13,1,4,'application/pdf',4,14572,'Chapter 1. A Future for Media Studies: C.pdf',4,NULL,NULL,1,'2022-11-05 03:01:13','2022-11-05 03:02:31',22,NULL,NULL),(18,1,14,1,4,'application/pdf',4,14572,'Chapter 2. Log On, Goof Off, and Look Up.pdf',4,NULL,NULL,1,'2022-11-05 03:01:22','2022-11-05 03:02:31',22,NULL,NULL),(19,1,15,1,4,'application/pdf',4,14572,'Chapter 3. Hawkers and Public Space: Fre.pdf',4,NULL,NULL,1,'2022-11-05 03:01:31','2022-11-05 03:02:31',22,NULL,NULL),(20,1,NULL,NULL,5,'application/pdf',3,14572,'Bomb Canada and Other Unkind Remarks in the American Media.pdf',2,NULL,NULL,1,'2022-11-05 03:03:37','2022-11-05 03:03:37',23,NULL,NULL),(21,1,20,1,5,'application/pdf',3,14572,'Bomb Canada and Other Unkind Remarks in the American Media.pdf',4,NULL,NULL,1,'2022-11-05 03:03:37','2022-11-05 03:04:18',23,NULL,NULL),(22,1,20,1,5,'application/pdf',3,14572,'Bomb Canada and Other Unkind Remarks in the American Media.pdf',10,'0','openAccess',1,'2022-11-05 03:03:37','2022-11-05 03:05:12',23,521,1),(23,1,NULL,NULL,6,'application/pdf',4,14572,'Identify: Understanding Your Information.pdf',2,NULL,NULL,1,'2022-11-05 03:05:37','2022-11-05 03:05:37',24,NULL,NULL),(24,1,NULL,NULL,6,'application/pdf',4,14572,'Scope: Knowing What Is Available.pdf',2,NULL,NULL,1,'2022-11-05 03:05:46','2022-11-05 03:05:46',24,NULL,NULL),(25,1,NULL,NULL,6,'application/pdf',4,14572,'Plan: Developing Research Strategies.pdf',2,NULL,NULL,1,'2022-11-05 03:05:54','2022-11-05 03:05:54',24,NULL,NULL),(26,1,NULL,NULL,6,'application/pdf',4,14572,'Gather: Finding What You Need.pdf',2,NULL,NULL,1,'2022-11-05 03:06:03','2022-11-05 03:06:03',24,NULL,NULL),(27,1,23,1,6,'application/pdf',4,14572,'Identify: Understanding Your Information.pdf',4,NULL,NULL,1,'2022-11-05 03:05:37','2022-11-05 03:07:01',24,NULL,NULL),(28,1,24,1,6,'application/pdf',4,14572,'Scope: Knowing What Is Available.pdf',4,NULL,NULL,1,'2022-11-05 03:05:46','2022-11-05 03:07:01',24,NULL,NULL),(29,1,25,1,6,'application/pdf',4,14572,'Plan: Developing Research Strategies.pdf',4,NULL,NULL,1,'2022-11-05 03:05:54','2022-11-05 03:07:01',24,NULL,NULL),(30,1,26,1,6,'application/pdf',4,14572,'Gather: Finding What You Need.pdf',4,NULL,NULL,1,'2022-11-05 03:06:03','2022-11-05 03:07:01',24,NULL,NULL),(31,1,NULL,NULL,7,'application/pdf',4,14572,'Introduction.pdf',2,NULL,NULL,1,'2022-11-05 03:07:46','2022-11-05 03:07:46',25,NULL,NULL),(32,1,NULL,NULL,7,'application/pdf',4,14572,'Chapter 1: Interactions Affording Distan.pdf',2,NULL,NULL,1,'2022-11-05 03:07:55','2022-11-05 03:07:55',25,NULL,NULL),(33,1,NULL,NULL,7,'application/pdf',4,14572,'Chapter 2: Learning Science at a Distanc.pdf',2,NULL,NULL,1,'2022-11-05 03:08:04','2022-11-05 03:08:04',25,NULL,NULL),(34,1,NULL,NULL,7,'application/pdf',4,14572,'Chapter 3: Leadership Strategies for Coo.pdf',2,NULL,NULL,1,'2022-11-05 03:08:13','2022-11-05 03:08:13',25,NULL,NULL),(35,1,NULL,NULL,7,'application/pdf',4,14572,'Chapter 4: Toward New Models of Flexible.pdf',2,NULL,NULL,1,'2022-11-05 03:08:22','2022-11-05 03:08:22',25,NULL,NULL),(36,1,31,1,7,'application/pdf',4,14572,'Introduction.pdf',4,NULL,NULL,1,'2022-11-05 03:07:46','2022-11-05 03:09:40',25,NULL,NULL),(37,1,32,1,7,'application/pdf',4,14572,'Chapter 1: Interactions Affording Distan.pdf',4,NULL,NULL,1,'2022-11-05 03:07:55','2022-11-05 03:09:40',25,NULL,NULL),(38,1,33,1,7,'application/pdf',4,14572,'Chapter 2: Learning Science at a Distanc.pdf',4,NULL,NULL,1,'2022-11-05 03:08:04','2022-11-05 03:09:40',25,NULL,NULL),(39,1,34,1,7,'application/pdf',4,14572,'Chapter 3: Leadership Strategies for Coo.pdf',4,NULL,NULL,1,'2022-11-05 03:08:13','2022-11-05 03:09:40',25,NULL,NULL),(40,1,35,1,7,'application/pdf',4,14572,'Chapter 4: Toward New Models of Flexible.pdf',4,NULL,NULL,1,'2022-11-05 03:08:22','2022-11-05 03:09:40',25,NULL,NULL),(41,1,NULL,NULL,8,'application/pdf',3,14572,'Editorial.pdf',2,NULL,NULL,1,'2022-11-05 03:10:18','2022-11-05 03:10:18',3,NULL,NULL),(42,1,NULL,NULL,9,'application/pdf',4,14572,'Internet, openness and the future of the.pdf',2,NULL,NULL,1,'2022-11-05 03:10:35','2022-11-05 03:10:35',26,NULL,NULL),(43,1,NULL,NULL,9,'application/pdf',4,14572,'Imagining the Internet: Open, closed or .pdf',2,NULL,NULL,1,'2022-11-05 03:10:44','2022-11-05 03:10:44',26,NULL,NULL),(44,1,NULL,NULL,9,'application/pdf',4,14572,'The internet in LAC will remain free, pu.pdf',2,NULL,NULL,1,'2022-11-05 03:10:53','2022-11-05 03:10:53',26,NULL,NULL),(45,1,NULL,NULL,9,'application/pdf',4,14572,'Free Internet?.pdf',2,NULL,NULL,1,'2022-11-05 03:11:01','2022-11-05 03:11:01',26,NULL,NULL),(46,1,NULL,NULL,9,'application/pdf',4,14572,'Risks and challenges for freedom of expr.pdf',2,NULL,NULL,1,'2022-11-05 03:11:11','2022-11-05 03:11:11',26,NULL,NULL),(47,1,NULL,NULL,10,'application/pdf',3,14572,'Lost Tracks: Buffalo National Park, 1909-1939.pdf',2,NULL,NULL,1,'2022-11-05 03:12:42','2022-11-05 03:12:42',27,NULL,NULL),(48,1,NULL,NULL,11,'application/pdf',3,14572,'Dreamwork.pdf',2,NULL,NULL,1,'2022-11-05 03:13:42','2022-11-05 03:13:42',28,NULL,NULL),(49,1,48,1,11,'application/pdf',3,14572,'Dreamwork.pdf',4,NULL,NULL,1,'2022-11-05 03:13:42','2022-11-05 03:14:02',28,NULL,NULL),(50,1,NULL,NULL,12,'application/pdf',4,14572,'Catalyzing Access through Social and Tec.pdf',2,NULL,NULL,1,'2022-11-05 03:15:10','2022-11-05 03:15:10',29,NULL,NULL),(51,1,NULL,NULL,12,'application/pdf',4,14572,'Catalyzing Access via Telecommunications.pdf',2,NULL,NULL,1,'2022-11-05 03:15:19','2022-11-05 03:15:19',29,NULL,NULL),(52,1,NULL,NULL,12,'application/pdf',4,14572,'Access to Knowledge as a New Paradigm fo.pdf',2,NULL,NULL,1,'2022-11-05 03:15:28','2022-11-05 03:15:28',29,NULL,NULL),(53,1,50,1,12,'application/pdf',4,14572,'Catalyzing Access through Social and Tec.pdf',4,NULL,NULL,1,'2022-11-05 03:15:10','2022-11-05 03:16:37',29,NULL,NULL),(54,1,51,1,12,'application/pdf',4,14572,'Catalyzing Access via Telecommunications.pdf',4,NULL,NULL,1,'2022-11-05 03:15:19','2022-11-05 03:16:37',29,NULL,NULL),(55,1,52,1,12,'application/pdf',4,14572,'Access to Knowledge as a New Paradigm fo.pdf',4,NULL,NULL,1,'2022-11-05 03:15:28','2022-11-05 03:16:37',29,NULL,NULL),(56,1,NULL,NULL,13,'application/pdf',4,14572,'Current State of Mobile Learning.pdf',2,NULL,NULL,1,'2022-11-05 03:17:28','2022-11-05 03:17:28',30,NULL,NULL),(57,1,NULL,NULL,13,'application/pdf',4,14572,'A Model for Framing Mobile Learning.pdf',2,NULL,NULL,1,'2022-11-05 03:17:37','2022-11-05 03:17:37',30,NULL,NULL),(58,1,NULL,NULL,13,'application/pdf',4,14572,'Mobile Distance Learning with PDAs: Deve.pdf',2,NULL,NULL,1,'2022-11-05 03:17:46','2022-11-05 03:17:46',30,NULL,NULL),(59,1,56,1,13,'application/pdf',4,14572,'Current State of Mobile Learning.pdf',4,NULL,NULL,1,'2022-11-05 03:17:28','2022-11-05 03:18:36',30,NULL,NULL),(60,1,57,1,13,'application/pdf',4,14572,'A Model for Framing Mobile Learning.pdf',4,NULL,NULL,1,'2022-11-05 03:17:37','2022-11-05 03:18:36',30,NULL,NULL),(61,1,58,1,13,'application/pdf',4,14572,'Mobile Distance Learning with PDAs: Deve.pdf',4,NULL,NULL,1,'2022-11-05 03:17:46','2022-11-05 03:18:36',30,NULL,NULL),(62,1,NULL,NULL,14,'application/pdf',4,14572,'Chapter 1: Mind Control—Internal or Exte.pdf',2,NULL,NULL,1,'2022-11-05 03:20:09','2022-11-05 03:20:09',31,NULL,NULL),(63,1,NULL,NULL,14,'application/pdf',4,14572,'Chapter 2: Classical Music and the Class.pdf',2,NULL,NULL,1,'2022-11-05 03:20:18','2022-11-05 03:20:18',31,NULL,NULL),(64,1,NULL,NULL,14,'application/pdf',4,14572,'Chapter 3: Situated Cognition and Bricol.pdf',2,NULL,NULL,1,'2022-11-05 03:20:27','2022-11-05 03:20:27',31,NULL,NULL),(65,1,NULL,NULL,14,'application/pdf',4,14572,'Chapter 4: Braitenberg’s Vehicle 2.pdf',2,NULL,NULL,1,'2022-11-05 03:20:36','2022-11-05 03:20:36',31,NULL,NULL),(66,1,NULL,NULL,14,'application/pdf',13,14572,'Segmentation of Vascular Ultrasound Imag.pdf',2,NULL,NULL,1,'2022-11-05 03:20:45','2022-11-05 03:20:45',31,NULL,NULL),(67,1,NULL,NULL,14,'application/pdf',13,14572,'The Canadian Nutrient File: Nutrient Val.pdf',2,NULL,NULL,1,'2022-11-05 03:20:56','2022-11-05 03:20:56',31,NULL,NULL),(68,1,62,1,14,'application/pdf',4,14572,'Chapter 1: Mind Control—Internal or Exte.pdf',4,NULL,NULL,1,'2022-11-05 03:20:09','2022-11-05 03:22:04',31,NULL,NULL),(69,1,63,1,14,'application/pdf',4,14572,'Chapter 2: Classical Music and the Class.pdf',4,NULL,NULL,1,'2022-11-05 03:20:18','2022-11-05 03:22:05',31,NULL,NULL),(70,1,64,1,14,'application/pdf',4,14572,'Chapter 3: Situated Cognition and Bricol.pdf',4,NULL,NULL,1,'2022-11-05 03:20:27','2022-11-05 03:22:05',31,NULL,NULL),(71,1,65,1,14,'application/pdf',4,14572,'Chapter 4: Braitenberg’s Vehicle 2.pdf',4,NULL,NULL,1,'2022-11-05 03:20:36','2022-11-05 03:22:05',31,NULL,NULL),(72,1,66,1,14,'application/pdf',13,14572,'Segmentation of Vascular Ultrasound Imag.pdf',4,NULL,NULL,1,'2022-11-05 03:20:45','2022-11-05 03:22:05',31,NULL,NULL),(73,1,67,1,14,'application/pdf',13,14572,'The Canadian Nutrient File: Nutrient Val.pdf',4,NULL,NULL,1,'2022-11-05 03:20:56','2022-11-05 03:22:05',31,NULL,NULL),(74,1,62,1,14,'application/pdf',4,14572,'Chapter 1: Mind Control—Internal or Exte.pdf',10,'0','openAccess',1,'2022-11-05 03:20:09','2022-11-05 03:23:20',31,521,2),(75,1,63,1,14,'application/pdf',4,14572,'Chapter 2: Classical Music and the Class.pdf',10,'0','openAccess',1,'2022-11-05 03:20:18','2022-11-05 03:23:20',31,521,2),(76,1,64,1,14,'application/pdf',4,14572,'Chapter 3: Situated Cognition and Bricol.pdf',10,'0','openAccess',1,'2022-11-05 03:20:27','2022-11-05 03:23:20',31,521,2),(77,1,65,1,14,'application/pdf',4,14572,'Chapter 4: Braitenberg’s Vehicle 2.pdf',10,'0','openAccess',1,'2022-11-05 03:20:36','2022-11-05 03:23:20',31,521,2),(78,1,66,1,14,'application/pdf',13,14572,'Segmentation of Vascular Ultrasound Imag.pdf',10,'0','openAccess',1,'2022-11-05 03:20:45','2022-11-05 03:23:20',31,521,2),(79,1,67,1,14,'application/pdf',13,14572,'The Canadian Nutrient File: Nutrient Val.pdf',10,'0','openAccess',1,'2022-11-05 03:20:56','2022-11-05 03:23:20',31,521,2),(80,1,NULL,NULL,15,'application/pdf',3,14572,'Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf',2,NULL,NULL,1,'2022-11-05 03:24:24','2022-11-05 03:24:24',32,NULL,NULL),(81,1,80,1,15,'application/pdf',3,14572,'Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf',4,NULL,NULL,1,'2022-11-05 03:24:24','2022-11-05 03:24:50',32,NULL,NULL),(82,1,NULL,NULL,16,'application/pdf',3,14572,'A Designer\'s Log: Case Studies in Instructional Design.pdf',2,NULL,NULL,1,'2022-11-05 03:25:05','2022-11-05 03:25:05',33,NULL,NULL),(83,1,82,1,16,'application/pdf',3,14572,'A Designer\'s Log: Case Studies in Instructional Design.pdf',4,NULL,NULL,1,'2022-11-05 03:25:05','2022-11-05 03:25:40',33,NULL,NULL),(84,1,NULL,NULL,17,'application/pdf',4,14572,'Preface.pdf',2,NULL,NULL,1,'2022-11-05 03:26:21','2022-11-05 03:26:21',34,NULL,NULL),(85,1,NULL,NULL,17,'application/pdf',4,14572,'Introduction.pdf',2,NULL,NULL,1,'2022-11-05 03:26:30','2022-11-05 03:26:30',34,NULL,NULL),(86,1,NULL,NULL,17,'application/pdf',4,14572,'The Emergence of Open Development in a N.pdf',2,NULL,NULL,1,'2022-11-05 03:26:39','2022-11-05 03:26:39',34,NULL,NULL),(87,1,NULL,NULL,17,'application/pdf',4,14572,'Enacting Openness in ICT4D Research.pdf',2,NULL,NULL,1,'2022-11-05 03:26:48','2022-11-05 03:26:48',34,NULL,NULL),(88,1,NULL,NULL,17,'application/pdf',4,14572,'Transparency and Development: Ethical Co.pdf',2,NULL,NULL,1,'2022-11-05 03:26:57','2022-11-05 03:26:57',34,NULL,NULL),(89,1,NULL,NULL,17,'application/pdf',4,14572,'Open Educational Resources: Opportunitie.pdf',2,NULL,NULL,1,'2022-11-05 03:27:06','2022-11-05 03:27:06',34,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (77,'acting'),(102,'affect'),(98,'agents'),(96,'agent’s'),(49,'alberta'),(2,'allan'),(10,'american'),(20,'americans'),(17,'anti-american'),(36,'anti-canadianism'),(52,'athabasca'),(90,'behaviour'),(32,'bilateral'),(6,'bomb'),(42,'book'),(15,'border'),(56,'brains'),(50,'brian'),(55,'bricks'),(54,'calgary'),(5,'california'),(7,'canada'),(99,'capable'),(1,'chantal'),(70,'characteristics'),(72,'classical'),(58,'cognitive'),(45,'complex'),(25,'confederation'),(66,'construction'),(16,'continent'),(83,'control'),(48,'dawson'),(84,'development'),(69,'discussing'),(71,'distinguish'),(81,'distributed'),(19,'documented'),(51,'dupuis'),(27,'election'),(57,'embodied'),(79,'embodiment'),(75,'emphasis'),(97,'environment'),(30,'events'),(23,'examines'),(28,'examining'),(92,'examples'),(100,'exhibiting'),(80,'exploration'),(89,'exploring'),(64,'foundational'),(41,'hilarious'),(35,'history'),(65,'ideas'),(93,'illustrate'),(63,'illustrates'),(78,'importance'),(37,'informative'),(62,'introduces'),(94,'key'),(44,'layer'),(60,'lego'),(29,'major'),(11,'media'),(47,'michael'),(68,'mindstorms'),(14,'nations'),(22,'neighbour'),(21,'northern'),(82,'notions'),(91,'numerous'),(26,'obama’s'),(67,'observation'),(73,'places'),(24,'portrayed'),(39,'provoking'),(33,'relations'),(46,'relationship'),(9,'remarks'),(74,'renewed'),(43,'reveals'),(61,'robots'),(59,'science'),(101,'sense'),(76,'sensing'),(18,'sentiment'),(87,'simple'),(4,'southern'),(13,'states'),(86,'synthesizing'),(88,'systems'),(31,'tested'),(95,'theme'),(85,'theories'),(38,'thought'),(40,'times'),(34,'tracks'),(12,'united'),(3,'university'),(8,'unkind'),(53,'wilson'),(103,'world');
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
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(3,2,13),(1,3,2),(7,3,2),(7,3,7),(7,3,10),(1,4,3),(1,5,4),(2,6,0),(3,6,28),(2,7,1),(3,7,0),(3,7,8),(3,7,18),(3,7,29),(3,7,43),(2,8,2),(2,9,3),(2,10,4),(3,10,15),(2,11,5),(3,11,16),(3,12,1),(3,12,44),(3,13,2),(3,13,45),(3,14,3),(3,15,4),(3,16,5),(3,17,6),(3,18,7),(3,19,9),(3,20,10),(3,21,11),(3,22,12),(3,23,14),(3,24,17),(3,25,19),(3,26,20),(3,27,21),(3,28,22),(3,29,23),(3,30,24),(3,31,25),(3,32,26),(3,33,27),(3,34,30),(3,35,31),(3,36,32),(3,37,33),(3,38,34),(3,39,35),(3,40,36),(3,41,37),(3,42,38),(3,43,39),(3,44,40),(3,45,41),(9,45,57),(3,46,42),(7,47,0),(7,47,8),(7,48,1),(7,49,3),(7,50,4),(7,51,5),(7,52,6),(7,53,9),(7,54,11),(8,55,0),(9,55,0),(9,55,23),(8,56,1),(9,56,1),(9,56,24),(8,57,2),(9,57,3),(9,57,17),(8,58,3),(9,58,4),(9,58,18),(9,58,21),(8,59,4),(9,59,5),(9,59,19),(9,59,22),(8,60,5),(9,60,11),(9,60,53),(8,61,6),(9,61,13),(9,61,54),(9,62,2),(9,63,6),(9,64,7),(9,65,8),(9,66,9),(9,67,10),(9,68,12),(9,69,14),(9,70,15),(9,71,16),(9,72,20),(9,73,25),(9,74,26),(9,75,27),(9,76,28),(9,77,29),(9,78,30),(9,78,48),(9,79,31),(9,80,32),(9,81,33),(9,82,34),(9,83,35),(9,84,36),(9,85,37),(9,86,38),(9,87,39),(9,87,51),(9,88,40),(9,89,41),(9,90,42),(9,90,58),(9,91,43),(9,92,44),(9,93,45),(9,94,46),(9,95,47),(9,96,49),(9,97,50),(9,98,52),(9,99,55),(9,100,56),(9,101,59),(9,102,60),(9,103,61);
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
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,5,1,0),(2,5,2,0),(3,5,4,0),(4,5,8,0),(5,5,32,0),(6,5,64,0),(7,14,1,0),(8,14,2,0),(9,14,4,0),(10,14,8,0),(11,14,32,0),(12,14,64,0);
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
  `setting_value` text,
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
-- Table structure for table `submission_supplementary_files`
--

DROP TABLE IF EXISTS `submission_supplementary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_supplementary_files`
--

LOCK TABLES `submission_supplementary_files` WRITE;
/*!40000 ALTER TABLE `submission_supplementary_files` DISABLE KEYS */;
INSERT INTO `submission_supplementary_files` VALUES (66,1),(67,1),(72,1),(73,1),(78,1),(79,1);
/*!40000 ALTER TABLE `submission_supplementary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `work_type` tinyint(4) DEFAULT '0',
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
INSERT INTO `submissions` VALUES (1,NULL,1,NULL,1,'2022-11-05 02:57:52','2022-11-05 02:57:30','2022-11-05 02:57:30',4,1,0,2),(2,NULL,1,NULL,2,'2022-11-05 03:00:10','2022-11-05 02:59:42','2022-11-05 02:59:42',3,1,0,1),(3,NULL,1,NULL,3,'2022-11-05 03:00:52','2022-11-05 03:00:52','2022-11-05 03:00:52',1,1,0,2),(4,NULL,1,NULL,4,'2022-11-05 03:03:23','2022-11-05 03:02:22','2022-11-05 03:02:22',5,1,0,1),(5,NULL,1,NULL,5,'2022-11-05 03:05:23','2022-11-05 03:04:10','2022-11-05 03:04:10',5,3,0,2),(6,NULL,1,NULL,6,'2022-11-05 03:07:22','2022-11-05 03:06:52','2022-11-05 03:06:52',2,1,0,1),(7,NULL,1,NULL,7,'2022-11-05 03:10:03','2022-11-05 03:09:29','2022-11-05 03:09:29',4,1,0,1),(8,NULL,1,NULL,8,'2022-11-05 03:10:23','2022-11-05 03:10:23','2022-11-05 03:10:23',1,1,0,2),(9,NULL,1,NULL,9,'2022-11-05 03:12:25','2022-11-05 03:12:14','2022-11-05 03:12:14',2,1,0,1),(10,NULL,1,NULL,10,'2022-11-05 03:13:29','2022-11-05 03:13:29','2022-11-05 03:13:29',1,1,0,2),(11,NULL,1,NULL,11,'2022-11-05 03:14:54','2022-11-05 03:13:54','2022-11-05 03:14:25',4,1,0,2),(12,NULL,1,NULL,12,'2022-11-05 03:17:14','2022-11-05 03:16:26','2022-11-05 03:16:55',2,1,0,1),(13,NULL,1,NULL,13,'2022-11-05 03:19:50','2022-11-05 03:18:25','2022-11-05 03:19:11',4,1,0,1),(14,NULL,1,NULL,14,'2022-11-05 03:24:10','2022-11-05 03:21:53','2022-11-05 03:21:53',5,3,0,1),(15,NULL,1,NULL,15,'2022-11-05 03:24:50','2022-11-05 03:24:42','2022-11-05 03:24:42',3,1,0,2),(16,NULL,1,NULL,16,'2022-11-05 03:26:08','2022-11-05 03:25:31','2022-11-05 03:25:48',3,1,0,2),(17,NULL,1,NULL,17,'2022-11-05 03:29:18','2022-11-05 03:28:43','2022-11-05 03:28:43',2,1,0,1);
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
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PM','string'),(2,'en_US','name','Press manager','string'),(2,'fr_CA','abbrev','MP','string'),(2,'fr_CA','name','Gestionnaire de la presse','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','PE','string'),(3,'en_US','name','Press editor','string'),(3,'fr_CA','abbrev','RP','string'),(3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'fr_CA','abbrev','DirProd','string'),(4,'fr_CA','name','Directeur-trice de production','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','AcqE','string'),(5,'en_US','name','Series editor','string'),(5,'fr_CA','abbrev','RS','string'),(5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(6,'','nameLocaleKey','default.groups.name.copyeditor','string'),(6,'en_US','abbrev','CE','string'),(6,'en_US','name','Copyeditor','string'),(6,'fr_CA','abbrev','RÉV','string'),(6,'fr_CA','name','Réviseur-e','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(7,'','nameLocaleKey','default.groups.name.designer','string'),(7,'en_US','abbrev','Design','string'),(7,'en_US','name','Designer','string'),(7,'fr_CA','abbrev','Design','string'),(7,'fr_CA','name','Designer','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(8,'','nameLocaleKey','default.groups.name.funding','string'),(8,'en_US','abbrev','FC','string'),(8,'en_US','name','Funding coordinator','string'),(8,'fr_CA','abbrev','CF','string'),(8,'fr_CA','name','Coordonnateur-trice du financement','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(9,'','nameLocaleKey','default.groups.name.indexer','string'),(9,'en_US','abbrev','IND','string'),(9,'en_US','name','Indexer','string'),(9,'fr_CA','abbrev','Indx','string'),(9,'fr_CA','name','Indexeur-e','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(10,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(10,'en_US','abbrev','LE','string'),(10,'en_US','name','Layout Editor','string'),(10,'fr_CA','abbrev','RespMP','string'),(10,'fr_CA','name','Responsable de la mise en page','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(11,'','nameLocaleKey','default.groups.name.marketing','string'),(11,'en_US','abbrev','MS','string'),(11,'en_US','name','Marketing and sales coordinator','string'),(11,'fr_CA','abbrev','CVM','string'),(11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(12,'','nameLocaleKey','default.groups.name.proofreader','string'),(12,'en_US','abbrev','PR','string'),(12,'en_US','name','Proofreader','string'),(12,'fr_CA','abbrev','CorEp','string'),(12,'fr_CA','name','Correcteur-trice d\'épreuves','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(13,'','nameLocaleKey','default.groups.name.author','string'),(13,'en_US','abbrev','AU','string'),(13,'en_US','name','Author','string'),(13,'fr_CA','abbrev','AU','string'),(13,'fr_CA','name','Auteur-e','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor','string'),(14,'','nameLocaleKey','default.groups.name.volumeEditor','string'),(14,'','recommendOnly','0','bool'),(14,'en_US','abbrev','VE','string'),(14,'en_US','name','Volume editor','string'),(14,'fr_CA','abbrev','RV','string'),(14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor','string'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor','string'),(15,'en_US','abbrev','CA','string'),(15,'en_US','name','Chapter Author','string'),(15,'fr_CA','abbrev','AC','string'),(15,'fr_CA','name','Auteur du chapitre','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(16,'','nameLocaleKey','default.groups.name.translator','string'),(16,'en_US','abbrev','Trans','string'),(16,'en_US','name','Translator','string'),(16,'fr_CA','abbrev','Trad','string'),(16,'fr_CA','name','Traducteur-trice','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer','string'),(17,'','nameLocaleKey','default.groups.name.internalReviewer','string'),(17,'en_US','abbrev','IR','string'),(17,'en_US','name','Internal Reviewer','string'),(17,'fr_CA','abbrev','EvalInt','string'),(17,'fr_CA','name','Évaluateur-trice interne','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(18,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(18,'en_US','abbrev','ER','string'),(18,'en_US','name','External Reviewer','string'),(18,'fr_CA','abbrev','EvEx','string'),(18,'fr_CA','name','Évaluateur-trice externe','string'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(19,'','nameLocaleKey','default.groups.name.reader','string'),(19,'en_US','abbrev','Read','string'),(19,'en_US','name','Reader','string'),(19,'fr_CA','abbrev','Lect','string'),(19,'fr_CA','name','Lecteur-trice','string');
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
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '1',
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT '0',
  `permit_metadata_edit` tinyint(4) NOT NULL DEFAULT '0',
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
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en_US','givenName',0,0,'admin','string'),(1,'en_US','familyName',0,0,'admin','string'),(2,'en_US','biography',0,0,'','string'),(2,'fr_CA','biography',0,0,'','string'),(2,'en_US','signature',0,0,'','string'),(2,'fr_CA','signature',0,0,'','string'),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México','string'),(2,'fr_CA','affiliation',0,0,'','string'),(2,'en_US','givenName',0,0,'Ramiro','string'),(2,'fr_CA','givenName',0,0,'','string'),(2,'en_US','familyName',0,0,'Vaca','string'),(2,'fr_CA','familyName',0,0,'','string'),(2,'en_US','preferredPublicName',0,0,'','string'),(2,'fr_CA','preferredPublicName',0,0,'','string'),(2,'','orcid',0,0,'','string'),(3,'en_US','biography',0,0,'','string'),(3,'fr_CA','biography',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'fr_CA','signature',0,0,'','string'),(3,'en_US','affiliation',0,0,'University of Melbourne','string'),(3,'fr_CA','affiliation',0,0,'','string'),(3,'en_US','givenName',0,0,'Daniel','string'),(3,'fr_CA','givenName',0,0,'','string'),(3,'en_US','familyName',0,0,'Barnes','string'),(3,'fr_CA','familyName',0,0,'','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'fr_CA','preferredPublicName',0,0,'','string'),(3,'','orcid',0,0,'','string'),(4,'en_US','biography',0,0,'','string'),(4,'fr_CA','biography',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'fr_CA','signature',0,0,'','string'),(4,'en_US','affiliation',0,0,'University of Chicago','string'),(4,'fr_CA','affiliation',0,0,'','string'),(4,'en_US','givenName',0,0,'David','string'),(4,'fr_CA','givenName',0,0,'','string'),(4,'en_US','familyName',0,0,'Buskins','string'),(4,'fr_CA','familyName',0,0,'','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'fr_CA','preferredPublicName',0,0,'','string'),(4,'','orcid',0,0,'','string'),(5,'en_US','biography',0,0,'','string'),(5,'fr_CA','biography',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'fr_CA','signature',0,0,'','string'),(5,'en_US','affiliation',0,0,'University of Toronto','string'),(5,'fr_CA','affiliation',0,0,'','string'),(5,'en_US','givenName',0,0,'Stephanie','string'),(5,'fr_CA','givenName',0,0,'','string'),(5,'en_US','familyName',0,0,'Berardo','string'),(5,'fr_CA','familyName',0,0,'','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'fr_CA','preferredPublicName',0,0,'','string'),(5,'','orcid',0,0,'','string'),(6,'en_US','biography',0,0,'','string'),(6,'fr_CA','biography',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'fr_CA','signature',0,0,'','string'),(6,'en_US','affiliation',0,0,'Kyoto University','string'),(6,'fr_CA','affiliation',0,0,'','string'),(6,'en_US','givenName',0,0,'Minoti','string'),(6,'fr_CA','givenName',0,0,'','string'),(6,'en_US','familyName',0,0,'Inoue','string'),(6,'fr_CA','familyName',0,0,'','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'fr_CA','preferredPublicName',0,0,'','string'),(6,'','orcid',0,0,'','string'),(7,'en_US','biography',0,0,'','string'),(7,'fr_CA','biography',0,0,'','string'),(7,'en_US','signature',0,0,'','string'),(7,'fr_CA','signature',0,0,'','string'),(7,'en_US','affiliation',0,0,'Utrecht University','string'),(7,'fr_CA','affiliation',0,0,'','string'),(7,'en_US','givenName',0,0,'Julie','string'),(7,'fr_CA','givenName',0,0,'','string'),(7,'en_US','familyName',0,0,'Janssen','string'),(7,'fr_CA','familyName',0,0,'','string'),(7,'en_US','preferredPublicName',0,0,'','string'),(7,'fr_CA','preferredPublicName',0,0,'','string'),(7,'','orcid',0,0,'','string'),(8,'en_US','biography',0,0,'','string'),(8,'fr_CA','biography',0,0,'','string'),(8,'en_US','signature',0,0,'','string'),(8,'fr_CA','signature',0,0,'','string'),(8,'en_US','affiliation',0,0,'McGill University','string'),(8,'fr_CA','affiliation',0,0,'','string'),(8,'en_US','givenName',0,0,'Paul','string'),(8,'fr_CA','givenName',0,0,'','string'),(8,'en_US','familyName',0,0,'Hudson','string'),(8,'fr_CA','familyName',0,0,'','string'),(8,'en_US','preferredPublicName',0,0,'','string'),(8,'fr_CA','preferredPublicName',0,0,'','string'),(8,'','orcid',0,0,'','string'),(9,'en_US','biography',0,0,'','string'),(9,'fr_CA','biography',0,0,'','string'),(9,'en_US','signature',0,0,'','string'),(9,'fr_CA','signature',0,0,'','string'),(9,'en_US','affiliation',0,0,'University of Manitoba','string'),(9,'fr_CA','affiliation',0,0,'','string'),(9,'en_US','givenName',0,0,'Aisla','string'),(9,'fr_CA','givenName',0,0,'','string'),(9,'en_US','familyName',0,0,'McCrae','string'),(9,'fr_CA','familyName',0,0,'','string'),(9,'en_US','preferredPublicName',0,0,'','string'),(9,'fr_CA','preferredPublicName',0,0,'','string'),(9,'','orcid',0,0,'','string'),(10,'en_US','biography',0,0,'','string'),(10,'fr_CA','biography',0,0,'','string'),(10,'en_US','signature',0,0,'','string'),(10,'fr_CA','signature',0,0,'','string'),(10,'en_US','affiliation',0,0,'State University of New York','string'),(10,'fr_CA','affiliation',0,0,'','string'),(10,'en_US','givenName',0,0,'Adela','string'),(10,'fr_CA','givenName',0,0,'','string'),(10,'en_US','familyName',0,0,'Gallego','string'),(10,'fr_CA','familyName',0,0,'','string'),(10,'en_US','preferredPublicName',0,0,'','string'),(10,'fr_CA','preferredPublicName',0,0,'','string'),(10,'','orcid',0,0,'','string'),(11,'en_US','biography',0,0,'','string'),(11,'fr_CA','biography',0,0,'','string'),(11,'en_US','signature',0,0,'','string'),(11,'fr_CA','signature',0,0,'','string'),(11,'en_US','affiliation',0,0,'KNUST','string'),(11,'fr_CA','affiliation',0,0,'','string'),(11,'en_US','givenName',0,0,'Al','string'),(11,'fr_CA','givenName',0,0,'','string'),(11,'en_US','familyName',0,0,'Zacharia','string'),(11,'fr_CA','familyName',0,0,'','string'),(11,'en_US','preferredPublicName',0,0,'','string'),(11,'fr_CA','preferredPublicName',0,0,'','string'),(11,'','orcid',0,0,'','string'),(12,'en_US','biography',0,0,'','string'),(12,'fr_CA','biography',0,0,'','string'),(12,'en_US','signature',0,0,'','string'),(12,'fr_CA','signature',0,0,'','string'),(12,'en_US','affiliation',0,0,'Madrid','string'),(12,'fr_CA','affiliation',0,0,'','string'),(12,'en_US','givenName',0,0,'Gonzalo','string'),(12,'fr_CA','givenName',0,0,'','string'),(12,'en_US','familyName',0,0,'Favio','string'),(12,'fr_CA','familyName',0,0,'','string'),(12,'en_US','preferredPublicName',0,0,'','string'),(12,'fr_CA','preferredPublicName',0,0,'','string'),(12,'','orcid',0,0,'','string'),(13,'en_US','biography',0,0,'','string'),(13,'fr_CA','biography',0,0,'','string'),(13,'en_US','signature',0,0,'','string'),(13,'fr_CA','signature',0,0,'','string'),(13,'en_US','affiliation',0,0,'Ghent University','string'),(13,'fr_CA','affiliation',0,0,'','string'),(13,'en_US','givenName',0,0,'Maria','string'),(13,'fr_CA','givenName',0,0,'','string'),(13,'en_US','familyName',0,0,'Fritz','string'),(13,'fr_CA','familyName',0,0,'','string'),(13,'en_US','preferredPublicName',0,0,'','string'),(13,'fr_CA','preferredPublicName',0,0,'','string'),(13,'','orcid',0,0,'','string'),(14,'en_US','biography',0,0,'','string'),(14,'fr_CA','biography',0,0,'','string'),(14,'en_US','signature',0,0,'','string'),(14,'fr_CA','signature',0,0,'','string'),(14,'en_US','affiliation',0,0,'Universidad de Chile','string'),(14,'fr_CA','affiliation',0,0,'','string'),(14,'en_US','givenName',0,0,'Sarah','string'),(14,'fr_CA','givenName',0,0,'','string'),(14,'en_US','familyName',0,0,'Vogt','string'),(14,'fr_CA','familyName',0,0,'','string'),(14,'en_US','preferredPublicName',0,0,'','string'),(14,'fr_CA','preferredPublicName',0,0,'','string'),(14,'','orcid',0,0,'','string'),(15,'en_US','biography',0,0,'','string'),(15,'fr_CA','biography',0,0,'','string'),(15,'en_US','signature',0,0,'','string'),(15,'fr_CA','signature',0,0,'','string'),(15,'en_US','affiliation',0,0,'Duke University','string'),(15,'fr_CA','affiliation',0,0,'','string'),(15,'en_US','givenName',0,0,'Graham','string'),(15,'fr_CA','givenName',0,0,'','string'),(15,'en_US','familyName',0,0,'Cox','string'),(15,'fr_CA','familyName',0,0,'','string'),(15,'en_US','preferredPublicName',0,0,'','string'),(15,'fr_CA','preferredPublicName',0,0,'','string'),(15,'','orcid',0,0,'','string'),(16,'en_US','biography',0,0,'','string'),(16,'fr_CA','biography',0,0,'','string'),(16,'en_US','signature',0,0,'','string'),(16,'fr_CA','signature',0,0,'','string'),(16,'en_US','affiliation',0,0,'University of Cape Town','string'),(16,'fr_CA','affiliation',0,0,'','string'),(16,'en_US','givenName',0,0,'Stephen','string'),(16,'fr_CA','givenName',0,0,'','string'),(16,'en_US','familyName',0,0,'Hellier','string'),(16,'fr_CA','familyName',0,0,'','string'),(16,'en_US','preferredPublicName',0,0,'','string'),(16,'fr_CA','preferredPublicName',0,0,'','string'),(16,'','orcid',0,0,'','string'),(17,'en_US','biography',0,0,'','string'),(17,'fr_CA','biography',0,0,'','string'),(17,'en_US','signature',0,0,'','string'),(17,'fr_CA','signature',0,0,'','string'),(17,'en_US','affiliation',0,0,'Imperial College London','string'),(17,'fr_CA','affiliation',0,0,'','string'),(17,'en_US','givenName',0,0,'Catherine','string'),(17,'fr_CA','givenName',0,0,'','string'),(17,'en_US','familyName',0,0,'Turner','string'),(17,'fr_CA','familyName',0,0,'','string'),(17,'en_US','preferredPublicName',0,0,'','string'),(17,'fr_CA','preferredPublicName',0,0,'','string'),(17,'','orcid',0,0,'','string'),(18,'en_US','biography',0,0,'','string'),(18,'fr_CA','biography',0,0,'','string'),(18,'en_US','signature',0,0,'','string'),(18,'fr_CA','signature',0,0,'','string'),(18,'en_US','affiliation',0,0,'National University of Singapore','string'),(18,'fr_CA','affiliation',0,0,'','string'),(18,'en_US','givenName',0,0,'Sabine','string'),(18,'fr_CA','givenName',0,0,'','string'),(18,'en_US','familyName',0,0,'Kumar','string'),(18,'fr_CA','familyName',0,0,'','string'),(18,'en_US','preferredPublicName',0,0,'','string'),(18,'fr_CA','preferredPublicName',0,0,'','string'),(18,'','orcid',0,0,'','string'),(19,'en_US','affiliation',0,0,'University of Calgary','string'),(19,'en_US','givenName',0,0,'Arthur','string'),(19,'en_US','familyName',0,0,'Clark','string'),(20,'en_US','affiliation',0,0,'Athabasca University','string'),(20,'en_US','givenName',0,0,'Alvin','string'),(20,'en_US','familyName',0,0,'Finkel','string'),(21,'en_US','affiliation',0,0,'Athabasca University','string'),(21,'en_US','givenName',0,0,'Bob','string'),(21,'en_US','familyName',0,0,'Barnetson','string'),(22,'en_US','affiliation',0,0,'University of British Columbia','string'),(22,'en_US','givenName',0,0,'Bart','string'),(22,'en_US','familyName',0,0,'Beaty','string'),(23,'en_US','affiliation',0,0,'University of Southern California','string'),(23,'en_US','givenName',0,0,'Chantal','string'),(23,'en_US','familyName',0,0,'Allan','string'),(24,'en_US','affiliation',0,0,'SUNY','string'),(24,'en_US','givenName',0,0,'Deborah','string'),(24,'en_US','familyName',0,0,'Bernnard','string'),(25,'en_US','affiliation',0,0,'Athabasca University','string'),(25,'en_US','givenName',0,0,'Dietmar','string'),(25,'en_US','familyName',0,0,'Kennepohl','string'),(26,'en_US','affiliation',0,0,'University of Sussex','string'),(26,'en_US','givenName',0,0,'Fernando','string'),(26,'en_US','familyName',0,0,'Perini','string'),(27,'en_US','affiliation',0,0,'Buffalo National Park Foundation','string'),(27,'en_US','givenName',0,0,'Jennifer','string'),(27,'en_US','familyName',0,0,'Brower','string'),(28,'en_US','affiliation',0,0,'University of Alberta','string'),(28,'en_US','givenName',0,0,'Jonathan','string'),(28,'en_US','familyName',0,0,'Locke Hart','string'),(29,'en_US','affiliation',0,0,'International Development Research Centre','string'),(29,'en_US','givenName',0,0,'Laurent','string'),(29,'en_US','familyName',0,0,'Elder','string'),(30,'en_US','affiliation',0,0,'Athabasca University','string'),(30,'en_US','givenName',0,0,'Mohamed','string'),(30,'en_US','familyName',0,0,'Ally','string'),(31,'en_US','affiliation',0,0,'University of Alberta','string'),(31,'en_US','givenName',0,0,'Michael','string'),(31,'en_US','familyName',0,0,'Dawson','string'),(32,'en_US','affiliation',0,0,'University of Calgary','string'),(32,'en_US','givenName',0,0,'Max','string'),(32,'en_US','familyName',0,0,'Foran','string'),(33,'en_US','affiliation',0,0,'London School of Economics','string'),(33,'en_US','givenName',0,0,'Michael','string'),(33,'en_US','familyName',0,0,'Power','string'),(34,'en_US','affiliation',0,0,'International Development Research Centre','string'),(34,'en_US','givenName',0,0,'Matthew','string'),(34,'en_US','familyName',0,0,'Smith','string');
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
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$o9wcNlSjqP4652nj0iWRj.4DToGhvPR.30Ocxul.zhThtRCdeE7OW','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2022-11-05 02:53:23',NULL,'2022-11-05 02:56:39',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$j4MHLaQOSOyFJ.RGzq0Ty.zCffItnl121pMlGCHT78QGzf3DtYDSm','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2022-11-05 02:54:15',NULL,'2022-11-05 02:56:35',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$4.0G2WwNDjX89cU0KRBwHu4bhAIcZhWv/xBvWb8.g8kQzufSN2pfC','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2022-11-05 02:54:20',NULL,'2022-11-05 03:28:45',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$hLU4wTT64qk8SRMsCjb5.uj6grMjSaNZ/CJtoon3ovZzxtTaKdDXW','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-11-05 02:54:26',NULL,'2022-11-05 02:54:26',0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$U1r6UFg1JlXvU.dTHmsE7.v5evt1yQFjf51tSIGOJ2GYBiMrticla','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-11-05 02:54:32',NULL,'2022-11-05 02:54:32',0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$aTBtvMpYxidpwEnNJpDUueFUoMfmY5oeX/MKhAaEVdmHSFX3e.xfK','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2022-11-05 02:54:38',NULL,'2022-11-05 03:07:13',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$uvWFxaXRwlfigr7i897p..kAaskq8rXT4Q3s1K5f5ezyOai8qLI3W','jjanssen@mailinator.com','','','',NULL,'NL','',NULL,NULL,'2022-11-05 02:54:45',NULL,'2022-11-05 02:54:45',0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$jQw9PHD4lNg78mS3b9txWuO9okL66JXI6a6Nboo4G4kDMrtoO9zE6','phudson@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-11-05 02:54:52',NULL,'2022-11-05 03:17:04',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$dQDH3rv3lag2x2gZWpFTy.VWDTHfmE9A6s2f8mkbgsmjlM0KcRd0C','amccrae@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-11-05 02:55:00',NULL,'2022-11-05 02:55:00',0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$ur.GOiFmgSGQGP5D00/Sq.hqYG8.hORdgR7OIMfeGEjPYuI9BQecO','agallego@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-11-05 02:55:08',NULL,'2022-11-05 03:26:00',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$ogHBuAMtN6UACmPTpmt5bu9RKpFCdycRGM1NScNgXVzpoSZFWGxSC','alzacharia@mailinator.com','','','',NULL,'GH','',NULL,NULL,'2022-11-05 02:55:17',NULL,'2022-11-05 02:55:17',0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$7yQkrsfIn1HPhjx6kclzqONy9EphCweE3FzPc4oOPXZiErYFC0kjq','gfavio@mailinator.com','','','',NULL,'ES','',NULL,NULL,'2022-11-05 02:55:25',NULL,'2022-11-05 03:19:25',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$tYk6lP2icsxj4Ef/b4QQpu582oO.m.C6RX9Z.Bpbhn.Il5ZvboAFe','mfritz@mailinator.com','','','',NULL,'BE','',NULL,NULL,'2022-11-05 02:55:35',NULL,'2022-11-05 02:55:35',0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$OGpFWctCx2/qBkk74e/zDO.IQVEC/IKwMwvC02XSVx71N2YPJpxZO','svogt@mailinator.com','','','',NULL,'CL','',NULL,NULL,'2022-11-05 02:55:44',NULL,'2022-11-05 02:55:44',0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$rqctDWMkUDWpd2uKQV9ByOUgm5CuT45KghNAtpom0z8iuCMtQulAa','gcox@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-11-05 02:55:53',NULL,'2022-11-05 02:55:53',0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$28P4dr4ql8ifeLNqXb4d2eDzQ4R44yvPss56BpheOhRexyqyJjIDy','shellier@mailinator.com','','','',NULL,'ZA','',NULL,NULL,'2022-11-05 02:56:04',NULL,'2022-11-05 02:56:04',0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$Q4veK/Ai.366c4tSRWefYOK2PJQgtCR8Z8.l1RVm0eXoCVSmsmPzC','cturner@mailinator.com','','','',NULL,'GB','',NULL,NULL,'2022-11-05 02:56:15',NULL,'2022-11-05 02:56:15',0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$6QPd/5GsUXdaq5TYNp7GLueUtKOA8OcrQR3pC/4PdI4LlmZa7IahG','skumar@mailinator.com','','','',NULL,'SG','',NULL,NULL,'2022-11-05 02:56:26',NULL,'2022-11-05 02:56:26',0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$P8TlLYVKd2SX.7WqLRJjteNQ64jR5Aq2SRxTgbPDQ1K5Ayu7jlx7.','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 02:57:05',NULL,'2022-11-05 02:57:05',0,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$zg9FjyyGfrmGczQzhYmWVei4qDaENvtTXRCzvUnaou3w0Whk9Jmge','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 02:57:58',NULL,'2022-11-05 02:57:58',0,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$NfKyUh/nkWLIXyqs8Y5aIu608guztAtjGbOTevfKyDKXGvNAZI/mq','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:00:16',NULL,'2022-11-05 03:00:16',0,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$I6gZU4TZNmX7cJpCI4OrU.wVUzcJjTdcqbY4S2ux8S3aDLwnpB1.W','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:00:56',NULL,'2022-11-05 03:00:57',0,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$0cS5B5dx98V3s4sBeJZBVehKSC0avurPyRKRES15mPXMCskNF9UFu','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:03:29',NULL,'2022-11-05 03:03:29',0,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$iM0xDg4V07ZSPoWsnzzO7u4fXakJ/7oZ5wAXqfnZvh63DzvMX31tC','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-11-05 03:05:29',NULL,'2022-11-05 03:05:29',0,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$GODObRZYKGwG7492W8Q4r.O8S4mxBIDPSiolw/s9Tghfy4ReoJwGC','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:07:38',NULL,'2022-11-05 03:07:38',0,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$6ei9aaIKVTqLixgpNUyJgePVPkLTrnTx1H6Lo/KHF36mb7mOf6m0O','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:10:27',NULL,'2022-11-05 03:10:27',0,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$A5YMuzenFNt4DoPCzkDrWe6fDLiqoCMew7mJ.CiY1vlmQO879OK5K','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:12:35',NULL,'2022-11-05 03:12:35',0,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$1vOqH4dGJF1H8omune7iY.60DGsOEkqeBrHQcauzKEDZK3eiGNSW2','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:13:34',NULL,'2022-11-05 03:13:34',0,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$cXbuqL06qXv/PWxnN5rqX.ATJWrmlbXwTq2DibiJceiY8q.TjyoJe','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:15:02',NULL,'2022-11-05 03:15:03',0,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$2mL.WwzzJ7gzIk6lE.boh.RU8xrUylF9tvUNNYkekvurEktTWNJzy','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:17:20',NULL,'2022-11-05 03:17:21',0,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$AUoMOrZ3RLwOLVvoqD/U4u48JbBSACvmUJpcI8p5ykV25Lm90Yb26','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:20:01',NULL,'2022-11-05 03:20:01',0,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$2s9OPXJG..21xlYtLT8SduPDBat5YhGJYEM2swoc.Bt63jgahQv0S','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:24:16',NULL,'2022-11-05 03:24:16',0,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$lkQNR7HCGk1XjljwCY9VieA60UolpsxguUoopzeabBtBPcgSXNApG','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:24:57',NULL,'2022-11-05 03:24:57',0,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$Sg/HYgT4p3EQFP4M6nVoy.QWitXtKFjS9gZh6HOZo9hTL2aerNMP6','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-05 03:26:13',NULL,'2022-11-05 03:26:13',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2022-11-05 02:53:23',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.metadata','openurl10','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.metadata','mods34','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.pubIds','urn','URNPubIdPlugin',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.pubIds','doi','DOIPubIdPlugin',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','acron','',0,1),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2022-11-05 02:53:23',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,2,0,0,'2022-11-05 02:53:23',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2022-11-05 02:53:23',1,'plugins.paymethod','manual','',0,0),(3,2,1,5,'2022-11-05 02:53:21',1,'core','omp','',0,1);
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

-- Dump completed on 2022-11-05  3:29:21
