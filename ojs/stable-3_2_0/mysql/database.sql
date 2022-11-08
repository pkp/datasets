-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: ojs-ci
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
INSERT INTO `author_settings` VALUES (1,'','country','ZA',NULL),(1,'en_US','affiliation','University of Cape Town',NULL),(1,'en_US','familyName','Mwandenga',NULL),(1,'en_US','givenName','Alan',NULL),(2,'','country','ZA',NULL),(2,'','orcid','',NULL),(2,'','url','',NULL),(2,'en_US','affiliation','',NULL),(2,'en_US','biography','',NULL),(2,'en_US','familyName','Ipsum',NULL),(2,'en_US','givenName','Lorem',NULL),(2,'en_US','preferredPublicName','',NULL),(2,'fr_CA','affiliation','',NULL),(2,'fr_CA','biography','',NULL),(2,'fr_CA','familyName','',NULL),(2,'fr_CA','givenName','',NULL),(2,'fr_CA','preferredPublicName','',NULL),(3,'','country','ZA',NULL),(3,'','orcid','',NULL),(3,'','url','',NULL),(3,'en_US','affiliation','University of Cape Town',NULL),(3,'en_US','biography','',NULL),(3,'en_US','familyName','Mwandenga Version 2',NULL),(3,'en_US','givenName','Alan',NULL),(3,'en_US','preferredPublicName','',NULL),(3,'fr_CA','affiliation','',NULL),(3,'fr_CA','biography','',NULL),(3,'fr_CA','familyName','',NULL),(3,'fr_CA','givenName','',NULL),(3,'fr_CA','preferredPublicName','',NULL),(4,'','country','ZA',NULL),(4,'','orcid','',NULL),(4,'','url','',NULL),(4,'en_US','affiliation','',NULL),(4,'en_US','biography','',NULL),(4,'en_US','familyName','Ipsum',NULL),(4,'en_US','givenName','Lorem',NULL),(4,'en_US','preferredPublicName','',NULL),(4,'fr_CA','affiliation','',NULL),(4,'fr_CA','biography','',NULL),(4,'fr_CA','familyName','',NULL),(4,'fr_CA','givenName','',NULL),(4,'fr_CA','preferredPublicName','',NULL),(5,'','country','IT',NULL),(5,'en_US','affiliation','University of Bologna',NULL),(5,'en_US','familyName','Corino',NULL),(5,'en_US','givenName','Carlo',NULL),(6,'','country','CA',NULL),(6,'en_US','affiliation','University of Windsor',NULL),(6,'en_US','familyName','Kwantes',NULL),(6,'en_US','givenName','Catherine',NULL),(7,'','country','CA',NULL),(7,'en_US','affiliation','University of Alberta',NULL),(7,'en_US','familyName','Montgomerie',NULL),(7,'en_US','givenName','Craig',NULL),(8,'','country','CA',NULL),(8,'','orcid','',NULL),(8,'','url','',NULL),(8,'en_US','affiliation','University of Victoria',NULL),(8,'en_US','biography','',NULL),(8,'en_US','familyName','Irvine',NULL),(8,'en_US','givenName','Mark',NULL),(8,'en_US','preferredPublicName','',NULL),(8,'fr_CA','affiliation','',NULL),(8,'fr_CA','biography','',NULL),(8,'fr_CA','familyName','',NULL),(8,'fr_CA','givenName','',NULL),(8,'fr_CA','preferredPublicName','',NULL),(9,'','country','EG',NULL),(9,'en_US','affiliation','Alexandria University',NULL),(9,'en_US','familyName','Diouf',NULL),(9,'en_US','givenName','Diaga',NULL),(10,'','country','CA',NULL),(10,'en_US','affiliation','University of Toronto',NULL),(10,'en_US','familyName','Phillips',NULL),(10,'en_US','givenName','Dana',NULL),(11,'','country','IE',NULL),(11,'en_US','affiliation','University College Cork',NULL),(11,'en_US','familyName','Sokoloff',NULL),(11,'en_US','givenName','Domatilia',NULL),(12,'','country','US',NULL),(12,'en_US','affiliation','Indiana University',NULL),(12,'en_US','familyName','Ostrom',NULL),(12,'en_US','givenName','Elinor',NULL),(13,'','country','US',NULL),(13,'','orcid','',NULL),(13,'','url','',NULL),(13,'en_US','affiliation','Indiana University',NULL),(13,'en_US','biography','',NULL),(13,'en_US','familyName','van Laerhoven',NULL),(13,'en_US','givenName','Frank',NULL),(13,'en_US','preferredPublicName','',NULL),(13,'fr_CA','affiliation','',NULL),(13,'fr_CA','biography','',NULL),(13,'fr_CA','familyName','',NULL),(13,'fr_CA','givenName','',NULL),(13,'fr_CA','preferredPublicName','',NULL),(14,'','country','IT',NULL),(14,'en_US','affiliation','University of Rome',NULL),(14,'en_US','familyName','Paglieri',NULL),(14,'en_US','givenName','Fabio',NULL),(15,'en_US','familyName','admin',NULL),(15,'en_US','givenName','admin',NULL),(16,'','country','DK',NULL),(16,'en_US','affiliation','Aalborg University',NULL),(16,'en_US','familyName','Novak',NULL),(16,'en_US','givenName','John',NULL),(17,'','country','US',NULL),(17,'en_US','affiliation','Stanford University',NULL),(17,'en_US','familyName','Al-Khafaji',NULL),(17,'en_US','givenName','Karim',NULL),(18,'','country','US',NULL),(18,'','orcid','',NULL),(18,'','url','',NULL),(18,'en_US','affiliation','Stanford University',NULL),(18,'en_US','biography','',NULL),(18,'en_US','familyName','Morse',NULL),(18,'en_US','givenName','Margaret',NULL),(18,'en_US','preferredPublicName','',NULL),(18,'fr_CA','affiliation','',NULL),(18,'fr_CA','biography','',NULL),(18,'fr_CA','familyName','',NULL),(18,'fr_CA','givenName','',NULL),(18,'fr_CA','preferredPublicName','',NULL),(19,'','country','AU',NULL),(19,'en_US','affiliation','Australian National University',NULL),(19,'en_US','familyName','Christopher',NULL),(19,'en_US','givenName','Leo',NULL),(20,'','country','ZA',NULL),(20,'en_US','affiliation','University of Cape Town',NULL),(20,'en_US','familyName','Kumiega',NULL),(20,'en_US','givenName','Lise',NULL),(21,'','country','GB',NULL),(21,'en_US','affiliation','University of Wolverhampton',NULL),(21,'en_US','familyName','Daniel',NULL),(21,'en_US','givenName','Patricia',NULL),(22,'','country','KE',NULL),(22,'en_US','affiliation','University of Nairobi',NULL),(22,'en_US','familyName','Baiyewu',NULL),(22,'en_US','givenName','Rana',NULL),(23,'','country','ES',NULL),(23,'en_US','affiliation','Barcelona University',NULL),(23,'en_US','familyName','Rossi',NULL),(23,'en_US','givenName','Rosanna',NULL),(24,'','country','IR',NULL),(24,'en_US','affiliation','University of Tehran',NULL),(24,'en_US','familyName','Karbasizaed',NULL),(24,'en_US','givenName','Vajiheh',NULL),(25,'','country','CA',NULL),(25,'en_US','affiliation','University of Windsor',NULL),(25,'en_US','familyName','Williamson',NULL),(25,'en_US','givenName','Valerie',NULL),(26,'','country','US',NULL),(26,'en_US','affiliation','CUNY',NULL),(26,'en_US','familyName','Woods',NULL),(26,'en_US','givenName','Zita',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'amwandenga@mailinator.com',1,1,NULL,0,14),(2,'lorem@mailinator.com',1,1,NULL,1,14),(3,'amwandenga@mailinator.com',1,2,NULL,0,14),(4,'lorem@mailinator.com',1,2,NULL,0,14),(5,'ccorino@mailinator.com',1,3,NULL,0,14),(6,'ckwantes@mailinator.com',1,4,NULL,0,14),(7,'cmontgomerie@mailinator.com',1,5,NULL,0,14),(8,'mirvine@mailinator.com',1,5,NULL,1,14),(9,'ddiouf@mailinator.com',1,6,NULL,0,14),(10,'dphillips@mailinator.com',1,7,NULL,0,14),(11,'dsokoloff@mailinator.com',1,8,NULL,0,14),(12,'eostrom@mailinator.com',1,9,NULL,0,14),(13,'fvanlaerhoven@mailinator.com',1,9,NULL,1,14),(14,'fpaglieri@mailinator.com',1,10,NULL,0,14),(15,'defstat@gmail.com',1,11,NULL,0,2),(16,'jnovak@mailinator.com',1,12,NULL,0,14),(17,'kalkhafaji@mailinator.com',1,13,NULL,0,14),(18,'mmorse@mailinator.com',1,13,NULL,1,14),(19,'lchristopher@mailinator.com',1,14,NULL,0,14),(20,'lkumiega@mailinator.com',1,15,NULL,0,14),(21,'pdaniel@mailinator.com',1,16,NULL,0,14),(22,'rbaiyewu@mailinator.com',1,17,NULL,0,14),(23,'rrossi@mailinator.com',1,18,NULL,0,14),(24,'vkarbasizaed@mailinator.com',1,19,NULL,0,14),(25,'vwilliamson@mailinator.com',1,20,NULL,0,14),(26,'zwoods@mailinator.com',1,21,NULL,0,14);
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
  `assoc_id` bigint(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,1),(9,2,2),(10,2,3),(11,2,4),(12,2,5),(13,2,6),(14,2,7),(15,3,1),(16,3,2),(17,3,3),(18,4,1),(19,4,2),(20,4,3),(21,4,4),(22,4,5),(23,4,6),(24,4,7),(25,5,1),(26,5,2),(27,5,3),(28,6,1),(29,6,2),(30,6,3),(31,6,4),(32,6,5),(33,6,6),(34,6,7),(35,6,8),(36,6,9),(37,6,10),(38,6,11),(39,6,12),(40,7,1),(41,7,2),(54,24,1),(55,24,2),(68,2588,1),(69,2588,2),(72,4857,1),(73,4857,2),(74,4857,3),(75,4857,4),(76,5783,1),(77,5783,2),(78,6584,1),(79,6584,2),(80,6584,3),(81,6584,4),(82,6584,5),(83,6584,6),(84,6584,7),(85,8962,1),(86,8962,2),(87,9888,1),(88,9888,2),(89,9888,3),(93,11664,1),(94,11664,2),(95,11664,3),(96,11721,1),(97,13162,1),(98,13162,2),(99,13162,3),(100,13162,4),(101,13418,1),(102,13418,2),(103,14414,1),(104,17530,1),(105,17530,2),(106,17530,3),(107,17530,4),(108,17530,5),(109,17530,6),(110,17530,7),(111,17530,8),(112,17530,9),(113,17530,10),(114,19192,1),(115,19192,2),(116,21409,1),(117,21409,2),(118,21409,3);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','name','journal','string'),(2,'','name','issue','string'),(3,'','name','article','string'),(4,'','name','proceeding','string'),(5,'','name','conference','string'),(6,'','name','preprint','string'),(7,'','name','unknown','string'),(8,'','name','book','string'),(9,'','name','bookitem','string'),(10,'','name','proceeding','string'),(11,'','name','conference','string'),(12,'','name','report','string'),(13,'','name','document','string'),(14,'','name','unknown','string'),(15,'','name','personal','string'),(16,'','name','corporate','string'),(17,'','name','conference','string'),(18,'','description','Author','string'),(18,'','name','aut','string'),(19,'','description','Contributor','string'),(19,'','name','ctb','string'),(20,'','description','Editor','string'),(20,'','name','edt','string'),(21,'','description','Illustrator','string'),(21,'','name','ill','string'),(22,'','description','Photographer','string'),(22,'','name','pht','string'),(23,'','description','Sponsor','string'),(23,'','name','spn','string'),(24,'','description','Translator','string'),(24,'','name','trl','string'),(25,'','name','multimedia','string'),(26,'','name','still image','string'),(27,'','name','text','string'),(28,'','name','article','string'),(29,'','name','book','string'),(30,'','name','conference publication','string'),(31,'','name','issue','string'),(32,'','name','journal','string'),(33,'','name','newspaper','string'),(34,'','name','picture','string'),(35,'','name','review','string'),(36,'','name','periodical','string'),(37,'','name','series','string'),(38,'','name','thesis','string'),(39,'','name','web site','string'),(40,'','name','electronic','string'),(41,'','name','print','string'),(54,'en_US','submissionKeyword','Professional Development','string'),(55,'en_US','submissionKeyword','Social Transformation','string'),(68,'en_US','submissionKeyword','Professional Development','string'),(69,'en_US','submissionKeyword','Social Transformation','string'),(72,'en_US','submissionKeyword','pigs','string'),(73,'en_US','submissionKeyword','food security','string'),(74,'en_US','submissionKeyword','Professional Development','string'),(75,'en_US','submissionKeyword','Social Transformation','string'),(76,'en_US','submissionKeyword','employees','string'),(77,'en_US','submissionKeyword','survey','string'),(78,'en_US','submissionKeyword','Integrating Technology','string'),(79,'en_US','submissionKeyword','Computer Skills','string'),(80,'en_US','submissionKeyword','Survey','string'),(81,'en_US','submissionKeyword','Alberta','string'),(82,'en_US','submissionKeyword','National','string'),(83,'en_US','submissionKeyword','Provincial','string'),(84,'en_US','submissionKeyword','Professional Development','string'),(85,'en_US','submissionKeyword','education','string'),(86,'en_US','submissionKeyword','citizenship','string'),(87,'en_US','submissionKeyword','Common pool resource','string'),(88,'en_US','submissionKeyword','common property','string'),(89,'en_US','submissionKeyword','intellectual developments','string'),(93,'en_US','submissionKeyword','test','string'),(94,'en_US','submissionKeyword','test2','string'),(95,'en_US','submissionKeyword','test3','string'),(96,'en_US','submissionKeyword','water','string'),(97,'en_US','submissionKeyword','Development','string'),(98,'en_US','submissionKeyword','engineering education','string'),(99,'en_US','submissionKeyword','service learning','string'),(100,'en_US','submissionKeyword','sustainability','string'),(101,'en_US','submissionKeyword','pigs','string'),(102,'en_US','submissionKeyword','food security','string'),(103,'en_US','submissionKeyword','water','string'),(104,'en_US','submissionKeyword','21st Century','string'),(105,'en_US','submissionKeyword','Diversity','string'),(106,'en_US','submissionKeyword','Multilingual','string'),(107,'en_US','submissionKeyword','Multiethnic','string'),(108,'en_US','submissionKeyword','Participatory Pedagogy','string'),(109,'en_US','submissionKeyword','Language','string'),(110,'en_US','submissionKeyword','Culture','string'),(111,'en_US','submissionKeyword','Gender','string'),(112,'en_US','submissionKeyword','Egalitarianism','string'),(113,'en_US','submissionKeyword','Social Transformation','string'),(114,'en_US','submissionKeyword','cattle','string'),(115,'en_US','submissionKeyword','food security','string'),(116,'en_US','submissionKeyword','Self-Organization','string'),(117,'en_US','submissionKeyword','Multi-Level Institutions','string'),(118,'en_US','submissionKeyword','Goverance','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=23785 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (8,'interest',0,0),(6,'mods34-genre-marcgt',0,0),(4,'mods34-name-role-roleTerms-marcrelator',0,0),(3,'mods34-name-types',0,0),(7,'mods34-physicalDescription-form-marcform',0,0),(5,'mods34-typeOfResource',0,0),(2,'openurl10-book-genres',0,0),(1,'openurl10-journal-genres',0,0),(28,'submissionAgency',1048588,1),(2592,'submissionAgency',1048588,2),(4861,'submissionAgency',1048588,3),(5787,'submissionAgency',1048588,4),(6588,'submissionAgency',1048588,5),(6864,'submissionAgency',1048588,6),(7930,'submissionAgency',1048588,7),(8966,'submissionAgency',1048588,8),(9892,'submissionAgency',1048588,9),(10168,'submissionAgency',1048588,10),(11668,'submissionAgency',1048588,11),(11725,'submissionAgency',1048588,12),(13166,'submissionAgency',1048588,13),(13422,'submissionAgency',1048588,14),(14418,'submissionAgency',1048588,15),(17534,'submissionAgency',1048588,16),(17760,'submissionAgency',1048588,17),(19196,'submissionAgency',1048588,18),(19422,'submissionAgency',1048588,19),(21413,'submissionAgency',1048588,20),(22444,'submissionAgency',1048588,21),(26,'submissionDiscipline',1048588,1),(2590,'submissionDiscipline',1048588,2),(4859,'submissionDiscipline',1048588,3),(5785,'submissionDiscipline',1048588,4),(6586,'submissionDiscipline',1048588,5),(6862,'submissionDiscipline',1048588,6),(7928,'submissionDiscipline',1048588,7),(8964,'submissionDiscipline',1048588,8),(9890,'submissionDiscipline',1048588,9),(10166,'submissionDiscipline',1048588,10),(11666,'submissionDiscipline',1048588,11),(11723,'submissionDiscipline',1048588,12),(13164,'submissionDiscipline',1048588,13),(13420,'submissionDiscipline',1048588,14),(14416,'submissionDiscipline',1048588,15),(17532,'submissionDiscipline',1048588,16),(17758,'submissionDiscipline',1048588,17),(19194,'submissionDiscipline',1048588,18),(19420,'submissionDiscipline',1048588,19),(21411,'submissionDiscipline',1048588,20),(22442,'submissionDiscipline',1048588,21),(24,'submissionKeyword',1048588,1),(2588,'submissionKeyword',1048588,2),(4857,'submissionKeyword',1048588,3),(5783,'submissionKeyword',1048588,4),(6584,'submissionKeyword',1048588,5),(6860,'submissionKeyword',1048588,6),(7926,'submissionKeyword',1048588,7),(8962,'submissionKeyword',1048588,8),(9888,'submissionKeyword',1048588,9),(10164,'submissionKeyword',1048588,10),(11664,'submissionKeyword',1048588,11),(11721,'submissionKeyword',1048588,12),(13162,'submissionKeyword',1048588,13),(13418,'submissionKeyword',1048588,14),(14414,'submissionKeyword',1048588,15),(17530,'submissionKeyword',1048588,16),(17756,'submissionKeyword',1048588,17),(19192,'submissionKeyword',1048588,18),(19418,'submissionKeyword',1048588,19),(21409,'submissionKeyword',1048588,20),(22440,'submissionKeyword',1048588,21),(27,'submissionLanguage',1048588,1),(2591,'submissionLanguage',1048588,2),(4860,'submissionLanguage',1048588,3),(5786,'submissionLanguage',1048588,4),(6587,'submissionLanguage',1048588,5),(6863,'submissionLanguage',1048588,6),(7929,'submissionLanguage',1048588,7),(8965,'submissionLanguage',1048588,8),(9891,'submissionLanguage',1048588,9),(10167,'submissionLanguage',1048588,10),(11667,'submissionLanguage',1048588,11),(11724,'submissionLanguage',1048588,12),(13165,'submissionLanguage',1048588,13),(13421,'submissionLanguage',1048588,14),(14417,'submissionLanguage',1048588,15),(17533,'submissionLanguage',1048588,16),(17759,'submissionLanguage',1048588,17),(19195,'submissionLanguage',1048588,18),(19421,'submissionLanguage',1048588,19),(21412,'submissionLanguage',1048588,20),(22443,'submissionLanguage',1048588,21),(25,'submissionSubject',1048588,1),(2589,'submissionSubject',1048588,2),(4858,'submissionSubject',1048588,3),(5784,'submissionSubject',1048588,4),(6585,'submissionSubject',1048588,5),(6861,'submissionSubject',1048588,6),(7927,'submissionSubject',1048588,7),(8963,'submissionSubject',1048588,8),(9889,'submissionSubject',1048588,9),(10165,'submissionSubject',1048588,10),(11665,'submissionSubject',1048588,11),(11722,'submissionSubject',1048588,12),(13163,'submissionSubject',1048588,13),(13419,'submissionSubject',1048588,14),(14415,'submissionSubject',1048588,15),(17531,'submissionSubject',1048588,16),(17757,'submissionSubject',1048588,17),(19193,'submissionSubject',1048588,18),(19419,'submissionSubject',1048588,19),(21410,'submissionSubject',1048588,20),(22441,'submissionSubject',1048588,21);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,3,8,'2022-11-07 23:56:27'),(2,1,1,3,1,3,1,'2022-11-07 23:56:44'),(3,1,0,4,0,3,7,'2022-11-07 23:56:53'),(4,2,0,1,0,3,8,'2022-11-07 23:59:03'),(5,2,2,3,1,6,11,'2022-11-07 23:59:19'),(6,3,0,1,0,3,8,'2022-11-07 23:59:49'),(7,3,3,3,1,3,1,'2022-11-08 00:00:02'),(8,5,0,1,0,3,8,'2022-11-08 00:00:52'),(9,5,4,3,1,3,1,'2022-11-08 00:01:06'),(10,5,0,4,0,3,7,'2022-11-08 00:01:13'),(11,6,0,1,0,3,8,'2022-11-08 00:01:47'),(12,6,5,3,1,3,1,'2022-11-08 00:02:01'),(13,6,0,4,0,3,7,'2022-11-08 00:02:09'),(14,7,0,1,0,3,8,'2022-11-08 00:02:39'),(15,9,0,1,0,3,8,'2022-11-08 00:03:48'),(16,9,7,3,1,3,1,'2022-11-08 00:04:01'),(17,9,0,4,0,3,7,'2022-11-08 00:04:09'),(18,11,0,1,0,3,8,'2022-11-08 00:04:51'),(19,13,0,1,0,3,8,'2022-11-08 00:06:05'),(20,14,0,1,0,3,8,'2022-11-08 00:06:42'),(21,14,10,3,1,3,2,'2022-11-08 00:07:37'),(22,16,0,1,0,3,8,'2022-11-08 00:08:20'),(23,16,11,3,1,3,1,'2022-11-08 00:08:33'),(24,16,0,4,0,3,7,'2022-11-08 00:08:41'),(25,18,0,1,0,3,8,'2022-11-08 00:09:32'),(26,18,12,3,1,3,1,'2022-11-08 00:09:46'),(27,18,0,4,0,3,7,'2022-11-08 00:09:54'),(28,19,0,1,0,3,9,'2022-11-08 00:10:45'),(29,20,0,1,0,3,8,'2022-11-08 00:11:12'),(30,20,13,3,1,3,1,'2022-11-08 00:11:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL),(7,'REVIEWER_REGISTER',0,1,NULL,NULL),(8,'PUBLISH_NOTIFY',0,1,NULL,NULL),(9,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL),(10,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL),(11,'SUBMISSION_ACK',1,1,NULL,65536),(12,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536),(13,'EDITOR_ASSIGN',1,1,16,16),(14,'REVIEW_CANCEL',1,1,16,4096),(15,'REVIEW_REINSTATE',1,1,16,4096),(16,'REVIEW_REQUEST',1,1,16,4096),(17,'REVIEW_REQUEST_SUBSEQUENT',1,1,16,4096),(18,'REVIEW_REQUEST_ONECLICK',1,1,16,4096),(19,'REVIEW_REQUEST_ONECLICK_SUBSEQUENT',1,1,16,4096),(20,'REVIEW_REQUEST_ATTACHED',0,1,16,4096),(21,'REVIEW_REQUEST_ATTACHED_SUBSEQUENT',0,1,16,4096),(22,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096),(23,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(24,'REVIEW_CONFIRM',1,1,4096,16),(25,'REVIEW_DECLINE',1,1,4096,16),(26,'REVIEW_ACK',1,1,16,4096),(27,'REVIEW_REMIND',0,1,16,4096),(28,'REVIEW_REMIND_AUTO',0,1,NULL,4096),(29,'REVIEW_REMIND_ONECLICK',0,1,16,4096),(30,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(31,'EDITOR_DECISION_ACCEPT',0,1,16,65536),(32,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536),(33,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536),(34,'EDITOR_DECISION_REVISIONS',0,1,16,65536),(35,'EDITOR_DECISION_RESUBMIT',0,1,16,65536),(36,'EDITOR_DECISION_DECLINE',0,1,16,65536),(37,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536),(38,'EDITOR_RECOMMENDATION',0,1,16,16),(39,'COPYEDIT_REQUEST',1,1,16,4097),(40,'LAYOUT_REQUEST',1,1,16,4097),(41,'LAYOUT_COMPLETE',1,1,4097,16),(42,'EMAIL_LINK',0,1,1048576,NULL),(43,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576),(44,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576),(45,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576),(46,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576),(47,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576),(48,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152),(49,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152),(50,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152),(51,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152),(52,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL),(53,'REVISED_VERSION_NOTIFY',0,1,NULL,16),(54,'STATISTICS_REPORT_NOTIFICATION',0,1,16,17),(55,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL),(56,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL),(57,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL),(58,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),('CITATION_EDITOR_AUTHOR_QUERY','fr_CA','Modification des références bibliographiques','{$authorFirstName},<br />\n<br />\nPourriez-vous vérifier ou nous fournir la référence bibliographique complète pour la référence suivante, provenant de votre article « {$submissionTitle} »  :<br />\n<br />\n{$rawCitation}<br />\n<br />\nMerci!<br />\n<br />\n{$userFirstName}<br />\nRéviseur-e, revue {$contextName}<br />\n','Ce courriel permet aux réviseurs-es de demander des renseignements additionnels à propos des références bibliographiques citées par les auteurs-es.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','fr_CA','Demande de révision d\'une soumission','{$participantName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$contextName} : {$contextUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$participantUsername}','Ce courriel du, de la rédacteur-trice de rubrique à un-e réviseur-e lui demande de procéder à la révision. Il fournit les renseignements sur la soumission et comment accéder à celle-ci.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),('EDITOR_ASSIGN','fr_CA','Assignation d\'un-e rédacteur-trice','{$editorialContactName},<br />\n<br />\nLa soumission intitulée « {$submissionTitle} » pour la revue {$contextName} vous a été attribuée. Vous êtes responsable, en tant que rédacteur-trice de rubrique, de la faire cheminer à travers le processus éditorial.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$editorUsername}<br />\n<br />\nMerci.','Ce courriel avise un,une rédacteur-trice de rubrique que le,la rédacteur-trice lui a assigné la tâche de suivre une soumission durant le processus éditorial. Il fournit des renseignements sur la soumission, et comment accéder au site Web de la revue.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','fr_CA','Décision du rédacteur','{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est d\'accepter votre soumission.','Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision finale concernant sa soumission, soit d\'accepter sa soumission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),('EDITOR_DECISION_DECLINE','fr_CA','Décision du rédacteur','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est de refuser votre soumission.','Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit de refuser la soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the editor declines their submission initially, before the review stage'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Décision du rédacteur','\n			{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$contextName}.<br />\n<br />\nNotre décision est de refuser votre soumission.','Cet courriel est envoyé à l\'auteur-e si la soumission est refusée avant même l\'étape d\'évaluation'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review','This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','fr_CA','Décision du rédacteur','{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.','Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique un-e auteur-e le,la notifie de la décision finale concernant sa soumission, soit de demander d\'y apporter des révisions et la soumettre à nouveau.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required','This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','fr_CA','Décision du rédacteur','{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.','Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision finale concernant sa soumission, soit de demander d\'y apporter des révisions.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Décision du rédacteur','{$authorName},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$contextName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}','Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit d\'envoyer sa soumission en évaluation externe.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Décision du rédacteur','{$authorName},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}','Ce courriel du,de la rédacteur-trice ou du,de la rédacteur-trice de rubrique à un-e auteur-e le,la notifie de la décision concernant sa soumission, soit d\'envoyer sa soumission en production.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EDITOR_RECOMMENDATION','fr_CA','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$contextName} est de : {$recommendation}','Ce courriel envoyé par le,la rédacteur-trice ou le,la rédacteur-trice de rubrique en charge de la recommandation au,à la rédacteur-trice ou au,à la rédacteur-trice de rubrique en charge de la prise de décisions l\'informe d\'une recommandation finale concernant la soumission.'),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('EMAIL_LINK','fr_CA','Article potentiellement intéressant','Je pense que l\'article suivant pourrait vous intéresser : « {$submissionTitle} » par {$authorName}, publié dans le volume {$volume}, numéro {$number} de ({$year}) de la revue {$contextName}, à l\'adresse suivante : {$articleUrl}.','Ce modèle de courriel fournit à un,une lecteur-trice inscrit-e l\'occasion d\'envoyer de l\'information à quelqu\'un qui peut être intéressé par un article en particulier. Il est disponible via Outils de lecture et doit être activé par le,la directeur-trice de la revue à la page Gestion des outils de lecture.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','fr_CA','Mise en page des épreuves terminée','{$editorialContactName},<br />\n<br />\nLes épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName} sont maintenant prêtes pour la relecture.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec moi.<br />\n<br />\n{$participantName}','Ce courriel du,de la responsable de la mise en page au,à la rédacteur-trice de rubrique l\'avise que l\'étape de mise en page est complétée.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','fr_CA','Demande de mise en page des épreuves','{$participantName},<br />\n<br />\nJ\'aimerais que vous prépariez les épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et utiliser les fichiers disponibles sous Fichiers prêts pour la production pour créer les épreuves en fonction des normes de la revue.<br />\n3. Téléverser les épreuves dans la section Épreuves.<br />\n4. Informer le,la rédacteur-trice, via une discussion sur la production, que les épreuves ont été téléversées et qu\'elles sont prêtes.<br />\n<br />\nURL de la revue {$contextName} : {$contextUrl}<br />\nURL du manuscrit : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.','Ce courriel du,de la rédacteur-trice de rubrique au, à la responsable de la mise en page l\'avise qu\'il ou elle a été assigné-e à la réalisation de la mise en page de la soumission. Il fournit les renseignements sur la soumission et comment accéder à celle-ci.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_EXISTING_ARCHIVE','fr_CA','Demande d\'archivage pour la revue {$contextName}','Cher,Chère [Bibliothécaire universitaire],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; est une revue pour laquelle un membre de votre faculté, [nom du membre], agit à titre de [titre de la position occupée]. La revue désire mettre en place un système d\'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe - Plusieurs exemplaires assurent la sécurité) avec votre bibliothèque ainsi que celles d\'autres universités.<br />\n<br />\n[Brève description de la revue]<br />\n<br />\nL\'adresse URL pour le LOCKSS Publisher Manifest pour notre revue est : {$contextUrl}/gateway/lockss<br />\n<br />\nNous croyons savoir que vous participez déjà à LOCKSS. Si nous pouvons vous fournir des métadonnées supplémentaires afin d\'inscrire notre revue avec votre version de LOCKSS, il nous fera plaisir de vous les fournir.<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel demande à un-e conservateur,trice d\'archives LOCKSS d\'envisager d\'inclure cette revue dans leur archive. Il fournit l\'adresse URL du LOCKSS Publisher Manifest de la revue.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('LOCKSS_NEW_ARCHIVE','fr_CA','Demande d\'archivage pour la revue {$contextName}','Cher,Chère [Bibliothécaire universitaire],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt;, est une revue pour laquelle un membre de votre faculté, [nom du membre], agit à titre de [titre de la fonction occupée]. La revue désire mettre en place un système d\'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe) avec votre bibliothèque et celles d\'autres universités.<br />\n<br />\n[Brève description de la revue]<br />\n<br />\nLe programme LOCKSS &lt;http://lockss.org/&gt;, une initiative de bibliothécaires et d\'éditeurs internationaux, est une belle démonstration d\'un dépôt d\'archives assurant la préservation des documents. Voir les détails ci-dessous. Le logiciel est gratuit et fonctionne sur tout ordinateur personnel. Il est facile de le mettre en ligne et ne requiert que très peu de maintenance.<br />\n<br />\nPour nous aider dans le processus d\'archivage de notre revue, nous vous invitons à devenir membre de la communauté LOCKSS, pour aider à recueillir et préserver des titres produits par votre faculté et par d\'autres chercheurs à travers le monde. Pour ce faire, veuillez demander à quelqu\'un de votre personnel de visiter le site Internet de LOCKSS pour voir les informations sur le fonctionnement du système. Nous attendons de vos nouvelles sur la faisabilité, pour vous, de fournir un support d\'archivage pour cette revue.<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel encourage le ou la destinaire à participer à l\'initiative LOCKSS et à inclure cette revue dans leur archives. Il fournit de l\'information au sujet de LOCKSS et des façons de s\'impliquer dans le projet.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('MANUAL_PAYMENT_NOTIFICATION','fr_CA','Avis de paiement manuel','Un paiement manuel doit être traité pour la revue {$contextName} et l\'utilisateur {$userFullName} (nom d\'utilisateur &quot;{$userName}&quot;).<br />\n<br />\nL\'élément facturé est &quot;{$itemName}&quot;.<br />\nLe coût est de {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.','Ce modèle de courriel est utilisé pour aviser un directeur de revue que le paiement manuel a été demandé.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message à propos de la revue {$contextName}','Prière de saisir votre message.','Message blanc par défaut utilisé pour concevoir d\'autres messages.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('OPEN_ACCESS_NOTIFY','fr_CA','Le numéro est maintenant en libre accès','Chers lecteurs et lectrices,<br />\n<br />\nLa revue {$contextName} vient de rendre disponible en libre accès le numéro suivant. Nous vous invitons à lire ici le sommaire puis visiter notre site Web ({$contextUrl}) pour lire les articles et autres textes qui pourraient vous intéresser.<br />\n<br />\nMerci de votre intérêt continu pour notre travail.<br />\n{$editorialContactSignature}','Ce courriel est envoyé aux lecteurs-trices inscrits-es qui ont demandé à recevoir un avis par courriel quand un numéro devient disponible en libre accès.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec la revue.<br />\n<br />\nVotre nom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PAYPAL_INVESTIGATE_PAYMENT','fr_CA','Activité inhabituelle de PayPal','L\'Open Journal Systems a remarqué une activité inhabituelle concernant la prise en charge du paiement PayPal pour la revue {$contextName}. Cette activité pourrait nécessiter une attention particulière ou une intervention manuelle.<br />\n                       <br />\nCe courriel a été généré par le plugiciel PayPal du Open Journal Systems.<br />\n<br />\nInformation complète de la demande :<br />\n{$postInfo}<br />\n<br />\nInformation supplémentaire (si fournie) :<br />\n{$additionalInfo}<br />\n<br />\nVariables serveur :<br />\n{$serverVars}<br />\n','Ce modèle de courriel est utilisé pour aviser un contact principal d\'une revue qu\'une activité inhabituelle ou requérant une intervention manuelle a été remarquée par le plugiciel PayPal.'),('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Parution du dernier numéro','Lecteurs-trices,<br />\n<br />\nLe plus récent numéro de la revue {$contextName} vient d\'être publié à l\'adresse suivante : {$contextUrl}. Nous vous invitons à consulter le sommaire, puis à visiter notre site Web pour y lire les articles qui vous intéressent.<br />\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre revue,<br />\n{$editorialContactSignature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices qu\'un nouveau numéro est publié et les invite à visiter la revue en cliquant sur l\'URL fourni.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','fr_CA','Inscription en tant qu\'évaluateur-trice pour la revue {$contextName}','Compte tenu de votre expertise, nous avons pris l\'initiative d\'inscrire votre nom dans la base de données des évaluateurs-trices de la revue {$contextName}. Cela ne vous engage d\'aucune façon, mais nous permet simplement de solliciter vos services pour l\'évaluation d\'une soumission. Si vous êtes invité-e à effectuer une évaluation, vous recevrez le titre et le résumé de l\'article en question, et serez toujours libre d\'accepter ou de refuser une telle invitation. À tout moment, il vous est également possible de demander à ce que votre nom soit retiré de la liste des évaluateurs-trices.<br />\n<br />\nNous vous acheminons un nom d\'utilisateur-trice et un mot de passe, car tous deux sont requis pour tout échange avec la revue via son site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise à jour de votre profil, y compris vos domaines d\'intérêt en matière d\'évaluation.<br />\n<br />\nNom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un,une évaluateur-trice nouvellement inscrit-e, afin de lui souhaiter la bienvenue dans le système et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','fr_CA','Accusé de réception de l\'évaluation d\'une soumission','{$reviewerName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.','Ce courriel est envoyé par le,la rédacteur-trice de rubrique, pour accuser réception d\'une évaluation terminée et remercier l\'évaluateur-trice de sa contribution.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','fr_CA','Annulation de la demande d\'évaluation','{$reviewerName},<br />\n<br />\nNous avons décidé d\'annuler notre demande concernant l\'évaluation du manuscrit intitulé « {$submissionTitle} » pour la revue {$contextName}. Nous sommes désolés des inconvénients que cela pourrait vous causer et espérons que nous pourrons de nouveau faire appel à vous pour contribuer au processus de révision par les pairs de cette revue dans le futur.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.','Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice qui a une évaluation en cours, pour l\'aviser que celle-ci a été annulée.'),('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','fr_CA','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé par l\'évaluateur-trice au,à la rédacteur-trice de rubrique en réponse à une demande d\'évaluation, pour l\'aviser que la demande a été acceptée et que l\'évaluation sera complétée au plus tard à la date spécifiée.'),('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),('REVIEW_DECLINE','fr_CA','Refus d\'évaluation','Rédacteurs-trices,<br />\n<br />\nPour le moment, il m\'est impossible d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$contextName}. Je vous remercie d\'avoir pensé à moi. N\'hésitez pas à communiquer avec moi pour un autre projet.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé par l\'évaluateur-trice au,à la rédacteur-trice de rubrique en réponse à la demande d\'évaluation, pour l\'aviser qu\'il ou elle ne peut effectuer l\'évaluation.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),('REVIEW_REINSTATE','fr_CA','Réintégration de la demande d\'évaluation','{$reviewerName},<br />\n<br />\nNous souhaitons rétablir notre demande d\'évaluation de la soumission, « {$ submissionTitle} » pour  la revue {$ contextName}. Nous espérons que vous pourrez contribuer au processus d\'évaluation de cette revue.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec moi.','Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice qui a une évaluation en cours, pour l\'aviser que la demande préalablement annulée a été rétablie.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','fr_CA','Rappel d\'évaluation d\'une soumission','{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le,la rédacteur-trice de rubrique pour rappeler à un,une évaluateur-trice que son évaluation est due.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsque la date d\'échéance de remise d\'une évaluation est révolue (voir Options d\'évaluation sous Paramètres > Flux des travaux > Évaluation) et que l\'accès de l\'évaluateur-trice en un clic est désactivé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsque la date d\'échéance de remise d\'une évaluation est révolue (voir Options d\'évaluation sous Paramètres > Flux des travaux > Évaluation) et que l\'accès de l\'évaluateur-trice en un clic est activé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','fr_CA','Rappel d\'évaluation d\'une soumission','{$reviewerName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice pour lui rappeler que son évaluation est due.'),('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$contextName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l\'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation. Le site Web se trouve à l\'adresse suivante : {$contextUrl}<br />\n<br />\nLa date d\'échéance de l\'évaluation a été fixée au {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas de nom d\'utilisateur-trice et de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}','Ce courriel du,de la rédacteur-trice à un,une évaluateur-trice demande que l\'évaluateur-trice accepte ou refuse la tâche d\'évaluation d\'une soumission. Il fournit de l\'information sur la soumission, tel son titre et un résumé, la date d\'échéance pour l\'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d\'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation. (Autrement voir « Demande d\'évaluation d\'un article (en pièce jointe) ».)'),('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} ». Nous espérons que vous envisagerez d\'entreprendre cette tâche essentielle à la publication de la revue. Les directives d\'évaluation de la revue se trouvent ci-dessous et la soumission est jointe au présent courriel. Votre évaluation de la soumission, ainsi que vos recommandations, devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez nous faire savoir par courriel d\'ici le {$responseDueDate} si vous acceptez ou non d\'effectuer cette évaluation.<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDirectives pour l\'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n','Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice pour lui demander s\'il ou elle accepte ou refuse la tâche d\'évaluation d\'une soumission. Il inclut la soumission en pièce jointe. Ce message est utilisé quand le processus de « Demande d\'évaluation par pièce-jointe de courriel » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation . (Autrement, voir « Demande d\'évaluation ».)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\n<br />\nCeci concerne le manuscrit « {$submissionTitle} », qui est présentement évalué par la revue {$contextName}.<br />\n<br />\nSuivant l\'évaluation de la dernière version du manuscrit, l\'auteur-e a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nLes directives d\'évaluation de la revue se trouvent ci-dessous et la soumission est jointe au présent courriel. Votre évaluation de la soumission, ainsi que vos recommandations, devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez nous faire savoir par courriel d\'ici le {$responseDueDate} si vous acceptez ou non d\'effectuer cette évaluation.<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDirectives pour l\'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n','Ce courriel est envoyé par le,la rédacteur-trice de rubrique à un,une évaluateur-trice pour lui demander s\'il ou elle accepte ou refuse la tâche d\'évaluation d\'une soumission pour un cycle subséquent d\'évaluation. Il inclut la soumission en pièce jointe. Ce message est utilisé quand le processus de « Demande d\'évaluation par pièce-jointe de courriel » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation . (Autrement voir « Demande d\'évaluation (cycle subséquent)».)'),('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$contextName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l\'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation.<br />\n<br />\nDate limite pour l\'évaluation {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}.<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}','Ce courriel du,de la rédacteur-trice de rubrique à un,une évaluateur-trice demande que l\'évaluateur-trice accepte ou décline la tâche d\'évaluation d\'une soumission. Il contient des informations sur la soumission tel que son titre et un résumé, la date d\'échéance pour faire l\'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d\'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation et que l\'accès de l\'évaluateur-trice en un clic a été activé.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\n<br />\nCeci concerne le manuscrit « {$submissionTitle} », qui est présentement évalué par la revue {$contextName}.<br />\n<br />\nSuivant l\'évaluation de la dernière version du manuscrit, l\'auteur a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations.<br />\n<br />\nL\'évaluation est due pour le {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} » <br />\n<br />\n{$submissionAbstract}','Ce courriel du,de la rédacteur-trice de rubrique à un,une évaluateur-trice demande que l\'évaluateur-trice accepte ou décline la tâche d\'évaluation d\'une soumission pour un cycle subséquent d\'évaluation. Il contient des informations sur la soumission tel que son titre et un résumé, la date d\'échéance pour faire l\'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d\'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation et que l\'accès de l\'évaluateur-trice en un clic est activé.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai.\n<br />\nNous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d\'entreprendre cette tâche essentielle à la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$contextUrl}<br />\n<br />\nL\'évaluation est dû pour le {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}','Ce courriel est envoyé automatiquement lorsque la date d\'échéance de confirmation d\'un,une évaluateur-trice est révolue (voir Options d\'évaluation sous Paramètres &gt; Flux des travaux &gt; Évaluation) et que l\'accès de l\'évaluateur-trice en un clic est désactivé. Les tâches planifiées doivent être activées et configurées (voir le fichier de configuration du site).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$contextName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai.\n<br />\nNous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d\'entreprendre cette tâche essentielle à la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations.<br />\n<br />\nL\'évaluation est dû pour le {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}','Ce courriel est automatiquement envoyé lorsque la date d\'échéance de confirmation d\'un,une évaluateur-trice est écoulée (voir Options de révision sous Paramètres &gt; Flux des travaux &gt; Révision) et l\'accès de l\'évaluateur-trice en un clic est activé. Les tâches planifiées doivent être configurées et activées (voir le fichier de configuration du site).'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVIEW_REQUEST_SUBSEQUENT','fr_CA','Demande d\'évaluation d\'un article','{$reviewerName},<br />\n<br />\nCeci concerne le manuscrit « {$submissionTitle} », qui est présentement évalué par {$contextName}.<br />\n<br />\nSuivant l\'évaluation de la dernière version du manuscrit, l\'auteur a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$contextUrl}<br />\n<br />\nL\'évaluation est due pour le {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$submissionReviewUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n« {$submissionTitle} » <br />\n<br />\n{$submissionAbstract}','Ce courriel du,de la rédacteur-trice de rubrique à un,une évaluateur-trice demande que l\'évaluateur-trice accepte ou décline la tâche d\'évaluation d\'une soumission pour un cycle subséquent d\'évaluation. Il contient des informations sur la soumission tel que son titre et un résumé, la date d\'échéance pour faire l\'évaluation, et comment accéder à la soumission. Ce message est utilisé quand « Processus d\'évaluation standard » est sélectionné dans Configuration de la revue > Paramètres > Flux des travaux > Évaluation (Autrement voir « Demande d\'évaluation d\'un article (cycle subséquent) ».)'),('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('REVISED_VERSION_NOTIFY','fr_CA','Version révisée téléversée','Rédacteurs-trices,<br />\n<br />\nUne version révisée de « {$submissionTitle} » a été téléversée par l\'auteur-e {$authorName}.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement au,à la rédacteur-trice assigné-e quand un-e auteur-e téléverse une version révisée d\'un article.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','Activité éditoriale pour {$month}, {$year}','\n{$name}, <br />\n<br />\nLe rapport d\'activité éditoriale de votre revue pour {$month}, {$year} est maintenant disponible. Les principales statistiques pour ce mois sont affichées ci-dessous.<br />\n<ul>\n	<li> Nouvelles soumissions pour ce mois : {$newSubmissions} </li>\n	<li> Soumissions refusées pour ce mois : {$rebuildsubmissions} </li>\n	<li> Soumissions acceptées pour ce mois : {$acceptedSubmissions} </li>\n	<li> Nombre total de soumissions dans la plateforme : {$totalSubmissions} </li>\n</ul>\nConnectez-vous au site de la revue pour voir davantage de <a href=\"{$editorialStatsLink}\">tendances dans l\'activité éditoriale</a> ainsi que des <a href=\"{$publicationStatsLink}\">statistiques relatives aux articles publiés</a>. Le rapport complet des tendances de l\'activité éditoriale de ce mois-ci est joint au présent envoi.<br />\n<br />\nCordialement,<br />\n{$principalContactSignature}','Ce courriel est envoyé automatiquement chaque mois aux rédacteurs et rédactrices en chef et aux directeurs et directrices de revues pour leur fournir un aperçu de l\'intégrité du système.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$authorName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$contextName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$authorUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la revue. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$contextName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OJS signalés-es comme effectuant la soumission.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY','fr_CA','Abonnement expiré','{$subscriberName},<br />\n<br />\nVotre abonnement à la revue {$contextName} est expiré.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d\'utilisateur-trice, soit « {$username} ».<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}','Ce courriel avise un-e abonné-e que son abonnement est expiré. Il fournit l\'adresse URL de la revue, ainsi que les instructions pour y accéder.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','fr_CA','Abonnement expiré - Dernier rappel','{$subscriberName},<br />\n<br />\nVotre abonnement à la revue {$contextName} est expiré. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoyé.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveller votre abonnement, aveuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$username} ».<br />\n<br />\nSi vous avez des questions, ne hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}','Ce courriel avise un-e abonné-e que son abonnement est expiré. Il donne l\'adresse URL de la revue ainsi que les instructions pour y accéder.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_BEFORE_EXPIRY','fr_CA','Avis d\'expiration de l\'abonnement','{$subscriberName},<br />\n<br />\nVotre abonnement à la revue {$contextName} expirera bientôt.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nAfin d\'assurer la continuité de votre accès à cette revue, nous vous invitons à aller sur le site Web de la revue et à renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$username} ».<br />\n<br />\nSi vous avez des questions, ne pas hésiter à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}','Ce courriel avise un-e abonné-e que son abonnement expirera sous peu. Il fournit l\'adresse URL de la revue, ainsi que les instructions pour y accéder.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_NOTIFY','fr_CA','Avis d\'abonnement','{$subscriberName},<br />\n<br />\nVous êtes maintenant abonné-e à notre système de gestion de revue en ligne pour la revue {$contextName}, avec le type d\'abonnement suivant  :<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour accéder au contenu destiné seulement aux abonnés, connectez-vous au système à l\'aide de votre nom d\'utilisateur-trice : {$username}.<br />\n<br />\nUne fois connecté-e dans le système, vous pouvez, en tout temps, modifier les renseignements de votre profil et votre mot de passe.<br />\n<br />\nVeuillez prendre note que si vous disposez d\'un abonnement institutionnel, les utilisateurs-trices n\'ont pas à entrer de nom d\'utilisateur-trice puisque le système authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionContactSignature}','Ce courriel avise un,une lecteur-trice inscrit-e que le,la directeur-trice de la revue lui a créé un abonnement. Il fournit l\'adresse URL de la revue ainsi que les instructions pour y accéder.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INDL','fr_CA','Souscription à un abonnement individuel','Une souscription en ligne à un abonnement individuel pour la revue {$contextName} avec les renseignements suivants :<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$userDetails}<br />\n<br />\nInformation d\'adhésion (si fournie) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivante.<br />\n<br />\nURL d\'abonnement : {$subscriptionUrl}<br/>\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement individuel a été souscrit en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour accéder à l\'abonnement souscrit.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','fr_CA','Souscription à un abonnement institutionnel','Souscription en ligne à un abonnement institutionnel pour la revue {$contextName} avec les renseignements suivants. Pour activer cet abonnement, veuillez utiliser l\'URL d\'abonnement fourni et fixer le statut de l\'abonnement à « actif ».<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$userDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant :<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement institutionnel a été souscrit en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour accéder à l\'abonnement souscrit.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INDL','fr_CA','Renouvellement d\'abonnement individuel','Un abonnement individuel a été renouvelé en ligne pour la revue {$contextName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$userDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement individuel a été renouvelé en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour accéder à l\'abonnement renouvelé.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','fr_CA','Renouvellement d\'abonnement institutionnel','Un abonnement institutionnel a été renouvelé en ligne pour la revue {$contextName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$userDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement institutionnel a été renouvelé en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour accéder à l\'abonnement renouvelé.'),('USER_REGISTER','en_US','Journal Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription à la revue','{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour la revue {$contextName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec la revue via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices de la revue en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue à la revue et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName},<br />\n<br />\nVous avez créé un compte pour la revue {$contextName}. Pour pouvoir commencer à l\'utiliser il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.');
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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,17,'2022-11-07 23:56:10',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,17,'2022-11-07 23:56:15',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,17,'2022-11-07 23:56:18',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,17,'2022-11-07 23:56:20',268435458,'submission.event.general.metadataUpdated',0),(5,1048585,1,17,'2022-11-07 23:56:21',268435457,'submission.event.submissionSubmitted',0),(6,1048585,1,3,'2022-11-07 23:56:27',805306371,'log.editor.decision',0),(7,1048585,1,3,'2022-11-07 23:56:33',1073741825,'log.review.reviewerAssigned',0),(8,1048585,1,3,'2022-11-07 23:56:38',1073741825,'log.review.reviewerAssigned',0),(9,1048585,1,3,'2022-11-07 23:56:42',1073741825,'log.review.reviewerAssigned',0),(10,1048585,1,3,'2022-11-07 23:56:44',805306371,'log.editor.decision',0),(11,1048585,1,3,'2022-11-07 23:56:50',268435459,'submission.event.participantAdded',0),(12,1048585,1,3,'2022-11-07 23:56:53',805306371,'log.editor.decision',0),(13,1048585,1,3,'2022-11-07 23:56:58',268435459,'submission.event.participantAdded',0),(14,1048585,1,3,'2022-11-07 23:57:02',268435459,'submission.event.participantAdded',0),(15,1048585,1,3,'2022-11-07 23:57:09',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,1,3,'2022-11-07 23:57:10',268435458,'submission.event.general.metadataUpdated',0),(17,1048585,1,3,'2022-11-07 23:57:11',268435458,'submission.event.general.metadataUpdated',0),(18,515,3,3,'2022-11-07 23:57:21',1342177281,'submission.event.fileUploaded',0),(19,1048585,1,3,'2022-11-07 23:57:22',1342177281,'submission.event.fileUploaded',0),(20,1048585,1,3,'2022-11-07 23:57:31',268435459,'submission.event.participantAdded',0),(21,1048585,1,17,'2022-11-07 23:57:37',268435458,'submission.event.general.metadataUpdated',0),(22,1048585,1,3,'2022-11-07 23:57:42',268435458,'submission.event.general.metadataUpdated',0),(23,1048585,1,3,'2022-11-07 23:57:42',268435462,'publication.event.published',0),(24,1048585,1,3,'2022-11-07 23:57:50',268435463,'publication.event.unpublished',0),(25,1048585,1,3,'2022-11-07 23:57:54',268435462,'publication.event.published',0),(26,1048585,1,3,'2022-11-07 23:57:57',268435458,'submission.event.general.metadataUpdated',0),(27,1048585,1,3,'2022-11-07 23:57:58',268435464,'publication.event.versionCreated',0),(28,1048585,1,3,'2022-11-07 23:58:08',268435458,'submission.event.general.metadataUpdated',0),(29,1048585,1,3,'2022-11-07 23:58:11',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,1,3,'2022-11-07 23:58:17',268435458,'submission.event.general.metadataUpdated',0),(31,1048585,1,3,'2022-11-07 23:58:18',268435462,'publication.event.versionPublished',0),(32,1048585,1,3,'2022-11-07 23:58:24',268435463,'publication.event.versionUnpublished',0),(33,1048585,1,3,'2022-11-07 23:58:29',268435459,'submission.event.participantAdded',0),(34,1048585,1,3,'2022-11-07 23:58:37',268435459,'submission.event.participantAdded',0),(35,1048585,2,18,'2022-11-07 23:58:47',268435458,'submission.event.general.metadataUpdated',0),(36,515,4,18,'2022-11-07 23:58:53',1342177281,'submission.event.fileUploaded',0),(37,1048585,2,18,'2022-11-07 23:58:55',1342177281,'submission.event.fileUploaded',0),(38,1048585,2,18,'2022-11-07 23:58:58',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,2,18,'2022-11-07 23:58:58',268435457,'submission.event.submissionSubmitted',0),(40,1048585,2,3,'2022-11-07 23:59:03',805306371,'log.editor.decision',0),(41,1048585,2,3,'2022-11-07 23:59:08',268435459,'submission.event.participantAdded',0),(42,1048585,2,3,'2022-11-07 23:59:12',268435458,'submission.event.general.metadataUpdated',0),(43,1048585,2,6,'2022-11-07 23:59:19',805306372,'log.editor.recommendation',0),(44,1048585,3,19,'2022-11-07 23:59:32',268435458,'submission.event.general.metadataUpdated',0),(45,515,5,19,'2022-11-07 23:59:38',1342177281,'submission.event.fileUploaded',0),(46,1048585,3,19,'2022-11-07 23:59:40',1342177281,'submission.event.fileUploaded',0),(47,1048585,3,19,'2022-11-07 23:59:43',268435458,'submission.event.general.metadataUpdated',0),(48,1048585,3,19,'2022-11-07 23:59:44',268435457,'submission.event.submissionSubmitted',0),(49,1048585,3,3,'2022-11-07 23:59:49',805306371,'log.editor.decision',0),(50,1048585,3,3,'2022-11-07 23:59:55',1073741825,'log.review.reviewerAssigned',0),(51,1048585,3,3,'2022-11-08 00:00:00',1073741825,'log.review.reviewerAssigned',0),(52,1048585,3,3,'2022-11-08 00:00:02',805306371,'log.editor.decision',0),(53,1048585,3,3,'2022-11-08 00:00:07',268435459,'submission.event.participantAdded',0),(54,1048585,4,20,'2022-11-08 00:00:15',268435458,'submission.event.general.metadataUpdated',0),(55,515,6,20,'2022-11-08 00:00:20',1342177281,'submission.event.fileUploaded',0),(56,1048585,4,20,'2022-11-08 00:00:23',1342177281,'submission.event.fileUploaded',0),(57,1048585,4,20,'2022-11-08 00:00:28',268435458,'submission.event.general.metadataUpdated',0),(58,1048585,4,20,'2022-11-08 00:00:29',268435457,'submission.event.submissionSubmitted',0),(59,1048585,5,21,'2022-11-08 00:00:36',268435458,'submission.event.general.metadataUpdated',0),(60,515,7,21,'2022-11-08 00:00:41',1342177281,'submission.event.fileUploaded',0),(61,1048585,5,21,'2022-11-08 00:00:43',1342177281,'submission.event.fileUploaded',0),(62,1048585,5,21,'2022-11-08 00:00:46',268435458,'submission.event.general.metadataUpdated',0),(63,1048585,5,21,'2022-11-08 00:00:46',268435457,'submission.event.submissionSubmitted',0),(64,1048585,5,3,'2022-11-08 00:00:52',805306371,'log.editor.decision',0),(65,1048585,5,3,'2022-11-08 00:00:58',1073741825,'log.review.reviewerAssigned',0),(66,1048585,5,3,'2022-11-08 00:01:03',1073741825,'log.review.reviewerAssigned',0),(67,1048585,5,3,'2022-11-08 00:01:06',805306371,'log.editor.decision',0),(68,1048585,5,3,'2022-11-08 00:01:11',268435459,'submission.event.participantAdded',0),(69,1048585,5,3,'2022-11-08 00:01:13',805306371,'log.editor.decision',0),(70,1048585,5,3,'2022-11-08 00:01:19',268435459,'submission.event.participantAdded',0),(71,1048585,5,3,'2022-11-08 00:01:22',268435459,'submission.event.participantAdded',0),(72,1048585,6,22,'2022-11-08 00:01:31',268435458,'submission.event.general.metadataUpdated',0),(73,515,9,22,'2022-11-08 00:01:36',1342177281,'submission.event.fileUploaded',0),(74,1048585,6,22,'2022-11-08 00:01:38',1342177281,'submission.event.fileUploaded',0),(75,1048585,6,22,'2022-11-08 00:01:41',268435458,'submission.event.general.metadataUpdated',0),(76,1048585,6,22,'2022-11-08 00:01:42',268435457,'submission.event.submissionSubmitted',0),(77,1048585,6,3,'2022-11-08 00:01:47',805306371,'log.editor.decision',0),(78,1048585,6,3,'2022-11-08 00:01:54',1073741825,'log.review.reviewerAssigned',0),(79,1048585,6,3,'2022-11-08 00:01:59',1073741825,'log.review.reviewerAssigned',0),(80,1048585,6,3,'2022-11-08 00:02:01',805306371,'log.editor.decision',0),(81,1048585,6,3,'2022-11-08 00:02:06',268435459,'submission.event.participantAdded',0),(82,1048585,6,3,'2022-11-08 00:02:09',805306371,'log.editor.decision',0),(83,1048585,6,3,'2022-11-08 00:02:14',268435459,'submission.event.participantAdded',0),(84,1048585,7,23,'2022-11-08 00:02:22',268435458,'submission.event.general.metadataUpdated',0),(85,515,11,23,'2022-11-08 00:02:27',1342177281,'submission.event.fileUploaded',0),(86,1048585,7,23,'2022-11-08 00:02:30',1342177281,'submission.event.fileUploaded',0),(87,1048585,7,23,'2022-11-08 00:02:32',268435458,'submission.event.general.metadataUpdated',0),(88,1048585,7,23,'2022-11-08 00:02:33',268435457,'submission.event.submissionSubmitted',0),(89,1048585,7,3,'2022-11-08 00:02:39',805306371,'log.editor.decision',0),(90,1048585,7,3,'2022-11-08 00:02:45',1073741825,'log.review.reviewerAssigned',0),(91,1048585,7,3,'2022-11-08 00:02:50',1073741825,'log.review.reviewerAssigned',0),(92,1048585,7,3,'2022-11-08 00:02:55',1073741825,'log.review.reviewerAssigned',0),(93,1048585,7,8,'2022-11-08 00:03:00',1073741830,'log.review.reviewAccepted',0),(94,1048585,7,8,'2022-11-08 00:03:04',1073741848,'log.review.reviewReady',0),(95,1048585,8,24,'2022-11-08 00:03:11',268435458,'submission.event.general.metadataUpdated',0),(96,515,12,24,'2022-11-08 00:03:16',1342177281,'submission.event.fileUploaded',0),(97,1048585,8,24,'2022-11-08 00:03:18',1342177281,'submission.event.fileUploaded',0),(98,1048585,8,24,'2022-11-08 00:03:23',268435458,'submission.event.general.metadataUpdated',0),(99,1048585,8,24,'2022-11-08 00:03:24',268435457,'submission.event.submissionSubmitted',0),(100,1048585,9,25,'2022-11-08 00:03:31',268435458,'submission.event.general.metadataUpdated',0),(101,515,13,25,'2022-11-08 00:03:36',1342177281,'submission.event.fileUploaded',0),(102,1048585,9,25,'2022-11-08 00:03:39',1342177281,'submission.event.fileUploaded',0),(103,1048585,9,25,'2022-11-08 00:03:41',268435458,'submission.event.general.metadataUpdated',0),(104,1048585,9,25,'2022-11-08 00:03:42',268435457,'submission.event.submissionSubmitted',0),(105,1048585,9,3,'2022-11-08 00:03:48',805306371,'log.editor.decision',0),(106,1048585,9,3,'2022-11-08 00:03:54',1073741825,'log.review.reviewerAssigned',0),(107,1048585,9,3,'2022-11-08 00:03:59',1073741825,'log.review.reviewerAssigned',0),(108,1048585,9,3,'2022-11-08 00:04:01',805306371,'log.editor.decision',0),(109,1048585,9,3,'2022-11-08 00:04:06',268435459,'submission.event.participantAdded',0),(110,1048585,9,3,'2022-11-08 00:04:09',805306371,'log.editor.decision',0),(111,1048585,9,3,'2022-11-08 00:04:14',268435459,'submission.event.participantAdded',0),(112,1048585,9,3,'2022-11-08 00:04:18',268435459,'submission.event.participantAdded',0),(113,1048585,10,1,'2022-11-08 00:04:27',268435458,'submission.event.general.metadataUpdated',0),(114,1048585,11,26,'2022-11-08 00:04:33',268435458,'submission.event.general.metadataUpdated',0),(115,515,18,26,'2022-11-08 00:04:38',1342177281,'submission.event.fileUploaded',0),(116,1048585,11,26,'2022-11-08 00:04:41',1342177281,'submission.event.fileUploaded',0),(117,1048585,11,26,'2022-11-08 00:04:44',268435458,'submission.event.general.metadataUpdated',0),(118,1048585,11,26,'2022-11-08 00:04:44',268435457,'submission.event.submissionSubmitted',0),(119,1048585,11,3,'2022-11-08 00:04:51',805306371,'log.editor.decision',0),(120,1048585,11,3,'2022-11-08 00:04:57',1073741825,'log.review.reviewerAssigned',0),(121,1048585,11,3,'2022-11-08 00:05:02',1073741825,'log.review.reviewerAssigned',0),(122,1048585,11,9,'2022-11-08 00:05:07',1073741830,'log.review.reviewAccepted',0),(123,1048585,11,9,'2022-11-08 00:05:11',1073741848,'log.review.reviewReady',0),(124,1048585,11,10,'2022-11-08 00:05:15',1073741830,'log.review.reviewAccepted',0),(125,1048585,11,10,'2022-11-08 00:05:19',1073741848,'log.review.reviewReady',0),(126,1048585,12,27,'2022-11-08 00:05:26',268435458,'submission.event.general.metadataUpdated',0),(127,515,20,27,'2022-11-08 00:05:32',1342177281,'submission.event.fileUploaded',0),(128,1048585,12,27,'2022-11-08 00:05:34',1342177281,'submission.event.fileUploaded',0),(129,1048585,12,27,'2022-11-08 00:05:39',268435458,'submission.event.general.metadataUpdated',0),(130,1048585,12,27,'2022-11-08 00:05:40',268435457,'submission.event.submissionSubmitted',0),(131,1048585,13,28,'2022-11-08 00:05:47',268435458,'submission.event.general.metadataUpdated',0),(132,515,21,28,'2022-11-08 00:05:53',1342177281,'submission.event.fileUploaded',0),(133,1048585,13,28,'2022-11-08 00:05:55',1342177281,'submission.event.fileUploaded',0),(134,1048585,13,28,'2022-11-08 00:05:58',268435458,'submission.event.general.metadataUpdated',0),(135,1048585,13,28,'2022-11-08 00:05:59',268435457,'submission.event.submissionSubmitted',0),(136,1048585,13,3,'2022-11-08 00:06:05',805306371,'log.editor.decision',0),(137,1048585,13,3,'2022-11-08 00:06:12',1073741825,'log.review.reviewerAssigned',0),(138,1048585,13,3,'2022-11-08 00:06:16',1073741825,'log.review.reviewerAssigned',0),(139,1048585,14,29,'2022-11-08 00:06:24',268435458,'submission.event.general.metadataUpdated',0),(140,515,23,29,'2022-11-08 00:06:29',1342177281,'submission.event.fileUploaded',0),(141,1048585,14,29,'2022-11-08 00:06:31',1342177281,'submission.event.fileUploaded',0),(142,1048585,14,29,'2022-11-08 00:06:34',268435458,'submission.event.general.metadataUpdated',0),(143,1048585,14,29,'2022-11-08 00:06:35',268435457,'submission.event.submissionSubmitted',0),(144,1048585,14,3,'2022-11-08 00:06:42',805306371,'log.editor.decision',0),(145,1048585,14,3,'2022-11-08 00:06:49',1073741825,'log.review.reviewerAssigned',0),(146,1048585,14,3,'2022-11-08 00:06:54',1073741825,'log.review.reviewerAssigned',0),(147,1048585,14,3,'2022-11-08 00:06:59',1073741825,'log.review.reviewerAssigned',0),(148,1048585,14,7,'2022-11-08 00:07:04',1073741830,'log.review.reviewAccepted',0),(149,1048585,14,7,'2022-11-08 00:07:07',1073741848,'log.review.reviewReady',0),(150,1048585,14,9,'2022-11-08 00:07:12',1073741830,'log.review.reviewAccepted',0),(151,1048585,14,9,'2022-11-08 00:07:16',1073741848,'log.review.reviewReady',0),(152,1048585,14,10,'2022-11-08 00:07:22',1073741830,'log.review.reviewAccepted',0),(153,1048585,14,10,'2022-11-08 00:07:26',1073741848,'log.review.reviewReady',0),(154,1048585,14,3,'2022-11-08 00:07:37',805306371,'log.editor.decision',0),(155,1048585,15,30,'2022-11-08 00:07:44',268435458,'submission.event.general.metadataUpdated',0),(156,515,24,30,'2022-11-08 00:07:49',1342177281,'submission.event.fileUploaded',0),(157,1048585,15,30,'2022-11-08 00:07:51',1342177281,'submission.event.fileUploaded',0),(158,1048585,15,30,'2022-11-08 00:07:54',268435458,'submission.event.general.metadataUpdated',0),(159,1048585,15,30,'2022-11-08 00:07:55',268435457,'submission.event.submissionSubmitted',0),(160,1048585,16,31,'2022-11-08 00:08:02',268435458,'submission.event.general.metadataUpdated',0),(161,515,25,31,'2022-11-08 00:08:07',1342177281,'submission.event.fileUploaded',0),(162,1048585,16,31,'2022-11-08 00:08:09',1342177281,'submission.event.fileUploaded',0),(163,1048585,16,31,'2022-11-08 00:08:12',268435458,'submission.event.general.metadataUpdated',0),(164,1048585,16,31,'2022-11-08 00:08:13',268435457,'submission.event.submissionSubmitted',0),(165,1048585,16,3,'2022-11-08 00:08:20',805306371,'log.editor.decision',0),(166,1048585,16,3,'2022-11-08 00:08:26',1073741825,'log.review.reviewerAssigned',0),(167,1048585,16,3,'2022-11-08 00:08:31',1073741825,'log.review.reviewerAssigned',0),(168,1048585,16,3,'2022-11-08 00:08:33',805306371,'log.editor.decision',0),(169,1048585,16,3,'2022-11-08 00:08:38',268435459,'submission.event.participantAdded',0),(170,1048585,16,3,'2022-11-08 00:08:41',805306371,'log.editor.decision',0),(171,1048585,16,3,'2022-11-08 00:08:46',268435459,'submission.event.participantAdded',0),(172,1048585,17,32,'2022-11-08 00:08:55',268435458,'submission.event.general.metadataUpdated',0),(173,515,26,32,'2022-11-08 00:09:00',1342177281,'submission.event.fileUploaded',0),(174,1048585,17,32,'2022-11-08 00:09:02',1342177281,'submission.event.fileUploaded',0),(175,1048585,17,32,'2022-11-08 00:09:05',268435458,'submission.event.general.metadataUpdated',0),(176,1048585,17,32,'2022-11-08 00:09:06',268435457,'submission.event.submissionSubmitted',0),(177,1048585,18,33,'2022-11-08 00:09:13',268435458,'submission.event.general.metadataUpdated',0),(178,515,27,33,'2022-11-08 00:09:18',1342177281,'submission.event.fileUploaded',0),(179,1048585,18,33,'2022-11-08 00:09:20',1342177281,'submission.event.fileUploaded',0),(180,1048585,18,33,'2022-11-08 00:09:24',268435458,'submission.event.general.metadataUpdated',0),(181,1048585,18,33,'2022-11-08 00:09:24',268435457,'submission.event.submissionSubmitted',0),(182,1048585,18,3,'2022-11-08 00:09:32',805306371,'log.editor.decision',0),(183,1048585,18,3,'2022-11-08 00:09:39',1073741825,'log.review.reviewerAssigned',0),(184,1048585,18,3,'2022-11-08 00:09:44',1073741825,'log.review.reviewerAssigned',0),(185,1048585,18,3,'2022-11-08 00:09:46',805306371,'log.editor.decision',0),(186,1048585,18,3,'2022-11-08 00:09:51',268435459,'submission.event.participantAdded',0),(187,1048585,18,3,'2022-11-08 00:09:54',805306371,'log.editor.decision',0),(188,1048585,18,3,'2022-11-08 00:09:59',268435459,'submission.event.participantAdded',0),(189,1048585,18,3,'2022-11-08 00:10:03',268435459,'submission.event.participantAdded',0),(190,515,29,3,'2022-11-08 00:10:10',1342177281,'submission.event.fileUploaded',0),(191,1048585,18,3,'2022-11-08 00:10:11',1342177281,'submission.event.fileUploaded',0),(192,1048585,18,3,'2022-11-08 00:10:15',268435458,'submission.event.general.metadataUpdated',0),(193,1048585,18,3,'2022-11-08 00:10:16',268435462,'publication.event.published',0),(194,1048585,19,34,'2022-11-08 00:10:25',268435458,'submission.event.general.metadataUpdated',0),(195,515,30,34,'2022-11-08 00:10:30',1342177281,'submission.event.fileUploaded',0),(196,1048585,19,34,'2022-11-08 00:10:33',1342177281,'submission.event.fileUploaded',0),(197,1048585,19,34,'2022-11-08 00:10:35',268435458,'submission.event.general.metadataUpdated',0),(198,1048585,19,34,'2022-11-08 00:10:36',268435457,'submission.event.submissionSubmitted',0),(199,1048585,19,3,'2022-11-08 00:10:45',805306371,'log.editor.decision',0),(200,1048585,20,35,'2022-11-08 00:10:53',268435458,'submission.event.general.metadataUpdated',0),(201,515,31,35,'2022-11-08 00:10:59',1342177281,'submission.event.fileUploaded',0),(202,1048585,20,35,'2022-11-08 00:11:01',1342177281,'submission.event.fileUploaded',0),(203,1048585,20,35,'2022-11-08 00:11:03',268435458,'submission.event.general.metadataUpdated',0),(204,1048585,20,35,'2022-11-08 00:11:04',268435457,'submission.event.submissionSubmitted',0),(205,1048585,20,3,'2022-11-08 00:11:12',805306371,'log.editor.decision',0),(206,1048585,20,3,'2022-11-08 00:11:18',1073741825,'log.review.reviewerAssigned',0),(207,1048585,20,3,'2022-11-08 00:11:23',1073741825,'log.review.reviewerAssigned',0),(208,1048585,20,3,'2022-11-08 00:11:25',805306371,'log.editor.decision',0),(209,1048585,20,3,'2022-11-08 00:11:30',268435459,'submission.event.participantAdded',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileRevision','1','int'),(2,'fileStage','2','int'),(2,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(2,'revisedFileId',NULL,'string'),(2,'submissionId','1','int'),(2,'username','amwandenga','string'),(3,'fileId','1','int'),(3,'fileRevision','1','int'),(3,'fileStage','2','int'),(3,'name','amwandenga, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(3,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(3,'submissionId','1','int'),(3,'username','amwandenga','string'),(6,'decision','Send to Review','string'),(6,'editorName','Daniel Barnes','string'),(6,'submissionId','1','int'),(7,'reviewAssignmentId','1','int'),(7,'reviewerName','Julie Janssen','string'),(7,'round','1','int'),(7,'stageId','3','int'),(7,'submissionId','1','int'),(8,'reviewAssignmentId','2','int'),(8,'reviewerName','Aisla McCrae','string'),(8,'round','1','int'),(8,'stageId','3','int'),(8,'submissionId','1','int'),(9,'reviewAssignmentId','3','int'),(9,'reviewerName','Adela Gallego','string'),(9,'round','1','int'),(9,'stageId','3','int'),(9,'submissionId','1','int'),(10,'decision','Accept Submission','string'),(10,'editorName','Daniel Barnes','string'),(10,'submissionId','1','int'),(11,'name','Sarah Vogt','string'),(11,'userGroupName','Copyeditor','string'),(11,'username','svogt','string'),(12,'decision','Send To Production','string'),(12,'editorName','Daniel Barnes','string'),(12,'submissionId','1','int'),(13,'name','Stephen Hellier','string'),(13,'userGroupName','Layout Editor','string'),(13,'username','shellier','string'),(14,'name','Sabine Kumar','string'),(14,'userGroupName','Proofreader','string'),(14,'username','skumar','string'),(18,'fileId','3','int'),(18,'fileRevision','1','int'),(18,'fileStage','10','int'),(18,'originalFileName','article.pdf','string'),(18,'revisedFileId',NULL,'string'),(18,'submissionId','1','int'),(18,'username','dbarnes','string'),(19,'fileId','3','int'),(19,'fileRevision','1','int'),(19,'fileStage','10','int'),(19,'name','dbarnes, article.pdf','string'),(19,'originalFileName','article.pdf','string'),(19,'submissionId','1','int'),(19,'username','dbarnes','string'),(20,'name','Alan Mwandenga','string'),(20,'userGroupName','Author','string'),(20,'username','amwandenga','string'),(33,'name','Stephanie Berardo','string'),(33,'userGroupName','Section editor','string'),(33,'username','sberardo','string'),(34,'name','Stephanie Berardo','string'),(34,'userGroupName','Section editor','string'),(34,'username','sberardo','string'),(36,'fileId','4','int'),(36,'fileRevision','1','int'),(36,'fileStage','2','int'),(36,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(36,'revisedFileId',NULL,'string'),(36,'submissionId','2','int'),(36,'username','ccorino','string'),(37,'fileId','4','int'),(37,'fileRevision','1','int'),(37,'fileStage','2','int'),(37,'name','ccorino, The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(37,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(37,'submissionId','2','int'),(37,'username','ccorino','string'),(40,'decision','Send to Review','string'),(40,'editorName','Daniel Barnes','string'),(40,'submissionId','2','int'),(41,'name','Minoti Inoue','string'),(41,'userGroupName','Section editor','string'),(41,'username','minoue','string'),(43,'decision','Accept Submission','string'),(43,'editorName','Minoti Inoue','string'),(43,'submissionId','2','int'),(45,'fileId','5','int'),(45,'fileRevision','1','int'),(45,'fileStage','2','int'),(45,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(45,'revisedFileId',NULL,'string'),(45,'submissionId','3','int'),(45,'username','ckwantes','string'),(46,'fileId','5','int'),(46,'fileRevision','1','int'),(46,'fileStage','2','int'),(46,'name','ckwantes, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(46,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(46,'submissionId','3','int'),(46,'username','ckwantes','string'),(49,'decision','Send to Review','string'),(49,'editorName','Daniel Barnes','string'),(49,'submissionId','3','int'),(50,'reviewAssignmentId','4','int'),(50,'reviewerName','Aisla McCrae','string'),(50,'round','1','int'),(50,'stageId','3','int'),(50,'submissionId','3','int'),(51,'reviewAssignmentId','5','int'),(51,'reviewerName','Adela Gallego','string'),(51,'round','1','int'),(51,'stageId','3','int'),(51,'submissionId','3','int'),(52,'decision','Accept Submission','string'),(52,'editorName','Daniel Barnes','string'),(52,'submissionId','3','int'),(53,'name','Maria Fritz','string'),(53,'userGroupName','Copyeditor','string'),(53,'username','mfritz','string'),(55,'fileId','6','int'),(55,'fileRevision','1','int'),(55,'fileStage','2','int'),(55,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(55,'revisedFileId',NULL,'string'),(55,'submissionId','4','int'),(55,'username','cmontgomerie','string'),(56,'fileId','6','int'),(56,'fileRevision','1','int'),(56,'fileStage','2','int'),(56,'name','cmontgomerie, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(56,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(56,'submissionId','4','int'),(56,'username','cmontgomerie','string'),(60,'fileId','7','int'),(60,'fileRevision','1','int'),(60,'fileStage','2','int'),(60,'originalFileName','Genetic transformation of forest trees.pdf','string'),(60,'revisedFileId',NULL,'string'),(60,'submissionId','5','int'),(60,'username','ddiouf','string'),(61,'fileId','7','int'),(61,'fileRevision','1','int'),(61,'fileStage','2','int'),(61,'name','ddiouf, Genetic transformation of forest trees.pdf','string'),(61,'originalFileName','Genetic transformation of forest trees.pdf','string'),(61,'submissionId','5','int'),(61,'username','ddiouf','string'),(64,'decision','Send to Review','string'),(64,'editorName','Daniel Barnes','string'),(64,'submissionId','5','int'),(65,'reviewAssignmentId','6','int'),(65,'reviewerName','Paul Hudson','string'),(65,'round','1','int'),(65,'stageId','3','int'),(65,'submissionId','5','int'),(66,'reviewAssignmentId','7','int'),(66,'reviewerName','Adela Gallego','string'),(66,'round','1','int'),(66,'stageId','3','int'),(66,'submissionId','5','int'),(67,'decision','Accept Submission','string'),(67,'editorName','Daniel Barnes','string'),(67,'submissionId','5','int'),(68,'name','Maria Fritz','string'),(68,'userGroupName','Copyeditor','string'),(68,'username','mfritz','string'),(69,'decision','Send To Production','string'),(69,'editorName','Daniel Barnes','string'),(69,'submissionId','5','int'),(70,'name','Graham Cox','string'),(70,'userGroupName','Layout Editor','string'),(70,'username','gcox','string'),(71,'name','Catherine Turner','string'),(71,'userGroupName','Proofreader','string'),(71,'username','cturner','string'),(73,'fileId','9','int'),(73,'fileRevision','1','int'),(73,'fileStage','2','int'),(73,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(73,'revisedFileId',NULL,'string'),(73,'submissionId','6','int'),(73,'username','dphillips','string'),(74,'fileId','9','int'),(74,'fileRevision','1','int'),(74,'fileStage','2','int'),(74,'name','dphillips, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(74,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(74,'submissionId','6','int'),(74,'username','dphillips','string'),(77,'decision','Send to Review','string'),(77,'editorName','Daniel Barnes','string'),(77,'submissionId','6','int'),(78,'reviewAssignmentId','8','int'),(78,'reviewerName','Julie Janssen','string'),(78,'round','1','int'),(78,'stageId','3','int'),(78,'submissionId','6','int'),(79,'reviewAssignmentId','9','int'),(79,'reviewerName','Adela Gallego','string'),(79,'round','1','int'),(79,'stageId','3','int'),(79,'submissionId','6','int'),(80,'decision','Accept Submission','string'),(80,'editorName','Daniel Barnes','string'),(80,'submissionId','6','int'),(81,'name','Maria Fritz','string'),(81,'userGroupName','Copyeditor','string'),(81,'username','mfritz','string'),(82,'decision','Send To Production','string'),(82,'editorName','Daniel Barnes','string'),(82,'submissionId','6','int'),(83,'name','Graham Cox','string'),(83,'userGroupName','Layout Editor','string'),(83,'username','gcox','string'),(85,'fileId','11','int'),(85,'fileRevision','1','int'),(85,'fileStage','2','int'),(85,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(85,'revisedFileId',NULL,'string'),(85,'submissionId','7','int'),(85,'username','dsokoloff','string'),(86,'fileId','11','int'),(86,'fileRevision','1','int'),(86,'fileStage','2','int'),(86,'name','dsokoloff, Developing efficacy beliefs in the classroom.pdf','string'),(86,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(86,'submissionId','7','int'),(86,'username','dsokoloff','string'),(89,'decision','Send to Review','string'),(89,'editorName','Daniel Barnes','string'),(89,'submissionId','7','int'),(90,'reviewAssignmentId','10','int'),(90,'reviewerName','Paul Hudson','string'),(90,'round','1','int'),(90,'stageId','3','int'),(90,'submissionId','7','int'),(91,'reviewAssignmentId','11','int'),(91,'reviewerName','Aisla McCrae','string'),(91,'round','1','int'),(91,'stageId','3','int'),(91,'submissionId','7','int'),(92,'reviewAssignmentId','12','int'),(92,'reviewerName','Adela Gallego','string'),(92,'round','1','int'),(92,'stageId','3','int'),(92,'submissionId','7','int'),(93,'reviewAssignmentId','10','int'),(93,'reviewerName','Paul Hudson','string'),(93,'round','1','int'),(93,'submissionId','7','int'),(94,'reviewAssignmentId','10','int'),(94,'reviewerName','Paul Hudson','string'),(94,'round','1','int'),(94,'submissionId','7','int'),(96,'fileId','12','int'),(96,'fileRevision','1','int'),(96,'fileStage','2','int'),(96,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(96,'revisedFileId',NULL,'string'),(96,'submissionId','8','int'),(96,'username','eostrom','string'),(97,'fileId','12','int'),(97,'fileRevision','1','int'),(97,'fileStage','2','int'),(97,'name','eostrom, Traditions and Trends in the Study of the Commons.pdf','string'),(97,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(97,'submissionId','8','int'),(97,'username','eostrom','string'),(101,'fileId','13','int'),(101,'fileRevision','1','int'),(101,'fileStage','2','int'),(101,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(101,'revisedFileId',NULL,'string'),(101,'submissionId','9','int'),(101,'username','fpaglieri','string'),(102,'fileId','13','int'),(102,'fileRevision','1','int'),(102,'fileStage','2','int'),(102,'name','fpaglieri, Hansen & Pinto: Reason Reclaimed.pdf','string'),(102,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(102,'submissionId','9','int'),(102,'username','fpaglieri','string'),(105,'decision','Send to Review','string'),(105,'editorName','Daniel Barnes','string'),(105,'submissionId','9','int'),(106,'reviewAssignmentId','13','int'),(106,'reviewerName','Julie Janssen','string'),(106,'round','1','int'),(106,'stageId','3','int'),(106,'submissionId','9','int'),(107,'reviewAssignmentId','14','int'),(107,'reviewerName','Adela Gallego','string'),(107,'round','1','int'),(107,'stageId','3','int'),(107,'submissionId','9','int'),(108,'decision','Accept Submission','string'),(108,'editorName','Daniel Barnes','string'),(108,'submissionId','9','int'),(109,'name','Sarah Vogt','string'),(109,'userGroupName','Copyeditor','string'),(109,'username','svogt','string'),(110,'decision','Send To Production','string'),(110,'editorName','Daniel Barnes','string'),(110,'submissionId','9','int'),(111,'name','Stephen Hellier','string'),(111,'userGroupName','Layout Editor','string'),(111,'username','shellier','string'),(112,'name','Sabine Kumar','string'),(112,'userGroupName','Proofreader','string'),(112,'username','skumar','string'),(115,'fileId','18','int'),(115,'fileRevision','1','int'),(115,'fileStage','2','int'),(115,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(115,'revisedFileId',NULL,'string'),(115,'submissionId','11','int'),(115,'username','jnovak','string'),(116,'fileId','18','int'),(116,'fileRevision','1','int'),(116,'fileStage','2','int'),(116,'name','jnovak, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(116,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(116,'submissionId','11','int'),(116,'username','jnovak','string'),(119,'decision','Send to Review','string'),(119,'editorName','Daniel Barnes','string'),(119,'submissionId','11','int'),(120,'reviewAssignmentId','15','int'),(120,'reviewerName','Aisla McCrae','string'),(120,'round','1','int'),(120,'stageId','3','int'),(120,'submissionId','11','int'),(121,'reviewAssignmentId','16','int'),(121,'reviewerName','Adela Gallego','string'),(121,'round','1','int'),(121,'stageId','3','int'),(121,'submissionId','11','int'),(122,'reviewAssignmentId','15','int'),(122,'reviewerName','Aisla McCrae','string'),(122,'round','1','int'),(122,'submissionId','11','int'),(123,'reviewAssignmentId','15','int'),(123,'reviewerName','Aisla McCrae','string'),(123,'round','1','int'),(123,'submissionId','11','int'),(124,'reviewAssignmentId','16','int'),(124,'reviewerName','Adela Gallego','string'),(124,'round','1','int'),(124,'submissionId','11','int'),(125,'reviewAssignmentId','16','int'),(125,'reviewerName','Adela Gallego','string'),(125,'round','1','int'),(125,'submissionId','11','int'),(127,'fileId','20','int'),(127,'fileRevision','1','int'),(127,'fileStage','2','int'),(127,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(127,'revisedFileId',NULL,'string'),(127,'submissionId','12','int'),(127,'username','kalkhafaji','string'),(128,'fileId','20','int'),(128,'fileRevision','1','int'),(128,'fileStage','2','int'),(128,'name','kalkhafaji, Learning Sustainable Design through Service.pdf','string'),(128,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(128,'submissionId','12','int'),(128,'username','kalkhafaji','string'),(132,'fileId','21','int'),(132,'fileRevision','1','int'),(132,'fileStage','2','int'),(132,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(132,'revisedFileId',NULL,'string'),(132,'submissionId','13','int'),(132,'username','lchristopher','string'),(133,'fileId','21','int'),(133,'fileRevision','1','int'),(133,'fileStage','2','int'),(133,'name','lchristopher, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(133,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(133,'submissionId','13','int'),(133,'username','lchristopher','string'),(136,'decision','Send to Review','string'),(136,'editorName','Daniel Barnes','string'),(136,'submissionId','13','int'),(137,'reviewAssignmentId','17','int'),(137,'reviewerName','Julie Janssen','string'),(137,'round','1','int'),(137,'stageId','3','int'),(137,'submissionId','13','int'),(138,'reviewAssignmentId','18','int'),(138,'reviewerName','Paul Hudson','string'),(138,'round','1','int'),(138,'stageId','3','int'),(138,'submissionId','13','int'),(140,'fileId','23','int'),(140,'fileRevision','1','int'),(140,'fileStage','2','int'),(140,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(140,'revisedFileId',NULL,'string'),(140,'submissionId','14','int'),(140,'username','lkumiega','string'),(141,'fileId','23','int'),(141,'fileRevision','1','int'),(141,'fileStage','2','int'),(141,'name','lkumiega, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(141,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(141,'submissionId','14','int'),(141,'username','lkumiega','string'),(144,'decision','Send to Review','string'),(144,'editorName','Daniel Barnes','string'),(144,'submissionId','14','int'),(145,'reviewAssignmentId','19','int'),(145,'reviewerName','Julie Janssen','string'),(145,'round','1','int'),(145,'stageId','3','int'),(145,'submissionId','14','int'),(146,'reviewAssignmentId','20','int'),(146,'reviewerName','Aisla McCrae','string'),(146,'round','1','int'),(146,'stageId','3','int'),(146,'submissionId','14','int'),(147,'reviewAssignmentId','21','int'),(147,'reviewerName','Adela Gallego','string'),(147,'round','1','int'),(147,'stageId','3','int'),(147,'submissionId','14','int'),(148,'reviewAssignmentId','19','int'),(148,'reviewerName','Julie Janssen','string'),(148,'round','1','int'),(148,'submissionId','14','int'),(149,'reviewAssignmentId','19','int'),(149,'reviewerName','Julie Janssen','string'),(149,'round','1','int'),(149,'submissionId','14','int'),(150,'reviewAssignmentId','20','int'),(150,'reviewerName','Aisla McCrae','string'),(150,'round','1','int'),(150,'submissionId','14','int'),(151,'reviewAssignmentId','20','int'),(151,'reviewerName','Aisla McCrae','string'),(151,'round','1','int'),(151,'submissionId','14','int'),(152,'reviewAssignmentId','21','int'),(152,'reviewerName','Adela Gallego','string'),(152,'round','1','int'),(152,'submissionId','14','int'),(153,'reviewAssignmentId','21','int'),(153,'reviewerName','Adela Gallego','string'),(153,'round','1','int'),(153,'submissionId','14','int'),(154,'decision','Request Revisions','string'),(154,'editorName','Daniel Barnes','string'),(154,'submissionId','14','int'),(156,'fileId','24','int'),(156,'fileRevision','1','int'),(156,'fileStage','2','int'),(156,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(156,'revisedFileId',NULL,'string'),(156,'submissionId','15','int'),(156,'username','pdaniel','string'),(157,'fileId','24','int'),(157,'fileRevision','1','int'),(157,'fileStage','2','int'),(157,'name','pdaniel, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(157,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(157,'submissionId','15','int'),(157,'username','pdaniel','string'),(161,'fileId','25','int'),(161,'fileRevision','1','int'),(161,'fileStage','2','int'),(161,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(161,'revisedFileId',NULL,'string'),(161,'submissionId','16','int'),(161,'username','rbaiyewu','string'),(162,'fileId','25','int'),(162,'fileRevision','1','int'),(162,'fileStage','2','int'),(162,'name','rbaiyewu, Yam diseases and its management in Nigeria.pdf','string'),(162,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(162,'submissionId','16','int'),(162,'username','rbaiyewu','string'),(165,'decision','Send to Review','string'),(165,'editorName','Daniel Barnes','string'),(165,'submissionId','16','int'),(166,'reviewAssignmentId','22','int'),(166,'reviewerName','Paul Hudson','string'),(166,'round','1','int'),(166,'stageId','3','int'),(166,'submissionId','16','int'),(167,'reviewAssignmentId','23','int'),(167,'reviewerName','Aisla McCrae','string'),(167,'round','1','int'),(167,'stageId','3','int'),(167,'submissionId','16','int'),(168,'decision','Accept Submission','string'),(168,'editorName','Daniel Barnes','string'),(168,'submissionId','16','int'),(169,'name','Sarah Vogt','string'),(169,'userGroupName','Copyeditor','string'),(169,'username','svogt','string'),(170,'decision','Send To Production','string'),(170,'editorName','Daniel Barnes','string'),(170,'submissionId','16','int'),(171,'name','Stephen Hellier','string'),(171,'userGroupName','Layout Editor','string'),(171,'username','shellier','string'),(173,'fileId','26','int'),(173,'fileRevision','1','int'),(173,'fileStage','2','int'),(173,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(173,'revisedFileId',NULL,'string'),(173,'submissionId','17','int'),(173,'username','rrossi','string'),(174,'fileId','26','int'),(174,'fileRevision','1','int'),(174,'fileStage','2','int'),(174,'name','rrossi, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(174,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(174,'submissionId','17','int'),(174,'username','rrossi','string'),(178,'fileId','27','int'),(178,'fileRevision','1','int'),(178,'fileStage','2','int'),(178,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(178,'revisedFileId',NULL,'string'),(178,'submissionId','18','int'),(178,'username','vkarbasizaed','string'),(179,'fileId','27','int'),(179,'fileRevision','1','int'),(179,'fileStage','2','int'),(179,'name','vkarbasizaed, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(179,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(179,'submissionId','18','int'),(179,'username','vkarbasizaed','string'),(182,'decision','Send to Review','string'),(182,'editorName','Daniel Barnes','string'),(182,'submissionId','18','int'),(183,'reviewAssignmentId','24','int'),(183,'reviewerName','Julie Janssen','string'),(183,'round','1','int'),(183,'stageId','3','int'),(183,'submissionId','18','int'),(184,'reviewAssignmentId','25','int'),(184,'reviewerName','Paul Hudson','string'),(184,'round','1','int'),(184,'stageId','3','int'),(184,'submissionId','18','int'),(185,'decision','Accept Submission','string'),(185,'editorName','Daniel Barnes','string'),(185,'submissionId','18','int'),(186,'name','Maria Fritz','string'),(186,'userGroupName','Copyeditor','string'),(186,'username','mfritz','string'),(187,'decision','Send To Production','string'),(187,'editorName','Daniel Barnes','string'),(187,'submissionId','18','int'),(188,'name','Graham Cox','string'),(188,'userGroupName','Layout Editor','string'),(188,'username','gcox','string'),(189,'name','Catherine Turner','string'),(189,'userGroupName','Proofreader','string'),(189,'username','cturner','string'),(190,'fileId','29','int'),(190,'fileRevision','1','int'),(190,'fileStage','10','int'),(190,'originalFileName','article.pdf','string'),(190,'revisedFileId',NULL,'string'),(190,'submissionId','18','int'),(190,'username','dbarnes','string'),(191,'fileId','29','int'),(191,'fileRevision','1','int'),(191,'fileStage','10','int'),(191,'name','dbarnes, article.pdf','string'),(191,'originalFileName','article.pdf','string'),(191,'submissionId','18','int'),(191,'username','dbarnes','string'),(195,'fileId','30','int'),(195,'fileRevision','1','int'),(195,'fileStage','2','int'),(195,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(195,'revisedFileId',NULL,'string'),(195,'submissionId','19','int'),(195,'username','vwilliamson','string'),(196,'fileId','30','int'),(196,'fileRevision','1','int'),(196,'fileStage','2','int'),(196,'name','vwilliamson, Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(196,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(196,'submissionId','19','int'),(196,'username','vwilliamson','string'),(199,'decision','Decline Submission','string'),(199,'editorName','Daniel Barnes','string'),(199,'submissionId','19','int'),(201,'fileId','31','int'),(201,'fileRevision','1','int'),(201,'fileStage','2','int'),(201,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(201,'revisedFileId',NULL,'string'),(201,'submissionId','20','int'),(201,'username','zwoods','string'),(202,'fileId','31','int'),(202,'fileRevision','1','int'),(202,'fileStage','2','int'),(202,'name','zwoods, Finocchiaro: Arguments About Arguments.pdf','string'),(202,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(202,'submissionId','20','int'),(202,'username','zwoods','string'),(205,'decision','Send to Review','string'),(205,'editorName','Daniel Barnes','string'),(205,'submissionId','20','int'),(206,'reviewAssignmentId','26','int'),(206,'reviewerName','Paul Hudson','string'),(206,'round','1','int'),(206,'stageId','3','int'),(206,'submissionId','20','int'),(207,'reviewAssignmentId','27','int'),(207,'reviewerName','Aisla McCrae','string'),(207,'round','1','int'),(207,'stageId','3','int'),(207,'submissionId','20','int'),(208,'decision','Accept Submission','string'),(208,'editorName','Daniel Barnes','string'),(208,'submissionId','20','int'),(209,'name','Sarah Vogt','string'),(209,'userGroupName','Copyeditor','string'),(209,'username','svogt','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'mods34=>mods34-xml','plugins.metadata.mods34.mods34XmlOutput.displayName','plugins.metadata.mods34.mods34XmlOutput.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(*)','xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),(3,'article=>mods34','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),(4,'mods34=>article','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)','class::classes.submission.Submission'),(5,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(6,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(7,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(8,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(9,'issue=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.issue.Issue[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(10,'article=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.submission.Submission[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(11,'galley=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.article.ArticleGalley[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(12,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(13,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),(14,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(15,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(16,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(17,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(18,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(19,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(20,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(21,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Author[]'),(22,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(23,'SubmissionArtworkFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionArtworkFile','xml::schema(plugins/importexport/native/native.xsd)'),(24,'SupplementaryFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SupplementaryFile','xml::schema(plugins/importexport/native/native.xsd)'),(25,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(26,'native-xml=>SubmissionArtworkFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionArtworkFile'),(27,'native-xml=>SupplementaryFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SupplementaryFile'),(28,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.ArticleGalley','xml::schema(plugins/importexport/native/native.xsd)'),(29,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.ArticleGalley[]'),(30,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(31,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(32,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(33,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(34,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.ArticleGalley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(35,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),(36,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(37,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'MODS 3.4','lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter',0,0,0),(3,3,0,'Extract metadata from a(n) Submission','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(4,4,0,'Inject metadata into a(n) Submission','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(5,5,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(6,6,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(7,7,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(8,8,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(9,9,0,'mEDRA XML issue export','plugins.importexport.medra.filter.IssueMedraXmlFilter',0,0,0),(10,10,0,'mEDRA XML article export','plugins.importexport.medra.filter.ArticleMedraXmlFilter',0,0,0),(11,11,0,'mEDRA XML article export','plugins.importexport.medra.filter.GalleyMedraXmlFilter',0,0,0),(12,12,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),(13,13,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0),(14,14,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),(15,15,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),(16,16,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),(17,17,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),(18,18,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),(19,19,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),(20,20,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(21,21,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(22,25,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),(23,26,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArtworkFileFilter',0,0,0),(24,27,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter',0,0,0),(25,22,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(26,23,0,'Native XML submission file export','plugins.importexport.native.filter.ArtworkFileNativeXmlFilter',0,0,0),(27,24,0,'Native XML submission file export','plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter',0,0,0),(28,28,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),(29,29,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0),(30,30,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(31,31,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(32,32,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(33,33,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(34,34,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(35,35,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0),(36,36,0,'Crossref XML issue export','plugins.importexport.crossref.filter.IssueCrossrefXmlFilter',0,0,0),(37,37,0,'Crossref XML issue export','plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter',0,0,0);
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
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Article Text','string'),(1,'fr_CA','name','Texte de l\'article','string'),(2,'en_US','name','Research Instrument','string'),(2,'fr_CA','name','Instruments de recherche','string'),(3,'en_US','name','Research Materials','string'),(3,'fr_CA','name','Documents de recherche','string'),(4,'en_US','name','Research Results','string'),(4,'fr_CA','name','Résultats de recherche','string'),(5,'en_US','name','Transcripts','string'),(5,'fr_CA','name','Transcriptions','string'),(6,'en_US','name','Data Analysis','string'),(6,'fr_CA','name','Analyse de données','string'),(7,'en_US','name','Data Set','string'),(7,'fr_CA','name','Ensemble de données','string'),(8,'en_US','name','Source Texts','string'),(8,'fr_CA','name','Textes source','string'),(9,'en_US','name','Multimedia','string'),(9,'fr_CA','name','Multimédias','string'),(10,'en_US','name','Image','string'),(10,'fr_CA','name','Image','string'),(11,'en_US','name','HTML Stylesheet','string'),(11,'fr_CA','name','Feuille de style HTML','string'),(12,'en_US','name','Other','string'),(12,'fr_CA','name','Autre','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,0,'SUBMISSION'),(2,1,1,1,3,0,1,'RESEARCHINSTRUMENT'),(3,1,2,1,3,0,1,'RESEARCHMATERIALS'),(4,1,3,1,3,0,1,'RESEARCHRESULTS'),(5,1,4,1,3,0,1,'TRANSCRIPTS'),(6,1,5,1,3,0,1,'DATAANALYSIS'),(7,1,6,1,3,0,1,'DATASET'),(8,1,7,1,3,0,1,'SOURCETEXTS'),(9,1,8,1,1,1,1,'MULTIMEDIA'),(10,1,9,1,2,1,0,'IMAGE'),(11,1,10,1,1,1,0,'STYLE'),(12,1,11,1,3,0,1,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`),
  KEY `issue_galleys_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES (1,'en_US','description','','string'),(1,'en_US','title','','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','title','','string'),(2,'en_US','coverImage','cover_issue_1_en_US.jpg','string'),(2,'en_US','coverImageAltText','','string'),(2,'en_US','description','<p>test 1 descr</p>','string'),(2,'en_US','title','test 1','string'),(3,'en_US','coverImage','cover_issue_2_en_US.jpg','string'),(3,'en_US','coverImageAltText','','string'),(3,'en_US','description','<p>Test Issue 2 Description</p>','string'),(3,'en_US','title','Test Issue 2','string');
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT '0',
  `show_number` tinyint(4) NOT NULL DEFAULT '0',
  `show_year` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`),
  KEY `issues_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'2',2014,1,0,'2022-11-07 23:55:53',NULL,'2022-11-07 23:55:53',1,NULL,1,1,1,0,NULL,NULL,''),(2,1,1,'1',2020,0,0,NULL,NULL,'2022-11-08 00:04:27',1,NULL,1,1,1,1,NULL,NULL,'test-issue'),(3,1,1,'2',2020,0,0,NULL,NULL,'2022-11-08 00:04:27',1,NULL,1,1,1,1,NULL,NULL,'test-issue-2');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
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
INSERT INTO `item_views` VALUES (515,'3-1',3,'2022-11-07 23:57:46');
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copyrightYearBasis','issue',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','membershipFee','0',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','onlineIssn','0378-5955',NULL),(1,'','printIssn','0378-5955',NULL),(1,'','publicationFee','0',NULL),(1,'','publisherInstitution','Public Knowledge Project',NULL),(1,'','purchaseArticleFee','0',NULL),(1,'','supportedFormLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportedLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportedSubmissionLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgeJ Pub Know',NULL),(1,'en_US','acronym','JPKJPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/index.phppublicknowledge/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/index.phppublicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.phppublicknowledge/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the five-step process.',NULL),(1,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),(1,'en_US','name','Journal of Public Knowledge',NULL),(1,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/index.phppublicknowledge/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/index.phppublicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:165:\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:82:\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:99:\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\";}}',NULL),(1,'fr_CA','authorInformation','Intéressé-e à soumettre à cette revue ? Nous vous recommandons de consulter les politiques de rubrique de la revue à la page <a href=\"http://localhost/index.php/{$journalPath}/about\">À propos de la revue</a> ainsi que les <a href=\"http://localhost/index.php/{$journalPath}/about/submissions#authorGuidelines\">Directives aux auteurs</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/{$journalPath}/user/register\">s\'inscrire</a> auprès de la revue avant de présenter une soumission, ou s\'ils et elles sont déjà inscrits-es, simplement <a href=\"http://localhost/index.php/{$journalPath}/login\">ouvrir une session</a> et accéder au tableau de bord pour commencer les 5 étapes du processus.',NULL),(1,'fr_CA','clockssLicense','Cette revue utilise le système CLOCKSS pour créer un système d\'archivage distribué parmi les bibliothèques participantes et permet à ces bibliothèques de créer des archives permanentes de la revue à des fins de conservation et de reconstitution. <a href=\"http://clockss.org/\">En apprendre davantage... </a>',NULL),(1,'fr_CA','librarianInformation','Nous incitons les bibliothécaires à lister cette revue dans leur fonds de revues numériques. Aussi, il peut être pertinent de mentionner que ce système de publication en libre accès est conçu pour être hébergé par les bibliothèques de recherche pour que les membres de leurs facultés l\'utilisent avec les revues dans lesquelles ils sont impliqués (voir <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'fr_CA','lockssLicense','Cette revue utilise le système LOCKSS pour créer un système de distribution des archives parmi les bibliothèques participantes et afin de permettre à ces bibliothèques de créer des archives permanentes pour fins de préservation et de restauration. <a href=\"http://lockss.org/\">En apprendre davantage...</a>',NULL),(1,'fr_CA','name','Journal de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette revue fournit le libre accès immédiat à son contenu se basant sur le principe que rendre la recherche disponible au public gratuitement facilite un plus grand échange du savoir, à l\'échelle de la planète.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et courriels saisis dans le site de cette revue seront utilisés exclusivement aux fins indiquées par cette revue et ne serviront à aucune autre fin, ni à toute autre partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous invitons les lecteurs-trices à s\'inscrire pour recevoir les avis de publication de cette revue. Utiliser le lien <a href=\"http://localhost/index.php/{$journalPath}/user/register\">S\'inscrire</a> en haut de la page d\'accueil de la revue. Cette inscription permettra au,à la lecteur-trice de recevoir par courriel le sommaire de chaque nouveau numéro de la revue. Cette liste permet aussi à la revue de revendiquer un certain niveau de soutien ou de lectorat. Voir la <a href=\"http://localhost/index.php/{$journalPath}/about/submissions#privacyStatement\">Déclaration de confidentialité</a> de la revue qui certifie aux lecteurs-trices que leur nom et leur courriel ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:211:\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par une autre revue. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:121:\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:62:\"Lorsque possible, les URL des références ont été fournies.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:256:\"Le texte est à simple interligne, utilise une police de 12 points, emploie l\'italique plutôt que le souligné (sauf pour les adresses URL) et place toutes les illustrations, figures et tableaux aux endroits appropriés dans le texte plutôt qu\'à la fin.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:263:\"Le texte se conforme aux exigences stylistiques et bibliographiques décrites dans les  <a href=\"http://localhost/index.php/{$journalPath}/about/submissions#authorGuidelines\">Directives aux auteurs</a>, qui se trouvent dans la section « À propos de la revue ».\";}}',NULL);
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'publicknowledge',1,'en_US',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,0,0),(9,2,9,0,1),(10,2,10,0,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(15,3,15,0,0),(16,3,16,0,1),(17,3,17,0,2),(18,3,18,0,3),(19,3,19,18,0),(20,3,20,18,1),(21,3,21,18,2),(22,3,22,18,3),(23,3,23,18,4);
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
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','navigation.current','string'),(16,'','titleLocaleKey','navigation.archives','string'),(17,'','titleLocaleKey','manager.announcements','string'),(18,'','titleLocaleKey','navigation.about','string'),(19,'','titleLocaleKey','about.aboutContext','string'),(20,'','titleLocaleKey','about.submissions','string'),(21,'','titleLocaleKey','about.editorialTeam','string'),(22,'','titleLocaleKey','manager.setup.privacyStatement','string'),(23,'','titleLocaleKey','about.contact','string'),(24,'','titleLocaleKey','common.search','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,NULL,'NMI_TYPE_CURRENT'),(16,1,NULL,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(18,1,NULL,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,NULL,'NMI_TYPE_ABOUT'),(20,1,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(21,1,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(22,1,NULL,NULL,'NMI_TYPE_PRIVACY'),(23,1,NULL,NULL,'NMI_TYPE_CONTACT'),(24,1,NULL,NULL,'NMI_TYPE_SEARCH');
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
INSERT INTO `notes` VALUES (1,1048586,1,6,'2022-11-07 23:59:19','2022-11-07 23:59:19','Recommendation','<p>Daniel Barnes, David Buskins, Stephanie Berardo:<br><br>The recommendation regarding the submission to Journal of Public Knowledge, \"The influence of lactation on the quantity and quality of cashmere production\" is: Accept Submission</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES (1,'blocked_emailed_notification','8',17,1,'int'),(2,'blocked_emailed_notification','268435477',17,1,'int'),(3,'blocked_emailed_notification','8',18,1,'int'),(4,'blocked_emailed_notification','268435477',18,1,'int'),(5,'blocked_emailed_notification','8',19,1,'int'),(6,'blocked_emailed_notification','268435477',19,1,'int'),(7,'blocked_emailed_notification','8',20,1,'int'),(8,'blocked_emailed_notification','268435477',20,1,'int'),(9,'blocked_emailed_notification','8',21,1,'int'),(10,'blocked_emailed_notification','268435477',21,1,'int'),(11,'blocked_emailed_notification','8',22,1,'int'),(12,'blocked_emailed_notification','268435477',22,1,'int'),(13,'blocked_emailed_notification','8',23,1,'int'),(14,'blocked_emailed_notification','268435477',23,1,'int'),(15,'blocked_emailed_notification','8',24,1,'int'),(16,'blocked_emailed_notification','268435477',24,1,'int'),(17,'blocked_emailed_notification','8',25,1,'int'),(18,'blocked_emailed_notification','268435477',25,1,'int'),(19,'blocked_emailed_notification','8',26,1,'int'),(20,'blocked_emailed_notification','268435477',26,1,'int'),(21,'blocked_emailed_notification','8',27,1,'int'),(22,'blocked_emailed_notification','268435477',27,1,'int'),(23,'blocked_emailed_notification','8',28,1,'int'),(24,'blocked_emailed_notification','268435477',28,1,'int'),(25,'blocked_emailed_notification','8',29,1,'int'),(26,'blocked_emailed_notification','268435477',29,1,'int'),(27,'blocked_emailed_notification','8',30,1,'int'),(28,'blocked_emailed_notification','268435477',30,1,'int'),(29,'blocked_emailed_notification','8',31,1,'int'),(30,'blocked_emailed_notification','268435477',31,1,'int'),(31,'blocked_emailed_notification','8',32,1,'int'),(32,'blocked_emailed_notification','268435477',32,1,'int'),(33,'blocked_emailed_notification','8',33,1,'int'),(34,'blocked_emailed_notification','268435477',33,1,'int'),(35,'blocked_emailed_notification','8',34,1,'int'),(36,'blocked_emailed_notification','268435477',34,1,'int'),(37,'blocked_emailed_notification','8',35,1,'int'),(38,'blocked_emailed_notification','268435477',35,1,'int');
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
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,1,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(5,1,3,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(7,1,5,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(9,1,4,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(11,1,13,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(13,1,11,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(15,1,10,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(17,1,14,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(19,1,8,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(21,1,6,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(23,1,7,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(25,1,16,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(27,1,9,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(29,1,15,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(31,1,2,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(33,1,12,2,268435477,'2022-11-07 23:55:53',NULL,0,0),(37,1,3,2,16777217,'2022-11-07 23:56:21',NULL,1048585,1),(39,1,5,2,16777217,'2022-11-07 23:56:21',NULL,1048585,1),(41,1,4,2,16777217,'2022-11-07 23:56:21',NULL,1048585,1),(43,1,0,2,16777243,'2022-11-07 23:56:21',NULL,1048585,1),(44,1,0,2,16777245,'2022-11-07 23:56:21',NULL,1048585,1),(46,1,0,2,16777236,'2022-11-07 23:56:27','2022-11-07 23:56:29',523,1),(48,1,7,3,16777227,'2022-11-07 23:56:33',NULL,517,1),(51,1,9,3,16777227,'2022-11-07 23:56:38',NULL,517,2),(54,1,10,3,16777227,'2022-11-07 23:56:42',NULL,517,3),(64,1,17,2,16777235,'2022-11-07 23:56:53',NULL,1048585,1),(75,1,3,2,16777217,'2022-11-07 23:58:58',NULL,1048585,2),(77,1,5,2,16777217,'2022-11-07 23:58:58',NULL,1048585,2),(79,1,4,2,16777217,'2022-11-07 23:58:58',NULL,1048585,2),(81,1,0,2,16777243,'2022-11-07 23:58:58',NULL,1048585,2),(82,1,0,2,16777245,'2022-11-07 23:58:58',NULL,1048585,2),(84,1,0,2,16777236,'2022-11-07 23:59:04','2022-11-07 23:59:06',523,2),(85,1,18,2,16777231,'2022-11-07 23:59:04',NULL,1048585,2),(88,1,3,3,16777249,'2022-11-07 23:59:19',NULL,1048586,1),(90,1,4,3,16777249,'2022-11-07 23:59:20',NULL,1048586,1),(92,1,5,3,16777249,'2022-11-07 23:59:20',NULL,1048586,1),(94,1,3,2,16777217,'2022-11-07 23:59:43',NULL,1048585,3),(96,1,5,2,16777217,'2022-11-07 23:59:43',NULL,1048585,3),(98,1,4,2,16777217,'2022-11-07 23:59:44',NULL,1048585,3),(100,1,0,2,16777243,'2022-11-07 23:59:44',NULL,1048585,3),(101,1,0,2,16777245,'2022-11-07 23:59:44',NULL,1048585,3),(103,1,0,2,16777236,'2022-11-07 23:59:49','2022-11-07 23:59:51',523,3),(105,1,9,3,16777227,'2022-11-07 23:59:55',NULL,517,4),(108,1,10,3,16777227,'2022-11-08 00:00:00',NULL,517,5),(112,1,19,2,16777230,'2022-11-08 00:00:02',NULL,1048585,3),(113,1,3,2,16777251,'2022-11-08 00:00:02','2022-11-08 00:00:04',1048585,3),(114,1,4,2,16777251,'2022-11-08 00:00:02',NULL,1048585,3),(115,1,5,2,16777251,'2022-11-08 00:00:02',NULL,1048585,3),(118,1,3,2,16777217,'2022-11-08 00:00:29',NULL,1048585,4),(120,1,5,2,16777217,'2022-11-08 00:00:29',NULL,1048585,4),(122,1,4,2,16777217,'2022-11-08 00:00:29',NULL,1048585,4),(124,1,0,2,16777243,'2022-11-08 00:00:29',NULL,1048585,4),(125,1,0,2,16777245,'2022-11-08 00:00:29',NULL,1048585,4),(128,1,3,2,16777217,'2022-11-08 00:00:46',NULL,1048585,5),(130,1,5,2,16777217,'2022-11-08 00:00:46',NULL,1048585,5),(132,1,4,2,16777217,'2022-11-08 00:00:46',NULL,1048585,5),(134,1,0,2,16777243,'2022-11-08 00:00:46',NULL,1048585,5),(135,1,0,2,16777245,'2022-11-08 00:00:46',NULL,1048585,5),(137,1,0,2,16777236,'2022-11-08 00:00:52','2022-11-08 00:00:54',523,4),(139,1,8,3,16777227,'2022-11-08 00:00:58',NULL,517,6),(142,1,10,3,16777227,'2022-11-08 00:01:03',NULL,517,7),(152,1,21,2,16777235,'2022-11-08 00:01:14',NULL,1048585,5),(153,1,3,2,16777254,'2022-11-08 00:01:14','2022-11-08 00:01:15',1048585,5),(154,1,4,2,16777254,'2022-11-08 00:01:14',NULL,1048585,5),(155,1,5,2,16777254,'2022-11-08 00:01:14',NULL,1048585,5),(158,1,3,2,16777217,'2022-11-08 00:01:42',NULL,1048585,6),(160,1,5,2,16777217,'2022-11-08 00:01:42',NULL,1048585,6),(162,1,4,2,16777217,'2022-11-08 00:01:42',NULL,1048585,6),(164,1,0,2,16777243,'2022-11-08 00:01:42',NULL,1048585,6),(165,1,0,2,16777245,'2022-11-08 00:01:42',NULL,1048585,6),(167,1,0,2,16777236,'2022-11-08 00:01:47','2022-11-08 00:01:50',523,5),(169,1,7,3,16777227,'2022-11-08 00:01:54',NULL,517,8),(172,1,10,3,16777227,'2022-11-08 00:01:59',NULL,517,9),(182,1,22,2,16777235,'2022-11-08 00:02:09',NULL,1048585,6),(183,1,3,2,16777254,'2022-11-08 00:02:09','2022-11-08 00:02:11',1048585,6),(184,1,4,2,16777254,'2022-11-08 00:02:09',NULL,1048585,6),(185,1,5,2,16777254,'2022-11-08 00:02:09',NULL,1048585,6),(187,1,3,2,16777217,'2022-11-08 00:02:33',NULL,1048585,7),(189,1,5,2,16777217,'2022-11-08 00:02:33',NULL,1048585,7),(191,1,4,2,16777217,'2022-11-08 00:02:33',NULL,1048585,7),(193,1,0,2,16777243,'2022-11-08 00:02:33',NULL,1048585,7),(194,1,0,2,16777245,'2022-11-08 00:02:33',NULL,1048585,7),(196,1,0,2,16777236,'2022-11-08 00:02:39','2022-11-08 00:02:41',523,6),(197,1,23,2,16777231,'2022-11-08 00:02:39',NULL,1048585,7),(201,1,9,3,16777227,'2022-11-08 00:02:50',NULL,517,11),(204,1,10,3,16777227,'2022-11-08 00:02:55',NULL,517,12),(208,1,3,2,16777219,'2022-11-08 00:03:03',NULL,517,10),(210,1,4,2,16777219,'2022-11-08 00:03:03',NULL,517,10),(212,1,5,2,16777219,'2022-11-08 00:03:03',NULL,517,10),(215,1,3,2,16777217,'2022-11-08 00:03:24',NULL,1048585,8),(217,1,5,2,16777217,'2022-11-08 00:03:24',NULL,1048585,8),(219,1,4,2,16777217,'2022-11-08 00:03:24',NULL,1048585,8),(221,1,0,2,16777243,'2022-11-08 00:03:24',NULL,1048585,8),(222,1,0,2,16777245,'2022-11-08 00:03:24',NULL,1048585,8),(225,1,3,2,16777217,'2022-11-08 00:03:42',NULL,1048585,9),(227,1,6,2,16777217,'2022-11-08 00:03:42',NULL,1048585,9),(229,1,0,2,16777243,'2022-11-08 00:03:42',NULL,1048585,9),(230,1,0,2,16777245,'2022-11-08 00:03:42',NULL,1048585,9),(232,1,0,2,16777236,'2022-11-08 00:03:48','2022-11-08 00:03:50',523,7),(234,1,7,3,16777227,'2022-11-08 00:03:54',NULL,517,13),(237,1,10,3,16777227,'2022-11-08 00:03:59',NULL,517,14),(246,1,25,2,16777235,'2022-11-08 00:04:09',NULL,1048585,9),(247,1,3,2,16777254,'2022-11-08 00:04:09','2022-11-08 00:04:11',1048585,9),(248,1,6,2,16777254,'2022-11-08 00:04:09',NULL,1048585,9),(251,1,3,2,16777217,'2022-11-08 00:04:44',NULL,1048585,11),(253,1,5,2,16777217,'2022-11-08 00:04:44',NULL,1048585,11),(255,1,4,2,16777217,'2022-11-08 00:04:44',NULL,1048585,11),(257,1,0,2,16777243,'2022-11-08 00:04:44',NULL,1048585,11),(258,1,0,2,16777245,'2022-11-08 00:04:44',NULL,1048585,11),(260,1,0,2,16777236,'2022-11-08 00:04:51','2022-11-08 00:04:53',523,8),(261,1,26,2,16777231,'2022-11-08 00:04:51',NULL,1048585,11),(269,1,3,2,16777219,'2022-11-08 00:05:10',NULL,517,15),(271,1,4,2,16777219,'2022-11-08 00:05:10',NULL,517,15),(273,1,5,2,16777219,'2022-11-08 00:05:10',NULL,517,15),(276,1,3,2,16777219,'2022-11-08 00:05:19',NULL,517,16),(278,1,4,2,16777219,'2022-11-08 00:05:19',NULL,517,16),(280,1,5,2,16777219,'2022-11-08 00:05:19',NULL,517,16),(283,1,3,2,16777217,'2022-11-08 00:05:40',NULL,1048585,12),(285,1,5,2,16777217,'2022-11-08 00:05:40',NULL,1048585,12),(287,1,4,2,16777217,'2022-11-08 00:05:40',NULL,1048585,12),(289,1,0,2,16777243,'2022-11-08 00:05:40',NULL,1048585,12),(290,1,0,2,16777245,'2022-11-08 00:05:40',NULL,1048585,12),(293,1,3,2,16777217,'2022-11-08 00:05:58',NULL,1048585,13),(295,1,5,2,16777217,'2022-11-08 00:05:58',NULL,1048585,13),(297,1,4,2,16777217,'2022-11-08 00:05:59',NULL,1048585,13),(299,1,0,2,16777243,'2022-11-08 00:05:59',NULL,1048585,13),(300,1,0,2,16777245,'2022-11-08 00:05:59',NULL,1048585,13),(302,1,0,2,16777236,'2022-11-08 00:06:05','2022-11-08 00:06:07',523,9),(303,1,28,2,16777231,'2022-11-08 00:06:05',NULL,1048585,13),(304,1,7,3,16777227,'2022-11-08 00:06:12',NULL,517,17),(307,1,8,3,16777227,'2022-11-08 00:06:16',NULL,517,18),(310,1,3,2,16777217,'2022-11-08 00:06:35',NULL,1048585,14),(312,1,5,2,16777217,'2022-11-08 00:06:35',NULL,1048585,14),(314,1,4,2,16777217,'2022-11-08 00:06:35',NULL,1048585,14),(316,1,0,2,16777243,'2022-11-08 00:06:35',NULL,1048585,14),(317,1,0,2,16777245,'2022-11-08 00:06:35',NULL,1048585,14),(319,1,0,2,16777236,'2022-11-08 00:06:42','2022-11-08 00:06:44',523,10),(331,1,3,2,16777219,'2022-11-08 00:07:07',NULL,517,19),(333,1,4,2,16777219,'2022-11-08 00:07:07',NULL,517,19),(335,1,5,2,16777219,'2022-11-08 00:07:07',NULL,517,19),(338,1,3,2,16777219,'2022-11-08 00:07:16',NULL,517,20),(340,1,4,2,16777219,'2022-11-08 00:07:16',NULL,517,20),(342,1,5,2,16777219,'2022-11-08 00:07:16',NULL,517,20),(345,1,3,2,16777219,'2022-11-08 00:07:26',NULL,517,21),(347,1,4,2,16777219,'2022-11-08 00:07:26',NULL,517,21),(349,1,5,2,16777219,'2022-11-08 00:07:26',NULL,517,21),(352,1,29,3,16777232,'2022-11-08 00:07:37',NULL,1048585,14),(353,1,3,2,16777217,'2022-11-08 00:07:55',NULL,1048585,15),(355,1,5,2,16777217,'2022-11-08 00:07:55',NULL,1048585,15),(357,1,4,2,16777217,'2022-11-08 00:07:55',NULL,1048585,15),(359,1,0,2,16777243,'2022-11-08 00:07:55',NULL,1048585,15),(360,1,0,2,16777245,'2022-11-08 00:07:55',NULL,1048585,15),(362,1,3,2,16777217,'2022-11-08 00:08:12',NULL,1048585,16),(364,1,5,2,16777217,'2022-11-08 00:08:12',NULL,1048585,16),(366,1,4,2,16777217,'2022-11-08 00:08:13',NULL,1048585,16),(368,1,0,2,16777243,'2022-11-08 00:08:13',NULL,1048585,16),(369,1,0,2,16777245,'2022-11-08 00:08:13',NULL,1048585,16),(371,1,0,2,16777236,'2022-11-08 00:08:20','2022-11-08 00:08:22',523,11),(373,1,8,3,16777227,'2022-11-08 00:08:26',NULL,517,22),(376,1,9,3,16777227,'2022-11-08 00:08:31',NULL,517,23),(386,1,31,2,16777235,'2022-11-08 00:08:41',NULL,1048585,16),(387,1,3,2,16777254,'2022-11-08 00:08:41','2022-11-08 00:08:43',1048585,16),(388,1,4,2,16777254,'2022-11-08 00:08:41',NULL,1048585,16),(389,1,5,2,16777254,'2022-11-08 00:08:41',NULL,1048585,16),(391,1,3,2,16777217,'2022-11-08 00:09:06',NULL,1048585,17),(393,1,5,2,16777217,'2022-11-08 00:09:06',NULL,1048585,17),(395,1,4,2,16777217,'2022-11-08 00:09:06',NULL,1048585,17),(397,1,0,2,16777243,'2022-11-08 00:09:06',NULL,1048585,17),(398,1,0,2,16777245,'2022-11-08 00:09:06',NULL,1048585,17),(400,1,3,2,16777217,'2022-11-08 00:09:24',NULL,1048585,18),(402,1,5,2,16777217,'2022-11-08 00:09:24',NULL,1048585,18),(404,1,4,2,16777217,'2022-11-08 00:09:24',NULL,1048585,18),(406,1,0,2,16777243,'2022-11-08 00:09:24',NULL,1048585,18),(407,1,0,2,16777245,'2022-11-08 00:09:24',NULL,1048585,18),(409,1,0,2,16777236,'2022-11-08 00:09:32','2022-11-08 00:09:34',523,12),(411,1,7,3,16777227,'2022-11-08 00:09:39',NULL,517,24),(414,1,8,3,16777227,'2022-11-08 00:09:44',NULL,517,25),(424,1,33,2,16777235,'2022-11-08 00:09:54',NULL,1048585,18),(430,1,3,2,16777217,'2022-11-08 00:10:36',NULL,1048585,19),(432,1,5,2,16777217,'2022-11-08 00:10:36',NULL,1048585,19),(434,1,4,2,16777217,'2022-11-08 00:10:36',NULL,1048585,19),(436,1,0,2,16777243,'2022-11-08 00:10:36',NULL,1048585,19),(437,1,0,2,16777245,'2022-11-08 00:10:36',NULL,1048585,19),(440,1,34,2,16777234,'2022-11-08 00:10:45',NULL,1048585,19),(441,1,3,2,16777217,'2022-11-08 00:11:04',NULL,1048585,20),(443,1,6,2,16777217,'2022-11-08 00:11:04',NULL,1048585,20),(445,1,0,2,16777243,'2022-11-08 00:11:04',NULL,1048585,20),(446,1,0,2,16777245,'2022-11-08 00:11:04',NULL,1048585,20),(448,1,0,2,16777236,'2022-11-08 00:11:12','2022-11-08 00:11:14',523,13),(450,1,8,3,16777227,'2022-11-08 00:11:18',NULL,517,26),(453,1,9,3,16777227,'2022-11-08 00:11:23',NULL,517,27),(457,1,35,2,16777230,'2022-11-08 00:11:25',NULL,1048585,20),(458,1,3,2,16777251,'2022-11-08 00:11:25','2022-11-08 00:11:27',1048585,20),(459,1,6,2,16777251,'2022-11-08 00:11:25',NULL,1048585,20);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','a:29:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:2;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:3;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:4;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:5;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:6;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:7;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:8;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:9;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:10;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:11;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:12;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:13;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:14;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:15;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:16;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:17;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:18;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:19;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:20;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:21;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:22;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:23;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:24;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:25;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:26;a:3:{s:9:\"className\";s:35:\"lib.pkp.classes.task.ReviewReminder\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:27;a:3:{s:9:\"className\";s:37:\"lib.pkp.classes.task.StatisticsReport\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}i:28;a:3:{s:9:\"className\";s:40:\"classes.tasks.SubscriptionExpiryReminder\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}}','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInJournalIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('pdfjsviewerplugin',1,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','63699a64e9883','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
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
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galley_settings`
--

LOCK TABLES `publication_galley_settings` WRITE;
/*!40000 ALTER TABLE `publication_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galleys`
--

DROP TABLE IF EXISTS `publication_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',3,0,'',0,''),(2,'en_US',2,'PDF Version 2',3,0,'',0,'pdf'),(3,'en_US',11,'test galley 1',17,0,NULL,0,NULL),(4,'en_US',19,'PDF',29,0,'',0,'');
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','a:0:{}'),(1,'','copyrightYear','2022'),(1,'','issueId','1'),(1,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(1,'en_US','copyrightHolder','Journal of Public Knowledge'),(1,'en_US','prefix','The'),(1,'en_US','subtitle','A Review Of The Literature And Empirical Evidence'),(1,'en_US','title','Signalling Theory Dividends'),(1,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(2,'','categoryIds','a:0:{}'),(2,'','copyrightYear','2022'),(2,'','issueId','1'),(2,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(2,'en_US','copyrightHolder','Journal of Public Knowledge'),(2,'en_US','prefix','The'),(2,'en_US','subtitle','A Review Of The Literature And Empirical Evidence'),(2,'en_US','title','Signalling Theory Dividends Version 2'),(2,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(3,'','categoryIds','a:0:{}'),(3,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','a:0:{}'),(4,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','a:0:{}'),(5,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(5,'fr_CA','abstract',''),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','a:0:{}'),(6,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Genetic transformation of forest trees'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','a:0:{}'),(7,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','a:0:{}'),(8,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Developing efficacy beliefs in the classroom'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','a:0:{}'),(9,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Traditions and Trends in the Study of the Commons'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','a:0:{}'),(10,'en_US','abstract','<p>None.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','a:0:{}'),(11,'','copyrightYear','2020'),(11,'','issueId','2'),(11,'','pages','1-2'),(11,'en_US','abstract','<p>test submission 2 - abstract</p>'),(11,'en_US','copyrightHolder','test'),(11,'en_US','coverImage','a:2:{s:10:\"uploadName\";s:36:\"submission_9_16_coverImage_en_US.jpg\";s:7:\"altText\";s:12:\"test-c-image\";}'),(11,'en_US','prefix','the'),(11,'en_US','subtitle','test submission 2 - subtitle'),(11,'en_US','title','test submission 2 - title'),(12,'','categoryIds','a:0:{}'),(12,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','a:0:{}'),(13,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Learning Sustainable Design through Service'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','a:0:{}'),(14,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(14,'fr_CA','abstract',''),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','a:0:{}'),(15,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','a:0:{}'),(16,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','a:0:{}'),(17,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Yam diseases and its management in Nigeria'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','a:0:{}'),(18,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(18,'fr_CA','abstract',''),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','a:0:{}'),(19,'','copyrightYear','2022'),(19,'','issueId','1'),(19,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(19,'en_US','copyrightHolder','Journal of Public Knowledge'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title',''),(20,'','categoryIds','a:0:{}'),(20,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(20,'en_US','prefix',''),(20,'en_US','subtitle',''),(20,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(20,'fr_CA','abstract',''),(20,'fr_CA','prefix',''),(20,'fr_CA','subtitle',''),(20,'fr_CA','title',''),(21,'','categoryIds','a:0:{}'),(21,'en_US','abstract','<p>None.</p>'),(21,'en_US','prefix',''),(21,'en_US','subtitle',''),(21,'en_US','title','Finocchiaro: Arguments About Arguments'),(21,'fr_CA','abstract',''),(21,'fr_CA','prefix',''),(21,'fr_CA','subtitle',''),(21,'fr_CA','title','');
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
  `access_status` bigint(20) DEFAULT '0',
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,'2022-11-07','2022-11-07 23:57:54','en_US',1,1,0,1,3,NULL,1),(2,0,'2022-11-07','2022-11-07 23:58:24','en_US',3,1,0,1,1,'mwandenga',2),(3,0,NULL,'2022-11-07 23:59:12','en_US',5,1,0,2,1,NULL,1),(4,0,NULL,'2022-11-07 23:59:43','en_US',6,1,0,3,1,NULL,1),(5,0,NULL,'2022-11-08 00:00:28','en_US',7,1,0,4,1,NULL,1),(6,0,NULL,'2022-11-08 00:00:46','en_US',9,1,0,5,1,NULL,1),(7,0,NULL,'2022-11-08 00:01:41','en_US',10,1,0,6,1,NULL,1),(8,0,NULL,'2022-11-08 00:02:32','en_US',11,1,0,7,1,NULL,1),(9,0,NULL,'2022-11-08 00:03:23','en_US',12,1,0,8,1,NULL,1),(10,0,NULL,'2022-11-08 00:03:41','en_US',14,2,0,9,1,NULL,1),(11,0,NULL,'2022-11-08 00:04:27','en_US',15,1,0,10,5,'te-1',1),(12,0,NULL,'2022-11-08 00:04:43','en_US',16,1,0,11,1,NULL,1),(13,0,NULL,'2022-11-08 00:05:39','en_US',17,1,0,12,1,NULL,1),(14,0,NULL,'2022-11-08 00:05:58','en_US',19,1,0,13,1,NULL,1),(15,0,NULL,'2022-11-08 00:06:34','en_US',20,1,0,14,1,NULL,1),(16,0,NULL,'2022-11-08 00:07:54','en_US',21,1,0,15,1,NULL,1),(17,0,NULL,'2022-11-08 00:08:12','en_US',22,1,0,16,1,NULL,1),(18,0,NULL,'2022-11-08 00:09:05','en_US',23,1,0,17,1,NULL,1),(19,0,'2022-11-08','2022-11-08 00:10:16','en_US',24,1,0,18,3,NULL,1),(20,0,NULL,'2022-11-08 00:10:35','en_US',25,1,0,19,1,NULL,1),(21,0,NULL,'2022-11-08 00:11:03','en_US',26,2,0,20,1,NULL,1);
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
INSERT INTO `queries` VALUES (1,1048585,2,3,1,NULL,NULL,0);
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
INSERT INTO `query_participants` VALUES (1,3),(1,4),(1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,7,NULL,NULL,'2022-11-07 23:56:33','2022-11-07 23:56:33',NULL,NULL,NULL,'2022-12-05 00:00:00','2022-12-05 00:00:00','2022-11-07 23:56:33',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,1,9,NULL,NULL,'2022-11-07 23:56:38','2022-11-07 23:56:38',NULL,NULL,NULL,'2022-12-05 00:00:00','2022-12-05 00:00:00','2022-11-07 23:56:38',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(3,1,10,NULL,NULL,'2022-11-07 23:56:42','2022-11-07 23:56:42',NULL,NULL,NULL,'2022-12-05 00:00:00','2022-12-05 00:00:00','2022-11-07 23:56:42',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(4,3,9,NULL,NULL,'2022-11-07 23:59:55','2022-11-07 23:59:55',NULL,NULL,NULL,'2022-12-05 00:00:00','2022-12-05 00:00:00','2022-11-07 23:59:55',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,0),(5,3,10,NULL,NULL,'2022-11-08 00:00:00','2022-11-08 00:00:00',NULL,NULL,NULL,'2022-12-05 00:00:00','2022-12-05 00:00:00','2022-11-08 00:00:00',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2022-11-08 00:00:58','2022-11-08 00:00:58',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:00:58',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(7,5,10,NULL,NULL,'2022-11-08 00:01:03','2022-11-08 00:01:03',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:01:03',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(8,6,7,NULL,NULL,'2022-11-08 00:01:54','2022-11-08 00:01:54',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:01:54',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,0),(9,6,10,NULL,NULL,'2022-11-08 00:01:59','2022-11-08 00:01:59',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:01:59',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,0),(10,7,8,NULL,5,'2022-11-08 00:02:45','2022-11-08 00:02:45','2022-11-08 00:03:00','2022-11-08 00:03:03',NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:03:03',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,4,0,0),(11,7,9,NULL,NULL,'2022-11-08 00:02:50','2022-11-08 00:02:50',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:02:50',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(12,7,10,NULL,NULL,'2022-11-08 00:02:55','2022-11-08 00:02:55',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:02:55',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(13,9,7,NULL,NULL,'2022-11-08 00:03:54','2022-11-08 00:03:54',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:03:54',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,0),(14,9,10,NULL,NULL,'2022-11-08 00:03:59','2022-11-08 00:03:59',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:03:59',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,0),(15,11,9,NULL,2,'2022-11-08 00:04:57','2022-11-08 00:04:57','2022-11-08 00:05:07','2022-11-08 00:05:10',NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:05:10',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,0,0),(16,11,10,NULL,3,'2022-11-08 00:05:02','2022-11-08 00:05:02','2022-11-08 00:05:15','2022-11-08 00:05:19',NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:05:19',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,0,0),(17,13,7,NULL,NULL,'2022-11-08 00:06:12','2022-11-08 00:06:12',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:06:12',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,1,NULL,0),(18,13,8,NULL,NULL,'2022-11-08 00:06:16','2022-11-08 00:06:16',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:06:16',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,1,NULL,0),(19,14,7,NULL,2,'2022-11-08 00:06:49','2022-11-08 00:06:49','2022-11-08 00:07:04','2022-11-08 00:07:07',NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:07:07',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,0,0),(20,14,9,NULL,2,'2022-11-08 00:06:54','2022-11-08 00:06:54','2022-11-08 00:07:12','2022-11-08 00:07:16',NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:07:16',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,0,0),(21,14,10,NULL,3,'2022-11-08 00:06:59','2022-11-08 00:06:59','2022-11-08 00:07:22','2022-11-08 00:07:26',NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:07:26',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,0,0),(22,16,8,NULL,NULL,'2022-11-08 00:08:26','2022-11-08 00:08:26',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:08:26',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,0),(23,16,9,NULL,NULL,'2022-11-08 00:08:31','2022-11-08 00:08:31',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:08:31',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,0),(24,18,7,NULL,NULL,'2022-11-08 00:09:39','2022-11-08 00:09:39',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:09:39',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,0),(25,18,8,NULL,NULL,'2022-11-08 00:09:44','2022-11-08 00:09:44',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:09:44',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,0),(26,20,8,NULL,NULL,'2022-11-08 00:11:18','2022-11-08 00:11:18',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:11:18',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,0),(27,20,9,NULL,NULL,'2022-11-08 00:11:23','2022-11-08 00:11:23',NULL,NULL,NULL,'2022-12-06 00:00:00','2022-12-06 00:00:00','2022-11-08 00:11:23',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,0);
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
INSERT INTO `review_files` VALUES (1,2),(2,2),(3,2),(6,8),(7,8),(8,10),(9,10),(13,14),(14,14),(15,19),(16,19),(17,22),(18,22),(24,28),(25,28),(26,32),(27,32);
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
INSERT INTO `review_round_files` VALUES (1,1,3,2,1),(5,4,3,8,1),(6,5,3,10,1),(9,7,3,14,1),(11,8,3,19,1),(13,9,3,22,1),(18,12,3,28,1),(20,13,3,32,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES (1,1,3,1,NULL,4),(2,2,3,1,NULL,6),(3,3,3,1,NULL,4),(4,5,3,1,NULL,4),(5,6,3,1,NULL,4),(6,7,3,1,NULL,8),(7,9,3,1,NULL,4),(8,11,3,1,NULL,8),(9,13,3,1,NULL,7),(10,14,3,1,NULL,1),(11,16,3,1,NULL,4),(12,18,3,1,NULL,4),(13,20,3,1,NULL,4);
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
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
INSERT INTO `scheduled_tasks` VALUES ('classes.tasks.SubscriptionExpiryReminder','2022-11-07 23:52:58'),('lib.pkp.classes.task.ReviewReminder','2022-11-07 23:52:58'),('lib.pkp.classes.task.StatisticsReport','2022-11-07 23:52:58'),('plugins.generic.usageStats.UsageStatsLoader','2022-11-07 23:52:57'),('plugins.importexport.crossref.CrossrefInfoSender','2022-11-07 23:52:58'),('plugins.importexport.datacite.DataciteInfoSender','2022-11-07 23:52:58'),('plugins.importexport.doaj.DOAJInfoSender','2022-11-07 23:52:58'),('plugins.importexport.medra.MedraInfoSender','2022-11-07 23:52:57');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_editors`
--

DROP TABLE IF EXISTS `section_editors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_editors` (
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`section_id`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_editors`
--

LOCK TABLES `section_editors` WRITE;
/*!40000 ALTER TABLE `section_editors` DISABLE KEYS */;
INSERT INTO `section_editors` VALUES (1,1,4),(1,1,5),(1,2,6);
/*!40000 ALTER TABLE `section_editors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'en_US','abbrev','ART','string'),(1,'en_US','identifyType','','string'),(1,'en_US','policy','<p>Section default policy</p>','string'),(1,'en_US','title','Articles','string'),(1,'fr_CA','abbrev','','string'),(1,'fr_CA','identifyType','','string'),(1,'fr_CA','policy','','string'),(1,'fr_CA','title','','string'),(2,'en_US','abbrev','REV','string'),(2,'en_US','identifyType','Review Article','string'),(2,'en_US','policy','','string'),(2,'en_US','title','Reviews','string'),(2,'fr_CA','abbrev','','string'),(2,'fr_CA','identifyType','','string'),(2,'fr_CA','policy','','string'),(2,'fr_CA','title','','string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,0,1,0,1,1,0,0,0,500),(2,1,0,2,0,1,1,1,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('0dkbv5b5h2vi98qrhoel396kpi',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667866220,1667866247,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866247;s:5:\"token\";s:32:\"8d12afb1f9fe830c2f459712a1da45ed\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('0nv6ecroa2l1fj3bq2240vumcq',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865686,1667865735,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865735;s:5:\"token\";s:32:\"783240638e78362a344cf81e483242a5\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('0ohnl3330qfjljt96lqsf4651m',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865474,1667865498,0,'userId|s:1:\"3\";username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1667865498;s:5:\"token\";s:32:\"7c35c2928e17feff1abe9c96fa2a6374\";}','localhost'),('0um2frhrkhtegbm8g62kkvkqjn',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865442,1667865447,0,'userId|s:2:\"17\";username|s:10:\"amwandenga\";csrf|a:2:{s:9:\"timestamp\";i:1667865446;s:5:\"token\";s:32:\"83abfb9b80f7b4722c3ac017c56d4b9c\";}','localhost'),('1i70t62sae6m80u4jcbu1qepej',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865506,1667865513,0,'userId|i:5;username|s:8:\"sberardo\";csrf|a:2:{s:9:\"timestamp\";i:1667865513;s:5:\"token\";s:32:\"0877b26adff6d2687ec9c27ec04f7ccb\";}signedInAs|s:1:\"3\";','localhost'),('1vdbgp2ce7c5rrn6tltk61mb5q',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865457,1667865466,0,'userId|s:1:\"3\";username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1667865466;s:5:\"token\";s:32:\"649cc2b879ea06e3917d3af1daad3c56\";}','localhost'),('4lrf31nviukfj44tok59ijtjfq',30,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667866059,1667866075,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866075;s:5:\"token\";s:32:\"e3e499d63952b6e18aaa6ba399817002\";}username|s:7:\"pdaniel\";userId|s:2:\"30\";','localhost'),('6o7ued5dj54dmmd7nllu881ovk',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865921,1667865940,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865940;s:5:\"token\";s:32:\"2c6c9ce465c8864c0d73462497e8720b\";}username|s:10:\"kalkhafaji\";userId|s:2:\"27\";','localhost'),('6prs2fofpqil6hlsga2lv3v40m',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667866077,1667866128,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866128;s:5:\"token\";s:32:\"f19e7b3f882eab750103a99331d0d817\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('6tj7l36refnvdt0ktoltl0t93n',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865737,1667865784,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865784;s:5:\"token\";s:32:\"40c48bc1157c69b21cd633cdec8aa1c1\";}username|s:7:\"phudson\";','localhost'),('7bkk2qgdpgmcscde4b9hegoj3f',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865514,1667865521,0,'userId|i:5;username|s:8:\"sberardo\";csrf|a:2:{s:9:\"timestamp\";i:1667865521;s:5:\"token\";s:32:\"4b74ec67c7850df3eade5f06fc3d6503\";}signedInAs|s:1:\"3\";','localhost'),('7o3scark3hlliehk99e1hv8cnb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865498,1667865501,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865501;s:5:\"token\";s:32:\"bfd2b5a46bad3a82558eb7089973a57f\";}','localhost'),('8cvv3h5aj31na3040imj9k6v42',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865868,1667865920,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865920;s:5:\"token\";s:32:\"0e862e1286cad467551fc87cb9603e45\";}username|s:8:\"agallego\";','localhost'),('9dlc67tplifus1fj1cm59bjctf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865806,1667865859,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865860;s:5:\"token\";s:32:\"772af250073a54f1a8a1cf22814f4916\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('atcjkm7vt42vpui25jb8vh3jjd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865176,1667865176,0,'','localhost'),('bt69fsbne5sdanhr7hili9dgse',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667866147,1667866218,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866218;s:5:\"token\";s:32:\"dd477777ac2398a03702552381c1fe73\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('fi4j4qcm5cc0ucpap7jbb1up5f',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865203,1667865212,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865212;s:5:\"token\";s:32:\"5da4b451db526374bfc30e31d62ddf1d\";}','localhost'),('fkkso2fvnkcrtn8f818pl5em7t',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865448,1667865457,0,'username|s:10:\"amwandenga\";csrf|a:2:{s:9:\"timestamp\";i:1667865457;s:5:\"token\";s:32:\"d028f6f397841c49faec282abb5329b5\";}userId|s:2:\"17\";','localhost'),('fq9b33rrn5v91nrbtphd4lbr8m',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865567,1667865608,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865608;s:5:\"token\";s:32:\"3a8a356cb584eed78f439a96d122b4e9\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('h3echigc5m1hc09faunkekdo15',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865522,1667865566,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865566;s:5:\"token\";s:32:\"19ff7d7223f983a3220c034668e4f857\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('hqs1jmjidmg3kum3cd91oomblq',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865177,1667865188,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865188;s:5:\"token\";s:32:\"45a4625575aee4ebe625104fe82b112c\";}','localhost'),('i6cu53dk8nkmj33ipd24q3eul6',32,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667866129,1667866146,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866146;s:5:\"token\";s:32:\"5250ed16f025f45941d3618cb0845c9b\";}username|s:6:\"rrossi\";userId|s:2:\"32\";','localhost'),('jhh7uuplc075vekbiiqeucgh2n',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865347,1667865353,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865352;s:5:\"token\";s:32:\"7746578d68e8ca241b5a0e6e5073eca2\";}','localhost'),('le1ei4723s0ki3gkhnr76ql4ce',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865861,1667865867,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865867;s:5:\"token\";s:32:\"1d8c30ff7f2c08f47a6bbf9de7ee05dd\";}','localhost'),('mrd5rn641er09s81qi7h26co8p',24,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865786,1667865805,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865805;s:5:\"token\";s:32:\"a1bd8cba1ca50225fc58d967d2bc0c15\";}username|s:7:\"eostrom\";userId|s:2:\"24\";','localhost'),('nql31kh4qqk0pqd8aarp0hevuo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865631,1667865684,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865684;s:5:\"token\";s:32:\"bc7e22cf122cddb602a57418cf460596\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('nqqcmopov350ddm73p3k7ejdod',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865354,1667865363,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865363;s:5:\"token\";s:32:\"f5b13eb82abc50432892141b00d124ce\";}','localhost'),('oa7ipsjabofqn0u9t4grilq7lb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865364,1667865423,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865424;s:5:\"token\";s:32:\"0c2768791608f36dcf167ad36b14abbd\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('phssbalnim0jb0caduid0s8tk8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667866248,1667866291,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866291;s:5:\"token\";s:32:\"82aa81ed96df8dc4367a38a67743f940\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('pt0g0qrpop1kardlv1tqivnhdd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865219,1667865345,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1667865345;s:5:\"token\";s:32:\"3d1fb747635c65c89cba28c0460fc283\";}','localhost'),('qg1q9ts34eac4qah8adcolt1l5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865978,1667866057,0,'csrf|a:2:{s:9:\"timestamp\";i:1667866057;s:5:\"token\";s:32:\"4bb7d2bbef02205712525b9df7df9083\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('rpp32rilfdvv2t5grddehsho89',20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865610,1667865629,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865629;s:5:\"token\";s:32:\"d6a4be75f34fac7768e51ec114da88f0\";}username|s:12:\"cmontgomerie\";userId|s:2:\"20\";','localhost'),('srh0s1go7kojli19hio52880p0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865501,1667865505,0,'userId|s:1:\"3\";username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1667865505;s:5:\"token\";s:32:\"ed334bf148b0fb683a446cf5f0ca2485\";}','localhost'),('ta35oo47rs3sqb2sd6nvha206d',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865188,1667865203,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865203;s:5:\"token\";s:32:\"30e1a4cef3f2dd33593340301a6e5287\";}','localhost'),('ts0ik4vent33dqcrhoe6r6blk6',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865212,1667865217,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1667865217;s:5:\"token\";s:32:\"a96c572b858fe36ab40379ec34df821a\";}','localhost'),('utimio2pam932tek5pk5cc393h',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865466,1667865474,0,'userId|s:1:\"3\";username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1667865474;s:5:\"token\";s:32:\"d2deda992b0f64a0204b513098619177\";}','localhost'),('vftqfapdctu44f889og4og61jr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865942,1667865977,0,'csrf|a:2:{s:9:\"timestamp\";i:1667865977;s:5:\"token\";s:32:\"ccbe54999ce4e60a567df2646cfebd86\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('vndbuvsmb5p5er3u1aiptdmtla',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/106.0.5249.91 Safari/537.36',1667865424,1667865442,0,'userId|s:1:\"3\";username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1667865442;s:5:\"token\";s:32:\"33d5324972962e9f9afe16f00bcb7143\";}','localhost');
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
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','pkpadmin@mailinator.com'),('contactName','en_US','Open Journal Systems'),('contactName','fr_CA','Open Journal Systems'),('themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,14,17,'2022-11-07 23:57:31',0,1),(2,1,3,3,'2022-11-07 23:56:21',0,1),(3,1,5,5,'2022-11-07 23:58:37',1,0),(4,1,5,4,'2022-11-07 23:56:21',0,1),(5,1,7,12,'2022-11-07 23:56:50',0,0),(6,1,11,14,'2022-11-07 23:56:58',0,0),(7,1,13,16,'2022-11-07 23:57:02',0,0),(8,2,14,18,'2022-11-07 23:58:47',0,0),(9,2,3,3,'2022-11-07 23:58:58',0,1),(10,2,5,5,'2022-11-07 23:58:58',0,1),(11,2,5,4,'2022-11-07 23:58:58',0,1),(12,2,5,6,'2022-11-07 23:59:08',1,1),(13,3,14,19,'2022-11-07 23:59:32',0,0),(14,3,3,3,'2022-11-07 23:59:43',0,1),(15,3,5,5,'2022-11-07 23:59:43',0,1),(16,3,5,4,'2022-11-07 23:59:43',0,1),(17,3,7,11,'2022-11-08 00:00:07',0,0),(18,4,14,20,'2022-11-08 00:00:15',0,0),(19,4,3,3,'2022-11-08 00:00:29',0,1),(20,4,5,5,'2022-11-08 00:00:29',0,1),(21,4,5,4,'2022-11-08 00:00:29',0,1),(22,5,14,21,'2022-11-08 00:00:36',0,0),(23,5,3,3,'2022-11-08 00:00:46',0,1),(24,5,5,5,'2022-11-08 00:00:46',0,1),(25,5,5,4,'2022-11-08 00:00:46',0,1),(26,5,7,11,'2022-11-08 00:01:11',0,0),(27,5,11,13,'2022-11-08 00:01:18',0,0),(28,5,13,15,'2022-11-08 00:01:22',0,0),(29,6,14,22,'2022-11-08 00:01:31',0,0),(30,6,3,3,'2022-11-08 00:01:42',0,1),(31,6,5,5,'2022-11-08 00:01:42',0,1),(32,6,5,4,'2022-11-08 00:01:42',0,1),(33,6,7,11,'2022-11-08 00:02:06',0,0),(34,6,11,13,'2022-11-08 00:02:14',0,0),(35,7,14,23,'2022-11-08 00:02:22',0,0),(36,7,3,3,'2022-11-08 00:02:33',0,1),(37,7,5,5,'2022-11-08 00:02:33',0,1),(38,7,5,4,'2022-11-08 00:02:33',0,1),(39,8,14,24,'2022-11-08 00:03:11',0,0),(40,8,3,3,'2022-11-08 00:03:24',0,1),(41,8,5,5,'2022-11-08 00:03:24',0,1),(42,8,5,4,'2022-11-08 00:03:24',0,1),(43,9,14,25,'2022-11-08 00:03:31',0,0),(44,9,3,3,'2022-11-08 00:03:42',0,1),(45,9,5,6,'2022-11-08 00:03:42',0,1),(46,9,7,12,'2022-11-08 00:04:06',0,0),(47,9,11,14,'2022-11-08 00:04:14',0,0),(48,9,13,16,'2022-11-08 00:04:18',0,0),(49,11,14,26,'2022-11-08 00:04:33',0,0),(50,11,3,3,'2022-11-08 00:04:44',0,1),(51,11,5,5,'2022-11-08 00:04:44',0,1),(52,11,5,4,'2022-11-08 00:04:44',0,1),(53,12,14,27,'2022-11-08 00:05:26',0,0),(54,12,3,3,'2022-11-08 00:05:40',0,1),(55,12,5,5,'2022-11-08 00:05:40',0,1),(56,12,5,4,'2022-11-08 00:05:40',0,1),(57,13,14,28,'2022-11-08 00:05:47',0,0),(58,13,3,3,'2022-11-08 00:05:58',0,1),(59,13,5,5,'2022-11-08 00:05:58',0,1),(60,13,5,4,'2022-11-08 00:05:58',0,1),(61,14,14,29,'2022-11-08 00:06:24',0,0),(62,14,3,3,'2022-11-08 00:06:35',0,1),(63,14,5,5,'2022-11-08 00:06:35',0,1),(64,14,5,4,'2022-11-08 00:06:35',0,1),(65,15,14,30,'2022-11-08 00:07:44',0,0),(66,15,3,3,'2022-11-08 00:07:55',0,1),(67,15,5,5,'2022-11-08 00:07:55',0,1),(68,15,5,4,'2022-11-08 00:07:55',0,1),(69,16,14,31,'2022-11-08 00:08:02',0,0),(70,16,3,3,'2022-11-08 00:08:12',0,1),(71,16,5,5,'2022-11-08 00:08:12',0,1),(72,16,5,4,'2022-11-08 00:08:12',0,1),(73,16,7,12,'2022-11-08 00:08:38',0,0),(74,16,11,14,'2022-11-08 00:08:46',0,0),(75,17,14,32,'2022-11-08 00:08:55',0,0),(76,17,3,3,'2022-11-08 00:09:06',0,1),(77,17,5,5,'2022-11-08 00:09:06',0,1),(78,17,5,4,'2022-11-08 00:09:06',0,1),(79,18,14,33,'2022-11-08 00:09:13',0,0),(80,18,3,3,'2022-11-08 00:09:24',0,1),(81,18,5,5,'2022-11-08 00:09:24',0,1),(82,18,5,4,'2022-11-08 00:09:24',0,1),(83,18,7,11,'2022-11-08 00:09:51',0,0),(84,18,11,13,'2022-11-08 00:09:59',0,0),(85,18,13,15,'2022-11-08 00:10:03',0,0),(86,19,14,34,'2022-11-08 00:10:25',0,0),(87,19,3,3,'2022-11-08 00:10:36',0,1),(88,19,5,5,'2022-11-08 00:10:36',0,1),(89,19,5,4,'2022-11-08 00:10:36',0,1),(90,20,14,35,'2022-11-08 00:10:53',0,0),(91,20,3,3,'2022-11-08 00:11:04',0,1),(92,20,5,6,'2022-11-08 00:11:04',0,1),(93,20,7,12,'2022-11-08 00:11:30',0,0);
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
INSERT INTO `submission_comments` VALUES (1,1,4096,7,10,8,'','<p>Here are my review comments</p>','2022-11-08 00:03:03',NULL,1),(2,1,4096,11,15,9,'','<p>Here are my review comments</p>','2022-11-08 00:05:10',NULL,1),(3,1,4096,11,16,10,'','<p>Here are my review comments</p>','2022-11-08 00:05:19',NULL,1),(4,1,4096,14,19,7,'','<p>Here are my review comments</p>','2022-11-08 00:07:07',NULL,1),(5,1,4096,14,20,9,'','<p>Here are my review comments</p>','2022-11-08 00:07:16',NULL,1),(6,1,4096,14,21,10,'','<p>Here are my review comments</p>','2022-11-08 00:07:25',NULL,1);
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','amwandenga, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','Article Text, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(2,'fr_CA','name','','string'),(3,'en_US','name','dbarnes, article.pdf','string'),(3,'fr_CA','name','','string'),(4,'en_US','name','ccorino, The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(4,'fr_CA','name','','string'),(5,'en_US','name','ckwantes, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(5,'fr_CA','name','','string'),(6,'en_US','name','cmontgomerie, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(6,'fr_CA','name','','string'),(7,'en_US','name','ddiouf, Genetic transformation of forest trees.pdf','string'),(7,'fr_CA','name','','string'),(8,'en_US','name','Article Text, Genetic transformation of forest trees.pdf','string'),(8,'fr_CA','name','','string'),(9,'en_US','name','dphillips, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(9,'fr_CA','name','','string'),(10,'en_US','name','Article Text, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(10,'fr_CA','name','','string'),(11,'en_US','name','dsokoloff, Developing efficacy beliefs in the classroom.pdf','string'),(11,'fr_CA','name','','string'),(12,'en_US','name','eostrom, Traditions and Trends in the Study of the Commons.pdf','string'),(12,'fr_CA','name','','string'),(13,'en_US','name','fpaglieri, Hansen & Pinto: Reason Reclaimed.pdf','string'),(13,'fr_CA','name','','string'),(14,'en_US','name','Article Text, Hansen & Pinto: Reason Reclaimed.pdf','string'),(14,'fr_CA','name','','string'),(15,'en_US','name','admin, test-upload-1.txt','string'),(16,'en_US','name','admin, test-upload-1.txt','string'),(17,'en_US','name','admin, test-upload-5.txt','string'),(18,'en_US','name','jnovak, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(18,'fr_CA','name','','string'),(19,'en_US','name','Article Text, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(19,'fr_CA','name','','string'),(20,'en_US','name','kalkhafaji, Learning Sustainable Design through Service.pdf','string'),(20,'fr_CA','name','','string'),(21,'en_US','name','lchristopher, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(21,'fr_CA','name','','string'),(22,'en_US','name','Article Text, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(22,'fr_CA','name','','string'),(23,'en_US','name','lkumiega, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(23,'fr_CA','name','','string'),(24,'en_US','name','pdaniel, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(24,'fr_CA','name','','string'),(25,'en_US','name','rbaiyewu, Yam diseases and its management in Nigeria.pdf','string'),(25,'fr_CA','name','','string'),(26,'en_US','name','rrossi, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(26,'fr_CA','name','','string'),(27,'en_US','name','vkarbasizaed, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(27,'fr_CA','name','','string'),(28,'en_US','name','Article Text, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(28,'fr_CA','name','','string'),(29,'en_US','name','dbarnes, article.pdf','string'),(29,'fr_CA','name','','string'),(30,'en_US','name','vwilliamson, Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(30,'fr_CA','name','','string'),(31,'en_US','name','zwoods, Finocchiaro: Arguments About Arguments.pdf','string'),(31,'fr_CA','name','','string'),(32,'en_US','name','Article Text, Finocchiaro: Arguments About Arguments.pdf','string'),(32,'fr_CA','name','','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,NULL,NULL,1,'application/pdf',1,14572,'Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf',2,NULL,NULL,1,'2022-11-07 23:56:15','2022-11-07 23:56:15',17,NULL,NULL),(2,1,1,1,1,'application/pdf',1,14572,'Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf',4,NULL,NULL,1,'2022-11-07 23:56:15','2022-11-07 23:56:27',17,NULL,NULL),(3,1,NULL,NULL,1,'application/pdf',1,14572,'article.pdf',10,NULL,NULL,0,'2022-11-07 23:57:21','2022-11-07 23:57:21',3,521,1),(4,1,NULL,NULL,2,'application/pdf',1,14572,'The influence of lactation on the quantity and quality of cashmere production.pdf',2,NULL,NULL,1,'2022-11-07 23:58:53','2022-11-07 23:58:53',18,NULL,NULL),(5,1,NULL,NULL,3,'application/pdf',1,14572,'The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf',2,NULL,NULL,1,'2022-11-07 23:59:38','2022-11-07 23:59:38',19,NULL,NULL),(6,1,NULL,NULL,4,'application/pdf',1,14572,'Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf',2,NULL,NULL,1,'2022-11-08 00:00:20','2022-11-08 00:00:20',20,NULL,NULL),(7,1,NULL,NULL,5,'application/pdf',1,14572,'Genetic transformation of forest trees.pdf',2,NULL,NULL,1,'2022-11-08 00:00:41','2022-11-08 00:00:41',21,NULL,NULL),(8,1,7,1,5,'application/pdf',1,14572,'Genetic transformation of forest trees.pdf',4,NULL,NULL,1,'2022-11-08 00:00:41','2022-11-08 00:00:52',21,NULL,NULL),(9,1,NULL,NULL,6,'application/pdf',1,14572,'Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf',2,NULL,NULL,1,'2022-11-08 00:01:36','2022-11-08 00:01:36',22,NULL,NULL),(10,1,9,1,6,'application/pdf',1,14572,'Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf',4,NULL,NULL,1,'2022-11-08 00:01:36','2022-11-08 00:01:48',22,NULL,NULL),(11,1,NULL,NULL,7,'application/pdf',1,14572,'Developing efficacy beliefs in the classroom.pdf',2,NULL,NULL,1,'2022-11-08 00:02:27','2022-11-08 00:02:27',23,NULL,NULL),(12,1,NULL,NULL,8,'application/pdf',1,14572,'Traditions and Trends in the Study of the Commons.pdf',2,NULL,NULL,1,'2022-11-08 00:03:16','2022-11-08 00:03:16',24,NULL,NULL),(13,1,NULL,NULL,9,'application/pdf',1,14572,'Hansen & Pinto: Reason Reclaimed.pdf',2,NULL,NULL,1,'2022-11-08 00:03:36','2022-11-08 00:03:36',25,NULL,NULL),(14,1,13,1,9,'application/pdf',1,14572,'Hansen & Pinto: Reason Reclaimed.pdf',4,NULL,NULL,1,'2022-11-08 00:03:36','2022-11-08 00:03:48',25,NULL,NULL),(15,1,NULL,NULL,10,'text/plain',1,47,'test-upload-1.txt',2,NULL,NULL,0,'2022-11-08 00:04:27','2022-11-08 00:04:27',1,NULL,NULL),(16,1,15,1,10,'text/plain',1,47,'test-upload-1.txt',6,NULL,NULL,0,'2022-11-08 00:04:27','2022-11-08 00:04:27',1,NULL,NULL),(17,1,NULL,NULL,10,'text/plain',2,47,'test-upload-5.txt',10,NULL,NULL,0,'2022-11-08 00:04:27','2022-11-08 00:04:27',1,521,3),(18,1,NULL,NULL,11,'application/pdf',1,14572,'Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf',2,NULL,NULL,1,'2022-11-08 00:04:38','2022-11-08 00:04:38',26,NULL,NULL),(19,1,18,1,11,'application/pdf',1,14572,'Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf',4,NULL,NULL,1,'2022-11-08 00:04:38','2022-11-08 00:04:51',26,NULL,NULL),(20,1,NULL,NULL,12,'application/pdf',1,14572,'Learning Sustainable Design through Service.pdf',2,NULL,NULL,1,'2022-11-08 00:05:32','2022-11-08 00:05:32',27,NULL,NULL),(21,1,NULL,NULL,13,'application/pdf',1,14572,'Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf',2,NULL,NULL,1,'2022-11-08 00:05:53','2022-11-08 00:05:53',28,NULL,NULL),(22,1,21,1,13,'application/pdf',1,14572,'Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf',4,NULL,NULL,1,'2022-11-08 00:05:53','2022-11-08 00:06:05',28,NULL,NULL),(23,1,NULL,NULL,14,'application/pdf',1,14572,'Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf',2,NULL,NULL,1,'2022-11-08 00:06:29','2022-11-08 00:06:29',29,NULL,NULL),(24,1,NULL,NULL,15,'application/pdf',1,14572,'Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf',2,NULL,NULL,1,'2022-11-08 00:07:49','2022-11-08 00:07:49',30,NULL,NULL),(25,1,NULL,NULL,16,'application/pdf',1,14572,'Yam diseases and its management in Nigeria.pdf',2,NULL,NULL,1,'2022-11-08 00:08:07','2022-11-08 00:08:07',31,NULL,NULL),(26,1,NULL,NULL,17,'application/pdf',1,14572,'Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf',2,NULL,NULL,1,'2022-11-08 00:09:00','2022-11-08 00:09:00',32,NULL,NULL),(27,1,NULL,NULL,18,'application/pdf',1,14572,'Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf',2,NULL,NULL,1,'2022-11-08 00:09:18','2022-11-08 00:09:18',33,NULL,NULL),(28,1,27,1,18,'application/pdf',1,14572,'Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf',4,NULL,NULL,1,'2022-11-08 00:09:18','2022-11-08 00:09:32',33,NULL,NULL),(29,1,NULL,NULL,18,'application/pdf',1,14572,'article.pdf',10,NULL,NULL,0,'2022-11-08 00:10:10','2022-11-08 00:10:10',3,521,4),(30,1,NULL,NULL,19,'application/pdf',1,14572,'Self-Organization in Multi-Level Institutions in Networked Environments.pdf',2,NULL,NULL,1,'2022-11-08 00:10:30','2022-11-08 00:10:30',34,NULL,NULL),(31,1,NULL,NULL,20,'application/pdf',1,14572,'Finocchiaro: Arguments About Arguments.pdf',2,NULL,NULL,1,'2022-11-08 00:10:59','2022-11-08 00:10:59',35,NULL,NULL),(32,1,31,1,20,'application/pdf',1,14572,'Finocchiaro: Arguments About Arguments.pdf',4,NULL,NULL,1,'2022-11-08 00:10:59','2022-11-08 00:11:12',35,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (54,'abstract'),(49,'admin'),(1,'alan'),(95,'antibiotics'),(62,'antimicrobial'),(4,'cape'),(103,'cases'),(102,'clinical'),(86,'coli'),(68,'coliforms'),(81,'compared'),(99,'concentration'),(23,'conclusive'),(25,'conflicting'),(112,'conjugative'),(108,'consistent'),(43,'continuous'),(38,'corporate'),(42,'decisions'),(96,'difference'),(41,'distribution'),(31,'dividend'),(10,'dividends'),(29,'economists'),(13,'empirical'),(113,'encoding'),(77,'enterobacteriacea'),(85,'escherichia'),(56,'ets'),(47,'evaluation'),(14,'evidence'),(34,'existing'),(80,'faeces'),(82,'fifteen'),(28,'financial'),(40,'financing'),(20,'firm'),(44,'function'),(18,'future'),(110,'group'),(32,'guidance'),(78,'healthy'),(63,'heavy'),(72,'hospital'),(79,'human'),(84,'identified'),(27,'implications'),(117,'infection'),(71,'infections'),(98,'inhibitory'),(46,'intuitive'),(39,'investment'),(36,'investors'),(7,'ipsum'),(74,'iran'),(73,'isfahan'),(69,'isolated'),(83,'isolates'),(24,'issue'),(60,'karbasizaed'),(88,'kelebsiella'),(12,'literature'),(6,'lorem'),(33,'management'),(64,'metal'),(104,'metals'),(100,'mic'),(97,'minimal'),(116,'multidrug-resistance'),(94,'multiple'),(2,'mwandenga'),(70,'nosocomial'),(22,'offer'),(111,'pattern'),(75,'patterns'),(91,'percent'),(107,'persons'),(66,'plasmid'),(89,'pneumoniae'),(26,'policy'),(93,'possess'),(35,'potential'),(30,'practical'),(67,'profile'),(76,'profiles'),(19,'prospects'),(21,'recent'),(114,'recovered'),(118,'region'),(109,'relationship'),(45,'rely'),(87,'remaining'),(65,'resistance'),(115,'results'),(11,'review'),(90,'seventy'),(37,'shareholding'),(17,'signal'),(15,'signaling'),(8,'signalling'),(105,'significant'),(92,'strains'),(58,'stst'),(51,'submission'),(53,'subtitle'),(16,'suggests'),(61,'tehran'),(50,'test'),(55,'tets'),(9,'theory'),(52,'title'),(106,'tolerant'),(5,'town'),(57,'tset'),(3,'university'),(59,'vajiheh'),(101,'values'),(48,'version');
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
INSERT INTO `submission_search_object_keywords` VALUES (8,1,0),(8,2,1),(8,3,2),(23,3,2),(8,4,3),(8,5,4),(8,6,5),(8,7,6),(9,8,0),(9,9,1),(10,9,1),(9,10,2),(10,10,3),(9,11,3),(9,12,4),(9,13,5),(10,13,9),(9,14,6),(10,14,10),(10,14,13),(10,15,0),(10,16,2),(10,17,4),(10,18,5),(10,19,6),(10,20,7),(10,21,8),(10,22,11),(10,23,12),(10,24,14),(10,25,15),(10,26,16),(10,26,22),(10,27,17),(10,28,18),(10,29,19),(10,30,20),(10,31,21),(10,31,37),(10,32,23),(10,33,24),(10,33,36),(10,34,25),(10,35,26),(25,35,85),(10,36,27),(10,37,28),(10,38,29),(10,39,30),(10,40,31),(10,41,32),(10,42,33),(10,42,38),(10,43,34),(10,44,35),(10,45,39),(10,46,40),(10,47,41),(15,49,0),(15,49,1),(16,50,0),(16,50,3),(17,50,0),(22,50,0),(22,50,1),(22,50,2),(22,50,3),(22,50,6),(16,51,1),(16,51,4),(17,51,1),(16,52,2),(16,53,5),(17,54,2),(22,55,4),(22,56,5),(22,57,7),(22,58,8),(23,59,0),(23,60,1),(23,61,3),(24,62,0),(25,62,0),(25,62,67),(24,63,1),(25,63,1),(25,63,51),(25,63,58),(25,63,74),(24,64,2),(25,64,2),(25,64,59),(24,65,3),(25,65,3),(25,65,34),(25,65,68),(25,65,73),(24,66,4),(25,66,5),(25,66,64),(25,66,71),(24,67,5),(25,67,65),(24,68,6),(25,68,7),(25,68,84),(24,69,7),(25,69,9),(25,69,29),(25,69,55),(25,69,79),(24,70,8),(25,70,10),(25,70,18),(25,70,30),(25,70,80),(25,70,86),(24,71,9),(25,71,11),(25,71,19),(25,71,31),(25,71,81),(24,72,10),(25,72,56),(24,73,11),(24,74,12),(25,75,4),(25,76,6),(25,77,8),(25,78,12),(25,78,38),(25,78,60),(25,79,13),(25,79,39),(25,80,14),(25,80,40),(25,80,50),(25,81,15),(25,81,36),(25,82,16),(25,83,17),(25,84,20),(25,85,21),(25,86,22),(25,87,23),(25,88,24),(25,89,25),(25,90,26),(25,91,27),(25,92,28),(25,92,37),(25,92,47),(25,92,54),(25,92,78),(25,93,32),(25,94,33),(25,95,35),(25,95,76),(25,96,41),(25,97,42),(25,98,43),(25,99,44),(25,100,45),(25,101,46),(25,102,48),(25,103,49),(25,104,52),(25,104,75),(25,105,53),(25,106,57),(25,107,61),(25,108,62),(25,109,63),(25,110,66),(25,111,69),(25,112,70),(25,113,72),(25,114,77),(25,115,82),(25,116,83),(25,117,87),(25,118,88);
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
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (8,1,1,0),(9,1,2,0),(10,1,4,0),(11,1,16,0),(12,1,8,0),(13,1,32,0),(14,1,64,0),(15,10,1,0),(16,10,2,0),(17,10,4,0),(18,10,16,0),(19,10,8,0),(20,10,32,0),(21,10,64,0),(22,10,128,17),(23,18,1,0),(24,18,2,0),(25,18,4,0),(26,18,16,0),(27,18,8,0),(28,18,32,0),(29,18,64,0);
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
INSERT INTO `submission_supplementary_files` VALUES (17,1);
/*!40000 ALTER TABLE `submission_supplementary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tombstones`
--

LOCK TABLES `submission_tombstones` WRITE;
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;
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
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,NULL,1,NULL,1,'2022-11-07 23:58:37','2022-11-07 23:56:21','2022-11-07 23:56:21',5,3,0),(2,NULL,1,NULL,3,'2022-11-07 23:59:19','2022-11-07 23:58:58','2022-11-07 23:58:58',3,1,0),(3,NULL,1,NULL,4,'2022-11-08 00:00:07','2022-11-07 23:59:43','2022-11-07 23:59:43',4,1,0),(4,NULL,1,NULL,5,'2022-11-08 00:00:29','2022-11-08 00:00:29','2022-11-08 00:00:29',1,1,0),(5,NULL,1,NULL,6,'2022-11-08 00:01:22','2022-11-08 00:00:46','2022-11-08 00:00:46',5,1,0),(6,NULL,1,NULL,7,'2022-11-08 00:02:14','2022-11-08 00:01:42','2022-11-08 00:01:42',5,1,0),(7,NULL,1,NULL,8,'2022-11-08 00:03:04','2022-11-08 00:02:33','2022-11-08 00:02:45',3,1,0),(8,NULL,1,NULL,9,'2022-11-08 00:03:24','2022-11-08 00:03:24','2022-11-08 00:03:24',1,1,0),(9,NULL,1,NULL,10,'2022-11-08 00:04:18','2022-11-08 00:03:42','2022-11-08 00:03:42',5,1,0),(10,NULL,1,NULL,11,'2022-11-08 00:04:26','2020-03-10 00:00:00','2022-11-08 00:04:26',5,5,0),(11,NULL,1,NULL,12,'2022-11-08 00:05:19','2022-11-08 00:04:44','2022-11-08 00:05:02',3,1,0),(12,NULL,1,NULL,13,'2022-11-08 00:05:40','2022-11-08 00:05:40','2022-11-08 00:05:40',1,1,0),(13,NULL,1,NULL,14,'2022-11-08 00:06:16','2022-11-08 00:05:58','2022-11-08 00:05:58',3,1,0),(14,NULL,1,NULL,15,'2022-11-08 00:07:37','2022-11-08 00:06:35','2022-11-08 00:06:59',3,1,0),(15,NULL,1,NULL,16,'2022-11-08 00:07:55','2022-11-08 00:07:55','2022-11-08 00:07:55',1,1,0),(16,NULL,1,NULL,17,'2022-11-08 00:08:46','2022-11-08 00:08:12','2022-11-08 00:08:12',5,1,0),(17,NULL,1,NULL,18,'2022-11-08 00:09:06','2022-11-08 00:09:06','2022-11-08 00:09:06',1,1,0),(18,NULL,1,NULL,19,'2022-11-08 00:10:16','2022-11-08 00:09:24','2022-11-08 00:09:24',5,3,0),(19,NULL,1,NULL,20,'2022-11-08 00:10:45','2022-11-08 00:10:36','2022-11-08 00:10:36',1,4,0),(20,NULL,1,NULL,21,'2022-11-08 00:11:30','2022-11-08 00:11:04','2022-11-08 00:11:04',4,1,0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT '0',
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
INSERT INTO `temporary_files` VALUES (1,1,'xmluQjJzp','text/xml',46538,'uploadedFile.xml','2022-11-08 00:04:26');
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
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','JM','string'),(2,'en_US','name','Journal manager','string'),(2,'fr_CA','abbrev','DIR','string'),(2,'fr_CA','name','Directeur-trice de la revue','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','JE','string'),(3,'en_US','name','Journal editor','string'),(3,'fr_CA','abbrev','RÉD','string'),(3,'fr_CA','name','Rédacteur-trice','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'fr_CA','abbrev','DirProd','string'),(4,'fr_CA','name','Directeur-trice de production','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','SecE','string'),(5,'en_US','name','Section editor','string'),(5,'fr_CA','abbrev','RÉDRUB','string'),(5,'fr_CA','name','Rédacteur-trice de rubrique','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(6,'','nameLocaleKey','default.groups.name.guestEditor','string'),(6,'en_US','abbrev','GE','string'),(6,'en_US','name','Guest editor','string'),(6,'fr_CA','abbrev','RÉDINV','string'),(6,'fr_CA','name','Rédacteur-trice invité-e','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(7,'','nameLocaleKey','default.groups.name.copyeditor','string'),(7,'en_US','abbrev','CE','string'),(7,'en_US','name','Copyeditor','string'),(7,'fr_CA','abbrev','RÉV','string'),(7,'fr_CA','name','Réviseur-e','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(8,'','nameLocaleKey','default.groups.name.designer','string'),(8,'en_US','abbrev','Design','string'),(8,'en_US','name','Designer','string'),(8,'fr_CA','abbrev','Design','string'),(8,'fr_CA','name','Designer','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(9,'','nameLocaleKey','default.groups.name.funding','string'),(9,'en_US','abbrev','FC','string'),(9,'en_US','name','Funding coordinator','string'),(9,'fr_CA','abbrev','CF','string'),(9,'fr_CA','name','Coordonnateur-trice du financement','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(10,'','nameLocaleKey','default.groups.name.indexer','string'),(10,'en_US','abbrev','IND','string'),(10,'en_US','name','Indexer','string'),(10,'fr_CA','abbrev','Indx','string'),(10,'fr_CA','name','Indexeur-e','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(11,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(11,'en_US','abbrev','LE','string'),(11,'en_US','name','Layout Editor','string'),(11,'fr_CA','abbrev','RespMP','string'),(11,'fr_CA','name','Responsable de la mise en page','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(12,'','nameLocaleKey','default.groups.name.marketing','string'),(12,'en_US','abbrev','MS','string'),(12,'en_US','name','Marketing and sales coordinator','string'),(12,'fr_CA','abbrev','CVM','string'),(12,'fr_CA','name','Coordonnateur-trice des ventes et du marketing','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(13,'','nameLocaleKey','default.groups.name.proofreader','string'),(13,'en_US','abbrev','PR','string'),(13,'en_US','name','Proofreader','string'),(13,'fr_CA','abbrev','CorEp','string'),(13,'fr_CA','name','Correcteur-trice d\'épreuves','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(14,'','nameLocaleKey','default.groups.name.author','string'),(14,'en_US','abbrev','AU','string'),(14,'en_US','name','Author','string'),(14,'fr_CA','abbrev','AU','string'),(14,'fr_CA','name','Auteur-e','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(15,'','nameLocaleKey','default.groups.name.translator','string'),(15,'en_US','abbrev','Trans','string'),(15,'en_US','name','Translator','string'),(15,'fr_CA','abbrev','Trad','string'),(15,'fr_CA','name','Traducteur-trice','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(16,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(16,'en_US','abbrev','R','string'),(16,'en_US','name','Reviewer','string'),(16,'fr_CA','abbrev','ÉVAL','string'),(16,'fr_CA','name','Évaluateur-trice','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(17,'','nameLocaleKey','default.groups.name.reader','string'),(17,'en_US','abbrev','Read','string'),(17,'en_US','name','Reader','string'),(17,'fr_CA','abbrev','Lect','string'),(17,'fr_CA','name','Lecteur-trice','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(18,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(18,'en_US','abbrev','SubM','string'),(18,'en_US','name','Subscription Manager','string'),(18,'fr_CA','abbrev','RespAB','string'),(18,'fr_CA','name','Responsable des abonnements','string');
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
INSERT INTO `user_group_stage` VALUES (1,3,1),(1,3,3),(1,3,4),(1,3,5),(1,4,4),(1,4,5),(1,5,1),(1,5,3),(1,5,4),(1,5,5),(1,6,1),(1,6,3),(1,6,4),(1,6,5),(1,7,4),(1,8,5),(1,9,1),(1,9,3),(1,10,5),(1,11,5),(1,12,4),(1,13,5),(1,14,1),(1,14,3),(1,14,4),(1,14,5),(1,15,1),(1,15,3),(1,15,4),(1,15,5),(1,16,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0),(2,1,16,1,0,0,1),(3,1,16,1,0,0,1),(4,1,16,1,0,0,1),(5,1,17,1,0,0,1),(6,1,17,1,0,0,0),(7,1,4097,1,0,0,0),(8,1,4097,1,0,0,0),(9,1,4097,1,0,0,0),(10,1,4097,1,0,0,0),(11,1,4097,1,0,0,0),(12,1,4097,1,0,0,0),(13,1,4097,1,0,0,0),(14,1,65536,1,0,1,0),(15,1,65536,1,0,0,0),(16,1,4096,1,0,1,0),(17,1,1048576,1,0,1,0),(18,1,2097152,1,0,0,0);
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
INSERT INTO `user_settings` VALUES (1,'en_US','givenName',0,0,'admin','string'),(1,'en_US','familyName',0,0,'admin','string'),(2,'en_US','biography',0,0,'','string'),(2,'fr_CA','biography',0,0,'','string'),(2,'en_US','signature',0,0,'','string'),(2,'fr_CA','signature',0,0,'','string'),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México','string'),(2,'fr_CA','affiliation',0,0,'','string'),(2,'en_US','givenName',0,0,'Ramiro','string'),(2,'fr_CA','givenName',0,0,'','string'),(2,'en_US','familyName',0,0,'Vaca','string'),(2,'fr_CA','familyName',0,0,'','string'),(2,'en_US','preferredPublicName',0,0,'','string'),(2,'fr_CA','preferredPublicName',0,0,'','string'),(2,'','orcid',0,0,'','string'),(3,'en_US','biography',0,0,'','string'),(3,'fr_CA','biography',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'fr_CA','signature',0,0,'','string'),(3,'en_US','affiliation',0,0,'University of Melbourne','string'),(3,'fr_CA','affiliation',0,0,'','string'),(3,'en_US','givenName',0,0,'Daniel','string'),(3,'fr_CA','givenName',0,0,'','string'),(3,'en_US','familyName',0,0,'Barnes','string'),(3,'fr_CA','familyName',0,0,'','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'fr_CA','preferredPublicName',0,0,'','string'),(3,'','orcid',0,0,'','string'),(4,'en_US','biography',0,0,'','string'),(4,'fr_CA','biography',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'fr_CA','signature',0,0,'','string'),(4,'en_US','affiliation',0,0,'University of Chicago','string'),(4,'fr_CA','affiliation',0,0,'','string'),(4,'en_US','givenName',0,0,'David','string'),(4,'fr_CA','givenName',0,0,'','string'),(4,'en_US','familyName',0,0,'Buskins','string'),(4,'fr_CA','familyName',0,0,'','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'fr_CA','preferredPublicName',0,0,'','string'),(4,'','orcid',0,0,'','string'),(5,'en_US','biography',0,0,'','string'),(5,'fr_CA','biography',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'fr_CA','signature',0,0,'','string'),(5,'en_US','affiliation',0,0,'University of Toronto','string'),(5,'fr_CA','affiliation',0,0,'','string'),(5,'en_US','givenName',0,0,'Stephanie','string'),(5,'fr_CA','givenName',0,0,'','string'),(5,'en_US','familyName',0,0,'Berardo','string'),(5,'fr_CA','familyName',0,0,'','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'fr_CA','preferredPublicName',0,0,'','string'),(5,'','orcid',0,0,'','string'),(6,'en_US','biography',0,0,'','string'),(6,'fr_CA','biography',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'fr_CA','signature',0,0,'','string'),(6,'en_US','affiliation',0,0,'Kyoto University','string'),(6,'fr_CA','affiliation',0,0,'','string'),(6,'en_US','givenName',0,0,'Minoti','string'),(6,'fr_CA','givenName',0,0,'','string'),(6,'en_US','familyName',0,0,'Inoue','string'),(6,'fr_CA','familyName',0,0,'','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'fr_CA','preferredPublicName',0,0,'','string'),(6,'','orcid',0,0,'','string'),(7,'en_US','biography',0,0,'','string'),(7,'fr_CA','biography',0,0,'','string'),(7,'en_US','signature',0,0,'','string'),(7,'fr_CA','signature',0,0,'','string'),(7,'en_US','affiliation',0,0,'Utrecht University','string'),(7,'fr_CA','affiliation',0,0,'','string'),(7,'en_US','givenName',0,0,'Julie','string'),(7,'fr_CA','givenName',0,0,'','string'),(7,'en_US','familyName',0,0,'Janssen','string'),(7,'fr_CA','familyName',0,0,'','string'),(7,'en_US','preferredPublicName',0,0,'','string'),(7,'fr_CA','preferredPublicName',0,0,'','string'),(7,'','orcid',0,0,'','string'),(8,'en_US','biography',0,0,'','string'),(8,'fr_CA','biography',0,0,'','string'),(8,'en_US','signature',0,0,'','string'),(8,'fr_CA','signature',0,0,'','string'),(8,'en_US','affiliation',0,0,'McGill University','string'),(8,'fr_CA','affiliation',0,0,'','string'),(8,'en_US','givenName',0,0,'Paul','string'),(8,'fr_CA','givenName',0,0,'','string'),(8,'en_US','familyName',0,0,'Hudson','string'),(8,'fr_CA','familyName',0,0,'','string'),(8,'en_US','preferredPublicName',0,0,'','string'),(8,'fr_CA','preferredPublicName',0,0,'','string'),(8,'','orcid',0,0,'','string'),(9,'en_US','biography',0,0,'','string'),(9,'fr_CA','biography',0,0,'','string'),(9,'en_US','signature',0,0,'','string'),(9,'fr_CA','signature',0,0,'','string'),(9,'en_US','affiliation',0,0,'University of Manitoba','string'),(9,'fr_CA','affiliation',0,0,'','string'),(9,'en_US','givenName',0,0,'Aisla','string'),(9,'fr_CA','givenName',0,0,'','string'),(9,'en_US','familyName',0,0,'McCrae','string'),(9,'fr_CA','familyName',0,0,'','string'),(9,'en_US','preferredPublicName',0,0,'','string'),(9,'fr_CA','preferredPublicName',0,0,'','string'),(9,'','orcid',0,0,'','string'),(10,'en_US','biography',0,0,'','string'),(10,'fr_CA','biography',0,0,'','string'),(10,'en_US','signature',0,0,'','string'),(10,'fr_CA','signature',0,0,'','string'),(10,'en_US','affiliation',0,0,'State University of New York','string'),(10,'fr_CA','affiliation',0,0,'','string'),(10,'en_US','givenName',0,0,'Adela','string'),(10,'fr_CA','givenName',0,0,'','string'),(10,'en_US','familyName',0,0,'Gallego','string'),(10,'fr_CA','familyName',0,0,'','string'),(10,'en_US','preferredPublicName',0,0,'','string'),(10,'fr_CA','preferredPublicName',0,0,'','string'),(10,'','orcid',0,0,'','string'),(11,'en_US','biography',0,0,'','string'),(11,'fr_CA','biography',0,0,'','string'),(11,'en_US','signature',0,0,'','string'),(11,'fr_CA','signature',0,0,'','string'),(11,'en_US','affiliation',0,0,'Ghent University','string'),(11,'fr_CA','affiliation',0,0,'','string'),(11,'en_US','givenName',0,0,'Maria','string'),(11,'fr_CA','givenName',0,0,'','string'),(11,'en_US','familyName',0,0,'Fritz','string'),(11,'fr_CA','familyName',0,0,'','string'),(11,'en_US','preferredPublicName',0,0,'','string'),(11,'fr_CA','preferredPublicName',0,0,'','string'),(11,'','orcid',0,0,'','string'),(12,'en_US','biography',0,0,'','string'),(12,'fr_CA','biography',0,0,'','string'),(12,'en_US','signature',0,0,'','string'),(12,'fr_CA','signature',0,0,'','string'),(12,'en_US','affiliation',0,0,'Universidad de Chile','string'),(12,'fr_CA','affiliation',0,0,'','string'),(12,'en_US','givenName',0,0,'Sarah','string'),(12,'fr_CA','givenName',0,0,'','string'),(12,'en_US','familyName',0,0,'Vogt','string'),(12,'fr_CA','familyName',0,0,'','string'),(12,'en_US','preferredPublicName',0,0,'','string'),(12,'fr_CA','preferredPublicName',0,0,'','string'),(12,'','orcid',0,0,'','string'),(13,'en_US','biography',0,0,'','string'),(13,'fr_CA','biography',0,0,'','string'),(13,'en_US','signature',0,0,'','string'),(13,'fr_CA','signature',0,0,'','string'),(13,'en_US','affiliation',0,0,'Duke University','string'),(13,'fr_CA','affiliation',0,0,'','string'),(13,'en_US','givenName',0,0,'Graham','string'),(13,'fr_CA','givenName',0,0,'','string'),(13,'en_US','familyName',0,0,'Cox','string'),(13,'fr_CA','familyName',0,0,'','string'),(13,'en_US','preferredPublicName',0,0,'','string'),(13,'fr_CA','preferredPublicName',0,0,'','string'),(13,'','orcid',0,0,'','string'),(14,'en_US','biography',0,0,'','string'),(14,'fr_CA','biography',0,0,'','string'),(14,'en_US','signature',0,0,'','string'),(14,'fr_CA','signature',0,0,'','string'),(14,'en_US','affiliation',0,0,'University of Cape Town','string'),(14,'fr_CA','affiliation',0,0,'','string'),(14,'en_US','givenName',0,0,'Stephen','string'),(14,'fr_CA','givenName',0,0,'','string'),(14,'en_US','familyName',0,0,'Hellier','string'),(14,'fr_CA','familyName',0,0,'','string'),(14,'en_US','preferredPublicName',0,0,'','string'),(14,'fr_CA','preferredPublicName',0,0,'','string'),(14,'','orcid',0,0,'','string'),(15,'en_US','biography',0,0,'','string'),(15,'fr_CA','biography',0,0,'','string'),(15,'en_US','signature',0,0,'','string'),(15,'fr_CA','signature',0,0,'','string'),(15,'en_US','affiliation',0,0,'Imperial College London','string'),(15,'fr_CA','affiliation',0,0,'','string'),(15,'en_US','givenName',0,0,'Catherine','string'),(15,'fr_CA','givenName',0,0,'','string'),(15,'en_US','familyName',0,0,'Turner','string'),(15,'fr_CA','familyName',0,0,'','string'),(15,'en_US','preferredPublicName',0,0,'','string'),(15,'fr_CA','preferredPublicName',0,0,'','string'),(15,'','orcid',0,0,'','string'),(16,'en_US','biography',0,0,'','string'),(16,'fr_CA','biography',0,0,'','string'),(16,'en_US','signature',0,0,'','string'),(16,'fr_CA','signature',0,0,'','string'),(16,'en_US','affiliation',0,0,'National University of Singapore','string'),(16,'fr_CA','affiliation',0,0,'','string'),(16,'en_US','givenName',0,0,'Sabine','string'),(16,'fr_CA','givenName',0,0,'','string'),(16,'en_US','familyName',0,0,'Kumar','string'),(16,'fr_CA','familyName',0,0,'','string'),(16,'en_US','preferredPublicName',0,0,'','string'),(16,'fr_CA','preferredPublicName',0,0,'','string'),(16,'','orcid',0,0,'','string'),(17,'en_US','affiliation',0,0,'University of Cape Town','string'),(17,'en_US','givenName',0,0,'Alan','string'),(17,'en_US','familyName',0,0,'Mwandenga','string'),(18,'en_US','affiliation',0,0,'University of Bologna','string'),(18,'en_US','givenName',0,0,'Carlo','string'),(18,'en_US','familyName',0,0,'Corino','string'),(19,'en_US','affiliation',0,0,'University of Windsor','string'),(19,'en_US','givenName',0,0,'Catherine','string'),(19,'en_US','familyName',0,0,'Kwantes','string'),(20,'en_US','affiliation',0,0,'University of Alberta','string'),(20,'en_US','givenName',0,0,'Craig','string'),(20,'en_US','familyName',0,0,'Montgomerie','string'),(21,'en_US','affiliation',0,0,'Alexandria University','string'),(21,'en_US','givenName',0,0,'Diaga','string'),(21,'en_US','familyName',0,0,'Diouf','string'),(22,'en_US','affiliation',0,0,'University of Toronto','string'),(22,'en_US','givenName',0,0,'Dana','string'),(22,'en_US','familyName',0,0,'Phillips','string'),(23,'en_US','affiliation',0,0,'University College Cork','string'),(23,'en_US','givenName',0,0,'Domatilia','string'),(23,'en_US','familyName',0,0,'Sokoloff','string'),(24,'en_US','affiliation',0,0,'Indiana University','string'),(24,'en_US','givenName',0,0,'Elinor','string'),(24,'en_US','familyName',0,0,'Ostrom','string'),(25,'en_US','affiliation',0,0,'University of Rome','string'),(25,'en_US','givenName',0,0,'Fabio','string'),(25,'en_US','familyName',0,0,'Paglieri','string'),(26,'en_US','affiliation',0,0,'Aalborg University','string'),(26,'en_US','givenName',0,0,'John','string'),(26,'en_US','familyName',0,0,'Novak','string'),(27,'en_US','affiliation',0,0,'Stanford University','string'),(27,'en_US','givenName',0,0,'Karim','string'),(27,'en_US','familyName',0,0,'Al-Khafaji','string'),(28,'en_US','affiliation',0,0,'Australian National University','string'),(28,'en_US','givenName',0,0,'Leo','string'),(28,'en_US','familyName',0,0,'Christopher','string'),(29,'en_US','affiliation',0,0,'University of Cape Town','string'),(29,'en_US','givenName',0,0,'Lise','string'),(29,'en_US','familyName',0,0,'Kumiega','string'),(30,'en_US','affiliation',0,0,'University of Wolverhampton','string'),(30,'en_US','givenName',0,0,'Patricia','string'),(30,'en_US','familyName',0,0,'Daniel','string'),(31,'en_US','affiliation',0,0,'University of Nairobi','string'),(31,'en_US','givenName',0,0,'Rana','string'),(31,'en_US','familyName',0,0,'Baiyewu','string'),(32,'en_US','affiliation',0,0,'Barcelona University','string'),(32,'en_US','givenName',0,0,'Rosanna','string'),(32,'en_US','familyName',0,0,'Rossi','string'),(33,'en_US','affiliation',0,0,'University of Tehran','string'),(33,'en_US','givenName',0,0,'Vajiheh','string'),(33,'en_US','familyName',0,0,'Karbasizaed','string'),(34,'en_US','affiliation',0,0,'University of Windsor','string'),(34,'en_US','givenName',0,0,'Valerie','string'),(34,'en_US','familyName',0,0,'Williamson','string'),(35,'en_US','affiliation',0,0,'CUNY','string'),(35,'en_US','givenName',0,0,'Zita','string'),(35,'en_US','familyName',0,0,'Woods','string');
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
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(3,3),(5,4),(5,5),(5,6),(7,11),(7,12),(11,13),(11,14),(13,15),(13,16),(14,17),(14,18),(14,19),(14,20),(14,21),(14,22),(14,23),(14,24),(14,25),(14,26),(14,27),(14,28),(14,29),(14,30),(14,31),(14,32),(14,33),(14,34),(14,35),(16,7),(16,8),(16,9),(16,10),(17,17),(17,18),(17,19),(17,20),(17,21),(17,22),(17,23),(17,24),(17,25),(17,26),(17,27),(17,28),(17,29),(17,30),(17,31),(17,32),(17,33),(17,34),(17,35);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$v6Oy93j3Gz0lmoTd8sraTOEIwDMXE7dFlGpJe7hcPIt59mPoUCeaq','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2022-11-07 23:52:54',NULL,'2022-11-08 00:04:21',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$XIgX6j46u2s/g5l98u5sIO5YESNkrMxpCy3jNOmNNNjjoJL56r1Ta','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2022-11-07 23:53:47',NULL,'2022-11-07 23:55:43',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$5Q.fiZc3Kx4cHZ7IbcxjhOzayueRsRnz8RVuRouw2L6YY6iVPAsQu','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2022-11-07 23:53:52',NULL,'2022-11-08 00:11:05',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$TUYg9vovcnsSUCjvd29gqeJCS1dn7Yq9jimbri3xVqvA3/n.GbxDi','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-11-07 23:53:58',NULL,'2022-11-07 23:53:58',0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$50dK/snOKxzYcB04ltx24uZG1sunMieB8XPcGNgNR5052x5pix7iO','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-11-07 23:54:04',NULL,'2022-11-07 23:54:04',0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$sUIwSx2kr/QqchOQCM8X2.9shgvaUw6hWEoekLROg8ZC6PwBuhGjG','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2022-11-07 23:54:11',NULL,'2022-11-07 23:59:13',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$/SxP9dXrxjI/4xX2cPAj9un0AmeWF5cNgaM9VmKUQkJpJBqE/8jmC','jjanssen@mailinator.com','','','',NULL,'NL','',NULL,NULL,'2022-11-07 23:54:17',NULL,'2022-11-08 00:07:00',0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$vIPRpjnmgBXSX6XmQEXS0Oga4gJ4otx2Lal6W5keRn0fCf4QWJBNW','phudson@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-11-07 23:54:25',NULL,'2022-11-08 00:02:56',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$onpd2uaZskZCmScGzFmcF.mKLlTvERwjOYRuraa7b37lNLZZXy55q','amccrae@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-11-07 23:54:32',NULL,'2022-11-08 00:07:08',0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$2Gy7lqWp5zh2nhhDXFcqAeR/kJ1CGXIun3WaXQyshf9uHm5I1zica','agallego@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-11-07 23:54:40',NULL,'2022-11-08 00:07:17',0,NULL,NULL,0,NULL,1),(11,'mfritz','$2y$10$Wmxjnt6NPUAfJED.fFMDK.7FEYY4YzdX5YbVcgsNPq4NQJRGSb6JK','mfritz@mailinator.com','','','',NULL,'BE','',NULL,NULL,'2022-11-07 23:54:48',NULL,'2022-11-07 23:54:48',0,NULL,NULL,0,NULL,1),(12,'svogt','$2y$10$SpXqtDXKaHijRMOW.bUsp.SBXKEmBV38fWuYZqNTWqK02jaKqLAqq','svogt@mailinator.com','','','',NULL,'CL','',NULL,NULL,'2022-11-07 23:54:56',NULL,'2022-11-07 23:54:56',0,NULL,NULL,0,NULL,1),(13,'gcox','$2y$10$qnAfex2zSDtwt2TN15/.3unTZIxuAlp0Ys.OjQe8qh3QOU2NRzmmm','gcox@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-11-07 23:55:05',NULL,'2022-11-07 23:55:05',0,NULL,NULL,0,NULL,1),(14,'shellier','$2y$10$.3wEOmYlASfc.lsloQKTD.b/rGH/TCR2x/3.j.N2WVgeE75OY3tKW','shellier@mailinator.com','','','',NULL,'ZA','',NULL,NULL,'2022-11-07 23:55:14',NULL,'2022-11-07 23:55:14',0,NULL,NULL,0,NULL,1),(15,'cturner','$2y$10$HoxrcR8Ll1TMWatEdLSv6eUXzG2q9SU/vVgmhVQloIRZUbMIYyTKO','cturner@mailinator.com','','','',NULL,'GB','',NULL,NULL,'2022-11-07 23:55:24',NULL,'2022-11-07 23:55:24',0,NULL,NULL,0,NULL,1),(16,'skumar','$2y$10$YHs7.9wODfU78AU39MtRrevsELSG6gWHzNqTDINnGf5qO1Yx3a/mW','skumar@mailinator.com','','','',NULL,'SG','',NULL,NULL,'2022-11-07 23:55:34',NULL,'2022-11-07 23:55:34',0,NULL,NULL,0,NULL,1),(17,'amwandenga','$2y$10$D6LF7hpf3xSOFzCabrClY.LeVeGxqNe7HoHpk4Anu86JyZpN169h.','amwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2022-11-07 23:56:07',NULL,'2022-11-07 23:57:34',0,NULL,NULL,0,NULL,1),(18,'ccorino','$2y$10$4DOojgOACrX18mAcUi1J0.QZtTfrAhIxOV2sw95JJrkBMhhCjt3cO','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2022-11-07 23:58:45',NULL,'2022-11-07 23:58:45',0,NULL,NULL,0,NULL,1),(19,'ckwantes','$2y$10$JEwAfiT07nwSDOQGNFNj5euTBm8EYkTLavPcFw0stdH0XqY9w3zB2','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-07 23:59:30',NULL,'2022-11-07 23:59:30',0,NULL,NULL,0,NULL,1),(20,'cmontgomerie','$2y$10$rTOIw3EWH3DflmRvI8F3e.1Dr5O954C2I.k1DQV2vbWomrdTDLGJS','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-08 00:00:13',NULL,'2022-11-08 00:00:13',0,NULL,NULL,0,NULL,1),(21,'ddiouf','$2y$10$Fs08oVFPZ71ONfPqeDO2heV/coMC7S4DlXjR23BmVQ.gU1s/Z02o.','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','',NULL,NULL,'2022-11-08 00:00:33',NULL,'2022-11-08 00:00:33',0,NULL,NULL,0,NULL,1),(22,'dphillips','$2y$10$P.8cO/3ahSOENIWIYNINyu5jOqDyCxV05DxRpVkYKbJ6a8U4j1W62','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-08 00:01:28',NULL,'2022-11-08 00:01:28',0,NULL,NULL,0,NULL,1),(23,'dsokoloff','$2y$10$EdzIlcP5UsY0npCl2b/p4.pMxj2GK3AJpmTXSWWMRvN88yDhQSqb.','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','',NULL,NULL,'2022-11-08 00:02:20',NULL,'2022-11-08 00:02:20',0,NULL,NULL,0,NULL,1),(24,'eostrom','$2y$10$4lcRVmrJ8LxH5bwqFJ8kRu2X3hn.f8F7Rqm8Gv4pTXdP8NviFUsCa','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-11-08 00:03:08',NULL,'2022-11-08 00:03:08',0,NULL,NULL,0,NULL,1),(25,'fpaglieri','$2y$10$BAUZBSq/Z1uMXSCbLbwhwOBDRvlVo/KTifFbgmGLTcms/QoH/ItJy','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2022-11-08 00:03:29',NULL,'2022-11-08 00:03:29',0,NULL,NULL,0,NULL,1),(26,'jnovak','$2y$10$xZuu.c7F6rofuIkJ4Vadx.iPDUnEcC0E.KI9TN/GcNm5LJaD5kLeG','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','',NULL,NULL,'2022-11-08 00:04:30',NULL,'2022-11-08 00:04:31',0,NULL,NULL,0,NULL,1),(27,'kalkhafaji','$2y$10$7ZrDJlinTO9z3DJ27JQDjes5f.Y7GCwsiwjQP4Jw6JynG8a4L/BtO','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-11-08 00:05:24',NULL,'2022-11-08 00:05:24',0,NULL,NULL,0,NULL,1),(28,'lchristopher','$2y$10$XITp5qwCzVh1ytKQo00En.wb4hvMR5BlM7bIEfMe4nD/nAnNMZqiS','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','',NULL,NULL,'2022-11-08 00:05:45',NULL,'2022-11-08 00:05:45',0,NULL,NULL,0,NULL,1),(29,'lkumiega','$2y$10$t/PrRP.TzDYBNz1Oi8c.Heb3j7QUw8MXG.xNaRqrRyk837a4gupwK','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2022-11-08 00:06:21',NULL,'2022-11-08 00:06:21',0,NULL,NULL,0,NULL,1),(30,'pdaniel','$2y$10$uD2lR2rJsTLzMzZxukX72uRbvpGUFVFSyljHV7TM3mm5q9H9xKdAG','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','',NULL,NULL,'2022-11-08 00:07:41',NULL,'2022-11-08 00:07:41',0,NULL,NULL,0,NULL,1),(31,'rbaiyewu','$2y$10$f0Ix4hDaXWwOI84LaC896ea8Zl1zcmC3M5M.iPOz2WUv1fFQAo84O','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','',NULL,NULL,'2022-11-08 00:07:59',NULL,'2022-11-08 00:07:59',0,NULL,NULL,0,NULL,1),(32,'rrossi','$2y$10$Vvcz2FmuqU6M3N5V1wP3Ru.vdH0q1OF3B/tNTyP6kEGaAV2r0Xzb.','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','',NULL,NULL,'2022-11-08 00:08:52',NULL,'2022-11-08 00:08:52',0,NULL,NULL,0,NULL,1),(33,'vkarbasizaed','$2y$10$VpGOCT61ygfPu0ITdQv3ueiEAMzebQHz/cUpr7rk3FgkByL2QvbvW','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','',NULL,NULL,'2022-11-08 00:09:10',NULL,'2022-11-08 00:09:10',0,NULL,NULL,0,NULL,1),(34,'vwilliamson','$2y$10$Yi3YmaU4jQlvwp/TjJHdFuQvhGWkMPwRyIny3F.uAvPbtkTyqkvvm','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-11-08 00:10:22',NULL,'2022-11-08 00:10:23',0,NULL,NULL,0,NULL,1),(35,'zwoods','$2y$10$bcqVCrrxa7bIE5.xzvGe7uSyp8gCeaMzaGwX5lqmwsDMEhte7AG1W','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-11-08 00:10:51',NULL,'2022-11-08 00:10:51',0,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-11-07 23:52:55',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.metadata','openurl10','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.metadata','mods34','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.auth','ldap','',0,0),(1,1,0,0,'2022-11-07 23:52:55',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,1,0,'2022-11-07 23:52:55',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.gateways','resolver','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,1,2,1,'2022-11-07 23:52:55',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2022-11-07 23:52:55',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,1,0,0,'2022-11-07 23:52:55',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(1,0,1,0,'2022-11-07 23:52:55',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),(1,2,0,0,'2022-11-07 23:52:55',1,'plugins.generic','acron','AcronPlugin',1,1),(1,2,0,0,'2022-11-07 23:52:55',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(0,1,0,0,'2022-11-07 23:52:55',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','users','',0,0),(2,0,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','medra','',0,0),(1,1,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','doaj','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','native','',0,0),(2,0,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','datacite','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','pubmed','',0,0),(2,1,0,0,'2022-11-07 23:52:55',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.reports','subscriptions','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.reports','articles','',0,0),(1,1,0,0,'2022-11-07 23:52:55',1,'plugins.reports','counterReport','',0,0),(2,0,0,0,'2022-11-07 23:52:55',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.reports','views','',0,0),(1,0,0,0,'2022-11-07 23:52:55',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,2,0,4,'2022-11-07 23:52:52',1,'core','ojs2','',0,1);
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

-- Dump completed on 2022-11-08  0:11:33
