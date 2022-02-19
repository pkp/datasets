-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: ops-ci
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
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`)
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
INSERT INTO `author_settings` VALUES (1,'','country','IT'),(1,'en_US','affiliation','University of Bologna'),(1,'en_US','familyName','Corino'),(1,'en_US','givenName','Carlo'),(2,'','country','CA'),(2,'en_US','affiliation','University of Windsor'),(2,'en_US','familyName','Kwantes'),(2,'en_US','givenName','Catherine'),(3,'','country','FI'),(3,'en_US','affiliation','Academy of Finland'),(3,'en_US','biography',NULL),(3,'en_US','familyName','Kekkonen'),(3,'en_US','givenName','Urho'),(3,'en_US','preferredPublicName',NULL),(3,'fr_CA','affiliation',NULL),(3,'fr_CA','biography',NULL),(3,'fr_CA','familyName',NULL),(3,'fr_CA','givenName',NULL),(3,'fr_CA','preferredPublicName',NULL),(4,'','country','CA'),(4,'en_US','affiliation','University of Alberta'),(4,'en_US','familyName','Montgomerie'),(4,'en_US','givenName','Craig'),(5,'','country','CA'),(5,'','orcid',''),(5,'','url',''),(5,'en_US','affiliation','University of Victoria'),(5,'en_US','biography',''),(5,'en_US','familyName','Irvine'),(5,'en_US','givenName','Mark'),(5,'en_US','preferredPublicName',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(6,'','country','CA'),(6,'en_US','affiliation','University of Alberta'),(6,'en_US','familyName','Montgomerie'),(6,'en_US','givenName','Craig'),(7,'','country','CA'),(7,'','orcid',''),(7,'','url',''),(7,'en_US','affiliation','University of Victoria'),(7,'en_US','biography',''),(7,'en_US','familyName','Irvine'),(7,'en_US','givenName','Mark'),(7,'en_US','preferredPublicName',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(8,'','country','EG'),(8,'en_US','affiliation','Alexandria University'),(8,'en_US','familyName','Diouf'),(8,'en_US','givenName','Diaga'),(9,'','country','CA'),(9,'en_US','affiliation','University of Toronto'),(9,'en_US','familyName','Phillips'),(9,'en_US','givenName','Dana'),(10,'','country','IE'),(10,'en_US','affiliation','University College Cork'),(10,'en_US','familyName','Sokoloff'),(10,'en_US','givenName','Domatilia'),(11,'','country','US'),(11,'en_US','affiliation','Indiana University'),(11,'en_US','familyName','Ostrom'),(11,'en_US','givenName','Elinor'),(12,'','country','US'),(12,'','orcid',''),(12,'','url',''),(12,'en_US','affiliation','Indiana University'),(12,'en_US','biography',''),(12,'en_US','familyName','van Laerhoven'),(12,'en_US','givenName','Frank'),(12,'en_US','preferredPublicName',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(13,'','country','IT'),(13,'en_US','affiliation','University of Rome'),(13,'en_US','familyName','Paglieri'),(13,'en_US','givenName','Fabio'),(14,'','country','ZA'),(14,'en_US','affiliation','University of Cape Town'),(14,'en_US','familyName','Mwandenga'),(14,'en_US','givenName','John'),(15,'','country','DK'),(15,'en_US','affiliation','Aalborg University'),(15,'en_US','familyName','Novak'),(15,'en_US','givenName','John'),(16,'','country','US'),(16,'en_US','affiliation','Stanford University'),(16,'en_US','familyName','Al-Khafaji'),(16,'en_US','givenName','Karim'),(17,'','country','US'),(17,'','orcid',''),(17,'','url',''),(17,'en_US','affiliation','Stanford University'),(17,'en_US','biography',''),(17,'en_US','familyName','Morse'),(17,'en_US','givenName','Margaret'),(17,'en_US','preferredPublicName',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(18,'','country','AU'),(18,'en_US','affiliation','Australian National University'),(18,'en_US','familyName','Christopher'),(18,'en_US','givenName','Leo'),(19,'','country','ZA'),(19,'en_US','affiliation','University of Cape Town'),(19,'en_US','familyName','Kumiega'),(19,'en_US','givenName','Lise'),(20,'','country','GB'),(20,'en_US','affiliation','University of Wolverhampton'),(20,'en_US','familyName','Daniel'),(20,'en_US','givenName','Patricia'),(21,'','country','KE'),(21,'en_US','affiliation','University of Nairobi'),(21,'en_US','familyName','Baiyewu'),(21,'en_US','givenName','Rana'),(22,'','country','ES'),(22,'en_US','affiliation','Barcelona University'),(22,'en_US','familyName','Rossi'),(22,'en_US','givenName','Rosanna'),(23,'','country','IR'),(23,'en_US','affiliation','University of Tehran'),(23,'en_US','familyName','Karbasizaed'),(23,'en_US','givenName','Vajiheh'),(24,'','country','CA'),(24,'en_US','affiliation','University of Windsor'),(24,'en_US','familyName','Williamson'),(24,'en_US','givenName','Valerie'),(25,'','country','US'),(25,'en_US','affiliation','CUNY'),(25,'en_US','familyName','Woods'),(25,'en_US','givenName','Zita');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,0.00,4),(2,'ckwantes@mailinator.com',1,2,0.00,4),(3,'ukk@mailinator.com',1,2,0.00,4),(4,'cmontgomerie@mailinator.com',1,3,0.00,4),(5,'mirvine@mailinator.com',1,3,1.00,4),(6,'cmontgomerie@mailinator.com',1,4,0.00,4),(7,'mirvine@mailinator.com',1,4,1.00,4),(8,'ddiouf@mailinator.com',1,5,0.00,4),(9,'dphillips@mailinator.com',1,6,0.00,4),(10,'dsokoloff@mailinator.com',1,7,0.00,4),(11,'eostrom@mailinator.com',1,8,0.00,4),(12,'fvanlaerhoven@mailinator.com',1,8,1.00,4),(13,'fpaglieri@mailinator.com',1,9,0.00,4),(14,'jmwandenga@mailinator.com',1,10,0.00,4),(15,'jnovak@mailinator.com',1,11,0.00,4),(16,'kalkhafaji@mailinator.com',1,12,0.00,4),(17,'mmorse@mailinator.com',1,12,1.00,4),(18,'lchristopher@mailinator.com',1,13,0.00,4),(19,'lkumiega@mailinator.com',1,14,0.00,4),(20,'pdaniel@mailinator.com',1,15,0.00,4),(21,'rbaiyewu@mailinator.com',1,16,0.00,4),(22,'rrossi@mailinator.com',1,17,0.00,4),(23,'vkarbasizaed@mailinator.com',1,18,0.00,4),(24,'vwilliamson@mailinator.com',1,19,0.00,4),(25,'zwoods@mailinator.com',1,20,0.00,4);
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
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'history',NULL),(2,1,NULL,2,'biology',NULL),(3,1,NULL,3,'social-sciences',NULL),(4,1,NULL,4,'mathematics',NULL),(5,1,1,10000,'cultural-history',NULL);
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
INSERT INTO `category_settings` VALUES (1,'','sortOption','title-ASC'),(1,'en_US','description',''),(1,'en_US','title','History'),(1,'fr_CA','description',''),(1,'fr_CA','title',''),(2,'','sortOption','title-ASC'),(2,'en_US','description',''),(2,'en_US','title','Biology'),(2,'fr_CA','description',''),(2,'fr_CA','title',''),(3,'','sortOption','title-ASC'),(3,'en_US','description',''),(3,'en_US','title','Social sciences'),(3,'fr_CA','description',''),(3,'fr_CA','title',''),(4,'','sortOption','title-ASC'),(4,'en_US','description',''),(4,'en_US','title','Mathematics'),(4,'fr_CA','description',''),(4,'fr_CA','title',''),(5,'','sortOption','title-ASC'),(5,'en_US','description',''),(5,'en_US','title','Cultural History'),(5,'fr_CA','description',''),(5,'fr_CA','title','');
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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,2,1.00),(2,2,2.00),(11,7,1.00),(12,7,2.00),(13,7,3.00),(43,12,1.00),(44,12,2.00),(45,12,3.00),(46,12,4.00),(47,12,5.00),(48,12,6.00),(49,12,7.00),(50,12,8.00),(75,17,1.00),(76,17,2.00),(77,17,3.00),(78,17,4.00),(79,17,5.00),(80,17,6.00),(81,17,7.00),(82,17,8.00),(85,32,1.00),(86,32,2.00),(90,37,1.00),(91,37,2.00),(92,37,3.00),(94,52,1.00),(99,57,1.00),(100,57,2.00),(101,57,3.00),(102,57,4.00),(105,62,1.00),(106,62,2.00),(108,67,1.00),(119,72,1.00),(120,72,2.00),(121,72,3.00),(122,72,4.00),(123,72,5.00),(124,72,6.00),(125,72,7.00),(126,72,8.00),(127,72,9.00),(128,72,10.00),(131,82,1.00),(132,82,2.00),(136,92,1.00),(137,92,2.00),(138,92,3.00);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'en_US','submissionKeyword','pigs','string'),(2,'en_US','submissionKeyword','food security','string'),(11,'en_US','submissionKeyword','employees','string'),(12,'en_US','submissionKeyword','survey','string'),(13,'en_US','submissionKeyword','multinational','string'),(43,'en_US','submissionKeyword','Integrating Technology','string'),(44,'en_US','submissionKeyword','Computer Skills','string'),(45,'en_US','submissionKeyword','Survey','string'),(46,'en_US','submissionKeyword','Alberta','string'),(47,'en_US','submissionKeyword','National','string'),(48,'en_US','submissionKeyword','Provincial','string'),(49,'en_US','submissionKeyword','Professional Development','string'),(50,'en_US','submissionKeyword','employees','string'),(75,'en_US','submissionKeyword','Integrating Technology','string'),(76,'en_US','submissionKeyword','Computer Skills','string'),(77,'en_US','submissionKeyword','Survey','string'),(78,'en_US','submissionKeyword','Alberta','string'),(79,'en_US','submissionKeyword','National','string'),(80,'en_US','submissionKeyword','Provincial','string'),(81,'en_US','submissionKeyword','Professional Development','string'),(82,'en_US','submissionKeyword','employees','string'),(85,'en_US','submissionKeyword','education','string'),(86,'en_US','submissionKeyword','citizenship','string'),(90,'en_US','submissionKeyword','Common pool resource','string'),(91,'en_US','submissionKeyword','common property','string'),(92,'en_US','submissionKeyword','intellectual developments','string'),(94,'en_US','submissionKeyword','water','string'),(99,'en_US','submissionKeyword','Development','string'),(100,'en_US','submissionKeyword','engineering education','string'),(101,'en_US','submissionKeyword','service learning','string'),(102,'en_US','submissionKeyword','sustainability','string'),(105,'en_US','submissionKeyword','pigs','string'),(106,'en_US','submissionKeyword','food security','string'),(108,'en_US','submissionKeyword','water','string'),(119,'en_US','submissionKeyword','21st Century','string'),(120,'en_US','submissionKeyword','Diversity','string'),(121,'en_US','submissionKeyword','Multilingual','string'),(122,'en_US','submissionKeyword','Multiethnic','string'),(123,'en_US','submissionKeyword','Participatory Pedagogy','string'),(124,'en_US','submissionKeyword','Language','string'),(125,'en_US','submissionKeyword','Culture','string'),(126,'en_US','submissionKeyword','Gender','string'),(127,'en_US','submissionKeyword','Egalitarianism','string'),(128,'en_US','submissionKeyword','Social Transformation','string'),(131,'en_US','submissionKeyword','cattle','string'),(132,'en_US','submissionKeyword','food security','string'),(136,'en_US','submissionKeyword','Self-Organization','string'),(137,'en_US','submissionKeyword','Multi-Level Institutions','string'),(138,'en_US','submissionKeyword','Goverance','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(6,'submissionAgency',1048588,1),(11,'submissionAgency',1048588,2),(16,'submissionAgency',1048588,3),(21,'submissionAgency',1048588,4),(26,'submissionAgency',1048588,5),(31,'submissionAgency',1048588,6),(36,'submissionAgency',1048588,7),(41,'submissionAgency',1048588,8),(46,'submissionAgency',1048588,9),(51,'submissionAgency',1048588,10),(56,'submissionAgency',1048588,11),(61,'submissionAgency',1048588,12),(66,'submissionAgency',1048588,13),(71,'submissionAgency',1048588,14),(76,'submissionAgency',1048588,15),(81,'submissionAgency',1048588,16),(86,'submissionAgency',1048588,17),(91,'submissionAgency',1048588,18),(96,'submissionAgency',1048588,19),(101,'submissionAgency',1048588,20),(4,'submissionDiscipline',1048588,1),(9,'submissionDiscipline',1048588,2),(14,'submissionDiscipline',1048588,3),(19,'submissionDiscipline',1048588,4),(24,'submissionDiscipline',1048588,5),(29,'submissionDiscipline',1048588,6),(34,'submissionDiscipline',1048588,7),(39,'submissionDiscipline',1048588,8),(44,'submissionDiscipline',1048588,9),(49,'submissionDiscipline',1048588,10),(54,'submissionDiscipline',1048588,11),(59,'submissionDiscipline',1048588,12),(64,'submissionDiscipline',1048588,13),(69,'submissionDiscipline',1048588,14),(74,'submissionDiscipline',1048588,15),(79,'submissionDiscipline',1048588,16),(84,'submissionDiscipline',1048588,17),(89,'submissionDiscipline',1048588,18),(94,'submissionDiscipline',1048588,19),(99,'submissionDiscipline',1048588,20),(2,'submissionKeyword',1048588,1),(7,'submissionKeyword',1048588,2),(12,'submissionKeyword',1048588,3),(17,'submissionKeyword',1048588,4),(22,'submissionKeyword',1048588,5),(27,'submissionKeyword',1048588,6),(32,'submissionKeyword',1048588,7),(37,'submissionKeyword',1048588,8),(42,'submissionKeyword',1048588,9),(47,'submissionKeyword',1048588,10),(52,'submissionKeyword',1048588,11),(57,'submissionKeyword',1048588,12),(62,'submissionKeyword',1048588,13),(67,'submissionKeyword',1048588,14),(72,'submissionKeyword',1048588,15),(77,'submissionKeyword',1048588,16),(82,'submissionKeyword',1048588,17),(87,'submissionKeyword',1048588,18),(92,'submissionKeyword',1048588,19),(97,'submissionKeyword',1048588,20),(5,'submissionLanguage',1048588,1),(10,'submissionLanguage',1048588,2),(15,'submissionLanguage',1048588,3),(20,'submissionLanguage',1048588,4),(25,'submissionLanguage',1048588,5),(30,'submissionLanguage',1048588,6),(35,'submissionLanguage',1048588,7),(40,'submissionLanguage',1048588,8),(45,'submissionLanguage',1048588,9),(50,'submissionLanguage',1048588,10),(55,'submissionLanguage',1048588,11),(60,'submissionLanguage',1048588,12),(65,'submissionLanguage',1048588,13),(70,'submissionLanguage',1048588,14),(75,'submissionLanguage',1048588,15),(80,'submissionLanguage',1048588,16),(85,'submissionLanguage',1048588,17),(90,'submissionLanguage',1048588,18),(95,'submissionLanguage',1048588,19),(100,'submissionLanguage',1048588,20),(3,'submissionSubject',1048588,1),(8,'submissionSubject',1048588,2),(13,'submissionSubject',1048588,3),(18,'submissionSubject',1048588,4),(23,'submissionSubject',1048588,5),(28,'submissionSubject',1048588,6),(33,'submissionSubject',1048588,7),(38,'submissionSubject',1048588,8),(43,'submissionSubject',1048588,9),(48,'submissionSubject',1048588,10),(53,'submissionSubject',1048588,11),(58,'submissionSubject',1048588,12),(63,'submissionSubject',1048588,13),(68,'submissionSubject',1048588,14),(73,'submissionSubject',1048588,15),(78,'submissionSubject',1048588,16),(83,'submissionSubject',1048588,17),(88,'submissionSubject',1048588,18),(93,'submissionSubject',1048588,19),(98,'submissionSubject',1048588,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL,NULL),(6,'USER_VALIDATE_CONTEXT',0,1,NULL,NULL,NULL),(7,'USER_VALIDATE_SITE',0,1,NULL,NULL,NULL),(8,'ISSUE_PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(9,'SUBMISSION_ACK',1,1,NULL,65536,5),(10,'POSTED_ACK',1,1,NULL,65536,5),(11,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,5),(12,'EDITOR_ASSIGN',1,1,16,16,5),(13,'EDITOR_DECISION_ACCEPT',0,1,16,65536,5),(14,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,5),(15,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(16,'ANNOUNCEMENT',0,1,16,1048576,NULL),(17,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(18,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','fr_CA','','','##emails.announcement.description##'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$serverName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_ASSIGN','fr_CA','','','##emails.editorAssign.description##'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','fr_CA','','','##emails.editorDecisionAccept.description##'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Moderator Decision','\n			{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the moderator declines his submission initially.'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','','##emails.editorDecisionInitialDecline.description##'),('ISSUE_PUBLISH_NOTIFY','en_US','New Preprint Posted','Readers:<br />\n<br />\n{$serverName} has just posted its latest preprint at {$serverUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$signature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('ISSUE_PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$serverName} vient d\'être publiée à l\'adresse suivante : {$serverUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$signature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\n{$signature}<hr />{$unsubscribeLink}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$notificationUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$serverName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','','','##emails.notificationCenterDefault.description##'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\n{$signature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('POSTED_ACK','en_US','Preprint Posted Acknowledgement','{$authorPrimary}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.'),('POSTED_ACK','fr_CA','','','##emails.postedAck.description##'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','','##emails.statisticsReportNotification.subject##'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$recipientName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$serverName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$signature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a new user signed up on the server to validate their email account.'),('USER_VALIDATE_CONTEXT','fr_CA','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.'),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a new user signed up on the site to validate their email account.'),('USER_VALIDATE_SITE','fr_CA','','','##emails.userValidateSite.description##');
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2022-02-19 01:51:04',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2022-02-19 01:51:14',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2022-02-19 01:51:14',1342177288,'submission.event.fileRevised',0),(4,515,1,7,'2022-02-19 01:51:17',1342177296,'submission.event.fileEdited',0),(5,1048585,1,7,'2022-02-19 01:51:17',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2022-02-19 01:51:21',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,7,'2022-02-19 01:51:22',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2022-02-19 01:51:30',268435458,'submission.event.general.metadataUpdated',0),(9,515,2,8,'2022-02-19 01:51:40',1342177281,'submission.event.fileUploaded',0),(10,1048585,2,8,'2022-02-19 01:51:40',1342177288,'submission.event.fileRevised',0),(11,515,2,8,'2022-02-19 01:51:42',1342177296,'submission.event.fileEdited',0),(12,1048585,2,8,'2022-02-19 01:51:42',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2022-02-19 01:51:46',268435458,'submission.event.general.metadataUpdated',0),(14,1048585,2,8,'2022-02-19 01:51:47',268435457,'submission.event.submissionSubmitted',0),(15,1048585,2,8,'2022-02-19 01:51:52',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,8,'2022-02-19 01:52:04',268435458,'submission.event.general.metadataUpdated',0),(17,1048585,2,3,'2022-02-19 01:52:10',268435462,'publication.event.published',0),(18,1048585,3,9,'2022-02-19 01:52:19',268435458,'submission.event.general.metadataUpdated',0),(19,515,3,9,'2022-02-19 01:52:29',1342177281,'submission.event.fileUploaded',0),(20,1048585,3,9,'2022-02-19 01:52:29',1342177288,'submission.event.fileRevised',0),(21,515,3,9,'2022-02-19 01:52:31',1342177296,'submission.event.fileEdited',0),(22,1048585,3,9,'2022-02-19 01:52:31',1342177296,'submission.event.fileEdited',0),(23,1048585,3,9,'2022-02-19 01:52:40',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,3,9,'2022-02-19 01:52:41',268435457,'submission.event.submissionSubmitted',0),(25,1048585,3,3,'2022-02-19 01:52:49',268435462,'publication.event.published',0),(26,1048585,3,3,'2022-02-19 01:52:57',268435463,'publication.event.unpublished',0),(27,1048585,3,3,'2022-02-19 01:53:00',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,3,3,'2022-02-19 01:53:03',268435462,'publication.event.published',0),(29,1048585,3,3,'2022-02-19 01:53:05',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,3,3,'2022-02-19 01:53:05',268435464,'publication.event.versionCreated',0),(31,1048585,3,3,'2022-02-19 01:53:09',268435458,'submission.event.general.metadataUpdated',0),(32,1048585,3,3,'2022-02-19 01:53:12',268435462,'publication.event.versionPublished',0),(33,1048585,4,10,'2022-02-19 01:53:21',268435458,'submission.event.general.metadataUpdated',0),(34,515,4,10,'2022-02-19 01:53:31',1342177281,'submission.event.fileUploaded',0),(35,1048585,4,10,'2022-02-19 01:53:31',1342177288,'submission.event.fileRevised',0),(36,515,4,10,'2022-02-19 01:53:34',1342177296,'submission.event.fileEdited',0),(37,1048585,4,10,'2022-02-19 01:53:34',1342177296,'submission.event.fileEdited',0),(38,1048585,4,10,'2022-02-19 01:53:37',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,4,10,'2022-02-19 01:53:38',268435457,'submission.event.submissionSubmitted',0),(40,1048585,4,3,'2022-02-19 01:53:45',268435462,'publication.event.published',0),(41,1048585,5,11,'2022-02-19 01:53:54',268435458,'submission.event.general.metadataUpdated',0),(42,515,5,11,'2022-02-19 01:54:05',1342177281,'submission.event.fileUploaded',0),(43,1048585,5,11,'2022-02-19 01:54:05',1342177288,'submission.event.fileRevised',0),(44,515,5,11,'2022-02-19 01:54:07',1342177296,'submission.event.fileEdited',0),(45,1048585,5,11,'2022-02-19 01:54:07',1342177296,'submission.event.fileEdited',0),(46,1048585,5,11,'2022-02-19 01:54:13',268435458,'submission.event.general.metadataUpdated',0),(47,1048585,5,11,'2022-02-19 01:54:14',268435457,'submission.event.submissionSubmitted',0),(48,1048585,5,3,'2022-02-19 01:54:22',268435462,'publication.event.published',0),(49,1048585,6,12,'2022-02-19 01:54:31',268435458,'submission.event.general.metadataUpdated',0),(50,515,6,12,'2022-02-19 01:54:41',1342177281,'submission.event.fileUploaded',0),(51,1048585,6,12,'2022-02-19 01:54:41',1342177288,'submission.event.fileRevised',0),(52,515,6,12,'2022-02-19 01:54:43',1342177296,'submission.event.fileEdited',0),(53,1048585,6,12,'2022-02-19 01:54:43',1342177296,'submission.event.fileEdited',0),(54,1048585,6,12,'2022-02-19 01:54:46',268435458,'submission.event.general.metadataUpdated',0),(55,1048585,6,12,'2022-02-19 01:54:48',268435457,'submission.event.submissionSubmitted',0),(56,1048585,6,3,'2022-02-19 01:54:55',268435462,'publication.event.published',0),(57,1048585,7,13,'2022-02-19 01:55:04',268435458,'submission.event.general.metadataUpdated',0),(58,515,7,13,'2022-02-19 01:55:15',1342177281,'submission.event.fileUploaded',0),(59,1048585,7,13,'2022-02-19 01:55:15',1342177288,'submission.event.fileRevised',0),(60,515,7,13,'2022-02-19 01:55:17',1342177296,'submission.event.fileEdited',0),(61,1048585,7,13,'2022-02-19 01:55:17',1342177296,'submission.event.fileEdited',0),(62,1048585,7,13,'2022-02-19 01:55:25',268435458,'submission.event.general.metadataUpdated',0),(63,1048585,7,13,'2022-02-19 01:55:26',268435457,'submission.event.submissionSubmitted',0),(64,1048585,7,3,'2022-02-19 01:55:34',268435462,'publication.event.published',0),(65,1048585,8,14,'2022-02-19 01:55:44',268435458,'submission.event.general.metadataUpdated',0),(66,515,8,14,'2022-02-19 01:55:54',1342177281,'submission.event.fileUploaded',0),(67,1048585,8,14,'2022-02-19 01:55:54',1342177288,'submission.event.fileRevised',0),(68,515,8,14,'2022-02-19 01:55:56',1342177296,'submission.event.fileEdited',0),(69,1048585,8,14,'2022-02-19 01:55:56',1342177296,'submission.event.fileEdited',0),(70,1048585,8,14,'2022-02-19 01:55:59',268435458,'submission.event.general.metadataUpdated',0),(71,1048585,8,14,'2022-02-19 01:56:01',268435457,'submission.event.submissionSubmitted',0),(72,1048585,8,3,'2022-02-19 01:56:09',268435462,'publication.event.published',0),(73,1048585,9,15,'2022-02-19 01:56:19',268435458,'submission.event.general.metadataUpdated',0),(74,515,9,15,'2022-02-19 01:56:29',1342177281,'submission.event.fileUploaded',0),(75,1048585,9,15,'2022-02-19 01:56:29',1342177288,'submission.event.fileRevised',0),(76,515,9,15,'2022-02-19 01:56:31',1342177296,'submission.event.fileEdited',0),(77,1048585,9,15,'2022-02-19 01:56:31',1342177296,'submission.event.fileEdited',0),(78,1048585,9,15,'2022-02-19 01:56:35',268435458,'submission.event.general.metadataUpdated',0),(79,1048585,9,15,'2022-02-19 01:56:36',268435457,'submission.event.submissionSubmitted',0),(80,1048585,9,3,'2022-02-19 01:56:44',268435462,'publication.event.published',0),(81,1048585,10,16,'2022-02-19 01:56:53',268435458,'submission.event.general.metadataUpdated',0),(82,515,10,16,'2022-02-19 01:57:03',1342177281,'submission.event.fileUploaded',0),(83,1048585,10,16,'2022-02-19 01:57:03',1342177288,'submission.event.fileRevised',0),(84,515,10,16,'2022-02-19 01:57:06',1342177296,'submission.event.fileEdited',0),(85,1048585,10,16,'2022-02-19 01:57:06',1342177296,'submission.event.fileEdited',0),(86,1048585,10,16,'2022-02-19 01:57:10',268435458,'submission.event.general.metadataUpdated',0),(87,1048585,10,16,'2022-02-19 01:57:11',268435457,'submission.event.submissionSubmitted',0),(88,1048585,10,3,'2022-02-19 01:57:19',268435462,'publication.event.published',0),(89,1048585,11,17,'2022-02-19 01:57:29',268435458,'submission.event.general.metadataUpdated',0),(90,515,11,17,'2022-02-19 01:57:39',1342177281,'submission.event.fileUploaded',0),(91,1048585,11,17,'2022-02-19 01:57:39',1342177288,'submission.event.fileRevised',0),(92,515,11,17,'2022-02-19 01:57:41',1342177296,'submission.event.fileEdited',0),(93,1048585,11,17,'2022-02-19 01:57:41',1342177296,'submission.event.fileEdited',0),(94,1048585,11,17,'2022-02-19 01:57:49',268435458,'submission.event.general.metadataUpdated',0),(95,1048585,11,17,'2022-02-19 01:57:50',268435457,'submission.event.submissionSubmitted',0),(96,1048585,11,3,'2022-02-19 01:57:58',268435462,'publication.event.published',0),(97,1048585,12,18,'2022-02-19 01:58:08',268435458,'submission.event.general.metadataUpdated',0),(98,515,12,18,'2022-02-19 01:58:18',1342177281,'submission.event.fileUploaded',0),(99,1048585,12,18,'2022-02-19 01:58:18',1342177288,'submission.event.fileRevised',0),(100,515,12,18,'2022-02-19 01:58:21',1342177296,'submission.event.fileEdited',0),(101,1048585,12,18,'2022-02-19 01:58:21',1342177296,'submission.event.fileEdited',0),(102,1048585,12,18,'2022-02-19 01:58:27',268435458,'submission.event.general.metadataUpdated',0),(103,1048585,12,18,'2022-02-19 01:58:28',268435457,'submission.event.submissionSubmitted',0),(104,1048585,12,3,'2022-02-19 01:58:37',268435462,'publication.event.published',0),(105,1048585,13,19,'2022-02-19 01:58:47',268435458,'submission.event.general.metadataUpdated',0),(106,515,13,19,'2022-02-19 01:58:57',1342177281,'submission.event.fileUploaded',0),(107,1048585,13,19,'2022-02-19 01:58:57',1342177288,'submission.event.fileRevised',0),(108,515,13,19,'2022-02-19 01:58:59',1342177296,'submission.event.fileEdited',0),(109,1048585,13,19,'2022-02-19 01:58:59',1342177296,'submission.event.fileEdited',0),(110,1048585,13,19,'2022-02-19 01:59:05',268435458,'submission.event.general.metadataUpdated',0),(111,1048585,13,19,'2022-02-19 01:59:06',268435457,'submission.event.submissionSubmitted',0),(112,1048585,13,3,'2022-02-19 01:59:14',268435462,'publication.event.published',0),(113,1048585,14,20,'2022-02-19 01:59:25',268435458,'submission.event.general.metadataUpdated',0),(114,515,14,20,'2022-02-19 01:59:35',1342177281,'submission.event.fileUploaded',0),(115,1048585,14,20,'2022-02-19 01:59:35',1342177288,'submission.event.fileRevised',0),(116,515,14,20,'2022-02-19 01:59:37',1342177296,'submission.event.fileEdited',0),(117,1048585,14,20,'2022-02-19 01:59:37',1342177296,'submission.event.fileEdited',0),(118,1048585,14,20,'2022-02-19 01:59:42',268435458,'submission.event.general.metadataUpdated',0),(119,1048585,14,20,'2022-02-19 01:59:43',268435457,'submission.event.submissionSubmitted',0),(120,1048585,14,3,'2022-02-19 01:59:51',268435462,'publication.event.published',0),(121,1048585,15,21,'2022-02-19 02:00:01',268435458,'submission.event.general.metadataUpdated',0),(122,515,15,21,'2022-02-19 02:00:11',1342177281,'submission.event.fileUploaded',0),(123,1048585,15,21,'2022-02-19 02:00:11',1342177288,'submission.event.fileRevised',0),(124,515,15,21,'2022-02-19 02:00:14',1342177296,'submission.event.fileEdited',0),(125,1048585,15,21,'2022-02-19 02:00:14',1342177296,'submission.event.fileEdited',0),(126,1048585,15,21,'2022-02-19 02:00:17',268435458,'submission.event.general.metadataUpdated',0),(127,1048585,15,21,'2022-02-19 02:00:18',268435457,'submission.event.submissionSubmitted',0),(128,1048585,15,3,'2022-02-19 02:00:26',268435462,'publication.event.published',0),(129,1048585,16,22,'2022-02-19 02:00:36',268435458,'submission.event.general.metadataUpdated',0),(130,515,16,22,'2022-02-19 02:00:46',1342177281,'submission.event.fileUploaded',0),(131,1048585,16,22,'2022-02-19 02:00:46',1342177288,'submission.event.fileRevised',0),(132,515,16,22,'2022-02-19 02:00:48',1342177296,'submission.event.fileEdited',0),(133,1048585,16,22,'2022-02-19 02:00:48',1342177296,'submission.event.fileEdited',0),(134,1048585,16,22,'2022-02-19 02:00:53',268435458,'submission.event.general.metadataUpdated',0),(135,1048585,16,22,'2022-02-19 02:00:54',268435457,'submission.event.submissionSubmitted',0),(136,1048585,16,3,'2022-02-19 02:01:02',268435462,'publication.event.published',0),(137,1048585,17,23,'2022-02-19 02:01:13',268435458,'submission.event.general.metadataUpdated',0),(138,515,17,23,'2022-02-19 02:01:23',1342177281,'submission.event.fileUploaded',0),(139,1048585,17,23,'2022-02-19 02:01:23',1342177288,'submission.event.fileRevised',0),(140,515,17,23,'2022-02-19 02:01:25',1342177296,'submission.event.fileEdited',0),(141,1048585,17,23,'2022-02-19 02:01:25',1342177296,'submission.event.fileEdited',0),(142,1048585,17,23,'2022-02-19 02:01:31',268435458,'submission.event.general.metadataUpdated',0),(143,1048585,17,23,'2022-02-19 02:01:32',268435457,'submission.event.submissionSubmitted',0),(144,1048585,17,3,'2022-02-19 02:01:40',268435462,'publication.event.published',0),(145,1048585,18,24,'2022-02-19 02:01:50',268435458,'submission.event.general.metadataUpdated',0),(146,515,18,24,'2022-02-19 02:02:00',1342177281,'submission.event.fileUploaded',0),(147,1048585,18,24,'2022-02-19 02:02:00',1342177288,'submission.event.fileRevised',0),(148,515,18,24,'2022-02-19 02:02:03',1342177296,'submission.event.fileEdited',0),(149,1048585,18,24,'2022-02-19 02:02:03',1342177296,'submission.event.fileEdited',0),(150,1048585,18,24,'2022-02-19 02:02:07',268435458,'submission.event.general.metadataUpdated',0),(151,1048585,18,24,'2022-02-19 02:02:08',268435457,'submission.event.submissionSubmitted',0),(152,1048585,18,3,'2022-02-19 02:02:16',268435462,'publication.event.published',0),(153,1048585,19,25,'2022-02-19 02:02:25',268435458,'submission.event.general.metadataUpdated',0),(154,515,19,25,'2022-02-19 02:02:36',1342177281,'submission.event.fileUploaded',0),(155,1048585,19,25,'2022-02-19 02:02:36',1342177288,'submission.event.fileRevised',0),(156,515,19,25,'2022-02-19 02:02:38',1342177296,'submission.event.fileEdited',0),(157,1048585,19,25,'2022-02-19 02:02:38',1342177296,'submission.event.fileEdited',0),(158,1048585,19,25,'2022-02-19 02:02:42',268435458,'submission.event.general.metadataUpdated',0),(159,1048585,19,25,'2022-02-19 02:02:43',268435457,'submission.event.submissionSubmitted',0),(160,1048585,19,3,'2022-02-19 02:02:51',268435462,'publication.event.published',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','10','int'),(2,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','ccorino','string'),(3,'fileId','1','int'),(3,'fileStage','10','int'),(3,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','ccorino','string'),(4,'fileId','1','int'),(4,'fileStage','10','int'),(4,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','ccorino','string'),(5,'fileId','1','int'),(5,'fileStage','10','int'),(5,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','ccorino','string'),(9,'fileId','2','int'),(9,'fileStage','10','int'),(9,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(9,'sourceSubmissionFileId',NULL,'string'),(9,'submissionFileId','2','int'),(9,'submissionId','2','int'),(9,'username','ckwantes','string'),(10,'fileId','2','int'),(10,'fileStage','10','int'),(10,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(10,'submissionFileId','2','int'),(10,'submissionId','2','int'),(10,'username','ckwantes','string'),(11,'fileId','2','int'),(11,'fileStage','10','int'),(11,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','2','int'),(11,'username','ckwantes','string'),(12,'fileId','2','int'),(12,'fileStage','10','int'),(12,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'sourceSubmissionFileId',NULL,'string'),(12,'submissionFileId','2','int'),(12,'submissionId','2','int'),(12,'username','ckwantes','string'),(19,'fileId','3','int'),(19,'fileStage','10','int'),(19,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','3','int'),(19,'username','cmontgomerie','string'),(20,'fileId','3','int'),(20,'fileStage','10','int'),(20,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(20,'submissionFileId','3','int'),(20,'submissionId','3','int'),(20,'username','cmontgomerie','string'),(21,'fileId','3','int'),(21,'fileStage','10','int'),(21,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','3','int'),(21,'submissionId','3','int'),(21,'username','cmontgomerie','string'),(22,'fileId','3','int'),(22,'fileStage','10','int'),(22,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','3','int'),(22,'submissionId','3','int'),(22,'username','cmontgomerie','string'),(34,'fileId','4','int'),(34,'fileStage','10','int'),(34,'originalFileName','Genetic transformation of forest trees.pdf','string'),(34,'sourceSubmissionFileId',NULL,'string'),(34,'submissionFileId','4','int'),(34,'submissionId','4','int'),(34,'username','ddiouf','string'),(35,'fileId','4','int'),(35,'fileStage','10','int'),(35,'name','Genetic transformation of forest trees.pdf','string'),(35,'submissionFileId','4','int'),(35,'submissionId','4','int'),(35,'username','ddiouf','string'),(36,'fileId','4','int'),(36,'fileStage','10','int'),(36,'originalFileName','Genetic transformation of forest trees.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','4','int'),(36,'submissionId','4','int'),(36,'username','ddiouf','string'),(37,'fileId','4','int'),(37,'fileStage','10','int'),(37,'name','Genetic transformation of forest trees.pdf','string'),(37,'originalFileName','Genetic transformation of forest trees.pdf','string'),(37,'sourceSubmissionFileId',NULL,'string'),(37,'submissionFileId','4','int'),(37,'submissionId','4','int'),(37,'username','ddiouf','string'),(42,'fileId','5','int'),(42,'fileStage','10','int'),(42,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(42,'sourceSubmissionFileId',NULL,'string'),(42,'submissionFileId','5','int'),(42,'submissionId','5','int'),(42,'username','dphillips','string'),(43,'fileId','5','int'),(43,'fileStage','10','int'),(43,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(43,'submissionFileId','5','int'),(43,'submissionId','5','int'),(43,'username','dphillips','string'),(44,'fileId','5','int'),(44,'fileStage','10','int'),(44,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','5','int'),(44,'submissionId','5','int'),(44,'username','dphillips','string'),(45,'fileId','5','int'),(45,'fileStage','10','int'),(45,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(45,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(45,'sourceSubmissionFileId',NULL,'string'),(45,'submissionFileId','5','int'),(45,'submissionId','5','int'),(45,'username','dphillips','string'),(50,'fileId','6','int'),(50,'fileStage','10','int'),(50,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(50,'sourceSubmissionFileId',NULL,'string'),(50,'submissionFileId','6','int'),(50,'submissionId','6','int'),(50,'username','dsokoloff','string'),(51,'fileId','6','int'),(51,'fileStage','10','int'),(51,'name','Developing efficacy beliefs in the classroom.pdf','string'),(51,'submissionFileId','6','int'),(51,'submissionId','6','int'),(51,'username','dsokoloff','string'),(52,'fileId','6','int'),(52,'fileStage','10','int'),(52,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','6','int'),(52,'submissionId','6','int'),(52,'username','dsokoloff','string'),(53,'fileId','6','int'),(53,'fileStage','10','int'),(53,'name','Developing efficacy beliefs in the classroom.pdf','string'),(53,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(53,'sourceSubmissionFileId',NULL,'string'),(53,'submissionFileId','6','int'),(53,'submissionId','6','int'),(53,'username','dsokoloff','string'),(58,'fileId','7','int'),(58,'fileStage','10','int'),(58,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','7','int'),(58,'submissionId','7','int'),(58,'username','eostrom','string'),(59,'fileId','7','int'),(59,'fileStage','10','int'),(59,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(59,'submissionFileId','7','int'),(59,'submissionId','7','int'),(59,'username','eostrom','string'),(60,'fileId','7','int'),(60,'fileStage','10','int'),(60,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(60,'sourceSubmissionFileId',NULL,'string'),(60,'submissionFileId','7','int'),(60,'submissionId','7','int'),(60,'username','eostrom','string'),(61,'fileId','7','int'),(61,'fileStage','10','int'),(61,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(61,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(61,'sourceSubmissionFileId',NULL,'string'),(61,'submissionFileId','7','int'),(61,'submissionId','7','int'),(61,'username','eostrom','string'),(66,'fileId','8','int'),(66,'fileStage','10','int'),(66,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','8','int'),(66,'submissionId','8','int'),(66,'username','fpaglieri','string'),(67,'fileId','8','int'),(67,'fileStage','10','int'),(67,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(67,'submissionFileId','8','int'),(67,'submissionId','8','int'),(67,'username','fpaglieri','string'),(68,'fileId','8','int'),(68,'fileStage','10','int'),(68,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(68,'sourceSubmissionFileId',NULL,'string'),(68,'submissionFileId','8','int'),(68,'submissionId','8','int'),(68,'username','fpaglieri','string'),(69,'fileId','8','int'),(69,'fileStage','10','int'),(69,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(69,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(69,'sourceSubmissionFileId',NULL,'string'),(69,'submissionFileId','8','int'),(69,'submissionId','8','int'),(69,'username','fpaglieri','string'),(74,'fileId','9','int'),(74,'fileStage','10','int'),(74,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(74,'sourceSubmissionFileId',NULL,'string'),(74,'submissionFileId','9','int'),(74,'submissionId','9','int'),(74,'username','jmwandenga','string'),(75,'fileId','9','int'),(75,'fileStage','10','int'),(75,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(75,'submissionFileId','9','int'),(75,'submissionId','9','int'),(75,'username','jmwandenga','string'),(76,'fileId','9','int'),(76,'fileStage','10','int'),(76,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(76,'sourceSubmissionFileId',NULL,'string'),(76,'submissionFileId','9','int'),(76,'submissionId','9','int'),(76,'username','jmwandenga','string'),(77,'fileId','9','int'),(77,'fileStage','10','int'),(77,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(77,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(77,'sourceSubmissionFileId',NULL,'string'),(77,'submissionFileId','9','int'),(77,'submissionId','9','int'),(77,'username','jmwandenga','string'),(82,'fileId','10','int'),(82,'fileStage','10','int'),(82,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(82,'sourceSubmissionFileId',NULL,'string'),(82,'submissionFileId','10','int'),(82,'submissionId','10','int'),(82,'username','jnovak','string'),(83,'fileId','10','int'),(83,'fileStage','10','int'),(83,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(83,'submissionFileId','10','int'),(83,'submissionId','10','int'),(83,'username','jnovak','string'),(84,'fileId','10','int'),(84,'fileStage','10','int'),(84,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(84,'sourceSubmissionFileId',NULL,'string'),(84,'submissionFileId','10','int'),(84,'submissionId','10','int'),(84,'username','jnovak','string'),(85,'fileId','10','int'),(85,'fileStage','10','int'),(85,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(85,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(85,'sourceSubmissionFileId',NULL,'string'),(85,'submissionFileId','10','int'),(85,'submissionId','10','int'),(85,'username','jnovak','string'),(90,'fileId','11','int'),(90,'fileStage','10','int'),(90,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(90,'sourceSubmissionFileId',NULL,'string'),(90,'submissionFileId','11','int'),(90,'submissionId','11','int'),(90,'username','kalkhafaji','string'),(91,'fileId','11','int'),(91,'fileStage','10','int'),(91,'name','Learning Sustainable Design through Service.pdf','string'),(91,'submissionFileId','11','int'),(91,'submissionId','11','int'),(91,'username','kalkhafaji','string'),(92,'fileId','11','int'),(92,'fileStage','10','int'),(92,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(92,'sourceSubmissionFileId',NULL,'string'),(92,'submissionFileId','11','int'),(92,'submissionId','11','int'),(92,'username','kalkhafaji','string'),(93,'fileId','11','int'),(93,'fileStage','10','int'),(93,'name','Learning Sustainable Design through Service.pdf','string'),(93,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(93,'sourceSubmissionFileId',NULL,'string'),(93,'submissionFileId','11','int'),(93,'submissionId','11','int'),(93,'username','kalkhafaji','string'),(98,'fileId','12','int'),(98,'fileStage','10','int'),(98,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(98,'sourceSubmissionFileId',NULL,'string'),(98,'submissionFileId','12','int'),(98,'submissionId','12','int'),(98,'username','lchristopher','string'),(99,'fileId','12','int'),(99,'fileStage','10','int'),(99,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(99,'submissionFileId','12','int'),(99,'submissionId','12','int'),(99,'username','lchristopher','string'),(100,'fileId','12','int'),(100,'fileStage','10','int'),(100,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(100,'sourceSubmissionFileId',NULL,'string'),(100,'submissionFileId','12','int'),(100,'submissionId','12','int'),(100,'username','lchristopher','string'),(101,'fileId','12','int'),(101,'fileStage','10','int'),(101,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(101,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(101,'sourceSubmissionFileId',NULL,'string'),(101,'submissionFileId','12','int'),(101,'submissionId','12','int'),(101,'username','lchristopher','string'),(106,'fileId','13','int'),(106,'fileStage','10','int'),(106,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(106,'sourceSubmissionFileId',NULL,'string'),(106,'submissionFileId','13','int'),(106,'submissionId','13','int'),(106,'username','lkumiega','string'),(107,'fileId','13','int'),(107,'fileStage','10','int'),(107,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(107,'submissionFileId','13','int'),(107,'submissionId','13','int'),(107,'username','lkumiega','string'),(108,'fileId','13','int'),(108,'fileStage','10','int'),(108,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(108,'sourceSubmissionFileId',NULL,'string'),(108,'submissionFileId','13','int'),(108,'submissionId','13','int'),(108,'username','lkumiega','string'),(109,'fileId','13','int'),(109,'fileStage','10','int'),(109,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(109,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(109,'sourceSubmissionFileId',NULL,'string'),(109,'submissionFileId','13','int'),(109,'submissionId','13','int'),(109,'username','lkumiega','string'),(114,'fileId','14','int'),(114,'fileStage','10','int'),(114,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(114,'sourceSubmissionFileId',NULL,'string'),(114,'submissionFileId','14','int'),(114,'submissionId','14','int'),(114,'username','pdaniel','string'),(115,'fileId','14','int'),(115,'fileStage','10','int'),(115,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(115,'submissionFileId','14','int'),(115,'submissionId','14','int'),(115,'username','pdaniel','string'),(116,'fileId','14','int'),(116,'fileStage','10','int'),(116,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(116,'sourceSubmissionFileId',NULL,'string'),(116,'submissionFileId','14','int'),(116,'submissionId','14','int'),(116,'username','pdaniel','string'),(117,'fileId','14','int'),(117,'fileStage','10','int'),(117,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(117,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(117,'sourceSubmissionFileId',NULL,'string'),(117,'submissionFileId','14','int'),(117,'submissionId','14','int'),(117,'username','pdaniel','string'),(122,'fileId','15','int'),(122,'fileStage','10','int'),(122,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(122,'sourceSubmissionFileId',NULL,'string'),(122,'submissionFileId','15','int'),(122,'submissionId','15','int'),(122,'username','rbaiyewu','string'),(123,'fileId','15','int'),(123,'fileStage','10','int'),(123,'name','Yam diseases and its management in Nigeria.pdf','string'),(123,'submissionFileId','15','int'),(123,'submissionId','15','int'),(123,'username','rbaiyewu','string'),(124,'fileId','15','int'),(124,'fileStage','10','int'),(124,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','15','int'),(124,'submissionId','15','int'),(124,'username','rbaiyewu','string'),(125,'fileId','15','int'),(125,'fileStage','10','int'),(125,'name','Yam diseases and its management in Nigeria.pdf','string'),(125,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','15','int'),(125,'submissionId','15','int'),(125,'username','rbaiyewu','string'),(130,'fileId','16','int'),(130,'fileStage','10','int'),(130,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','16','int'),(130,'submissionId','16','int'),(130,'username','rrossi','string'),(131,'fileId','16','int'),(131,'fileStage','10','int'),(131,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(131,'submissionFileId','16','int'),(131,'submissionId','16','int'),(131,'username','rrossi','string'),(132,'fileId','16','int'),(132,'fileStage','10','int'),(132,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','16','int'),(132,'submissionId','16','int'),(132,'username','rrossi','string'),(133,'fileId','16','int'),(133,'fileStage','10','int'),(133,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(133,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','16','int'),(133,'submissionId','16','int'),(133,'username','rrossi','string'),(138,'fileId','17','int'),(138,'fileStage','10','int'),(138,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(138,'sourceSubmissionFileId',NULL,'string'),(138,'submissionFileId','17','int'),(138,'submissionId','17','int'),(138,'username','vkarbasizaed','string'),(139,'fileId','17','int'),(139,'fileStage','10','int'),(139,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(139,'submissionFileId','17','int'),(139,'submissionId','17','int'),(139,'username','vkarbasizaed','string'),(140,'fileId','17','int'),(140,'fileStage','10','int'),(140,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(140,'sourceSubmissionFileId',NULL,'string'),(140,'submissionFileId','17','int'),(140,'submissionId','17','int'),(140,'username','vkarbasizaed','string'),(141,'fileId','17','int'),(141,'fileStage','10','int'),(141,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(141,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(141,'sourceSubmissionFileId',NULL,'string'),(141,'submissionFileId','17','int'),(141,'submissionId','17','int'),(141,'username','vkarbasizaed','string'),(146,'fileId','18','int'),(146,'fileStage','10','int'),(146,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(146,'sourceSubmissionFileId',NULL,'string'),(146,'submissionFileId','18','int'),(146,'submissionId','18','int'),(146,'username','vwilliamson','string'),(147,'fileId','18','int'),(147,'fileStage','10','int'),(147,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(147,'submissionFileId','18','int'),(147,'submissionId','18','int'),(147,'username','vwilliamson','string'),(148,'fileId','18','int'),(148,'fileStage','10','int'),(148,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(148,'sourceSubmissionFileId',NULL,'string'),(148,'submissionFileId','18','int'),(148,'submissionId','18','int'),(148,'username','vwilliamson','string'),(149,'fileId','18','int'),(149,'fileStage','10','int'),(149,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(149,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(149,'sourceSubmissionFileId',NULL,'string'),(149,'submissionFileId','18','int'),(149,'submissionId','18','int'),(149,'username','vwilliamson','string'),(154,'fileId','19','int'),(154,'fileStage','10','int'),(154,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(154,'sourceSubmissionFileId',NULL,'string'),(154,'submissionFileId','19','int'),(154,'submissionId','19','int'),(154,'username','zwoods','string'),(155,'fileId','19','int'),(155,'fileStage','10','int'),(155,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(155,'submissionFileId','19','int'),(155,'submissionId','19','int'),(155,'username','zwoods','string'),(156,'fileId','19','int'),(156,'fileStage','10','int'),(156,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(156,'sourceSubmissionFileId',NULL,'string'),(156,'submissionFileId','19','int'),(156,'submissionId','19','int'),(156,'username','zwoods','string'),(157,'fileId','19','int'),(157,'fileStage','10','int'),(157,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(157,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(157,'sourceSubmissionFileId',NULL,'string'),(157,'submissionFileId','19','int'),(157,'submissionId','19','int'),(157,'username','zwoods','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/62104d12a7ebd.pdf','application/pdf'),(2,'contexts/1/submissions/2/62104d2c2c874.pdf','application/pdf'),(3,'contexts/1/submissions/3/62104d5d78cad.pdf','application/pdf'),(4,'contexts/1/submissions/4/62104d9be1454.pdf','application/pdf'),(5,'contexts/1/submissions/5/62104dbd02906.pdf','application/pdf'),(6,'contexts/1/submissions/6/62104de14a6cd.pdf','application/pdf'),(7,'contexts/1/submissions/7/62104e03264ed.pdf','application/pdf'),(8,'contexts/1/submissions/8/62104e2a871e7.pdf','application/pdf'),(9,'contexts/1/submissions/9/62104e4d638a7.pdf','application/pdf'),(10,'contexts/1/submissions/10/62104e6fe36a9.pdf','application/pdf'),(11,'contexts/1/submissions/11/62104e9324ade.pdf','application/pdf'),(12,'contexts/1/submissions/12/62104ebadd131.pdf','application/pdf'),(13,'contexts/1/submissions/13/62104ee1417e9.pdf','application/pdf'),(14,'contexts/1/submissions/14/62104f076e04d.pdf','application/pdf'),(15,'contexts/1/submissions/15/62104f2bcbaf6.pdf','application/pdf'),(16,'contexts/1/submissions/16/62104f4e6ba4b.pdf','application/pdf'),(17,'contexts/1/submissions/17/62104f735fdfd.pdf','application/pdf'),(18,'contexts/1/submissions/18/62104f98d9213.pdf','application/pdf'),(19,'contexts/1/submissions/19/62104fbc358ad.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)'),(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(PREPRINT)'),(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.preprint.PreprintGalley','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.preprint.PreprintGalley[]'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Crossref XML preprint export','plugins.generic.crossref.filter.PreprintCrossrefXmlFilter',0,0,0),(2,2,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaPreprintAdapter',0,0,0),(3,3,0,'Native XML submission export','plugins.importexport.native.filter.PreprintNativeXmlFilter',0,0,0),(4,4,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlPreprintFilter',0,0,0),(5,5,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(6,6,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(7,8,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlPreprintFileFilter',0,0,0),(8,7,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(9,9,0,'Native XML representation export','plugins.importexport.native.filter.PreprintGalleyNativeXmlFilter',0,0,0),(10,10,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPreprintGalleyFilter',0,0,0),(11,11,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(12,12,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0);
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
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Preprint Text','string'),(1,'fr_CA','name','Texte de la prépublication','string'),(2,'en_US','name','Research Instrument','string'),(2,'fr_CA','name','##default.genres.researchInstrument##','string'),(3,'en_US','name','Research Materials','string'),(3,'fr_CA','name','##default.genres.researchMaterials##','string'),(4,'en_US','name','Research Results','string'),(4,'fr_CA','name','##default.genres.researchResults##','string'),(5,'en_US','name','Transcripts','string'),(5,'fr_CA','name','##default.genres.transcripts##','string'),(6,'en_US','name','Data Analysis','string'),(6,'fr_CA','name','##default.genres.dataAnalysis##','string'),(7,'en_US','name','Data Set','string'),(7,'fr_CA','name','##default.genres.dataSet##','string'),(8,'en_US','name','Source Texts','string'),(8,'fr_CA','name','##default.genres.sourceTexts##','string'),(9,'en_US','name','Multimedia','string'),(9,'fr_CA','name','Multimédias','string'),(10,'en_US','name','Image','string'),(10,'fr_CA','name','Image','string'),(11,'en_US','name','HTML Stylesheet','string'),(11,'fr_CA','name','Feuille de style HTML','string'),(12,'en_US','name','Other','string'),(12,'fr_CA','name','Autre','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
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
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','manager.announcements','string'),(16,'','titleLocaleKey','navigation.archives','string'),(17,'','titleLocaleKey','navigation.about','string'),(18,'','titleLocaleKey','about.aboutContext','string'),(19,'','titleLocaleKey','about.submissions','string'),(20,'','titleLocaleKey','about.editorialTeam','string'),(21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,'','titleLocaleKey','about.contact','string'),(23,'','titleLocaleKey','common.search','string');
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
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(16,1,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(21,1,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,'NMI_TYPE_SEARCH');
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
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
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
INSERT INTO `notification_settings` VALUES (204,'','contents','There was a problem sending an email message. Please try again later, or contact your system administrator.','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES (1,'blocked_emailed_notification','8',7,1,'int'),(2,'blocked_emailed_notification','8',8,1,'int'),(3,'blocked_emailed_notification','8',9,1,'int'),(4,'blocked_emailed_notification','8',10,1,'int'),(5,'blocked_emailed_notification','8',11,1,'int'),(6,'blocked_emailed_notification','8',12,1,'int'),(7,'blocked_emailed_notification','8',13,1,'int'),(8,'blocked_emailed_notification','8',14,1,'int'),(9,'blocked_emailed_notification','8',15,1,'int'),(10,'blocked_emailed_notification','8',16,1,'int'),(11,'blocked_emailed_notification','8',17,1,'int'),(12,'blocked_emailed_notification','8',18,1,'int'),(13,'blocked_emailed_notification','8',19,1,'int'),(14,'blocked_emailed_notification','8',20,1,'int'),(15,'blocked_emailed_notification','8',21,1,'int'),(16,'blocked_emailed_notification','8',22,1,'int'),(17,'blocked_emailed_notification','8',23,1,'int'),(18,'blocked_emailed_notification','8',24,1,'int'),(19,'blocked_emailed_notification','8',25,1,'int');
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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2022-02-19 01:51:22',NULL,1048585,1),(4,1,0,3,16777223,'2022-02-19 01:51:22',NULL,1048585,1),(5,1,4,2,16777217,'2022-02-19 01:51:22',NULL,1048585,1),(7,1,5,2,16777217,'2022-02-19 01:51:22',NULL,1048585,1),(9,1,0,2,16777243,'2022-02-19 01:51:22',NULL,1048585,1),(10,1,0,2,16777245,'2022-02-19 01:51:22',NULL,1048585,1),(12,1,0,3,16777222,'2022-02-19 01:51:47',NULL,1048585,2),(13,1,0,3,16777223,'2022-02-19 01:51:47',NULL,1048585,2),(14,1,4,2,16777217,'2022-02-19 01:51:47',NULL,1048585,2),(16,1,5,2,16777217,'2022-02-19 01:51:47',NULL,1048585,2),(18,1,0,2,16777243,'2022-02-19 01:51:47',NULL,1048585,2),(19,1,0,2,16777245,'2022-02-19 01:51:47',NULL,1048585,2),(23,1,0,3,16777222,'2022-02-19 01:52:41',NULL,1048585,3),(24,1,0,3,16777223,'2022-02-19 01:52:41',NULL,1048585,3),(25,1,4,2,16777217,'2022-02-19 01:52:41',NULL,1048585,3),(27,1,5,2,16777217,'2022-02-19 01:52:41',NULL,1048585,3),(29,1,0,2,16777243,'2022-02-19 01:52:41',NULL,1048585,3),(30,1,0,2,16777245,'2022-02-19 01:52:41',NULL,1048585,3),(35,1,4,3,16777259,'2022-02-19 01:53:05',NULL,1048585,3),(37,1,5,3,16777259,'2022-02-19 01:53:05',NULL,1048585,3),(39,1,9,3,16777259,'2022-02-19 01:53:06',NULL,1048585,3),(41,1,0,3,16777222,'2022-02-19 01:53:38',NULL,1048585,4),(42,1,0,3,16777223,'2022-02-19 01:53:38',NULL,1048585,4),(43,1,4,2,16777217,'2022-02-19 01:53:38',NULL,1048585,4),(45,1,5,2,16777217,'2022-02-19 01:53:38',NULL,1048585,4),(47,1,0,2,16777243,'2022-02-19 01:53:38',NULL,1048585,4),(48,1,0,2,16777245,'2022-02-19 01:53:38',NULL,1048585,4),(51,1,0,3,16777222,'2022-02-19 01:54:14',NULL,1048585,5),(52,1,0,3,16777223,'2022-02-19 01:54:14',NULL,1048585,5),(53,1,4,2,16777217,'2022-02-19 01:54:14',NULL,1048585,5),(55,1,5,2,16777217,'2022-02-19 01:54:14',NULL,1048585,5),(57,1,0,2,16777243,'2022-02-19 01:54:14',NULL,1048585,5),(58,1,0,2,16777245,'2022-02-19 01:54:14',NULL,1048585,5),(61,1,0,3,16777222,'2022-02-19 01:54:47',NULL,1048585,6),(62,1,0,3,16777223,'2022-02-19 01:54:47',NULL,1048585,6),(63,1,4,2,16777217,'2022-02-19 01:54:47',NULL,1048585,6),(65,1,5,2,16777217,'2022-02-19 01:54:47',NULL,1048585,6),(67,1,0,2,16777243,'2022-02-19 01:54:47',NULL,1048585,6),(68,1,0,2,16777245,'2022-02-19 01:54:47',NULL,1048585,6),(72,1,0,3,16777222,'2022-02-19 01:55:26',NULL,1048585,7),(73,1,0,3,16777223,'2022-02-19 01:55:26',NULL,1048585,7),(74,1,4,2,16777217,'2022-02-19 01:55:26',NULL,1048585,7),(76,1,5,2,16777217,'2022-02-19 01:55:26',NULL,1048585,7),(78,1,0,2,16777243,'2022-02-19 01:55:26',NULL,1048585,7),(79,1,0,2,16777245,'2022-02-19 01:55:26',NULL,1048585,7),(83,1,0,3,16777222,'2022-02-19 01:56:00',NULL,1048585,8),(84,1,0,3,16777223,'2022-02-19 01:56:00',NULL,1048585,8),(85,1,4,2,16777217,'2022-02-19 01:56:00',NULL,1048585,8),(87,1,5,2,16777217,'2022-02-19 01:56:00',NULL,1048585,8),(89,1,0,2,16777243,'2022-02-19 01:56:01',NULL,1048585,8),(90,1,0,2,16777245,'2022-02-19 01:56:01',NULL,1048585,8),(93,1,0,3,16777222,'2022-02-19 01:56:36',NULL,1048585,9),(94,1,0,3,16777223,'2022-02-19 01:56:36',NULL,1048585,9),(95,1,4,2,16777217,'2022-02-19 01:56:36',NULL,1048585,9),(97,1,5,2,16777217,'2022-02-19 01:56:36',NULL,1048585,9),(99,1,0,2,16777243,'2022-02-19 01:56:36',NULL,1048585,9),(100,1,0,2,16777245,'2022-02-19 01:56:36',NULL,1048585,9),(103,1,0,3,16777222,'2022-02-19 01:57:11',NULL,1048585,10),(104,1,0,3,16777223,'2022-02-19 01:57:11',NULL,1048585,10),(105,1,4,2,16777217,'2022-02-19 01:57:11',NULL,1048585,10),(107,1,5,2,16777217,'2022-02-19 01:57:11',NULL,1048585,10),(109,1,0,2,16777243,'2022-02-19 01:57:11',NULL,1048585,10),(110,1,0,2,16777245,'2022-02-19 01:57:11',NULL,1048585,10),(114,1,0,3,16777222,'2022-02-19 01:57:49',NULL,1048585,11),(115,1,0,3,16777223,'2022-02-19 01:57:49',NULL,1048585,11),(116,1,4,2,16777217,'2022-02-19 01:57:49',NULL,1048585,11),(118,1,5,2,16777217,'2022-02-19 01:57:50',NULL,1048585,11),(120,1,0,2,16777243,'2022-02-19 01:57:50',NULL,1048585,11),(121,1,0,2,16777245,'2022-02-19 01:57:50',NULL,1048585,11),(125,1,0,3,16777222,'2022-02-19 01:58:27',NULL,1048585,12),(126,1,0,3,16777223,'2022-02-19 01:58:27',NULL,1048585,12),(127,1,4,2,16777217,'2022-02-19 01:58:27',NULL,1048585,12),(129,1,5,2,16777217,'2022-02-19 01:58:27',NULL,1048585,12),(131,1,0,2,16777243,'2022-02-19 01:58:28',NULL,1048585,12),(132,1,0,2,16777245,'2022-02-19 01:58:28',NULL,1048585,12),(135,1,0,3,16777222,'2022-02-19 01:59:06',NULL,1048585,13),(136,1,0,3,16777223,'2022-02-19 01:59:06',NULL,1048585,13),(137,1,4,2,16777217,'2022-02-19 01:59:06',NULL,1048585,13),(139,1,5,2,16777217,'2022-02-19 01:59:06',NULL,1048585,13),(141,1,0,2,16777243,'2022-02-19 01:59:06',NULL,1048585,13),(142,1,0,2,16777245,'2022-02-19 01:59:06',NULL,1048585,13),(145,1,0,3,16777222,'2022-02-19 01:59:43',NULL,1048585,14),(146,1,0,3,16777223,'2022-02-19 01:59:43',NULL,1048585,14),(147,1,4,2,16777217,'2022-02-19 01:59:43',NULL,1048585,14),(149,1,5,2,16777217,'2022-02-19 01:59:43',NULL,1048585,14),(151,1,0,2,16777243,'2022-02-19 01:59:43',NULL,1048585,14),(152,1,0,2,16777245,'2022-02-19 01:59:43',NULL,1048585,14),(155,1,0,3,16777222,'2022-02-19 02:00:18',NULL,1048585,15),(156,1,0,3,16777223,'2022-02-19 02:00:18',NULL,1048585,15),(157,1,4,2,16777217,'2022-02-19 02:00:18',NULL,1048585,15),(159,1,5,2,16777217,'2022-02-19 02:00:18',NULL,1048585,15),(161,1,0,2,16777243,'2022-02-19 02:00:18',NULL,1048585,15),(162,1,0,2,16777245,'2022-02-19 02:00:18',NULL,1048585,15),(165,1,0,3,16777222,'2022-02-19 02:00:54',NULL,1048585,16),(166,1,0,3,16777223,'2022-02-19 02:00:54',NULL,1048585,16),(167,1,4,2,16777217,'2022-02-19 02:00:54',NULL,1048585,16),(169,1,5,2,16777217,'2022-02-19 02:00:54',NULL,1048585,16),(171,1,0,2,16777243,'2022-02-19 02:00:54',NULL,1048585,16),(172,1,0,2,16777245,'2022-02-19 02:00:54',NULL,1048585,16),(175,1,0,3,16777222,'2022-02-19 02:01:32',NULL,1048585,17),(176,1,0,3,16777223,'2022-02-19 02:01:32',NULL,1048585,17),(177,1,4,2,16777217,'2022-02-19 02:01:32',NULL,1048585,17),(179,1,5,2,16777217,'2022-02-19 02:01:32',NULL,1048585,17),(181,1,0,2,16777243,'2022-02-19 02:01:32',NULL,1048585,17),(182,1,0,2,16777245,'2022-02-19 02:01:32',NULL,1048585,17),(185,1,0,3,16777222,'2022-02-19 02:02:08',NULL,1048585,18),(186,1,0,3,16777223,'2022-02-19 02:02:08',NULL,1048585,18),(187,1,4,2,16777217,'2022-02-19 02:02:08',NULL,1048585,18),(189,1,5,2,16777217,'2022-02-19 02:02:08',NULL,1048585,18),(191,1,0,2,16777243,'2022-02-19 02:02:08',NULL,1048585,18),(192,1,0,2,16777245,'2022-02-19 02:02:08',NULL,1048585,18),(195,1,0,3,16777222,'2022-02-19 02:02:43',NULL,1048585,19),(196,1,0,3,16777223,'2022-02-19 02:02:43',NULL,1048585,19),(197,1,4,2,16777217,'2022-02-19 02:02:43',NULL,1048585,19),(199,1,5,2,16777217,'2022-02-19 02:02:43',NULL,1048585,19),(201,1,0,2,16777243,'2022-02-19 02:02:43',NULL,1048585,19),(202,1,0,2,16777245,'2022-02-19 02:02:43',NULL,1048585,19),(204,0,3,1,3,'2022-02-19 02:02:51',NULL,0,0);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','62104c78cd988','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object');
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
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  KEY `publication_galleys_doi_id_foreign` (`doi_id`),
  CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',NULL,0.00,'',0,'',NULL),(2,'en_US',2,'PDF',NULL,0.00,'',0,'',NULL),(3,'en_US',3,'PDF',NULL,0.00,'',0,'',NULL),(4,'en_US',4,'PDF',NULL,0.00,'',0,'',NULL),(5,'en_US',5,'PDF',NULL,0.00,'',0,'',NULL),(6,'en_US',6,'PDF',NULL,0.00,'',0,'',NULL),(7,'en_US',7,'PDF',NULL,0.00,'',0,'',NULL),(8,'en_US',8,'PDF',NULL,0.00,'',0,'',NULL),(9,'en_US',9,'PDF',NULL,0.00,'',0,'',NULL),(10,'en_US',10,'PDF',NULL,0.00,'',0,'',NULL),(11,'en_US',11,'PDF',NULL,0.00,'',0,'',NULL),(12,'en_US',12,'PDF',NULL,0.00,'',0,'',NULL),(13,'en_US',13,'PDF',NULL,0.00,'',0,'',NULL),(14,'en_US',14,'PDF',NULL,0.00,'',0,'',NULL),(15,'en_US',15,'PDF',NULL,0.00,'',0,'',NULL),(16,'en_US',16,'PDF',NULL,0.00,'',0,'',NULL),(17,'en_US',17,'PDF',NULL,0.00,'',0,'',NULL),(18,'en_US',18,'PDF',NULL,0.00,'',0,'',NULL),(19,'en_US',19,'PDF',NULL,0.00,'',0,'',NULL),(20,'en_US',20,'PDF',NULL,0.00,'',0,'',NULL);
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'','licenseUrl',''),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2022'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','subtitle','A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'en_US','title','The Facets Of Job Satisfaction'),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'','categoryIds','[]'),(3,'','copyrightYear','2022'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'','copyrightYear','2022'),(4,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(4,'en_US','copyrightHolder','Craig Montgomerie'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Genetic transformation of forest trees'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'','copyrightYear','2022'),(6,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2022'),(7,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Developing efficacy beliefs in the classroom'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'','copyrightYear','2022'),(8,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Traditions and Trends in the Study of the Commons'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'','copyrightYear','2022'),(9,'en_US','abstract','<p>None.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'','copyrightYear','2022'),(10,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'','copyrightYear','2022'),(11,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'','copyrightYear','2022'),(12,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Learning Sustainable Design through Service'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'','copyrightYear','2022'),(13,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'','copyrightYear','2022'),(15,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'','copyrightYear','2022'),(16,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Yam diseases and its management in Nigeria'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'','copyrightYear','2022'),(17,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2022'),(18,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'','copyrightYear','2022'),(19,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title',''),(20,'','categoryIds','[]'),(20,'','copyrightYear','2022'),(20,'en_US','abstract','<p>None.</p>'),(20,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(20,'en_US','prefix',''),(20,'en_US','subtitle',''),(20,'en_US','title','Finocchiaro: Arguments About Arguments'),(20,'fr_CA','abstract',''),(20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(20,'fr_CA','prefix',''),(20,'fr_CA','subtitle',''),(20,'fr_CA','title','');
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
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`),
  KEY `publications_doi_id_foreign` (`doi_id`),
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2022-02-19 01:51:21',1,1,1,1,NULL,1,NULL),(2,0,'2022-02-19','2022-02-19 01:52:10',2,1,2,3,NULL,1,NULL),(3,0,'2022-02-19','2022-02-19 01:53:02',4,1,3,3,NULL,1,NULL),(4,0,'2022-02-19','2022-02-19 01:53:12',6,1,3,3,NULL,2,NULL),(5,0,'2022-02-19','2022-02-19 01:53:45',8,1,4,3,NULL,1,NULL),(6,0,'2022-02-19','2022-02-19 01:54:22',9,1,5,3,NULL,1,NULL),(7,0,'2022-02-19','2022-02-19 01:54:55',10,1,6,3,NULL,1,NULL),(8,0,'2022-02-19','2022-02-19 01:55:34',11,1,7,3,NULL,1,NULL),(9,0,'2022-02-19','2022-02-19 01:56:09',13,1,8,3,NULL,1,NULL),(10,0,'2022-02-19','2022-02-19 01:56:44',14,1,9,3,NULL,1,NULL),(11,0,'2022-02-19','2022-02-19 01:57:19',15,1,10,3,NULL,1,NULL),(12,0,'2022-02-19','2022-02-19 01:57:58',16,1,11,3,NULL,1,NULL),(13,0,'2022-02-19','2022-02-19 01:58:37',18,1,12,3,NULL,1,NULL),(14,0,'2022-02-19','2022-02-19 01:59:14',19,1,13,3,NULL,1,NULL),(15,0,'2022-02-19','2022-02-19 01:59:51',20,1,14,3,NULL,1,NULL),(16,0,'2022-02-19','2022-02-19 02:00:26',21,1,15,3,NULL,1,NULL),(17,0,'2022-02-19','2022-02-19 02:01:02',22,1,16,3,NULL,1,NULL),(18,0,'2022-02-19','2022-02-19 02:01:40',23,1,17,3,NULL,1,NULL),(19,0,'2022-02-19','2022-02-19 02:02:16',24,1,18,3,NULL,1,NULL),(20,0,'2022-02-19','2022-02-19 02:02:51',25,1,19,3,NULL,1,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.StatisticsReport','2022-02-19 01:48:26'),('plugins.generic.usageStats.UsageStatsLoader','2022-02-19 01:48:26');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
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
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'','path','preprints','string'),(1,'en_US','abbrev','PRE','string'),(1,'en_US','description','','string'),(1,'en_US','identifyType','','string'),(1,'en_US','policy','<p>##section.default.policy##</p>','string'),(1,'en_US','title','Preprints','string'),(1,'fr_CA','abbrev','','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','identifyType','','string'),(1,'fr_CA','policy','','string'),(1,'fr_CA','title','','string');
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
  `server_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `is_inactive` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_server_id` (`server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,0,0.00,0,1,1,0,0,0,0,NULL);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_settings`
--

DROP TABLE IF EXISTS `server_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_settings` (
  `server_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `server_settings_pkey` (`server_id`,`locale`,`setting_name`),
  KEY `server_settings_server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copySubmissionAckAddress','',NULL),(1,'','copySubmissionAckPrimaryContact','0',NULL),(1,'','country','IS',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enableDois','0',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','registrationAgency','none',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"http://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously posted.\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par un autre serveur. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\"},{\"order\":2,\"content\":\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\"},{\"order\":3,\"content\":\"Lorsque possible, les URL des références ont été fournies.\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]',NULL);
/*!40000 ALTER TABLE `server_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `server_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Used to order lists of servers',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the server is considered "live" and will appear on the website. (Note that disabled servers may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `servers_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,'publicknowledge',1.00,'en_US',1);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('1cb1popofs332scbmolkf1gdja',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235841,1645235878,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235878;s:5:\"token\";s:32:\"cd17f4970911992122f1604558a0c945\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('1k83eim09kj5e55vq5mrkjvms2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235993,1645236026,0,'csrf|a:2:{s:9:\"timestamp\";i:1645236026;s:5:\"token\";s:32:\"3d9e37d8876f84948edd43f6fa10fba2\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2dv9ojpca0uh8lghn30cvqbbvf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235771,1645235804,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235804;s:5:\"token\";s:32:\"f35d2c1128e3d512d0634fe85f55ec04\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2jr72nqcgtkq9v2ec78lc6pvtr',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235457,1645235482,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235481;s:5:\"token\";s:32:\"4cfe49c2f201385c4d34e94c00f0ff24\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('2m8q5unf6to2ktm6f9o3094qqv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645236028,1645236063,0,'csrf|a:2:{s:9:\"timestamp\";i:1645236063;s:5:\"token\";s:32:\"9230c0a4a2b45077e1dc077ffeaa5c06\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('33m7fnb8ctq4drdhtl918ekugi',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235736,1645235769,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235769;s:5:\"token\";s:32:\"1fdf61f7f225be8d5ee5b504d050111f\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('39ct6oqvljpmtm03v54ckfou78',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235337,1645235344,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645235344;s:5:\"token\";s:32:\"9c72805da8039ff62fd783db07c95d41\";}','localhost'),('3fb49mnd5rtstc81qatr1bb270',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235697,1645235734,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235734;s:5:\"token\";s:32:\"021f41123718dd16f06ecd4f0e0cc1f3\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3tmqphse7b1o4a2m38m956831m',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235305,1645235320,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645235320;s:5:\"token\";s:32:\"ba37e7593d226b6237caf1d52b271349\";}','localhost'),('54ip96rt48n5bh9i5tm300teeh',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235421,1645235428,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645235428;s:5:\"token\";s:32:\"ef96a358387c9ee09911e5bddd7d97d6\";}','localhost'),('7im75bkp3k10lvun58npcn9s3t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235627,1645235662,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235662;s:5:\"token\";s:32:\"fe57785cd1ffd5e44c4db4c2eec2bd2d\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('92ctritlcor37qbdh4s9fh16vt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235806,1645235839,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235839;s:5:\"token\";s:32:\"1097d5f859dfb8a9d127944f19d05a29\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('99jssvscvpbtpjr5j828pe7aa8',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235344,1645235354,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645235354;s:5:\"token\";s:32:\"7af8d0c8be0215e8de921bac51da5fe9\";}','localhost'),('a3vp4obb72ta4k4n0988onm9mh',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235428,1645235455,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645235455;s:5:\"token\";s:32:\"32bd87208106e6e3034c4e0197f302a5\";}','localhost'),('dqbnv55d5hfetb0rbnqniv00s8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235664,1645235695,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235695;s:5:\"token\";s:32:\"11af1fc9e29da3ac47946c969bef31b9\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('eu3h0jgiv3aivf9g9a5b0cpbld',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645236138,1645236171,0,'csrf|a:2:{s:9:\"timestamp\";i:1645236171;s:5:\"token\";s:32:\"93527f3d0498fb74793b48a21529c28c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('f4iu9eqihne7o82r0habsk0fu6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235880,1645235917,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235917;s:5:\"token\";s:32:\"797335ca917080f79896a1357ca3d8a5\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('f7nebmvlcgsv8sepl4nf3epfu6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235919,1645235955,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235955;s:5:\"token\";s:32:\"e9d36bbeb4fd4f51e64221134f5fdda1\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('guilnf4j9aju418l5dfllpkdsm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235594,1645235626,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235626;s:5:\"token\";s:32:\"59236fbe4e91c498b55f3006dfd112cc\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ihb8gms6ueomvee3v7tn05qe49',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235525,1645235531,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1645235531;s:5:\"token\";s:32:\"52417aa2c232ae1d4cde39f39a3a0e47\";}','localhost'),('lenmg2fvu1rgkc16507tefu682',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235356,1645235419,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1645235418;s:5:\"token\";s:32:\"6aaca843a03785a9940decdad4bd293c\";}','localhost'),('mlsd3lf7lnf0svt13ubnr5ucdf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645236064,1645236100,0,'csrf|a:2:{s:9:\"timestamp\";i:1645236100;s:5:\"token\";s:32:\"4f0ddb2e860d0379070617ded8270b66\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('proamthh34m310k7mfejn9qti3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235956,1645235991,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235992;s:5:\"token\";s:32:\"703900677da9009e26e0e8828d199eb7\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('q6849dkl1u0fr1r46i9hh9pt7j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235484,1645235525,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235525;s:5:\"token\";s:32:\"54ffe033544b01aad97e12a6fa056e07\";}username|s:8:\"ckwantes\";','localhost'),('qqkop0vlpvfgqf8tkm3mlld88f',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645236102,1645236136,0,'csrf|a:2:{s:9:\"timestamp\";i:1645236136;s:5:\"token\";s:32:\"e4a0f6a494b1fc245ab1512ea4a8020b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('sri6apu0r67uakrdqq7pq17kbk',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235320,1645235337,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645235337;s:5:\"token\";s:32:\"e08cd55c49f8a4ff69ba83a36f1bab75\";}','localhost'),('t20pp6iv9nh6v1o8q9iq0h4q3i',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645235532,1645235592,0,'csrf|a:2:{s:9:\"timestamp\";i:1645235592;s:5:\"token\";s:32:\"1cafc537104799da68831beb932919aa\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','pkpadmin@mailinator.com'),('contactName','en_US','Open Preprint Systems'),('contactName','fr_CA','Open Preprint Systems'),('themePluginPath','','default');
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
  `recommend_only` smallint(6) NOT NULL DEFAULT '0',
  `can_change_metadata` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2022-02-19 01:51:04',0,1),(2,1,3,4,'2022-02-19 01:51:21',0,1),(3,1,3,5,'2022-02-19 01:51:21',0,1),(4,2,4,8,'2022-02-19 01:51:30',0,1),(5,2,3,4,'2022-02-19 01:51:47',0,1),(6,2,3,5,'2022-02-19 01:51:47',0,1),(7,3,4,9,'2022-02-19 01:52:19',0,1),(8,3,3,4,'2022-02-19 01:52:41',0,1),(9,3,3,5,'2022-02-19 01:52:41',0,1),(10,4,4,10,'2022-02-19 01:53:21',0,1),(11,4,3,4,'2022-02-19 01:53:38',0,1),(12,4,3,5,'2022-02-19 01:53:38',0,1),(13,5,4,11,'2022-02-19 01:53:54',0,1),(14,5,3,4,'2022-02-19 01:54:14',0,1),(15,5,3,5,'2022-02-19 01:54:14',0,1),(16,6,4,12,'2022-02-19 01:54:31',0,1),(17,6,3,4,'2022-02-19 01:54:47',0,1),(18,6,3,5,'2022-02-19 01:54:47',0,1),(19,7,4,13,'2022-02-19 01:55:04',0,1),(20,7,3,4,'2022-02-19 01:55:26',0,1),(21,7,3,5,'2022-02-19 01:55:26',0,1),(22,8,4,14,'2022-02-19 01:55:44',0,1),(23,8,3,4,'2022-02-19 01:56:00',0,1),(24,8,3,5,'2022-02-19 01:56:00',0,1),(25,9,4,15,'2022-02-19 01:56:19',0,1),(26,9,3,4,'2022-02-19 01:56:36',0,1),(27,9,3,5,'2022-02-19 01:56:36',0,1),(28,10,4,16,'2022-02-19 01:56:53',0,1),(29,10,3,4,'2022-02-19 01:57:11',0,1),(30,10,3,5,'2022-02-19 01:57:11',0,1),(31,11,4,17,'2022-02-19 01:57:29',0,1),(32,11,3,4,'2022-02-19 01:57:49',0,1),(33,11,3,5,'2022-02-19 01:57:49',0,1),(34,12,4,18,'2022-02-19 01:58:08',0,1),(35,12,3,4,'2022-02-19 01:58:27',0,1),(36,12,3,5,'2022-02-19 01:58:27',0,1),(37,13,4,19,'2022-02-19 01:58:47',0,1),(38,13,3,4,'2022-02-19 01:59:05',0,1),(39,13,3,5,'2022-02-19 01:59:05',0,1),(40,14,4,20,'2022-02-19 01:59:25',0,1),(41,14,3,4,'2022-02-19 01:59:43',0,1),(42,14,3,5,'2022-02-19 01:59:43',0,1),(43,15,4,21,'2022-02-19 02:00:01',0,1),(44,15,3,4,'2022-02-19 02:00:18',0,1),(45,15,3,5,'2022-02-19 02:00:18',0,1),(46,16,4,22,'2022-02-19 02:00:36',0,1),(47,16,3,4,'2022-02-19 02:00:54',0,1),(48,16,3,5,'2022-02-19 02:00:54',0,1),(49,17,4,23,'2022-02-19 02:01:13',0,1),(50,17,3,4,'2022-02-19 02:01:32',0,1),(51,17,3,5,'2022-02-19 02:01:32',0,1),(52,18,4,24,'2022-02-19 02:01:50',0,1),(53,18,3,4,'2022-02-19 02:02:08',0,1),(54,18,3,5,'2022-02-19 02:02:08',0,1),(55,19,4,25,'2022-02-19 02:02:25',0,1),(56,19,3,4,'2022-02-19 02:02:43',0,1),(57,19,3,5,'2022-02-19 02:02:43',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
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
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,4),(1,1,530,5);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19);
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(2,'fr_CA','name','','string'),(3,'en_US','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(3,'fr_CA','name','','string'),(4,'en_US','name','Genetic transformation of forest trees.pdf','string'),(4,'fr_CA','name','','string'),(5,'en_US','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(5,'fr_CA','name','','string'),(6,'en_US','name','Developing efficacy beliefs in the classroom.pdf','string'),(6,'fr_CA','name','','string'),(7,'en_US','name','Traditions and Trends in the Study of the Commons.pdf','string'),(7,'fr_CA','name','','string'),(8,'en_US','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(8,'fr_CA','name','','string'),(9,'en_US','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(9,'fr_CA','name','','string'),(10,'en_US','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(10,'fr_CA','name','','string'),(11,'en_US','name','Learning Sustainable Design through Service.pdf','string'),(11,'fr_CA','name','','string'),(12,'en_US','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(12,'fr_CA','name','','string'),(13,'en_US','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(13,'fr_CA','name','','string'),(14,'en_US','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(14,'fr_CA','name','','string'),(15,'en_US','name','Yam diseases and its management in Nigeria.pdf','string'),(15,'fr_CA','name','','string'),(16,'en_US','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(16,'fr_CA','name','','string'),(17,'en_US','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(17,'fr_CA','name','','string'),(18,'en_US','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(18,'fr_CA','name','','string'),(19,'en_US','name','Finocchiaro: Arguments About Arguments.pdf','string'),(19,'fr_CA','name','','string');
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
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:51:14','2022-02-19 01:51:17',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:51:40','2022-02-19 01:51:42',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:52:29','2022-02-19 01:52:31',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:53:31','2022-02-19 01:53:34',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:54:05','2022-02-19 01:54:07',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:54:41','2022-02-19 01:54:43',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:55:15','2022-02-19 01:55:17',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:55:54','2022-02-19 01:55:56',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:56:29','2022-02-19 01:56:31',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:57:03','2022-02-19 01:57:06',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:57:39','2022-02-19 01:57:41',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:58:18','2022-02-19 01:58:21',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:58:57','2022-02-19 01:58:59',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2022-02-19 01:59:35','2022-02-19 01:59:37',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2022-02-19 02:00:11','2022-02-19 02:00:14',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2022-02-19 02:00:46','2022-02-19 02:00:48',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2022-02-19 02:01:23','2022-02-19 02:01:25',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2022-02-19 02:02:00','2022-02-19 02:02:03',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2022-02-19 02:02:36','2022-02-19 02:02:38',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (529,'11-'),(670,'21st'),(354,'aalborg'),(802,'abattoir'),(841,'abnormal'),(438,'academic'),(10,'academy'),(537,'accepted'),(403,'accompanying'),(721,'achieving'),(481,'acid'),(554,'acids'),(257,'action'),(941,'actor'),(934,'actors'),(390,'added'),(435,'address'),(485,'adipose'),(136,'administered'),(366,'administration'),(756,'adopted'),(757,'advocated'),(830,'affected'),(32,'affects'),(798,'african'),(940,'agree'),(863,'aid'),(474,'aim'),(421,'al-khafaji'),(74,'alberta'),(148,'alexandria'),(659,'analyses'),(43,'analysis'),(512,'analyzed'),(510,'animals'),(734,'anthracnose'),(906,'antibiotics'),(877,'antimicrobial'),(590,'antonio'),(620,'appears'),(157,'applications'),(365,'applied'),(567,'aquifer'),(20,'archival'),(654,'areas'),(173,'argument'),(959,'arguments'),(775,'ash'),(475,'assess'),(559,'assessed'),(615,'assessments'),(666,'atlantic'),(22,'attitude'),(465,'australian'),(864,'authorities'),(417,'authority'),(357,'availability'),(490,'averaging'),(506,'backfat'),(172,'background'),(724,'baiyewu'),(789,'barcelona'),(676,'barriers'),(489,'barrows'),(571,'barton'),(418,'based'),(411,'basin'),(376,'basins'),(678,'basis'),(614,'bearings'),(801,'beef'),(106,'began'),(185,'beliefs'),(700,'belonging'),(38,'benchmark'),(52,'benefit'),(604,'blanco'),(4,'bologna'),(58,'brazil'),(416,'brazos'),(826,'breeds'),(629,'buda'),(814,'bulls'),(467,'butyrate'),(527,'c18'),(531,'c20'),(108,'called'),(795,'cameroon'),(102,'canada'),(387,'capabilities'),(317,'cape'),(828,'carcass'),(809,'carcasses'),(558,'carefully'),(1,'carlo'),(691,'carried'),(665,'case'),(914,'cases'),(832,'category'),(5,'catherine'),(793,'cattle'),(797,'central'),(671,'century'),(618,'cfs'),(460,'challenges'),(640,'change'),(447,'chapter'),(808,'characteristics'),(219,'children'),(57,'china'),(781,'chips'),(464,'christopher'),(528,'cis'),(224,'citizens'),(260,'citizenship'),(192,'claim'),(181,'claims'),(88,'classroom'),(913,'clinical'),(708,'close'),(514,'close-'),(667,'coast'),(897,'coli'),(881,'coliforms'),(295,'colleagues'),(508,'collected'),(593,'collection'),(943,'collective'),(939,'collectively'),(63,'collectivistic'),(214,'college'),(206,'com-mitments'),(730,'combating'),(186,'commitments'),(196,'common'),(269,'commons'),(47,'communication'),(702,'communities'),(685,'community'),(16,'comparative'),(933,'compare'),(41,'compared'),(53,'comparisons'),(200,'competencies'),(36,'compiled'),(406,'complete'),(859,'completely'),(384,'complex'),(513,'composition'),(78,'computer'),(910,'concentration'),(588,'concept'),(332,'conclusive'),(856,'condemned'),(398,'condensed'),(355,'condensing'),(573,'conditions'),(234,'conducted'),(222,'confident'),(333,'conflicting'),(922,'conjugative'),(649,'connection'),(565,'connectivity'),(948,'consensus'),(740,'considered'),(59,'consistent'),(195,'consists'),(539,'consortium'),(18,'construct'),(412,'contained'),(294,'contemporary'),(519,'content'),(69,'context'),(656,'continual'),(225,'continue'),(348,'continuous'),(687,'contributing'),(952,'contributors'),(869,'control'),(457,'coordinated'),(111,'core'),(2,'corino'),(215,'cork'),(343,'corporate'),(698,'council'),(35,'countries'),(714,'country'),(112,'courses'),(287,'coward'),(839,'cows'),(246,'cps'),(72,'craig'),(37,'create'),(243,'creative'),(603,'creek'),(174,'critique'),(759,'crop'),(782,'cubes'),(767,'cultivars'),(68,'cultural'),(31,'culture'),(703,'cultures'),(957,'cuny'),(105,'curriculum'),(167,'dana'),(661,'daniel'),(21,'data'),(399,'dataset'),(381,'datasets'),(275,'decades1'),(935,'decide'),(949,'decision'),(255,'decision-making'),(386,'decision-support'),(347,'decisions'),(177,'deep'),(694,'defining'),(29,'degree'),(695,'delivering'),(653,'demands'),(97,'demonstrate'),(689,'describes'),(426,'design'),(663,'designing'),(765,'destruction'),(746,'devastating'),(415,'develop'),(388,'developed'),(216,'developing'),(124,'development'),(307,'developments'),(146,'diaga'),(550,'dietary'),(495,'diets'),(546,'differed'),(907,'difference'),(207,'difficult'),(946,'difficulty'),(147,'diouf'),(462,'directions'),(178,'disagreement'),(278,'disciplines'),(639,'discontinuity'),(156,'discussed'),(696,'discussions'),(739,'disease'),(727,'diseases'),(607,'dissipated'),(276,'distinguished'),(853,'distress'),(346,'distribution'),(210,'diverge'),(674,'diversity'),(589,'divide'),(337,'dividend'),(321,'dividends'),(212,'domatilia'),(584,'downstream'),(601,'drainage'),(638,'dramatic'),(865,'draw'),(572,'drought'),(613,'droughts'),(744,'dry'),(540,'dry-cured'),(860,'due'),(642,'dynamic'),(335,'economists'),(530,'ecosenoic'),(843,'ectoparasites'),(751,'edible'),(91,'education'),(566,'edwards'),(71,'effect'),(49,'effectiveness'),(252,'effects'),(217,'efficacy'),(48,'efficiency'),(716,'egalitarianism'),(261,'elinor'),(673,'embracing'),(440,'emerging'),(699,'emphasises'),(323,'empirical'),(144,'employed'),(24,'employees'),(923,'encoding'),(842,'encountered'),(581,'endangered'),(374,'endeavors'),(158,'engineering'),(444,'engineers'),(241,'enhance'),(393,'enhanced'),(258,'enhancing'),(849,'enlarged'),(890,'enterobacteriacea'),(428,'environmental'),(932,'environments'),(218,'equip'),(19,'equivalence'),(896,'escherichia'),(587,'established'),(710,'ethnic'),(711,'ethno-linguistic'),(352,'evaluation'),(324,'evidence'),(28,'examine'),(140,'examined'),(684,'examines'),(70,'exerts'),(55,'exhibited'),(461,'exist'),(81,'existing'),(598,'exists'),(372,'expanding'),(270,'expe-'),(446,'experiences'),(164,'expression'),(624,'extended'),(626,'extensive'),(308,'fabio'),(12,'facets'),(42,'factor'),(45,'factors'),(892,'faeces'),(434,'failed'),(761,'fallowing'),(478,'fat'),(844,'fatigue'),(501,'fats'),(480,'fatty'),(389,'features'),(503,'fed'),(732,'field'),(893,'fifteen'),(487,'fifty-four'),(779,'finally'),(334,'financial'),(345,'financing'),(194,'find'),(61,'findings'),(11,'finland'),(958,'finocchiaro'),(330,'firm'),(612,'flow'),(619,'flowing'),(410,'flows'),(858,'flukes'),(359,'focus'),(180,'fogelin'),(175,'fogelins'),(191,'fogelin’s'),(560,'food'),(151,'forest'),(776,'found'),(184,'framework'),(264,'frank'),(188,'fruitfully'),(823,'fulani'),(349,'function'),(777,'fungal'),(846,'fungal-like'),(328,'future'),(680,'gender'),(791,'general'),(163,'genes'),(149,'genetic'),(672,'genuinely'),(773,'gins'),(131,'goal'),(954,'goverance'),(162,'governing'),(100,'government'),(98,'grade'),(632,'gradient'),(641,'gradients'),(227,'graduation'),(597,'groundwater'),(596,'groundwater-level'),(920,'group'),(392,'growing'),(273,'growth'),(822,'gudali'),(338,'guidance'),(817,'guinea'),(541,'ham'),(198,'hand'),(311,'hansen'),(763,'healthy'),(483,'heavy'),(818,'high'),(65,'higher'),(517,'highest'),(717,'highlights'),(143,'hired'),(126,'hiring'),(885,'hospital'),(891,'human'),(646,'hydraulic'),(595,'hydrogeologic'),(564,'hydrologic'),(609,'hydrologically'),(449,'identification'),(895,'identified'),(583,'immediately'),(402,'impacts'),(119,'implement'),(104,'implementation'),(938,'implemented'),(83,'implications'),(718,'importance'),(868,'improve'),(468,'improves'),(159,'improving'),(706,'include'),(414,'included'),(758,'includes'),(652,'increased'),(551,'increases'),(543,'index'),(263,'indiana'),(701,'individual'),(40,'individually'),(62,'individuals'),(766,'infected'),(778,'infection'),(884,'infections'),(476,'influence'),(621,'influenced'),(645,'influences'),(109,'information'),(223,'informed'),(110,'infused'),(536,'ing'),(648,'inherent'),(909,'inhibitory'),(94,'initiatives'),(396,'input'),(930,'institutions'),(240,'instruction'),(437,'integrates'),(145,'integrating'),(86,'integration'),(306,'intellectual'),(693,'intention'),(664,'intercultural'),(688,'interculturality'),(300,'interest'),(182,'interlocutors'),(456,'internships'),(351,'intuitive'),(170,'investigating'),(344,'investment'),(341,'investors'),(254,'involve'),(709,'involvement'),(448,'involves'),(534,'iodine'),(887,'iran'),(76,'irvine'),(886,'isfahan'),(494,'isoenergetic'),(882,'isolated'),(894,'isolates'),(90,'issue'),(805,'january'),(13,'job'),(315,'john'),(121,'jurisdictions'),(875,'karbasizaed'),(420,'karim'),(9,'kekkonen'),(899,'kelebsiella'),(228,'key'),(220,'knowledge'),(563,'kumiega'),(6,'kwantes'),(628,'kyle'),(266,'laerhoven'),(845,'lameness'),(679,'language'),(383,'large'),(433,'largely'),(804,'largest'),(722,'lasting'),(544,'layers'),(256,'leads'),(231,'learn'),(226,'learners'),(117,'learning'),(454,'led'),(463,'leo'),(848,'lesions'),(99,'level'),(533,'levels'),(442,'leveraged'),(459,'limitations'),(532,'linoleic'),(526,'linolenic'),(562,'lise'),(322,'literature'),(784,'live'),(857,'liver'),(771,'locally'),(279,'long'),(477,'long-term'),(608,'longer'),(811,'longissimus'),(288,'los'),(742,'losses'),(631,'low'),(523,'lowest'),(862,'lungs'),(850,'lymph'),(290,'mackenzie'),(772,'made'),(498,'maize'),(89,'major'),(283,'managed'),(339,'management'),(103,'mandated'),(806,'march'),(569,'marcos'),(423,'margaret'),(75,'mark'),(747,'marked'),(833,'markedly'),(750,'marketable'),(492,'matched'),(764,'material'),(825,'mbororo'),(248,'means'),(835,'meat'),(161,'mechanisms'),(130,'meet'),(731,'menace'),(669,'met'),(878,'metal'),(915,'metals'),(397,'methodology'),(911,'mic'),(293,'mid-1980s'),(715,'militate'),(908,'minimal'),(284,'mismanaged'),(202,'mistakenly'),(413,'model'),(362,'modeling'),(358,'models'),(419,'modifying'),(657,'monitoring'),(524,'monounsaturated'),(73,'montgomerie'),(785,'months'),(424,'morse'),(737,'mosaic'),(249,'motivate'),(259,'motivation'),(525,'mufa'),(929,'multi-level'),(925,'multidrug-resistance'),(683,'multiethnic'),(682,'multilingual'),(26,'multinational'),(905,'multiple'),(316,'mwandenga'),(725,'nairobi'),(30,'national'),(39,'nations'),(33,'nature'),(382,'necessarily'),(655,'necessitates'),(931,'networked'),(142,'newly'),(668,'nicaragua'),(728,'nigeria'),(15,'nine-nation'),(851,'nodes'),(854,'nodular'),(635,'non-drought'),(606,'normal'),(637,'north'),(883,'nosocomial'),(353,'novak'),(617,'numerical'),(230,'nurturing'),(790,'nutrition'),(555,'nutritional'),(871,'observed'),(331,'offer'),(499,'oil'),(602,'onion'),(187,'order'),(27,'organization'),(46,'organizational'),(452,'organizations'),(855,'organs'),(816,'origin'),(405,'original'),(262,'ostrom'),(675,'overcome'),(309,'paglieri'),(132,'paper'),(815,'parameters'),(538,'parma'),(204,'part'),(232,'participate'),(690,'participatory'),(451,'partner'),(274,'past'),(660,'patricia'),(921,'pattern'),(888,'patterns'),(719,'pedagogy'),(677,'people'),(209,'people’s'),(902,'percent'),(469,'performance'),(472,'period'),(625,'periods'),(368,'permit'),(379,'permits'),(51,'personal'),(918,'persons'),(950,'perverse'),(168,'phillips'),(484,'pig'),(471,'piglets'),(516,'pigs'),(312,'pinto'),(286,'places'),(579,'plan'),(371,'planning'),(762,'planting'),(166,'plants'),(880,'plasmid'),(900,'pneumoniae'),(84,'policy'),(521,'polyunsaturated'),(303,'pool'),(651,'population'),(752,'portions'),(251,'positive'),(904,'possess'),(340,'potential'),(633,'potentiometric'),(712,'power'),(336,'practical'),(85,'practice'),(807,'pre-slaughter'),(827,'predominant'),(840,'pregnant'),(445,'present'),(237,'presented'),(729,'presents'),(870,'prevent'),(60,'previous'),(575,'primary'),(430,'principles'),(199,'pro-cedural'),(244,'problem'),(945,'problematic'),(205,'procedural'),(780,'processing'),(821,'production'),(193,'productive'),(123,'professional'),(482,'profile'),(889,'profiles'),(594,'program'),(866,'programmes'),(155,'progress'),(455,'project-based'),(450,'projects'),(872,'promote'),(720,'promoting'),(647,'properties'),(305,'property'),(552,'proportion'),(329,'prospects'),(580,'protect'),(385,'provide'),(101,'province'),(93,'provincial'),(137,'public'),(522,'pufa'),(627,'pumping'),(951,'punishing'),(189,'pursue'),(556,'quality'),(749,'quantity'),(585,'questions'),(586,'raised'),(723,'rana'),(491,'randomized'),(500,'rapeseed'),(650,'rapid'),(139,'rate'),(947,'reaching'),(831,'rearing'),(313,'reason'),(154,'recent'),(622,'recharge'),(314,'reclaimed'),(810,'recorded'),(924,'recovered'),(824,'red'),(748,'reduction'),(754,'reductions'),(515,'reflected'),(378,'reflects'),(190,'refute'),(735,'regarded'),(299,'region'),(369,'regional'),(301,'regions'),(713,'relations'),(919,'relationship'),(350,'rely'),(898,'remaining'),(404,'removed'),(64,'report'),(813,'represent'),(796,'representative'),(409,'represents'),(141,'require'),(118,'required'),(80,'requirements'),(66,'research'),(292,'researchers'),(401,'reservoir'),(380,'reservoirs'),(879,'resistance'),(768,'resistant'),(304,'resource'),(282,'resources'),(115,'respect'),(852,'respiratory'),(138,'response'),(34,'responses'),(611,'result'),(535,'result-'),(134,'results'),(44,'revealed'),(153,'review'),(289,'reyes'),(271,'rienced'),(367,'rights'),(375,'river'),(179,'robert'),(229,'role'),(310,'rome'),(787,'rosanna'),(788,'rossi'),(745,'rot'),(760,'rotation'),(364,'routinely'),(953,'ruled'),(800,'safety'),(507,'samples'),(568,'san'),(936,'sanction'),(942,'sanctioned'),(944,'sanctioning'),(937,'sanctions'),(14,'satisfaction'),(56,'satisfied'),(518,'saturated'),(819,'savannah'),(277,'scholars'),(120,'school'),(297,'sec-'),(561,'security'),(591,'segments'),(400,'selected'),(221,'self-belief'),(242,'self-efficacy'),(928,'self-organization'),(610,'separated'),(107,'september'),(574,'serves'),(427,'service'),(436,'service-learning'),(407,'set'),(439,'setting'),(901,'seventy'),(741,'severe'),(520,'sfa'),(183,'share'),(171,'shared'),(342,'shareholding'),(783,'shelf'),(549,'show'),(837,'showed'),(238,'showing'),(250,'shown'),(630,'shows'),(327,'signal'),(325,'signaling'),(319,'signalling'),(916,'significant'),(547,'significantly'),(836,'similar'),(394,'simplifying'),(395,'simulation'),(616,'simulations'),(25,'single'),(792,'situation'),(79,'skill'),(95,'skills'),(847,'skin'),(505,'slaughter'),(794,'slaughtered'),(504,'slaughtering'),(636,'slopes'),(235,'social'),(233,'society'),(466,'sodium'),(213,'sokoloff'),(245,'solving'),(578,'source'),(577,'south-central'),(582,'species'),(281,'specific'),(113,'specifies'),(736,'spread'),(570,'springs'),(692,'staff'),(127,'standards'),(422,'stanford'),(377,'state'),(370,'statewide'),(733,'storage'),(755,'stored'),(903,'strains'),(125,'strategies'),(239,'strategy'),(408,'streamflows'),(867,'strengthen'),(644,'structural'),(54,'structures'),(453,'student'),(96,'students'),(280,'studied'),(236,'studies'),(17,'study'),(799,'sub-region'),(545,'subcutaneous'),(272,'substantial'),(458,'successful'),(67,'suggest'),(326,'suggests'),(133,'summarizes'),(502,'supplement-'),(479,'supplementation'),(496,'supplemented'),(576,'supply'),(50,'support'),(201,'supporters'),(705,'supporting'),(600,'surface'),(23,'survey'),(429,'sustainability'),(425,'sustainable'),(363,'system'),(360,'systems'),(681,'takes'),(497,'tallow'),(247,'taught'),(443,'teach'),(82,'teachers'),(129,'teachers’'),(557,'technological'),(87,'technology'),(116,'technology”'),(769,'tecto'),(876,'tehran'),(135,'telephone'),(509,'ten'),(361,'texas'),(320,'theory'),(176,'thesis'),(770,'thiabendazole'),(812,'thoracis'),(704,'time'),(285,'times'),(486,'tissue'),(92,'today'),(917,'tolerant'),(441,'tool'),(197,'topic'),(432,'topics'),(169,'toronto'),(298,'tors'),(838,'toughest'),(318,'town'),(873,'trade'),(267,'traditions'),(150,'transformation'),(820,'transhumance'),(511,'treatment'),(548,'treatments'),(152,'trees'),(658,'trend'),(268,'trends'),(861,'tuberculosis'),(753,'tubers'),(122,'turning'),(391,'types'),(160,'understanding'),(3,'university'),(707,'university’s'),(643,'unknown'),(542,'unsaturation'),(128,'upgrade'),(208,'uphold'),(686,'uraccan'),(8,'urho'),(874,'vajiheh'),(926,'valerie'),(253,'valuable'),(912,'values'),(265,'van'),(634,'variation'),(834,'varied'),(373,'variety'),(599,'vicinity'),(77,'victoria'),(203,'view'),(738,'virus'),(431,'vital'),(623,'vulnerable'),(697,'wales'),(356,'water'),(592,'water-level'),(470,'weaned'),(473,'weaning'),(829,'weight'),(493,'weights'),(605,'wet'),(488,'white'),(211,'widely'),(927,'williamson'),(7,'windsor'),(291,'wittfogel'),(662,'wolverhampton'),(774,'wood'),(956,'woods'),(165,'woody'),(296,'work'),(302,'world'),(726,'yam'),(743,'yams'),(803,'yaoundé'),(786,'year'),(955,'zita'),(114,'“expected'),(553,'“healthy”');
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(9,3,2),(25,3,2),(25,3,6),(33,3,3),(41,3,2),(49,3,2),(57,3,3),(57,3,8),(65,3,2),(73,3,2),(81,3,3),(89,3,3),(89,3,7),(97,3,4),(105,3,2),(113,3,2),(115,3,28),(115,3,37),(115,3,80),(121,3,2),(129,3,3),(137,3,2),(145,3,2),(1,4,3),(9,5,0),(9,6,1),(9,7,3),(145,7,3),(9,8,4),(9,9,5),(9,10,6),(9,11,7),(10,12,0),(10,13,1),(11,13,14),(11,13,70),(10,14,2),(11,14,15),(11,14,60),(11,14,71),(10,15,3),(10,16,4),(10,17,5),(58,17,2),(59,17,0),(99,17,1),(107,17,43),(114,17,4),(115,17,18),(10,18,6),(11,18,43),(10,19,7),(11,19,44),(11,20,0),(11,21,1),(107,21,39),(107,21,47),(107,21,64),(107,21,127),(107,21,203),(131,21,110),(11,22,2),(11,23,3),(13,23,1),(27,23,62),(29,23,4),(11,24,4),(11,24,48),(13,24,0),(29,24,10),(11,25,5),(11,26,6),(13,26,2),(11,27,7),(11,28,8),(11,29,9),(107,29,176),(11,30,10),(11,30,64),(27,30,7),(29,30,6),(97,30,3),(11,31,11),(115,31,15),(117,31,8),(11,32,12),(11,33,13),(11,33,69),(107,33,157),(11,34,16),(11,35,17),(11,36,18),(11,37,19),(11,38,20),(11,39,21),(11,39,57),(11,40,22),(147,40,3),(11,41,23),(139,41,15),(139,41,36),(11,42,24),(11,42,38),(11,43,25),(107,43,45),(107,43,63),(11,44,26),(11,45,27),(115,45,61),(11,46,28),(11,46,30),(11,46,33),(11,46,40),(11,47,29),(11,47,41),(27,47,27),(11,48,31),(11,49,32),(11,50,34),(27,50,80),(51,50,49),(11,51,35),(11,51,45),(11,52,36),(11,52,46),(11,53,37),(11,54,39),(11,55,42),(11,56,47),(11,56,50),(11,57,49),(11,58,51),(11,59,52),(139,59,62),(11,60,53),(11,61,54),(11,61,62),(51,61,27),(11,62,55),(11,63,56),(11,64,58),(11,65,59),(99,65,96),(11,66,61),(51,66,26),(51,66,40),(115,66,35),(115,66,81),(131,66,1),(11,67,63),(43,67,33),(107,67,98),(11,68,65),(11,69,66),(51,69,31),(11,70,67),(11,71,68),(99,71,87),(25,72,0),(25,73,1),(25,74,3),(27,74,18),(27,74,38),(27,74,68),(29,74,5),(25,75,4),(25,76,5),(25,77,7),(26,78,0),(27,78,54),(27,78,72),(29,78,2),(26,79,1),(26,80,2),(26,81,3),(75,81,25),(26,82,4),(27,82,40),(27,82,79),(27,82,84),(26,83,5),(51,83,65),(75,83,17),(107,83,87),(26,84,6),(75,84,16),(75,84,22),(26,85,7),(27,86,0),(27,87,1),(27,87,10),(27,87,28),(29,87,1),(27,88,2),(50,88,3),(51,88,70),(27,89,3),(51,89,0),(107,89,9),(107,89,85),(27,90,4),(75,90,14),(27,91,5),(51,91,2),(53,91,0),(91,91,8),(93,91,2),(115,91,7),(27,92,6),(27,93,8),(29,93,7),(27,94,9),(27,95,11),(27,95,55),(27,95,73),(29,95,3),(51,95,6),(27,96,12),(27,96,34),(115,96,39),(27,97,13),(27,98,14),(27,99,15),(107,99,164),(107,99,195),(27,100,16),(27,101,17),(27,101,67),(27,102,19),(27,103,20),(27,104,21),(27,105,22),(27,105,29),(27,105,43),(114,105,2),(115,105,43),(115,105,53),(115,105,65),(27,106,23),(27,107,24),(27,108,25),(27,109,26),(27,110,30),(27,111,31),(27,112,32),(27,113,33),(27,114,35),(27,115,36),(27,116,37),(27,117,39),(51,117,38),(51,117,50),(51,117,56),(90,117,0),(93,117,4),(27,118,41),(42,118,3),(43,118,19),(43,118,41),(27,119,42),(27,120,44),(27,120,65),(27,120,74),(51,120,24),(27,121,45),(27,121,66),(27,121,75),(27,122,46),(27,123,47),(29,123,8),(27,124,48),(29,124,9),(59,124,6),(91,124,3),(93,124,0),(115,124,31),(115,124,63),(27,125,49),(27,125,81),(115,125,44),(123,125,5),(123,125,50),(27,126,50),(27,127,51),(27,128,52),(27,129,53),(27,130,56),(27,131,57),(51,131,1),(27,132,58),(51,132,15),(27,133,59),(27,134,60),(99,134,112),(139,134,82),(27,135,61),(27,136,63),(27,137,64),(27,138,69),(107,138,165),(27,139,70),(27,140,71),(27,141,76),(27,142,77),(27,143,78),(27,144,82),(27,144,83),(123,144,6),(29,145,0),(33,146,0),(33,147,1),(33,148,2),(34,149,0),(35,149,3),(35,149,9),(34,150,1),(35,150,4),(115,150,92),(117,150,12),(34,151,2),(35,151,5),(35,151,12),(34,152,3),(35,152,6),(35,152,13),(35,153,0),(74,153,3),(123,153,0),(35,154,1),(75,154,8),(35,155,2),(35,156,7),(51,156,71),(91,156,58),(35,157,8),(83,157,42),(83,157,44),(35,158,10),(91,158,7),(93,158,1),(35,159,11),(99,159,135),(35,160,14),(115,160,51),(35,161,15),(35,162,16),(35,163,17),(35,164,18),(35,165,19),(35,166,20),(41,167,0),(41,168,1),(41,169,3),(42,170,0),(43,170,16),(42,171,1),(43,171,17),(43,171,29),(43,171,38),(42,172,2),(43,172,6),(43,172,18),(43,172,23),(43,172,42),(42,173,4),(43,173,12),(43,173,21),(43,173,44),(42,174,5),(42,175,6),(42,176,7),(42,177,8),(42,178,9),(43,179,0),(43,180,1),(43,180,34),(43,181,2),(43,182,3),(43,183,4),(43,184,5),(51,184,58),(43,185,7),(43,185,26),(43,185,39),(43,185,50),(50,185,2),(51,185,20),(43,186,8),(43,186,31),(43,187,9),(51,187,21),(43,188,10),(43,189,11),(43,190,13),(43,191,14),(43,192,15),(43,193,20),(43,193,43),(43,194,22),(43,195,24),(43,196,25),(61,196,0),(61,196,3),(131,196,48),(131,196,82),(43,197,27),(43,197,53),(43,198,28),(43,198,54),(43,199,30),(43,200,32),(43,201,35),(43,202,36),(43,203,37),(43,204,40),(51,204,39),(43,205,45),(43,206,46),(43,207,47),(43,208,48),(43,209,49),(43,210,51),(43,211,52),(123,211,16),(49,212,0),(49,213,1),(49,214,3),(49,215,4),(50,216,0),(83,216,56),(107,216,11),(50,217,1),(51,217,19),(51,218,3),(51,219,4),(51,219,46),(51,219,60),(51,220,5),(51,221,7),(51,222,8),(51,223,9),(59,223,32),(51,224,10),(51,224,11),(51,225,12),(115,225,10),(51,226,13),(51,227,14),(51,228,16),(51,229,17),(51,230,18),(51,231,22),(51,231,69),(51,232,23),(51,233,25),(51,234,28),(107,234,44),(51,235,29),(51,235,63),(91,235,14),(115,235,91),(117,235,11),(51,236,30),(51,237,32),(83,237,55),(123,237,13),(51,238,33),(51,239,34),(51,240,35),(51,241,36),(51,242,37),(51,242,55),(51,242,67),(51,243,41),(51,244,42),(51,245,43),(51,246,44),(51,246,52),(51,247,45),(51,248,47),(51,249,48),(51,250,51),(51,251,53),(51,252,54),(83,252,79),(99,252,138),(51,253,57),(51,254,59),(51,255,61),(51,256,62),(51,257,64),(51,258,66),(51,259,68),(53,260,1),(57,261,0),(57,262,1),(57,263,2),(57,263,7),(57,264,4),(57,265,5),(57,266,6),(58,267,0),(58,268,1),(58,269,3),(59,269,1),(59,269,28),(59,270,2),(59,271,3),(59,272,4),(59,273,5),(98,273,3),(107,273,185),(59,274,7),(107,274,79),(107,274,101),(59,275,8),(59,276,9),(59,277,10),(59,277,34),(59,278,11),(59,278,35),(59,279,12),(59,280,13),(59,280,26),(59,281,14),(59,281,27),(82,281,5),(59,282,15),(59,283,16),(59,284,17),(59,285,18),(59,286,19),(59,287,20),(59,288,21),(59,289,22),(59,290,23),(59,291,24),(59,292,25),(59,293,29),(59,294,30),(59,295,31),(59,296,33),(59,297,36),(59,298,37),(59,299,38),(115,299,25),(115,299,76),(139,299,88),(59,300,39),(147,300,36),(59,301,40),(59,302,41),(91,302,38),(61,303,1),(61,304,2),(61,305,4),(61,306,5),(61,307,6),(65,308,0),(65,309,1),(65,310,3),(66,311,0),(66,312,1),(66,313,2),(66,314,3),(73,315,0),(81,315,0),(73,316,1),(73,317,3),(105,317,3),(73,318,4),(105,318,4),(74,319,0),(74,320,1),(75,320,1),(74,321,2),(75,321,3),(74,322,4),(74,323,5),(75,323,9),(74,324,6),(75,324,10),(75,324,13),(75,325,0),(75,326,2),(107,326,67),(75,327,4),(75,328,5),(91,328,24),(91,328,59),(107,328,204),(75,329,6),(75,330,7),(75,331,11),(75,332,12),(75,333,15),(75,334,18),(75,335,19),(75,336,20),(75,337,21),(75,337,37),(75,338,23),(75,339,24),(75,339,36),(82,339,7),(83,339,20),(83,339,52),(107,339,89),(122,339,2),(123,339,4),(123,339,49),(75,340,26),(107,340,76),(139,340,85),(75,341,27),(75,342,28),(75,343,29),(75,344,30),(75,345,31),(75,346,32),(75,347,33),(75,347,38),(147,347,16),(147,347,35),(75,348,34),(75,349,35),(75,350,39),(75,351,40),(75,352,41),(81,353,1),(81,354,2),(82,355,0),(82,356,1),(82,356,6),(83,356,1),(83,356,8),(83,356,19),(83,356,25),(83,356,51),(83,356,64),(83,356,80),(83,356,106),(85,356,0),(107,356,4),(107,356,163),(107,356,187),(109,356,0),(82,357,2),(83,357,2),(83,357,107),(107,357,90),(82,358,3),(82,359,4),(83,359,50),(82,360,8),(83,360,53),(83,361,0),(83,361,105),(107,361,7),(83,362,3),(83,362,18),(83,362,35),(83,362,38),(83,362,108),(83,363,4),(83,363,11),(83,363,36),(83,363,61),(83,363,78),(83,363,102),(83,363,109),(131,363,50),(131,363,62),(83,364,5),(83,365,6),(83,365,94),(83,366,7),(83,367,9),(83,367,65),(83,367,81),(83,368,10),(83,369,12),(131,369,127),(83,370,13),(83,371,14),(83,372,15),(91,372,61),(83,373,16),(83,374,17),(83,375,21),(83,375,82),(83,375,99),(83,375,112),(107,375,58),(107,375,116),(83,376,22),(83,377,23),(83,378,24),(83,378,62),(83,379,26),(83,380,27),(83,380,67),(83,381,28),(83,381,49),(83,382,29),(83,383,30),(99,383,15),(83,384,31),(83,385,32),(107,385,202),(131,385,2),(83,386,33),(83,387,34),(83,388,37),(83,388,74),(83,389,39),(83,390,40),(83,391,41),(83,392,43),(83,393,45),(83,394,46),(83,395,47),(83,396,48),(83,396,88),(83,397,54),(83,397,93),(83,398,57),(83,398,91),(83,398,96),(83,399,58),(83,399,71),(83,399,89),(83,399,92),(83,399,110),(83,400,59),(83,400,77),(131,400,32),(83,401,60),(83,401,101),(83,402,63),(83,403,66),(83,404,68),(83,405,69),(83,405,85),(83,406,70),(83,406,86),(83,407,72),(107,407,128),(83,408,73),(83,409,75),(83,410,76),(83,411,83),(83,411,113),(83,412,84),(83,413,87),(83,413,97),(91,413,27),(91,413,39),(91,413,53),(91,413,62),(107,413,97),(115,413,46),(115,413,49),(83,414,90),(83,415,95),(83,416,98),(83,416,111),(83,417,100),(83,418,103),(91,418,32),(83,419,104),(89,420,0),(89,421,1),(89,422,2),(89,422,6),(91,422,34),(89,423,4),(89,424,5),(90,425,1),(91,425,2),(91,425,22),(91,425,30),(91,425,37),(90,426,2),(91,426,23),(91,426,31),(91,426,48),(90,427,3),(91,427,15),(93,427,3),(91,428,0),(91,429,1),(93,429,5),(91,430,4),(91,431,5),(91,432,6),(91,433,9),(91,434,10),(91,435,11),(107,435,36),(91,436,12),(91,436,28),(91,437,13),(91,438,16),(91,439,17),(147,439,1),(147,439,6),(91,440,18),(91,441,19),(91,442,20),(91,443,21),(91,443,29),(91,444,25),(91,444,36),(91,445,26),(91,446,33),(91,447,35),(91,448,40),(91,449,41),(91,450,42),(91,451,43),(91,451,51),(91,452,44),(91,452,52),(91,453,45),(91,454,46),(91,455,47),(91,456,49),(91,457,50),(91,458,54),(91,459,55),(91,460,56),(115,460,0),(91,461,57),(115,461,11),(91,462,60),(97,463,0),(97,464,1),(97,465,2),(98,466,0),(98,467,1),(98,468,2),(98,469,4),(98,470,5),(98,471,6),(98,472,7),(123,472,96),(98,473,8),(99,474,0),(131,474,0),(131,474,115),(99,475,2),(99,476,3),(107,476,175),(130,476,0),(99,477,4),(99,477,114),(130,477,1),(99,478,5),(99,478,134),(99,478,141),(131,478,70),(99,479,6),(99,479,116),(99,479,125),(99,480,7),(99,480,42),(99,480,48),(99,480,58),(99,480,66),(99,480,71),(99,480,118),(99,480,131),(130,480,5),(99,481,8),(99,481,43),(99,481,49),(99,481,59),(99,481,67),(99,481,72),(99,481,79),(99,481,84),(99,481,89),(99,481,119),(130,481,6),(99,482,9),(99,482,120),(138,482,5),(139,482,65),(99,483,10),(99,483,121),(130,483,8),(138,483,1),(139,483,1),(139,483,51),(139,483,58),(139,483,74),(99,484,11),(99,484,122),(99,484,133),(99,485,12),(99,485,123),(99,486,13),(99,486,108),(99,486,124),(99,487,14),(99,488,16),(131,488,52),(99,489,17),(99,490,18),(99,491,19),(99,492,20),(99,493,21),(99,494,22),(99,495,23),(99,496,24),(99,496,51),(99,497,25),(99,498,26),(99,499,27),(99,499,29),(99,499,127),(99,500,28),(99,500,126),(99,501,30),(99,501,52),(99,501,117),(130,501,4),(99,502,31),(99,503,32),(99,503,55),(99,503,62),(99,503,75),(99,504,33),(99,505,34),(131,505,30),(99,506,35),(99,506,45),(99,506,53),(99,506,92),(99,506,107),(130,506,10),(99,507,36),(99,508,37),(107,508,65),(99,509,38),(99,510,39),(99,511,40),(99,511,86),(99,512,41),(99,513,44),(99,513,50),(130,513,7),(131,513,38),(99,514,46),(99,515,47),(99,516,54),(101,516,0),(130,516,9),(99,517,56),(99,517,63),(99,517,76),(99,518,57),(99,519,60),(99,519,64),(99,519,74),(99,519,77),(131,519,71),(99,520,61),(99,521,65),(99,522,68),(99,523,69),(99,524,70),(99,525,73),(99,526,78),(99,527,80),(99,527,97),(99,528,81),(99,529,82),(99,530,83),(99,531,85),(99,532,88),(99,533,90),(99,533,95),(107,533,139),(107,533,152),(99,534,91),(99,535,93),(99,536,94),(99,537,98),(99,538,99),(99,539,100),(99,540,101),(99,541,102),(99,542,103),(99,543,104),(99,544,105),(99,545,106),(99,546,109),(99,547,110),(107,547,149),(99,548,111),(99,549,113),(99,550,115),(130,550,3),(99,551,128),(123,551,93),(99,552,129),(99,553,130),(99,554,132),(99,555,136),(99,556,137),(99,556,140),(131,556,12),(131,556,36),(131,556,69),(99,557,139),(99,558,142),(99,559,143),(101,560,1),(133,560,1),(101,561,2),(133,561,2),(105,562,0),(105,563,1),(106,564,0),(107,564,25),(107,564,61),(107,564,177),(106,565,1),(106,566,2),(107,566,0),(107,566,32),(107,566,92),(106,567,3),(107,567,1),(107,567,33),(107,567,93),(107,567,173),(106,568,4),(107,568,18),(107,568,27),(107,568,80),(107,568,102),(107,568,134),(107,568,179),(107,568,198),(106,569,5),(107,569,19),(107,569,81),(107,569,103),(107,569,135),(107,569,180),(107,569,199),(106,570,6),(106,570,8),(107,570,10),(107,570,20),(107,570,30),(107,570,82),(107,570,84),(107,570,105),(107,570,136),(107,570,145),(107,570,182),(107,570,200),(106,571,7),(107,571,29),(107,571,83),(107,571,104),(107,571,144),(107,571,181),(106,572,9),(107,572,34),(107,572,66),(107,572,106),(107,572,140),(107,572,153),(106,573,10),(107,573,35),(107,573,62),(107,573,107),(131,573,23),(131,573,84),(107,574,2),(115,574,72),(107,575,3),(107,576,5),(131,576,121),(107,577,6),(107,578,8),(107,578,156),(107,579,12),(107,580,13),(123,580,81),(107,581,14),(107,582,15),(107,583,16),(107,584,17),(107,585,21),(107,585,37),(107,586,22),(107,587,23),(107,588,24),(107,589,26),(107,589,49),(107,589,54),(107,589,69),(107,589,109),(107,590,28),(107,591,31),(107,591,74),(107,592,38),(107,593,40),(107,594,41),(107,594,197),(107,595,42),(107,595,205),(107,596,46),(107,597,48),(107,597,68),(107,597,77),(107,597,91),(107,597,108),(107,597,194),(107,598,50),(107,599,51),(107,599,124),(107,600,52),(107,600,133),(107,600,147),(107,601,53),(107,602,55),(107,602,113),(107,603,56),(107,603,114),(107,604,57),(107,604,115),(107,605,59),(107,606,60),(107,607,70),(107,608,71),(107,609,72),(107,610,73),(107,611,75),(107,612,78),(107,613,86),(107,614,88),(107,615,94),(107,616,95),(107,617,96),(107,618,99),(107,619,100),(107,620,110),(107,620,117),(107,621,111),(107,622,112),(107,622,121),(107,623,118),(107,624,119),(107,625,120),(107,625,142),(107,625,155),(107,626,122),(107,627,123),(107,628,125),(107,628,137),(107,628,143),(107,628,166),(107,628,189),(107,629,126),(107,629,190),(107,629,201),(107,630,129),(107,631,130),(131,631,72),(107,632,131),(107,633,132),(107,633,146),(107,633,160),(107,634,138),(107,635,141),(107,635,154),(107,636,148),(107,637,150),(107,638,151),(107,639,158),(107,639,174),(107,640,159),(107,641,161),(107,642,162),(107,643,167),(107,644,168),(107,645,169),(107,646,170),(107,647,171),(107,648,172),(107,649,178),(107,650,183),(107,651,184),(107,652,186),(107,653,188),(107,654,191),(107,655,192),(107,656,193),(107,657,196),(107,658,206),(107,659,207),(113,660,0),(113,661,1),(113,662,3),(114,663,0),(114,664,1),(115,664,42),(115,664,64),(114,665,3),(115,665,17),(114,666,5),(115,666,20),(114,667,6),(115,667,21),(114,668,7),(115,668,22),(115,669,1),(115,670,2),(117,670,0),(115,671,3),(117,671,1),(115,672,4),(115,673,5),(115,674,6),(117,674,2),(115,675,8),(115,676,9),(115,677,12),(115,678,13),(115,678,47),(115,678,86),(115,679,14),(117,679,7),(115,680,16),(117,680,9),(115,681,19),(115,682,23),(117,682,3),(115,683,24),(117,683,4),(115,684,26),(115,685,27),(115,685,50),(115,686,29),(115,687,30),(115,688,32),(115,688,88),(115,689,33),(115,690,34),(115,690,84),(117,690,5),(115,691,36),(131,691,41),(115,692,38),(115,693,40),(115,694,41),(115,695,45),(115,696,48),(115,697,52),(115,698,54),(115,699,55),(115,700,56),(115,701,57),(147,701,30),(115,702,58),(115,702,71),(115,703,59),(115,704,60),(115,705,62),(115,706,66),(115,707,67),(115,708,68),(115,709,69),(115,710,70),(115,711,73),(115,712,74),(115,713,75),(115,714,77),(115,715,78),(115,716,79),(117,716,10),(115,717,82),(115,718,83),(115,719,85),(117,719,6),(115,720,87),(115,721,89),(115,722,90),(121,723,0),(121,724,1),(121,725,3),(122,726,0),(123,726,3),(123,726,20),(123,726,34),(123,726,82),(123,726,89),(122,727,1),(123,727,2),(123,727,12),(123,727,19),(123,727,33),(123,727,55),(123,727,70),(131,727,125),(122,728,3),(123,728,9),(123,729,1),(123,730,7),(123,730,53),(123,731,8),(123,732,10),(123,732,18),(123,732,54),(123,733,11),(123,733,32),(123,733,69),(123,733,79),(123,733,86),(123,734,14),(123,735,15),(123,736,17),(123,737,21),(123,738,22),(123,739,23),(123,740,24),(123,740,30),(131,740,19),(123,741,25),(123,741,46),(123,742,26),(123,743,27),(123,743,37),(123,743,48),(123,744,28),(123,744,35),(123,744,75),(123,745,29),(123,745,36),(123,746,31),(123,747,38),(123,748,39),(123,749,40),(123,750,41),(123,751,42),(123,752,43),(123,753,44),(123,753,83),(123,753,90),(123,754,45),(123,755,47),(123,756,51),(123,757,52),(123,758,56),(123,759,57),(123,759,65),(123,760,58),(123,761,59),(123,762,60),(123,763,61),(139,763,12),(139,763,38),(139,763,60),(123,764,62),(123,765,63),(123,766,64),(123,767,66),(123,767,68),(123,768,67),(123,769,71),(123,770,72),(123,771,73),(123,772,74),(147,772,23),(123,773,76),(123,774,77),(123,775,78),(123,776,80),(123,777,84),(123,778,85),(139,778,87),(123,779,87),(123,780,88),(123,781,91),(123,782,92),(123,783,94),(123,784,95),(123,785,97),(123,786,98),(131,786,67),(129,787,0),(129,788,1),(129,789,2),(130,790,2),(131,791,3),(131,792,4),(131,793,5),(131,793,25),(131,793,43),(131,793,63),(131,793,117),(133,793,0),(131,794,6),(131,794,35),(131,794,80),(131,795,7),(131,795,18),(131,796,8),(131,797,9),(131,798,10),(131,799,11),(131,800,13),(131,801,14),(131,801,120),(131,802,15),(131,803,16),(131,804,17),(131,805,20),(131,806,21),(131,807,22),(131,808,24),(131,809,26),(131,809,31),(131,809,99),(131,810,27),(131,811,28),(131,811,39),(131,812,29),(131,812,40),(131,813,33),(131,814,34),(131,815,37),(131,816,42),(131,817,44),(131,818,45),(147,818,28),(131,819,46),(131,820,47),(131,821,49),(131,821,118),(131,822,51),(131,822,75),(131,823,53),(131,824,54),(131,825,55),(131,826,56),(131,826,74),(131,827,57),(131,828,58),(131,829,59),(131,830,60),(131,830,108),(131,831,61),(131,832,64),(131,833,65),(131,834,66),(131,835,68),(131,835,78),(131,836,73),(131,837,76),(131,838,77),(131,839,79),(131,840,81),(131,841,83),(131,842,85),(131,843,86),(131,844,87),(131,845,88),(131,846,89),(131,847,90),(131,848,91),(131,848,98),(131,849,92),(131,850,93),(131,851,94),(131,852,95),(131,853,96),(131,854,97),(131,855,100),(131,856,101),(131,856,105),(131,857,102),(131,858,103),(131,859,104),(131,860,106),(147,860,18),(131,861,107),(131,862,109),(131,863,111),(131,864,112),(131,865,113),(131,866,114),(131,867,116),(131,868,119),(131,869,122),(131,870,123),(131,871,124),(131,872,126),(131,873,128),(137,874,0),(137,875,1),(137,876,3),(138,877,0),(139,877,0),(139,877,67),(138,878,2),(139,878,2),(139,878,59),(138,879,3),(139,879,3),(139,879,34),(139,879,68),(139,879,73),(138,880,4),(139,880,5),(139,880,64),(139,880,71),(138,881,6),(139,881,7),(139,881,84),(138,882,7),(139,882,9),(139,882,29),(139,882,55),(139,882,79),(138,883,8),(139,883,10),(139,883,18),(139,883,30),(139,883,80),(139,883,86),(138,884,9),(139,884,11),(139,884,19),(139,884,31),(139,884,81),(138,885,10),(139,885,56),(138,886,11),(138,887,12),(139,888,4),(139,889,6),(139,890,8),(139,891,13),(139,891,39),(139,892,14),(139,892,40),(139,892,50),(139,893,16),(139,894,17),(139,895,20),(139,896,21),(139,897,22),(139,898,23),(139,899,24),(139,900,25),(139,901,26),(139,902,27),(139,903,28),(139,903,37),(139,903,47),(139,903,54),(139,903,78),(139,904,32),(139,905,33),(139,906,35),(139,906,76),(139,907,41),(139,908,42),(139,909,43),(139,910,44),(139,911,45),(139,912,46),(139,913,48),(139,914,49),(139,915,52),(139,915,75),(139,916,53),(139,917,57),(139,918,61),(139,919,63),(139,920,66),(147,920,37),(139,921,69),(139,922,70),(139,923,72),(139,924,77),(139,925,83),(145,926,0),(145,927,1),(146,928,0),(149,928,0),(146,929,1),(149,929,1),(146,930,2),(149,930,2),(146,931,3),(146,932,4),(147,933,0),(147,934,2),(147,934,9),(147,934,31),(147,935,4),(147,936,5),(147,937,7),(147,938,8),(147,939,10),(147,939,24),(147,940,11),(147,941,12),(147,942,13),(147,943,14),(147,943,33),(147,944,15),(147,944,26),(147,944,34),(147,945,17),(147,946,19),(147,947,20),(147,948,21),(147,949,22),(147,950,25),(147,951,27),(147,952,29),(147,953,32),(149,954,3),(153,955,0),(153,956,1),(153,957,2),(154,958,0),(154,959,1),(154,959,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,1,1,0),(2,1,2,0),(3,1,4,0),(4,1,16,0),(5,1,17,0),(6,1,8,0),(7,1,32,0),(8,1,64,0),(9,2,1,0),(10,2,2,0),(11,2,4,0),(12,2,16,0),(13,2,17,0),(14,2,8,0),(15,2,32,0),(16,2,64,0),(25,3,1,0),(26,3,2,0),(27,3,4,0),(28,3,16,0),(29,3,17,0),(30,3,8,0),(31,3,32,0),(32,3,64,0),(33,4,1,0),(34,4,2,0),(35,4,4,0),(36,4,16,0),(37,4,17,0),(38,4,8,0),(39,4,32,0),(40,4,64,0),(41,5,1,0),(42,5,2,0),(43,5,4,0),(44,5,16,0),(45,5,17,0),(46,5,8,0),(47,5,32,0),(48,5,64,0),(49,6,1,0),(50,6,2,0),(51,6,4,0),(52,6,16,0),(53,6,17,0),(54,6,8,0),(55,6,32,0),(56,6,64,0),(57,7,1,0),(58,7,2,0),(59,7,4,0),(60,7,16,0),(61,7,17,0),(62,7,8,0),(63,7,32,0),(64,7,64,0),(65,8,1,0),(66,8,2,0),(67,8,4,0),(68,8,16,0),(69,8,17,0),(70,8,8,0),(71,8,32,0),(72,8,64,0),(73,9,1,0),(74,9,2,0),(75,9,4,0),(76,9,16,0),(77,9,17,0),(78,9,8,0),(79,9,32,0),(80,9,64,0),(81,10,1,0),(82,10,2,0),(83,10,4,0),(84,10,16,0),(85,10,17,0),(86,10,8,0),(87,10,32,0),(88,10,64,0),(89,11,1,0),(90,11,2,0),(91,11,4,0),(92,11,16,0),(93,11,17,0),(94,11,8,0),(95,11,32,0),(96,11,64,0),(97,12,1,0),(98,12,2,0),(99,12,4,0),(100,12,16,0),(101,12,17,0),(102,12,8,0),(103,12,32,0),(104,12,64,0),(105,13,1,0),(106,13,2,0),(107,13,4,0),(108,13,16,0),(109,13,17,0),(110,13,8,0),(111,13,32,0),(112,13,64,0),(113,14,1,0),(114,14,2,0),(115,14,4,0),(116,14,16,0),(117,14,17,0),(118,14,8,0),(119,14,32,0),(120,14,64,0),(121,15,1,0),(122,15,2,0),(123,15,4,0),(124,15,16,0),(125,15,17,0),(126,15,8,0),(127,15,32,0),(128,15,64,0),(129,16,1,0),(130,16,2,0),(131,16,4,0),(132,16,16,0),(133,16,17,0),(134,16,8,0),(135,16,32,0),(136,16,64,0),(137,17,1,0),(138,17,2,0),(139,17,4,0),(140,17,16,0),(141,17,17,0),(142,17,8,0),(143,17,32,0),(144,17,64,0),(145,18,1,0),(146,18,2,0),(147,18,4,0),(148,18,16,0),(149,18,17,0),(150,18,8,0),(151,18,32,0),(152,18,64,0),(153,19,1,0),(154,19,2,0),(155,19,4,0),(156,19,16,0),(157,19,17,0),(158,19,8,0),(159,19,32,0),(160,19,64,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2022-02-19 01:51:22','2022-02-19 01:51:21','2022-02-19 01:51:21',5,'en_US',1,0,0),(2,1,2,'2022-02-19 01:52:10','2022-02-19 01:51:47','2022-02-19 01:52:10',5,'en_US',3,0,0),(3,1,4,'2022-02-19 01:53:12','2022-02-19 01:52:41','2022-02-19 01:53:12',5,'en_US',3,0,0),(4,1,5,'2022-02-19 01:53:45','2022-02-19 01:53:38','2022-02-19 01:53:45',5,'en_US',3,0,0),(5,1,6,'2022-02-19 01:54:22','2022-02-19 01:54:14','2022-02-19 01:54:22',5,'en_US',3,0,0),(6,1,7,'2022-02-19 01:54:55','2022-02-19 01:54:47','2022-02-19 01:54:55',5,'en_US',3,0,0),(7,1,8,'2022-02-19 01:55:34','2022-02-19 01:55:26','2022-02-19 01:55:34',5,'en_US',3,0,0),(8,1,9,'2022-02-19 01:56:09','2022-02-19 01:56:00','2022-02-19 01:56:09',5,'en_US',3,0,0),(9,1,10,'2022-02-19 01:56:44','2022-02-19 01:56:36','2022-02-19 01:56:44',5,'en_US',3,0,0),(10,1,11,'2022-02-19 01:57:19','2022-02-19 01:57:11','2022-02-19 01:57:19',5,'en_US',3,0,0),(11,1,12,'2022-02-19 01:57:58','2022-02-19 01:57:49','2022-02-19 01:57:58',5,'en_US',3,0,0),(12,1,13,'2022-02-19 01:58:37','2022-02-19 01:58:27','2022-02-19 01:58:37',5,'en_US',3,0,0),(13,1,14,'2022-02-19 01:59:14','2022-02-19 01:59:05','2022-02-19 01:59:14',5,'en_US',3,0,0),(14,1,15,'2022-02-19 01:59:51','2022-02-19 01:59:43','2022-02-19 01:59:51',5,'en_US',3,0,0),(15,1,16,'2022-02-19 02:00:26','2022-02-19 02:00:18','2022-02-19 02:00:26',5,'en_US',3,0,0),(16,1,17,'2022-02-19 02:01:02','2022-02-19 02:00:54','2022-02-19 02:01:02',5,'en_US',3,0,0),(17,1,18,'2022-02-19 02:01:40','2022-02-19 02:01:32','2022-02-19 02:01:40',5,'en_US',3,0,0),(18,1,19,'2022-02-19 02:02:16','2022-02-19 02:02:08','2022-02-19 02:02:16',5,'en_US',3,0,0),(19,1,20,'2022-02-19 02:02:51','2022-02-19 02:02:43','2022-02-19 02:02:51',5,'en_US',3,0,0);
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
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','Administrateur-trice du site','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PSM','string'),(2,'en_US','name','Preprint Server manager','string'),(2,'fr_CA','abbrev','##default.groups.abbrev.manager##','string'),(2,'fr_CA','name','##default.groups.name.manager##','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(3,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(3,'en_US','abbrev','MOD','string'),(3,'en_US','name','Moderator','string'),(3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##','string'),(3,'fr_CA','name','##default.groups.name.sectionEditor##','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(4,'','nameLocaleKey','default.groups.name.author','string'),(4,'en_US','abbrev','AU','string'),(4,'en_US','name','Author','string'),(4,'fr_CA','abbrev','AU','string'),(4,'fr_CA','name','Auteur-e','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(5,'','nameLocaleKey','default.groups.name.reader','string'),(5,'en_US','abbrev','Read','string'),(5,'en_US','name','Reader','string'),(5,'fr_CA','abbrev','Lect','string'),(5,'fr_CA','name','Lecteur-trice','string');
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
INSERT INTO `user_group_stage` VALUES (1,2,1),(1,2,5),(1,3,1),(1,3,5),(1,4,1),(1,4,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0),(2,1,16,1,0,0,1),(3,1,17,1,0,0,1),(4,1,65536,1,0,1,1),(5,1,1048576,1,0,1,0);
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName','admin'),(1,'en_US','givenName','admin'),(2,'','orcid',''),(2,'en_US','affiliation','Universidad Nacional Autónoma de México'),(2,'en_US','biography',''),(2,'en_US','familyName','Vaca'),(2,'en_US','givenName','Ramiro'),(2,'en_US','preferredPublicName',''),(2,'en_US','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','preferredPublicName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en_US','affiliation','University of Melbourne'),(3,'en_US','biography',''),(3,'en_US','familyName','Barnes'),(3,'en_US','givenName','Daniel'),(3,'en_US','preferredPublicName',''),(3,'en_US','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en_US','affiliation','University of Chicago'),(4,'en_US','biography',''),(4,'en_US','familyName','Buskins'),(4,'en_US','givenName','David'),(4,'en_US','preferredPublicName',''),(4,'en_US','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en_US','affiliation','University of Toronto'),(5,'en_US','biography',''),(5,'en_US','familyName','Berardo'),(5,'en_US','givenName','Stephanie'),(5,'en_US','preferredPublicName',''),(5,'en_US','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en_US','affiliation','Kyoto University'),(6,'en_US','biography',''),(6,'en_US','familyName','Inoue'),(6,'en_US','givenName','Minoti'),(6,'en_US','preferredPublicName',''),(6,'en_US','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(6,'fr_CA','signature',''),(7,'en_US','affiliation','University of Bologna'),(7,'en_US','familyName','Corino'),(7,'en_US','givenName','Carlo'),(8,'en_US','affiliation','University of Windsor'),(8,'en_US','familyName','Kwantes'),(8,'en_US','givenName','Catherine'),(9,'en_US','affiliation','University of Alberta'),(9,'en_US','familyName','Montgomerie'),(9,'en_US','givenName','Craig'),(10,'en_US','affiliation','Alexandria University'),(10,'en_US','familyName','Diouf'),(10,'en_US','givenName','Diaga'),(11,'en_US','affiliation','University of Toronto'),(11,'en_US','familyName','Phillips'),(11,'en_US','givenName','Dana'),(12,'en_US','affiliation','University College Cork'),(12,'en_US','familyName','Sokoloff'),(12,'en_US','givenName','Domatilia'),(13,'en_US','affiliation','Indiana University'),(13,'en_US','familyName','Ostrom'),(13,'en_US','givenName','Elinor'),(14,'en_US','affiliation','University of Rome'),(14,'en_US','familyName','Paglieri'),(14,'en_US','givenName','Fabio'),(15,'en_US','affiliation','University of Cape Town'),(15,'en_US','familyName','Mwandenga'),(15,'en_US','givenName','John'),(16,'en_US','affiliation','Aalborg University'),(16,'en_US','familyName','Novak'),(16,'en_US','givenName','John'),(17,'en_US','affiliation','Stanford University'),(17,'en_US','familyName','Al-Khafaji'),(17,'en_US','givenName','Karim'),(18,'en_US','affiliation','Australian National University'),(18,'en_US','familyName','Christopher'),(18,'en_US','givenName','Leo'),(19,'en_US','affiliation','University of Cape Town'),(19,'en_US','familyName','Kumiega'),(19,'en_US','givenName','Lise'),(20,'en_US','affiliation','University of Wolverhampton'),(20,'en_US','familyName','Daniel'),(20,'en_US','givenName','Patricia'),(21,'en_US','affiliation','University of Nairobi'),(21,'en_US','familyName','Baiyewu'),(21,'en_US','givenName','Rana'),(22,'en_US','affiliation','Barcelona University'),(22,'en_US','familyName','Rossi'),(22,'en_US','givenName','Rosanna'),(23,'en_US','affiliation','University of Tehran'),(23,'en_US','familyName','Karbasizaed'),(23,'en_US','givenName','Vajiheh'),(24,'en_US','affiliation','University of Windsor'),(24,'en_US','familyName','Williamson'),(24,'en_US','givenName','Valerie'),(25,'en_US','affiliation','CUNY'),(25,'en_US','familyName','Woods'),(25,'en_US','givenName','Zita');
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
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(2,3),(3,4),(3,5),(3,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$8nN1kQH4y51lHFcUk69NOu.NZjzOvUbHMNcGOpqvwChMPDTDMwlMS','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-02-19 01:48:22',NULL,'2022-02-19 01:50:28',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$Wx92pZr.631VaIkX.a8G.Om/jzRE1Zcs2NrDkZaZ3BtFR7se0B7KG','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-02-19 01:49:25',NULL,'2022-02-19 01:50:16',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$k26WzkT7Osvabzzu5k1nZe.0XQTHnRiKn6JSZo0ZC2XD/HcFiB2iu','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-02-19 01:49:33',NULL,'2022-02-19 02:02:44',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$VKhxRYk98iwMBKw6HRWPv.DEJNp4jtkEMBUuZ5l2Cs03pPiD81vmO','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-02-19 01:49:42',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$sYh8/1CRzs8Ws.5xQ2Csn.oWF6h2H29gJYpm52e8bCb.VPxSbmQzO','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-02-19 01:49:52',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$sOuqJWue4S9d5pGltgt3zO.SinjXjdiYssd1HaVtmCsxSJya8o6cq','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-02-19 01:50:06',NULL,NULL,0,0,NULL,0,NULL,1),(7,'ccorino','$2y$10$crGnxYsUsDw09g6KS.kk3OG6ByhY2sXLd8caBT/oZrPZ1wkReP8NO','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-02-19 01:50:59',NULL,'2022-02-19 01:50:59',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$DNxKREv1fVXnA4DC4OAzreoHevTAJCGSRpDPk3RxkLhGe1I2hc/XS','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-19 01:51:26',NULL,'2022-02-19 01:51:26',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$JNE1I51.yJfJ7KB4.HEmt.QypePXxkjfF9ob//qNfGbTo5sckdu22','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-19 01:52:15',NULL,'2022-02-19 01:52:15',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$a2326/fJTdpKLaWzXgznuO3IXtZrLhwXeC1rcQ55mB/UuneIhk19e','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG',NULL,NULL,NULL,'2022-02-19 01:53:17',NULL,'2022-02-19 01:53:17',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$1NkeZbDmoJQDqrDwJU0T6O3wFAdwWz4ya.FnnQVw6.R/L.vBmzAI.','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-19 01:53:50',NULL,'2022-02-19 01:53:51',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$U50tkBwLHA2bP9wqiFcGU.h02vqmXzQb9aR489ltm0ryAkI6iATly','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE',NULL,NULL,NULL,'2022-02-19 01:54:27',NULL,'2022-02-19 01:54:27',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$8ee8cF2vedF2At.BcoKnr.4ancIdGAGi6SzvMyPGCaNlPIM1zqwTe','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-02-19 01:55:00',NULL,'2022-02-19 01:55:00',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$hfkVrJH/Ow1P6gZmQZ1naeZpb4CokGG.REDBvTPZIb47L4aN1nF1y','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-02-19 01:55:40',NULL,'2022-02-19 01:55:40',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$0G/TNUGLZOnidoa0rBg1l.5peWEjROIHMGZX/E5dfYIRoF1WaOb7m','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-02-19 01:56:15',NULL,'2022-02-19 01:56:15',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$hZH2D7qNPQnLs3FGqWVVyOVI/rZwQiJYObAss3sH6bUHZfP6D6mR2','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK',NULL,NULL,NULL,'2022-02-19 01:56:49',NULL,'2022-02-19 01:56:50',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$joaM9KRxh9TgdKn1Dn/X5.W5rbXSs7NOsN32FtUvtQuaRXYJerfzK','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-02-19 01:57:25',NULL,'2022-02-19 01:57:25',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$mUluEZjhKqvERWEeRPOHserVPgrh2lcuIMu3KMOkoWBeEgHsvyY4y','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU',NULL,NULL,NULL,'2022-02-19 01:58:04',NULL,'2022-02-19 01:58:04',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$0zu3.0NYZRwVFreOS8IMYOBffTV7i4p7dtxnRoduDZODhxrMa7.A.','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-02-19 01:58:43',NULL,'2022-02-19 01:58:43',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$uXjfyucUyOrDTrqTUMKZ/Oeuw5GnlvTK/n4KZle.MuUlzq.Ea.wyi','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB',NULL,NULL,NULL,'2022-02-19 01:59:21',NULL,'2022-02-19 01:59:21',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$k3GwsMLgxxHULYT1XrhlFudtbr/fuKM3RwpImAYqmNMsKTsaVeh9u','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE',NULL,NULL,NULL,'2022-02-19 01:59:57',NULL,'2022-02-19 01:59:57',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$6BZLAbumWM2C6ewEWguz2.PKHJZVF8Hn6jqsT1GM3fjqndznVgJj2','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES',NULL,NULL,NULL,'2022-02-19 02:00:32',NULL,'2022-02-19 02:00:32',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$LtmjgH4ME95d/5zAm.CI0ujCqxpRS3x9US2xJBmdMABnb0AOZxyJ6','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR',NULL,NULL,NULL,'2022-02-19 02:01:09',NULL,'2022-02-19 02:01:09',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$aiIrFJShgdEDQGZ67c5pDe6AfHbIV10uzFWSsHL3k4kDtpY0dkdka','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-19 02:01:46',NULL,'2022-02-19 02:01:46',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$B/YeEcwZeZ4/rdyrgz4Qm.gq.3hQBl3zCyttuulcAJgXVUWVJJQBq','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-02-19 02:02:21',NULL,'2022-02-19 02:02:22',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-02-19 01:48:22',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2022-02-19 01:48:22',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,2,0,0,'2022-02-19 01:48:22',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,2,0,0,'2022-02-19 01:48:22',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,1,0,'2022-02-19 01:48:22',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,1,3,0,'2022-02-19 01:48:22',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(2,2,0,0,'2022-02-19 01:48:22',1,'plugins.generic','crossref','',0,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,1,0,0,'2022-02-19 01:48:22',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,1,0,0,'2022-02-19 01:48:22',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2022-02-19 01:48:22',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2022-02-19 01:48:19',1,'core','ops','',0,1);
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

-- Dump completed on 2022-02-19  2:02:52
