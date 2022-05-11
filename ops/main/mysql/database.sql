-- MySQL dump 10.13  Distrib 5.7.37, for Linux (x86_64)
--
-- Host: localhost    Database: ops-ci
-- ------------------------------------------------------
-- Server version	5.7.37-0ubuntu0.18.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,4,NULL,5,NULL,3,9,'2022-05-11 02:11:46'),(2,4,NULL,5,NULL,3,18,'2022-05-11 02:11:52'),(3,4,NULL,5,NULL,3,9,'2022-05-11 02:11:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,4,3,'2022-05-11 02:11:46',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(2,1048585,4,3,'2022-05-11 02:11:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>\n'),(3,1048585,4,3,'2022-05-11 02:11:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>');
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
INSERT INTO `email_log_users` VALUES (1,10),(2,10),(3,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL,NULL),(6,'USER_VALIDATE_CONTEXT',0,1,NULL,NULL,NULL),(7,'USER_VALIDATE_SITE',0,1,NULL,NULL,NULL),(8,'ISSUE_PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(9,'SUBMISSION_ACK',1,1,NULL,65536,5),(10,'POSTED_ACK',1,1,NULL,65536,5),(11,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,5),(12,'EDITOR_ASSIGN',1,1,16,16,5),(13,'EDITOR_DECISION_ACCEPT',0,1,16,65536,5),(14,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,5),(15,'EDITOR_DECISION_REVERT_INITIAL_DECLINE',0,1,16,65536,1),(16,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS',0,1,16,65536,3),(17,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(18,'ANNOUNCEMENT',0,1,16,1048576,NULL),(19,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(20,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','fr_CA','','','##emails.announcement.description##'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$serverName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_ASSIGN','fr_CA','','','##emails.editorAssign.description##'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','fr_CA','','','##emails.editorDecisionAccept.description##'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}','This email is sent to the author if the editor declines their submission initially, before the review stage, because the submission does not meet the requirements for publication.'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$serverName}.<br />\n<br />\nNotre décision est de refuser votre soumission.','Cet courriel est envoyé à l\'auteur-e si la soumission est refusée avant même l\'étape d\'évaluation'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en_US','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}','This email is sent to notify authors of a submission who are not assigned as participants that a decision has been made. Usually these are all others except the submitting author.'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','','##mailable.decision.notifyOtherAuthors.description##'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n','This email notifies the author that a previous decision to decline their submission without review is being reverted.'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','','##mailable.decision.revertInitialDecline.notifyAuthor.description##'),('ISSUE_PUBLISH_NOTIFY','en_US','New Preprint Posted','Readers:<br />\n<br />\n{$serverName} has just posted its latest preprint at {$serverUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$signature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('ISSUE_PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$serverName} vient d\'être publiée à l\'adresse suivante : {$serverUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$signature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\n{$signature}<hr />{$unsubscribeLink}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$notificationUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$serverName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','','','##emails.notificationCenterDefault.description##'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\n{$signature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('POSTED_ACK','en_US','Preprint Posted Acknowledgement','{$authorPrimary}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.'),('POSTED_ACK','fr_CA','','','##emails.postedAck.description##'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','','##emails.statisticsReportNotification.subject##'),('SUBMISSION_ACK','en_US','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p>{$signature}','This email, when enabled, is automatically sent to an author when they submit to the journal. It provides information about tracking the submission through the editorial process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$signature}','##emails.submissionAck.description##'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$signature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a new user signed up on the server to validate their email account.'),('USER_VALIDATE_CONTEXT','fr_CA','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.'),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a new user signed up on the site to validate their email account.'),('USER_VALIDATE_SITE','fr_CA','','','##emails.userValidateSite.description##');
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2022-05-11 02:08:45',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2022-05-11 02:08:55',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2022-05-11 02:08:55',1342177288,'submission.event.fileRevised',0),(4,515,1,7,'2022-05-11 02:08:58',1342177296,'submission.event.fileEdited',0),(5,1048585,1,7,'2022-05-11 02:08:58',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2022-05-11 02:09:03',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,7,'2022-05-11 02:09:04',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2022-05-11 02:09:12',268435458,'submission.event.general.metadataUpdated',0),(9,515,2,8,'2022-05-11 02:09:22',1342177281,'submission.event.fileUploaded',0),(10,1048585,2,8,'2022-05-11 02:09:22',1342177288,'submission.event.fileRevised',0),(11,515,2,8,'2022-05-11 02:09:24',1342177296,'submission.event.fileEdited',0),(12,1048585,2,8,'2022-05-11 02:09:24',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2022-05-11 02:09:31',268435458,'submission.event.general.metadataUpdated',0),(14,1048585,2,8,'2022-05-11 02:09:32',268435457,'submission.event.submissionSubmitted',0),(15,1048585,2,8,'2022-05-11 02:09:38',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,8,'2022-05-11 02:09:51',268435458,'submission.event.general.metadataUpdated',0),(17,1048585,2,3,'2022-05-11 02:09:59',268435462,'publication.event.published',0),(18,1048585,3,9,'2022-05-11 02:10:08',268435458,'submission.event.general.metadataUpdated',0),(19,515,3,9,'2022-05-11 02:10:19',1342177281,'submission.event.fileUploaded',0),(20,1048585,3,9,'2022-05-11 02:10:19',1342177288,'submission.event.fileRevised',0),(21,515,3,9,'2022-05-11 02:10:21',1342177296,'submission.event.fileEdited',0),(22,1048585,3,9,'2022-05-11 02:10:21',1342177296,'submission.event.fileEdited',0),(23,1048585,3,9,'2022-05-11 02:10:34',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,3,9,'2022-05-11 02:10:36',268435457,'submission.event.submissionSubmitted',0),(25,1048585,3,3,'2022-05-11 02:10:45',268435462,'publication.event.published',0),(26,1048585,3,3,'2022-05-11 02:10:53',268435463,'publication.event.unpublished',0),(27,1048585,3,3,'2022-05-11 02:10:56',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,3,3,'2022-05-11 02:10:59',268435462,'publication.event.published',0),(29,1048585,3,3,'2022-05-11 02:11:02',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,3,3,'2022-05-11 02:11:02',268435464,'publication.event.versionCreated',0),(31,1048585,3,3,'2022-05-11 02:11:07',268435458,'submission.event.general.metadataUpdated',0),(32,1048585,3,3,'2022-05-11 02:11:10',268435462,'publication.event.versionPublished',0),(33,1048585,4,10,'2022-05-11 02:11:19',268435458,'submission.event.general.metadataUpdated',0),(34,515,4,10,'2022-05-11 02:11:30',1342177281,'submission.event.fileUploaded',0),(35,1048585,4,10,'2022-05-11 02:11:30',1342177288,'submission.event.fileRevised',0),(36,515,4,10,'2022-05-11 02:11:32',1342177296,'submission.event.fileEdited',0),(37,1048585,4,10,'2022-05-11 02:11:32',1342177296,'submission.event.fileEdited',0),(38,1048585,4,10,'2022-05-11 02:11:36',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,4,10,'2022-05-11 02:11:37',268435457,'submission.event.submissionSubmitted',0),(40,1048585,4,3,'2022-05-11 02:11:46',805306371,'editor.submission.decision.decline.log',0),(41,1048585,4,3,'2022-05-11 02:11:52',805306371,'editor.submission.decision.revertDecline.log',0),(42,1048585,4,3,'2022-05-11 02:11:59',805306371,'editor.submission.decision.decline.log',0),(43,1048585,5,11,'2022-05-11 02:12:11',268435458,'submission.event.general.metadataUpdated',0),(44,515,5,11,'2022-05-11 02:12:21',1342177281,'submission.event.fileUploaded',0),(45,1048585,5,11,'2022-05-11 02:12:21',1342177288,'submission.event.fileRevised',0),(46,515,5,11,'2022-05-11 02:12:24',1342177296,'submission.event.fileEdited',0),(47,1048585,5,11,'2022-05-11 02:12:24',1342177296,'submission.event.fileEdited',0),(48,1048585,5,11,'2022-05-11 02:12:30',268435458,'submission.event.general.metadataUpdated',0),(49,1048585,5,11,'2022-05-11 02:12:31',268435457,'submission.event.submissionSubmitted',0),(50,1048585,5,3,'2022-05-11 02:12:40',268435462,'publication.event.published',0),(51,1048585,6,12,'2022-05-11 02:12:50',268435458,'submission.event.general.metadataUpdated',0),(52,515,6,12,'2022-05-11 02:13:00',1342177281,'submission.event.fileUploaded',0),(53,1048585,6,12,'2022-05-11 02:13:00',1342177288,'submission.event.fileRevised',0),(54,515,6,12,'2022-05-11 02:13:02',1342177296,'submission.event.fileEdited',0),(55,1048585,6,12,'2022-05-11 02:13:02',1342177296,'submission.event.fileEdited',0),(56,1048585,6,12,'2022-05-11 02:13:06',268435458,'submission.event.general.metadataUpdated',0),(57,1048585,6,12,'2022-05-11 02:13:07',268435457,'submission.event.submissionSubmitted',0),(58,1048585,6,3,'2022-05-11 02:13:15',268435462,'publication.event.published',0),(59,1048585,7,13,'2022-05-11 02:13:24',268435458,'submission.event.general.metadataUpdated',0),(60,515,7,13,'2022-05-11 02:13:35',1342177281,'submission.event.fileUploaded',0),(61,1048585,7,13,'2022-05-11 02:13:35',1342177288,'submission.event.fileRevised',0),(62,515,7,13,'2022-05-11 02:13:37',1342177296,'submission.event.fileEdited',0),(63,1048585,7,13,'2022-05-11 02:13:37',1342177296,'submission.event.fileEdited',0),(64,1048585,7,13,'2022-05-11 02:13:48',268435458,'submission.event.general.metadataUpdated',0),(65,1048585,7,13,'2022-05-11 02:13:49',268435457,'submission.event.submissionSubmitted',0),(66,1048585,7,3,'2022-05-11 02:13:58',268435462,'publication.event.published',0),(67,1048585,8,14,'2022-05-11 02:14:08',268435458,'submission.event.general.metadataUpdated',0),(68,515,8,14,'2022-05-11 02:14:18',1342177281,'submission.event.fileUploaded',0),(69,1048585,8,14,'2022-05-11 02:14:18',1342177288,'submission.event.fileRevised',0),(70,515,8,14,'2022-05-11 02:14:20',1342177296,'submission.event.fileEdited',0),(71,1048585,8,14,'2022-05-11 02:14:21',1342177296,'submission.event.fileEdited',0),(72,1048585,8,14,'2022-05-11 02:14:24',268435458,'submission.event.general.metadataUpdated',0),(73,1048585,8,14,'2022-05-11 02:14:25',268435457,'submission.event.submissionSubmitted',0),(74,1048585,8,3,'2022-05-11 02:14:33',268435462,'publication.event.published',0),(75,1048585,9,15,'2022-05-11 02:14:43',268435458,'submission.event.general.metadataUpdated',0),(76,515,9,15,'2022-05-11 02:14:54',1342177281,'submission.event.fileUploaded',0),(77,1048585,9,15,'2022-05-11 02:14:54',1342177288,'submission.event.fileRevised',0),(78,515,9,15,'2022-05-11 02:14:56',1342177296,'submission.event.fileEdited',0),(79,1048585,9,15,'2022-05-11 02:14:56',1342177296,'submission.event.fileEdited',0),(80,1048585,9,15,'2022-05-11 02:15:01',268435458,'submission.event.general.metadataUpdated',0),(81,1048585,9,15,'2022-05-11 02:15:02',268435457,'submission.event.submissionSubmitted',0),(82,1048585,9,3,'2022-05-11 02:15:11',268435462,'publication.event.published',0),(83,1048585,10,16,'2022-05-11 02:15:20',268435458,'submission.event.general.metadataUpdated',0),(84,515,10,16,'2022-05-11 02:15:31',1342177281,'submission.event.fileUploaded',0),(85,1048585,10,16,'2022-05-11 02:15:31',1342177288,'submission.event.fileRevised',0),(86,515,10,16,'2022-05-11 02:15:33',1342177296,'submission.event.fileEdited',0),(87,1048585,10,16,'2022-05-11 02:15:33',1342177296,'submission.event.fileEdited',0),(88,1048585,10,16,'2022-05-11 02:15:38',268435458,'submission.event.general.metadataUpdated',0),(89,1048585,10,16,'2022-05-11 02:15:39',268435457,'submission.event.submissionSubmitted',0),(90,1048585,10,3,'2022-05-11 02:15:48',268435462,'publication.event.published',0),(91,1048585,11,17,'2022-05-11 02:15:58',268435458,'submission.event.general.metadataUpdated',0),(92,515,11,17,'2022-05-11 02:16:08',1342177281,'submission.event.fileUploaded',0),(93,1048585,11,17,'2022-05-11 02:16:08',1342177288,'submission.event.fileRevised',0),(94,515,11,17,'2022-05-11 02:16:11',1342177296,'submission.event.fileEdited',0),(95,1048585,11,17,'2022-05-11 02:16:11',1342177296,'submission.event.fileEdited',0),(96,1048585,11,17,'2022-05-11 02:16:19',268435458,'submission.event.general.metadataUpdated',0),(97,1048585,11,17,'2022-05-11 02:16:20',268435457,'submission.event.submissionSubmitted',0),(98,1048585,11,3,'2022-05-11 02:16:29',268435462,'publication.event.published',0),(99,1048585,12,18,'2022-05-11 02:16:40',268435458,'submission.event.general.metadataUpdated',0),(100,515,12,18,'2022-05-11 02:16:50',1342177281,'submission.event.fileUploaded',0),(101,1048585,12,18,'2022-05-11 02:16:50',1342177288,'submission.event.fileRevised',0),(102,515,12,18,'2022-05-11 02:16:53',1342177296,'submission.event.fileEdited',0),(103,1048585,12,18,'2022-05-11 02:16:53',1342177296,'submission.event.fileEdited',0),(104,1048585,12,18,'2022-05-11 02:16:58',268435458,'submission.event.general.metadataUpdated',0),(105,1048585,12,18,'2022-05-11 02:16:59',268435457,'submission.event.submissionSubmitted',0),(106,1048585,12,3,'2022-05-11 02:17:07',268435462,'publication.event.published',0),(107,1048585,13,19,'2022-05-11 02:17:17',268435458,'submission.event.general.metadataUpdated',0),(108,515,13,19,'2022-05-11 02:17:28',1342177281,'submission.event.fileUploaded',0),(109,1048585,13,19,'2022-05-11 02:17:28',1342177288,'submission.event.fileRevised',0),(110,515,13,19,'2022-05-11 02:17:30',1342177296,'submission.event.fileEdited',0),(111,1048585,13,19,'2022-05-11 02:17:30',1342177296,'submission.event.fileEdited',0),(112,1048585,13,19,'2022-05-11 02:17:36',268435458,'submission.event.general.metadataUpdated',0),(113,1048585,13,19,'2022-05-11 02:17:38',268435457,'submission.event.submissionSubmitted',0),(114,1048585,13,3,'2022-05-11 02:17:46',268435462,'publication.event.published',0),(115,1048585,14,20,'2022-05-11 02:17:56',268435458,'submission.event.general.metadataUpdated',0),(116,515,14,20,'2022-05-11 02:18:06',1342177281,'submission.event.fileUploaded',0),(117,1048585,14,20,'2022-05-11 02:18:06',1342177288,'submission.event.fileRevised',0),(118,515,14,20,'2022-05-11 02:18:08',1342177296,'submission.event.fileEdited',0),(119,1048585,14,20,'2022-05-11 02:18:08',1342177296,'submission.event.fileEdited',0),(120,1048585,14,20,'2022-05-11 02:18:15',268435458,'submission.event.general.metadataUpdated',0),(121,1048585,14,20,'2022-05-11 02:18:16',268435457,'submission.event.submissionSubmitted',0),(122,1048585,14,3,'2022-05-11 02:18:25',268435462,'publication.event.published',0),(123,1048585,15,21,'2022-05-11 02:18:35',268435458,'submission.event.general.metadataUpdated',0),(124,515,15,21,'2022-05-11 02:18:46',1342177281,'submission.event.fileUploaded',0),(125,1048585,15,21,'2022-05-11 02:18:46',1342177288,'submission.event.fileRevised',0),(126,515,15,21,'2022-05-11 02:18:48',1342177296,'submission.event.fileEdited',0),(127,1048585,15,21,'2022-05-11 02:18:48',1342177296,'submission.event.fileEdited',0),(128,1048585,15,21,'2022-05-11 02:18:52',268435458,'submission.event.general.metadataUpdated',0),(129,1048585,15,21,'2022-05-11 02:18:53',268435457,'submission.event.submissionSubmitted',0),(130,1048585,15,3,'2022-05-11 02:19:02',268435462,'publication.event.published',0),(131,1048585,16,22,'2022-05-11 02:19:12',268435458,'submission.event.general.metadataUpdated',0),(132,515,16,22,'2022-05-11 02:19:22',1342177281,'submission.event.fileUploaded',0),(133,1048585,16,22,'2022-05-11 02:19:22',1342177288,'submission.event.fileRevised',0),(134,515,16,22,'2022-05-11 02:19:25',1342177296,'submission.event.fileEdited',0),(135,1048585,16,22,'2022-05-11 02:19:25',1342177296,'submission.event.fileEdited',0),(136,1048585,16,22,'2022-05-11 02:19:30',268435458,'submission.event.general.metadataUpdated',0),(137,1048585,16,22,'2022-05-11 02:19:32',268435457,'submission.event.submissionSubmitted',0),(138,1048585,16,3,'2022-05-11 02:19:41',268435462,'publication.event.published',0),(139,1048585,17,23,'2022-05-11 02:19:51',268435458,'submission.event.general.metadataUpdated',0),(140,515,17,23,'2022-05-11 02:20:01',1342177281,'submission.event.fileUploaded',0),(141,1048585,17,23,'2022-05-11 02:20:01',1342177288,'submission.event.fileRevised',0),(142,515,17,23,'2022-05-11 02:20:04',1342177296,'submission.event.fileEdited',0),(143,1048585,17,23,'2022-05-11 02:20:04',1342177296,'submission.event.fileEdited',0),(144,1048585,17,23,'2022-05-11 02:20:10',268435458,'submission.event.general.metadataUpdated',0),(145,1048585,17,23,'2022-05-11 02:20:11',268435457,'submission.event.submissionSubmitted',0),(146,1048585,17,3,'2022-05-11 02:20:20',268435462,'publication.event.published',0),(147,1048585,18,24,'2022-05-11 02:20:30',268435458,'submission.event.general.metadataUpdated',0),(148,515,18,24,'2022-05-11 02:20:40',1342177281,'submission.event.fileUploaded',0),(149,1048585,18,24,'2022-05-11 02:20:40',1342177288,'submission.event.fileRevised',0),(150,515,18,24,'2022-05-11 02:20:42',1342177296,'submission.event.fileEdited',0),(151,1048585,18,24,'2022-05-11 02:20:42',1342177296,'submission.event.fileEdited',0),(152,1048585,18,24,'2022-05-11 02:20:47',268435458,'submission.event.general.metadataUpdated',0),(153,1048585,18,24,'2022-05-11 02:20:48',268435457,'submission.event.submissionSubmitted',0),(154,1048585,18,3,'2022-05-11 02:20:57',268435462,'publication.event.published',0),(155,1048585,19,25,'2022-05-11 02:21:07',268435458,'submission.event.general.metadataUpdated',0),(156,515,19,25,'2022-05-11 02:21:18',1342177281,'submission.event.fileUploaded',0),(157,1048585,19,25,'2022-05-11 02:21:18',1342177288,'submission.event.fileRevised',0),(158,515,19,25,'2022-05-11 02:21:20',1342177296,'submission.event.fileEdited',0),(159,1048585,19,25,'2022-05-11 02:21:20',1342177296,'submission.event.fileEdited',0),(160,1048585,19,25,'2022-05-11 02:21:24',268435458,'submission.event.general.metadataUpdated',0),(161,1048585,19,25,'2022-05-11 02:21:25',268435457,'submission.event.submissionSubmitted',0),(162,1048585,19,3,'2022-05-11 02:21:34',268435462,'publication.event.published',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','10','int'),(2,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','ccorino','string'),(3,'fileId','1','int'),(3,'fileStage','10','int'),(3,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','ccorino','string'),(4,'fileId','1','int'),(4,'fileStage','10','int'),(4,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','ccorino','string'),(5,'fileId','1','int'),(5,'fileStage','10','int'),(5,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','ccorino','string'),(9,'fileId','2','int'),(9,'fileStage','10','int'),(9,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(9,'sourceSubmissionFileId',NULL,'string'),(9,'submissionFileId','2','int'),(9,'submissionId','2','int'),(9,'username','ckwantes','string'),(10,'fileId','2','int'),(10,'fileStage','10','int'),(10,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(10,'submissionFileId','2','int'),(10,'submissionId','2','int'),(10,'username','ckwantes','string'),(11,'fileId','2','int'),(11,'fileStage','10','int'),(11,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','2','int'),(11,'username','ckwantes','string'),(12,'fileId','2','int'),(12,'fileStage','10','int'),(12,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'sourceSubmissionFileId',NULL,'string'),(12,'submissionFileId','2','int'),(12,'submissionId','2','int'),(12,'username','ckwantes','string'),(19,'fileId','3','int'),(19,'fileStage','10','int'),(19,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','3','int'),(19,'username','cmontgomerie','string'),(20,'fileId','3','int'),(20,'fileStage','10','int'),(20,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(20,'submissionFileId','3','int'),(20,'submissionId','3','int'),(20,'username','cmontgomerie','string'),(21,'fileId','3','int'),(21,'fileStage','10','int'),(21,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','3','int'),(21,'submissionId','3','int'),(21,'username','cmontgomerie','string'),(22,'fileId','3','int'),(22,'fileStage','10','int'),(22,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','3','int'),(22,'submissionId','3','int'),(22,'username','cmontgomerie','string'),(34,'fileId','4','int'),(34,'fileStage','10','int'),(34,'originalFileName','Genetic transformation of forest trees.pdf','string'),(34,'sourceSubmissionFileId',NULL,'string'),(34,'submissionFileId','4','int'),(34,'submissionId','4','int'),(34,'username','ddiouf','string'),(35,'fileId','4','int'),(35,'fileStage','10','int'),(35,'name','Genetic transformation of forest trees.pdf','string'),(35,'submissionFileId','4','int'),(35,'submissionId','4','int'),(35,'username','ddiouf','string'),(36,'fileId','4','int'),(36,'fileStage','10','int'),(36,'originalFileName','Genetic transformation of forest trees.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','4','int'),(36,'submissionId','4','int'),(36,'username','ddiouf','string'),(37,'fileId','4','int'),(37,'fileStage','10','int'),(37,'name','Genetic transformation of forest trees.pdf','string'),(37,'originalFileName','Genetic transformation of forest trees.pdf','string'),(37,'sourceSubmissionFileId',NULL,'string'),(37,'submissionFileId','4','int'),(37,'submissionId','4','int'),(37,'username','ddiouf','string'),(40,'decision','9','int'),(40,'editorId','3','int'),(40,'editorName','Daniel Barnes','string'),(40,'submissionId','4','int'),(41,'decision','18','int'),(41,'editorId','3','int'),(41,'editorName','Daniel Barnes','string'),(41,'submissionId','4','int'),(42,'decision','9','int'),(42,'editorId','3','int'),(42,'editorName','Daniel Barnes','string'),(42,'submissionId','4','int'),(44,'fileId','5','int'),(44,'fileStage','10','int'),(44,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','5','int'),(44,'submissionId','5','int'),(44,'username','dphillips','string'),(45,'fileId','5','int'),(45,'fileStage','10','int'),(45,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(45,'submissionFileId','5','int'),(45,'submissionId','5','int'),(45,'username','dphillips','string'),(46,'fileId','5','int'),(46,'fileStage','10','int'),(46,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','5','int'),(46,'submissionId','5','int'),(46,'username','dphillips','string'),(47,'fileId','5','int'),(47,'fileStage','10','int'),(47,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(47,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','5','int'),(47,'submissionId','5','int'),(47,'username','dphillips','string'),(52,'fileId','6','int'),(52,'fileStage','10','int'),(52,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','6','int'),(52,'submissionId','6','int'),(52,'username','dsokoloff','string'),(53,'fileId','6','int'),(53,'fileStage','10','int'),(53,'name','Developing efficacy beliefs in the classroom.pdf','string'),(53,'submissionFileId','6','int'),(53,'submissionId','6','int'),(53,'username','dsokoloff','string'),(54,'fileId','6','int'),(54,'fileStage','10','int'),(54,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(54,'sourceSubmissionFileId',NULL,'string'),(54,'submissionFileId','6','int'),(54,'submissionId','6','int'),(54,'username','dsokoloff','string'),(55,'fileId','6','int'),(55,'fileStage','10','int'),(55,'name','Developing efficacy beliefs in the classroom.pdf','string'),(55,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','6','int'),(55,'submissionId','6','int'),(55,'username','dsokoloff','string'),(60,'fileId','7','int'),(60,'fileStage','10','int'),(60,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(60,'sourceSubmissionFileId',NULL,'string'),(60,'submissionFileId','7','int'),(60,'submissionId','7','int'),(60,'username','eostrom','string'),(61,'fileId','7','int'),(61,'fileStage','10','int'),(61,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(61,'submissionFileId','7','int'),(61,'submissionId','7','int'),(61,'username','eostrom','string'),(62,'fileId','7','int'),(62,'fileStage','10','int'),(62,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','7','int'),(62,'submissionId','7','int'),(62,'username','eostrom','string'),(63,'fileId','7','int'),(63,'fileStage','10','int'),(63,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(63,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','7','int'),(63,'submissionId','7','int'),(63,'username','eostrom','string'),(68,'fileId','8','int'),(68,'fileStage','10','int'),(68,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(68,'sourceSubmissionFileId',NULL,'string'),(68,'submissionFileId','8','int'),(68,'submissionId','8','int'),(68,'username','fpaglieri','string'),(69,'fileId','8','int'),(69,'fileStage','10','int'),(69,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(69,'submissionFileId','8','int'),(69,'submissionId','8','int'),(69,'username','fpaglieri','string'),(70,'fileId','8','int'),(70,'fileStage','10','int'),(70,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','8','int'),(70,'submissionId','8','int'),(70,'username','fpaglieri','string'),(71,'fileId','8','int'),(71,'fileStage','10','int'),(71,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(71,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','8','int'),(71,'submissionId','8','int'),(71,'username','fpaglieri','string'),(76,'fileId','9','int'),(76,'fileStage','10','int'),(76,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(76,'sourceSubmissionFileId',NULL,'string'),(76,'submissionFileId','9','int'),(76,'submissionId','9','int'),(76,'username','jmwandenga','string'),(77,'fileId','9','int'),(77,'fileStage','10','int'),(77,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(77,'submissionFileId','9','int'),(77,'submissionId','9','int'),(77,'username','jmwandenga','string'),(78,'fileId','9','int'),(78,'fileStage','10','int'),(78,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(78,'sourceSubmissionFileId',NULL,'string'),(78,'submissionFileId','9','int'),(78,'submissionId','9','int'),(78,'username','jmwandenga','string'),(79,'fileId','9','int'),(79,'fileStage','10','int'),(79,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(79,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(79,'sourceSubmissionFileId',NULL,'string'),(79,'submissionFileId','9','int'),(79,'submissionId','9','int'),(79,'username','jmwandenga','string'),(84,'fileId','10','int'),(84,'fileStage','10','int'),(84,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(84,'sourceSubmissionFileId',NULL,'string'),(84,'submissionFileId','10','int'),(84,'submissionId','10','int'),(84,'username','jnovak','string'),(85,'fileId','10','int'),(85,'fileStage','10','int'),(85,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(85,'submissionFileId','10','int'),(85,'submissionId','10','int'),(85,'username','jnovak','string'),(86,'fileId','10','int'),(86,'fileStage','10','int'),(86,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(86,'sourceSubmissionFileId',NULL,'string'),(86,'submissionFileId','10','int'),(86,'submissionId','10','int'),(86,'username','jnovak','string'),(87,'fileId','10','int'),(87,'fileStage','10','int'),(87,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(87,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(87,'sourceSubmissionFileId',NULL,'string'),(87,'submissionFileId','10','int'),(87,'submissionId','10','int'),(87,'username','jnovak','string'),(92,'fileId','11','int'),(92,'fileStage','10','int'),(92,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(92,'sourceSubmissionFileId',NULL,'string'),(92,'submissionFileId','11','int'),(92,'submissionId','11','int'),(92,'username','kalkhafaji','string'),(93,'fileId','11','int'),(93,'fileStage','10','int'),(93,'name','Learning Sustainable Design through Service.pdf','string'),(93,'submissionFileId','11','int'),(93,'submissionId','11','int'),(93,'username','kalkhafaji','string'),(94,'fileId','11','int'),(94,'fileStage','10','int'),(94,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(94,'sourceSubmissionFileId',NULL,'string'),(94,'submissionFileId','11','int'),(94,'submissionId','11','int'),(94,'username','kalkhafaji','string'),(95,'fileId','11','int'),(95,'fileStage','10','int'),(95,'name','Learning Sustainable Design through Service.pdf','string'),(95,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(95,'sourceSubmissionFileId',NULL,'string'),(95,'submissionFileId','11','int'),(95,'submissionId','11','int'),(95,'username','kalkhafaji','string'),(100,'fileId','12','int'),(100,'fileStage','10','int'),(100,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(100,'sourceSubmissionFileId',NULL,'string'),(100,'submissionFileId','12','int'),(100,'submissionId','12','int'),(100,'username','lchristopher','string'),(101,'fileId','12','int'),(101,'fileStage','10','int'),(101,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(101,'submissionFileId','12','int'),(101,'submissionId','12','int'),(101,'username','lchristopher','string'),(102,'fileId','12','int'),(102,'fileStage','10','int'),(102,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(102,'sourceSubmissionFileId',NULL,'string'),(102,'submissionFileId','12','int'),(102,'submissionId','12','int'),(102,'username','lchristopher','string'),(103,'fileId','12','int'),(103,'fileStage','10','int'),(103,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(103,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(103,'sourceSubmissionFileId',NULL,'string'),(103,'submissionFileId','12','int'),(103,'submissionId','12','int'),(103,'username','lchristopher','string'),(108,'fileId','13','int'),(108,'fileStage','10','int'),(108,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(108,'sourceSubmissionFileId',NULL,'string'),(108,'submissionFileId','13','int'),(108,'submissionId','13','int'),(108,'username','lkumiega','string'),(109,'fileId','13','int'),(109,'fileStage','10','int'),(109,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(109,'submissionFileId','13','int'),(109,'submissionId','13','int'),(109,'username','lkumiega','string'),(110,'fileId','13','int'),(110,'fileStage','10','int'),(110,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(110,'sourceSubmissionFileId',NULL,'string'),(110,'submissionFileId','13','int'),(110,'submissionId','13','int'),(110,'username','lkumiega','string'),(111,'fileId','13','int'),(111,'fileStage','10','int'),(111,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(111,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(111,'sourceSubmissionFileId',NULL,'string'),(111,'submissionFileId','13','int'),(111,'submissionId','13','int'),(111,'username','lkumiega','string'),(116,'fileId','14','int'),(116,'fileStage','10','int'),(116,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(116,'sourceSubmissionFileId',NULL,'string'),(116,'submissionFileId','14','int'),(116,'submissionId','14','int'),(116,'username','pdaniel','string'),(117,'fileId','14','int'),(117,'fileStage','10','int'),(117,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(117,'submissionFileId','14','int'),(117,'submissionId','14','int'),(117,'username','pdaniel','string'),(118,'fileId','14','int'),(118,'fileStage','10','int'),(118,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(118,'sourceSubmissionFileId',NULL,'string'),(118,'submissionFileId','14','int'),(118,'submissionId','14','int'),(118,'username','pdaniel','string'),(119,'fileId','14','int'),(119,'fileStage','10','int'),(119,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(119,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(119,'sourceSubmissionFileId',NULL,'string'),(119,'submissionFileId','14','int'),(119,'submissionId','14','int'),(119,'username','pdaniel','string'),(124,'fileId','15','int'),(124,'fileStage','10','int'),(124,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','15','int'),(124,'submissionId','15','int'),(124,'username','rbaiyewu','string'),(125,'fileId','15','int'),(125,'fileStage','10','int'),(125,'name','Yam diseases and its management in Nigeria.pdf','string'),(125,'submissionFileId','15','int'),(125,'submissionId','15','int'),(125,'username','rbaiyewu','string'),(126,'fileId','15','int'),(126,'fileStage','10','int'),(126,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','15','int'),(126,'submissionId','15','int'),(126,'username','rbaiyewu','string'),(127,'fileId','15','int'),(127,'fileStage','10','int'),(127,'name','Yam diseases and its management in Nigeria.pdf','string'),(127,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','15','int'),(127,'submissionId','15','int'),(127,'username','rbaiyewu','string'),(132,'fileId','16','int'),(132,'fileStage','10','int'),(132,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','16','int'),(132,'submissionId','16','int'),(132,'username','rrossi','string'),(133,'fileId','16','int'),(133,'fileStage','10','int'),(133,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(133,'submissionFileId','16','int'),(133,'submissionId','16','int'),(133,'username','rrossi','string'),(134,'fileId','16','int'),(134,'fileStage','10','int'),(134,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','16','int'),(134,'submissionId','16','int'),(134,'username','rrossi','string'),(135,'fileId','16','int'),(135,'fileStage','10','int'),(135,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(135,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(135,'sourceSubmissionFileId',NULL,'string'),(135,'submissionFileId','16','int'),(135,'submissionId','16','int'),(135,'username','rrossi','string'),(140,'fileId','17','int'),(140,'fileStage','10','int'),(140,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(140,'sourceSubmissionFileId',NULL,'string'),(140,'submissionFileId','17','int'),(140,'submissionId','17','int'),(140,'username','vkarbasizaed','string'),(141,'fileId','17','int'),(141,'fileStage','10','int'),(141,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(141,'submissionFileId','17','int'),(141,'submissionId','17','int'),(141,'username','vkarbasizaed','string'),(142,'fileId','17','int'),(142,'fileStage','10','int'),(142,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','17','int'),(142,'submissionId','17','int'),(142,'username','vkarbasizaed','string'),(143,'fileId','17','int'),(143,'fileStage','10','int'),(143,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(143,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(143,'sourceSubmissionFileId',NULL,'string'),(143,'submissionFileId','17','int'),(143,'submissionId','17','int'),(143,'username','vkarbasizaed','string'),(148,'fileId','18','int'),(148,'fileStage','10','int'),(148,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(148,'sourceSubmissionFileId',NULL,'string'),(148,'submissionFileId','18','int'),(148,'submissionId','18','int'),(148,'username','vwilliamson','string'),(149,'fileId','18','int'),(149,'fileStage','10','int'),(149,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(149,'submissionFileId','18','int'),(149,'submissionId','18','int'),(149,'username','vwilliamson','string'),(150,'fileId','18','int'),(150,'fileStage','10','int'),(150,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(150,'sourceSubmissionFileId',NULL,'string'),(150,'submissionFileId','18','int'),(150,'submissionId','18','int'),(150,'username','vwilliamson','string'),(151,'fileId','18','int'),(151,'fileStage','10','int'),(151,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(151,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(151,'sourceSubmissionFileId',NULL,'string'),(151,'submissionFileId','18','int'),(151,'submissionId','18','int'),(151,'username','vwilliamson','string'),(156,'fileId','19','int'),(156,'fileStage','10','int'),(156,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(156,'sourceSubmissionFileId',NULL,'string'),(156,'submissionFileId','19','int'),(156,'submissionId','19','int'),(156,'username','zwoods','string'),(157,'fileId','19','int'),(157,'fileStage','10','int'),(157,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(157,'submissionFileId','19','int'),(157,'submissionId','19','int'),(157,'username','zwoods','string'),(158,'fileId','19','int'),(158,'fileStage','10','int'),(158,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','19','int'),(158,'submissionId','19','int'),(158,'username','zwoods','string'),(159,'fileId','19','int'),(159,'fileStage','10','int'),(159,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(159,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(159,'sourceSubmissionFileId',NULL,'string'),(159,'submissionFileId','19','int'),(159,'submissionId','19','int'),(159,'username','zwoods','string');
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
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/627b1ab7d7ebd.pdf','application/pdf'),(2,'contexts/1/submissions/2/627b1ad27cb0a.pdf','application/pdf'),(3,'contexts/1/submissions/3/627b1b0b52d53.pdf','application/pdf'),(4,'contexts/1/submissions/4/627b1b5212287.pdf','application/pdf'),(5,'contexts/1/submissions/5/627b1b85ac52a.pdf','application/pdf'),(6,'contexts/1/submissions/6/627b1bac4c258.pdf','application/pdf'),(7,'contexts/1/submissions/7/627b1bcf201e1.pdf','application/pdf'),(8,'contexts/1/submissions/8/627b1bfa9660d.pdf','application/pdf'),(9,'contexts/1/submissions/9/627b1c1e29161.pdf','application/pdf'),(10,'contexts/1/submissions/10/627b1c433c6d5.pdf','application/pdf'),(11,'contexts/1/submissions/11/627b1c689f3c3.pdf','application/pdf'),(12,'contexts/1/submissions/12/627b1c92c12c6.pdf','application/pdf'),(13,'contexts/1/submissions/13/627b1cb8215e2.pdf','application/pdf'),(14,'contexts/1/submissions/14/627b1cde812e9.pdf','application/pdf'),(15,'contexts/1/submissions/15/627b1d061e982.pdf','application/pdf'),(16,'contexts/1/submissions/16/627b1d2ac805e.pdf','application/pdf'),(17,'contexts/1/submissions/17/627b1d51d76a6.pdf','application/pdf'),(18,'contexts/1/submissions/18/627b1d784ffeb.pdf','application/pdf'),(19,'contexts/1/submissions/19/627b1d9e476ef.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)'),(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(PREPRINT)'),(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
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
INSERT INTO `notification_settings` VALUES (205,'','contents','There was a problem sending an email message. Please try again later, or contact your system administrator.','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2022-05-11 02:09:04',NULL,1048585,1),(4,1,0,3,16777223,'2022-05-11 02:09:04',NULL,1048585,1),(5,1,4,2,16777217,'2022-05-11 02:09:04',NULL,1048585,1),(7,1,5,2,16777217,'2022-05-11 02:09:04',NULL,1048585,1),(9,1,0,2,16777243,'2022-05-11 02:09:04',NULL,1048585,1),(10,1,0,2,16777245,'2022-05-11 02:09:04',NULL,1048585,1),(12,1,0,3,16777222,'2022-05-11 02:09:32',NULL,1048585,2),(13,1,0,3,16777223,'2022-05-11 02:09:32',NULL,1048585,2),(14,1,4,2,16777217,'2022-05-11 02:09:32',NULL,1048585,2),(16,1,5,2,16777217,'2022-05-11 02:09:32',NULL,1048585,2),(18,1,0,2,16777243,'2022-05-11 02:09:32',NULL,1048585,2),(19,1,0,2,16777245,'2022-05-11 02:09:32',NULL,1048585,2),(23,1,0,3,16777222,'2022-05-11 02:10:36',NULL,1048585,3),(24,1,0,3,16777223,'2022-05-11 02:10:36',NULL,1048585,3),(25,1,4,2,16777217,'2022-05-11 02:10:36',NULL,1048585,3),(27,1,5,2,16777217,'2022-05-11 02:10:36',NULL,1048585,3),(29,1,0,2,16777243,'2022-05-11 02:10:36',NULL,1048585,3),(30,1,0,2,16777245,'2022-05-11 02:10:36',NULL,1048585,3),(35,1,4,3,16777259,'2022-05-11 02:11:02',NULL,1048585,3),(37,1,5,3,16777259,'2022-05-11 02:11:02',NULL,1048585,3),(39,1,9,3,16777259,'2022-05-11 02:11:02',NULL,1048585,3),(41,1,0,3,16777222,'2022-05-11 02:11:37',NULL,1048585,4),(42,1,0,3,16777223,'2022-05-11 02:11:37',NULL,1048585,4),(43,1,4,2,16777217,'2022-05-11 02:11:37',NULL,1048585,4),(45,1,5,2,16777217,'2022-05-11 02:11:37',NULL,1048585,4),(47,1,0,2,16777243,'2022-05-11 02:11:37',NULL,1048585,4),(48,1,0,2,16777245,'2022-05-11 02:11:37',NULL,1048585,4),(51,1,10,2,16777234,'2022-05-11 02:11:59',NULL,1048585,4),(52,1,0,3,16777222,'2022-05-11 02:12:31',NULL,1048585,5),(53,1,0,3,16777223,'2022-05-11 02:12:31',NULL,1048585,5),(54,1,4,2,16777217,'2022-05-11 02:12:31',NULL,1048585,5),(56,1,5,2,16777217,'2022-05-11 02:12:31',NULL,1048585,5),(58,1,0,2,16777243,'2022-05-11 02:12:31',NULL,1048585,5),(59,1,0,2,16777245,'2022-05-11 02:12:31',NULL,1048585,5),(62,1,0,3,16777222,'2022-05-11 02:13:07',NULL,1048585,6),(63,1,0,3,16777223,'2022-05-11 02:13:07',NULL,1048585,6),(64,1,4,2,16777217,'2022-05-11 02:13:07',NULL,1048585,6),(66,1,5,2,16777217,'2022-05-11 02:13:07',NULL,1048585,6),(68,1,0,2,16777243,'2022-05-11 02:13:07',NULL,1048585,6),(69,1,0,2,16777245,'2022-05-11 02:13:07',NULL,1048585,6),(73,1,0,3,16777222,'2022-05-11 02:13:49',NULL,1048585,7),(74,1,0,3,16777223,'2022-05-11 02:13:49',NULL,1048585,7),(75,1,4,2,16777217,'2022-05-11 02:13:49',NULL,1048585,7),(77,1,5,2,16777217,'2022-05-11 02:13:49',NULL,1048585,7),(79,1,0,2,16777243,'2022-05-11 02:13:49',NULL,1048585,7),(80,1,0,2,16777245,'2022-05-11 02:13:49',NULL,1048585,7),(84,1,0,3,16777222,'2022-05-11 02:14:25',NULL,1048585,8),(85,1,0,3,16777223,'2022-05-11 02:14:25',NULL,1048585,8),(86,1,4,2,16777217,'2022-05-11 02:14:25',NULL,1048585,8),(88,1,5,2,16777217,'2022-05-11 02:14:25',NULL,1048585,8),(90,1,0,2,16777243,'2022-05-11 02:14:25',NULL,1048585,8),(91,1,0,2,16777245,'2022-05-11 02:14:25',NULL,1048585,8),(94,1,0,3,16777222,'2022-05-11 02:15:02',NULL,1048585,9),(95,1,0,3,16777223,'2022-05-11 02:15:02',NULL,1048585,9),(96,1,4,2,16777217,'2022-05-11 02:15:02',NULL,1048585,9),(98,1,5,2,16777217,'2022-05-11 02:15:02',NULL,1048585,9),(100,1,0,2,16777243,'2022-05-11 02:15:02',NULL,1048585,9),(101,1,0,2,16777245,'2022-05-11 02:15:02',NULL,1048585,9),(104,1,0,3,16777222,'2022-05-11 02:15:39',NULL,1048585,10),(105,1,0,3,16777223,'2022-05-11 02:15:39',NULL,1048585,10),(106,1,4,2,16777217,'2022-05-11 02:15:39',NULL,1048585,10),(108,1,5,2,16777217,'2022-05-11 02:15:39',NULL,1048585,10),(110,1,0,2,16777243,'2022-05-11 02:15:39',NULL,1048585,10),(111,1,0,2,16777245,'2022-05-11 02:15:39',NULL,1048585,10),(115,1,0,3,16777222,'2022-05-11 02:16:20',NULL,1048585,11),(116,1,0,3,16777223,'2022-05-11 02:16:20',NULL,1048585,11),(117,1,4,2,16777217,'2022-05-11 02:16:20',NULL,1048585,11),(119,1,5,2,16777217,'2022-05-11 02:16:20',NULL,1048585,11),(121,1,0,2,16777243,'2022-05-11 02:16:20',NULL,1048585,11),(122,1,0,2,16777245,'2022-05-11 02:16:20',NULL,1048585,11),(126,1,0,3,16777222,'2022-05-11 02:16:59',NULL,1048585,12),(127,1,0,3,16777223,'2022-05-11 02:16:59',NULL,1048585,12),(128,1,4,2,16777217,'2022-05-11 02:16:59',NULL,1048585,12),(130,1,5,2,16777217,'2022-05-11 02:16:59',NULL,1048585,12),(132,1,0,2,16777243,'2022-05-11 02:16:59',NULL,1048585,12),(133,1,0,2,16777245,'2022-05-11 02:16:59',NULL,1048585,12),(136,1,0,3,16777222,'2022-05-11 02:17:37',NULL,1048585,13),(137,1,0,3,16777223,'2022-05-11 02:17:37',NULL,1048585,13),(138,1,4,2,16777217,'2022-05-11 02:17:37',NULL,1048585,13),(140,1,5,2,16777217,'2022-05-11 02:17:37',NULL,1048585,13),(142,1,0,2,16777243,'2022-05-11 02:17:37',NULL,1048585,13),(143,1,0,2,16777245,'2022-05-11 02:17:37',NULL,1048585,13),(146,1,0,3,16777222,'2022-05-11 02:18:16',NULL,1048585,14),(147,1,0,3,16777223,'2022-05-11 02:18:16',NULL,1048585,14),(148,1,4,2,16777217,'2022-05-11 02:18:16',NULL,1048585,14),(150,1,5,2,16777217,'2022-05-11 02:18:16',NULL,1048585,14),(152,1,0,2,16777243,'2022-05-11 02:18:16',NULL,1048585,14),(153,1,0,2,16777245,'2022-05-11 02:18:16',NULL,1048585,14),(156,1,0,3,16777222,'2022-05-11 02:18:53',NULL,1048585,15),(157,1,0,3,16777223,'2022-05-11 02:18:53',NULL,1048585,15),(158,1,4,2,16777217,'2022-05-11 02:18:53',NULL,1048585,15),(160,1,5,2,16777217,'2022-05-11 02:18:53',NULL,1048585,15),(162,1,0,2,16777243,'2022-05-11 02:18:53',NULL,1048585,15),(163,1,0,2,16777245,'2022-05-11 02:18:53',NULL,1048585,15),(166,1,0,3,16777222,'2022-05-11 02:19:31',NULL,1048585,16),(167,1,0,3,16777223,'2022-05-11 02:19:31',NULL,1048585,16),(168,1,4,2,16777217,'2022-05-11 02:19:31',NULL,1048585,16),(170,1,5,2,16777217,'2022-05-11 02:19:31',NULL,1048585,16),(172,1,0,2,16777243,'2022-05-11 02:19:31',NULL,1048585,16),(173,1,0,2,16777245,'2022-05-11 02:19:31',NULL,1048585,16),(176,1,0,3,16777222,'2022-05-11 02:20:11',NULL,1048585,17),(177,1,0,3,16777223,'2022-05-11 02:20:11',NULL,1048585,17),(178,1,4,2,16777217,'2022-05-11 02:20:11',NULL,1048585,17),(180,1,5,2,16777217,'2022-05-11 02:20:11',NULL,1048585,17),(182,1,0,2,16777243,'2022-05-11 02:20:11',NULL,1048585,17),(183,1,0,2,16777245,'2022-05-11 02:20:11',NULL,1048585,17),(186,1,0,3,16777222,'2022-05-11 02:20:48',NULL,1048585,18),(187,1,0,3,16777223,'2022-05-11 02:20:48',NULL,1048585,18),(188,1,4,2,16777217,'2022-05-11 02:20:48',NULL,1048585,18),(190,1,5,2,16777217,'2022-05-11 02:20:48',NULL,1048585,18),(192,1,0,2,16777243,'2022-05-11 02:20:48',NULL,1048585,18),(193,1,0,2,16777245,'2022-05-11 02:20:48',NULL,1048585,18),(196,1,0,3,16777222,'2022-05-11 02:21:25',NULL,1048585,19),(197,1,0,3,16777223,'2022-05-11 02:21:25',NULL,1048585,19),(198,1,4,2,16777217,'2022-05-11 02:21:25',NULL,1048585,19),(200,1,5,2,16777217,'2022-05-11 02:21:25',NULL,1048585,19),(202,1,0,2,16777243,'2022-05-11 02:21:25',NULL,1048585,19),(203,1,0,2,16777245,'2022-05-11 02:21:25',NULL,1048585,19),(205,0,3,1,3,'2022-05-11 02:21:34',NULL,0,0);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','627b1a1976040','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object');
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
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',1,0.00,'',0,'',NULL),(2,'en_US',2,'PDF',2,0.00,'',0,'',NULL),(3,'en_US',3,'PDF',3,0.00,'',0,'',NULL),(4,'en_US',4,'PDF',3,0.00,'',0,'',NULL),(5,'en_US',5,'PDF',4,0.00,'',0,'',NULL),(6,'en_US',6,'PDF',5,0.00,'',0,'',NULL),(7,'en_US',7,'PDF',6,0.00,'',0,'',NULL),(8,'en_US',8,'PDF',7,0.00,'',0,'',NULL),(9,'en_US',9,'PDF',8,0.00,'',0,'',NULL),(10,'en_US',10,'PDF',9,0.00,'',0,'',NULL),(11,'en_US',11,'PDF',10,0.00,'',0,'',NULL),(12,'en_US',12,'PDF',11,0.00,'',0,'',NULL),(13,'en_US',13,'PDF',12,0.00,'',0,'',NULL),(14,'en_US',14,'PDF',13,0.00,'',0,'',NULL),(15,'en_US',15,'PDF',14,0.00,'',0,'',NULL),(16,'en_US',16,'PDF',15,0.00,'',0,'',NULL),(17,'en_US',17,'PDF',16,0.00,'',0,'',NULL),(18,'en_US',18,'PDF',17,0.00,'',0,'',NULL),(19,'en_US',19,'PDF',18,0.00,'',0,'',NULL),(20,'en_US',20,'PDF',19,0.00,'',0,'',NULL);
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'','licenseUrl',''),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2022'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','subtitle','A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'en_US','title','The Facets Of Job Satisfaction'),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'','categoryIds','[]'),(3,'','copyrightYear','2022'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'','copyrightYear','2022'),(4,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(4,'en_US','copyrightHolder','Craig Montgomerie'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','licenseUrl',''),(5,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Genetic transformation of forest trees'),(5,'fr_CA','abstract',''),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'','copyrightYear','2022'),(6,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2022'),(7,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Developing efficacy beliefs in the classroom'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'','copyrightYear','2022'),(8,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Traditions and Trends in the Study of the Commons'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'','copyrightYear','2022'),(9,'en_US','abstract','<p>None.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'','copyrightYear','2022'),(10,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'','copyrightYear','2022'),(11,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'','copyrightYear','2022'),(12,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Learning Sustainable Design through Service'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'','copyrightYear','2022'),(13,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'','copyrightYear','2022'),(15,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'','copyrightYear','2022'),(16,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Yam diseases and its management in Nigeria'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'','copyrightYear','2022'),(17,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2022'),(18,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'','copyrightYear','2022'),(19,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title',''),(20,'','categoryIds','[]'),(20,'','copyrightYear','2022'),(20,'en_US','abstract','<p>None.</p>'),(20,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(20,'en_US','prefix',''),(20,'en_US','subtitle',''),(20,'en_US','title','Finocchiaro: Arguments About Arguments'),(20,'fr_CA','abstract',''),(20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(20,'fr_CA','prefix',''),(20,'fr_CA','subtitle',''),(20,'fr_CA','title','');
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
INSERT INTO `publications` VALUES (1,0,NULL,'2022-05-11 02:09:03',1,1,1,1,NULL,1,NULL),(2,0,'2022-05-11','2022-05-11 02:09:59',2,1,2,3,NULL,1,NULL),(3,0,'2022-05-11','2022-05-11 02:10:59',4,1,3,3,NULL,1,NULL),(4,0,'2022-05-11','2022-05-11 02:11:10',6,1,3,3,NULL,2,NULL),(5,0,NULL,'2022-05-11 02:11:36',8,1,4,1,NULL,1,NULL),(6,0,'2022-05-11','2022-05-11 02:12:40',9,1,5,3,NULL,1,NULL),(7,0,'2022-05-11','2022-05-11 02:13:15',10,1,6,3,NULL,1,NULL),(8,0,'2022-05-11','2022-05-11 02:13:58',11,1,7,3,NULL,1,NULL),(9,0,'2022-05-11','2022-05-11 02:14:33',13,1,8,3,NULL,1,NULL),(10,0,'2022-05-11','2022-05-11 02:15:11',14,1,9,3,NULL,1,NULL),(11,0,'2022-05-11','2022-05-11 02:15:48',15,1,10,3,NULL,1,NULL),(12,0,'2022-05-11','2022-05-11 02:16:29',16,1,11,3,NULL,1,NULL),(13,0,'2022-05-11','2022-05-11 02:17:07',18,1,12,3,NULL,1,NULL),(14,0,'2022-05-11','2022-05-11 02:17:46',19,1,13,3,NULL,1,NULL),(15,0,'2022-05-11','2022-05-11 02:18:24',20,1,14,3,NULL,1,NULL),(16,0,'2022-05-11','2022-05-11 02:19:02',21,1,15,3,NULL,1,NULL),(17,0,'2022-05-11','2022-05-11 02:19:41',22,1,16,3,NULL,1,NULL),(18,0,'2022-05-11','2022-05-11 02:20:20',23,1,17,3,NULL,1,NULL),(19,0,'2022-05-11','2022-05-11 02:20:57',24,1,18,3,NULL,1,NULL),(20,0,'2022-05-11','2022-05-11 02:21:34',25,1,19,3,NULL,1,NULL);
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
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers','2022-05-11 02:06:02'),('lib.pkp.classes.task.StatisticsReport','2022-05-11 02:06:02'),('plugins.generic.usageStats.UsageStatsLoader','2022-05-11 02:06:02');
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
INSERT INTO `section_settings` VALUES (1,'','path','preprints','string'),(1,'en_US','abbrev','PRE','string'),(1,'en_US','description','','string'),(1,'en_US','identifyType','','string'),(1,'en_US','policy','<p>Section default policy</p>','string'),(1,'en_US','title','Preprints','string'),(1,'fr_CA','abbrev','','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','identifyType','','string'),(1,'fr_CA','policy','','string'),(1,'fr_CA','title','','string');
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
INSERT INTO `server_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copySubmissionAckAddress','',NULL),(1,'','copySubmissionAckPrimaryContact','0',NULL),(1,'','country','IS',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enableDois','0',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','registrationAgency','none',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"http://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously posted.\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par un autre serveur. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\"},{\"order\":2,\"content\":\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\"},{\"order\":3,\"content\":\"Lorsque possible, les URL des références ont été fournies.\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]',NULL);
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
INSERT INTO `sessions` VALUES ('104f7q90uc8ikgevr0hld1jl11',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235659,1652235694,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235694;s:5:\"token\";s:32:\"6716eef372083db5934b5d7802c6db2a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('19sissqkfj59hsrjq4fllgrmio',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235124,1652235160,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235160;s:5:\"token\";s:32:\"e99cd6ab7d52936a38a8d8c20156ca6e\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2du30iild9k9pepjf4179fvjmo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235507,1652235543,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235543;s:5:\"token\";s:32:\"58e661ffbb55c2155de120a339b7f1b2\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('44tt8csvh3ki60r6n5bk9vf07t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235162,1652235195,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235195;s:5:\"token\";s:32:\"a020b8d4d4ca3713901a8f13da03b200\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('70gs5cpljlnr2s4dpsqpvl81ad',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234918,1652234944,0,'csrf|a:2:{s:9:\"timestamp\";i:1652234944;s:5:\"token\";s:32:\"759af8de001dcf5741d29d68af6361f2\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('729losj6t230np182bteff2bj6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235350,1652235389,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235389;s:5:\"token\";s:32:\"dbdf74b588fa9e8508ce51b9497e2003\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('88ncr15dlupd21ah9nbuk3rb3a',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234887,1652234916,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1652234916;s:5:\"token\";s:32:\"6025a4d54bcc73eae17ab00825ff7992\";}','localhost'),('8oj3rai5qk7hg3creoep30nvs8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234993,1652234999,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1652234999;s:5:\"token\";s:32:\"6267c462816ce870fa9a7ba0c6a538a6\";}','localhost'),('9prg038lap2fq1blkmptkici2b',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235544,1652235581,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235581;s:5:\"token\";s:32:\"377f50b11afef02a3994a95ad548605c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ahom8egko1mqu2o9s3t79lgrrt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234946,1652234992,0,'csrf|a:2:{s:9:\"timestamp\";i:1652234992;s:5:\"token\";s:32:\"a8745b0579a14e8caca2c9b99e25e697\";}username|s:8:\"ckwantes\";','localhost'),('bfd6ed8veuvtsud78sefie0976',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235468,1652235505,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235505;s:5:\"token\";s:32:\"ee963fa526a49ca078a8a4baf9ccb1a9\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('d3t2pqlv7oniohtihnckspetca',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235429,1652235466,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235466;s:5:\"token\";s:32:\"daa4f5e7ed665264b109980119859f59\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('d6qa5mmqg7f26q59iul7ri0onk',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234795,1652234802,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1652234802;s:5:\"token\";s:32:\"69975bc524ec48191fbaec893aec8741\";}','localhost'),('dj1f9bia72e00gshkr4jkuqqhd',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235391,1652235428,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235428;s:5:\"token\";s:32:\"aba7c8ab395fc1675da1c557a461cc41\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('dpai3slpnke38c7phbbfcpsajg',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234777,1652234795,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1652234795;s:5:\"token\";s:32:\"dcbe491aa6d27e400187e0ce206c7c3e\";}','localhost'),('jf4ggdku2m1ilp7iljnr92o18o',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235240,1652235273,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235273;s:5:\"token\";s:32:\"25a934a1c19bf1527e1e7fef5a818089\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('jfmheeu9q8chlfe2hir0ukuugd',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235622,1652235658,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235658;s:5:\"token\";s:32:\"28f925193f9f92297096e0a043fd89d2\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('jgljvvc0l73vldtl67p40bb9at',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235583,1652235620,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235620;s:5:\"token\";s:32:\"3b0a5501ccc2fd5e47742195a05c4199\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('kh8d8dup9rh0j1lt210jdk6hdh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235098,1652235122,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1652235120;s:5:\"token\";s:32:\"4e91a55fa71d261fe077c1381fd93d34\";}','localhost'),('nolrqp3d8uvoamb8ef03asv2l5',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234880,1652234887,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1652234887;s:5:\"token\";s:32:\"7f390c24ca8d5c890e64b7c349b9dfa3\";}','localhost'),('oqnb7f89m01ab8ee6o33vtnbgp',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235275,1652235311,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235311;s:5:\"token\";s:32:\"3b906d0cc0021b11b689f999204c4dd6\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ppn77hr725q81nvg5alqaeof28',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234802,1652234812,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1652234812;s:5:\"token\";s:32:\"e7fb247dec137e92b7341c34be134e7d\";}','localhost'),('r1bola0n0b8j7s6e3kf22bca1n',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235001,1652235071,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235071;s:5:\"token\";s:32:\"c206d4f438b9a1a35efdcc347ed95d11\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ta32b6n0t3t5sn41i6pnpn36cm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235313,1652235348,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235348;s:5:\"token\";s:32:\"54fa5f179d3b24233f636161f00ba385\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('tca63turkl8j4i6n4lqgtkl8jp',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234762,1652234777,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1652234777;s:5:\"token\";s:32:\"ce12d158059d5cf3da66c03ff9f7fd6f\";}','localhost'),('u8j0vulrimr5uk86u93o3e42so',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652234814,1652234877,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1652234877;s:5:\"token\";s:32:\"b51213d0315298ccecf1f5de7578a21f\";}','localhost'),('uvp3rujknjch4ikli4av7ersqs',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235197,1652235238,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235238;s:5:\"token\";s:32:\"2936aaa58f764f73258a6750e858c0a5\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('vof7gklevn1alp65ar2ngtb4dr',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/100.0.4896.60 Safari/537.36',1652235073,1652235097,0,'csrf|a:2:{s:9:\"timestamp\";i:1652235097;s:5:\"token\";s:32:\"0eeb497de678e7f947933851d97c7476\";}username|s:6:\"ddiouf\";userId|i:10;','localhost');
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
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2022-05-11 02:08:45',0,1),(2,1,3,4,'2022-05-11 02:09:04',0,1),(3,1,3,5,'2022-05-11 02:09:04',0,1),(4,2,4,8,'2022-05-11 02:09:12',0,1),(5,2,3,4,'2022-05-11 02:09:32',0,1),(6,2,3,5,'2022-05-11 02:09:32',0,1),(7,3,4,9,'2022-05-11 02:10:08',0,1),(8,3,3,4,'2022-05-11 02:10:36',0,1),(9,3,3,5,'2022-05-11 02:10:36',0,1),(10,4,4,10,'2022-05-11 02:11:19',0,1),(11,4,3,4,'2022-05-11 02:11:37',0,1),(12,4,3,5,'2022-05-11 02:11:37',0,1),(13,5,4,11,'2022-05-11 02:12:11',0,1),(14,5,3,4,'2022-05-11 02:12:31',0,1),(15,5,3,5,'2022-05-11 02:12:31',0,1),(16,6,4,12,'2022-05-11 02:12:50',0,1),(17,6,3,4,'2022-05-11 02:13:07',0,1),(18,6,3,5,'2022-05-11 02:13:07',0,1),(19,7,4,13,'2022-05-11 02:13:24',0,1),(20,7,3,4,'2022-05-11 02:13:49',0,1),(21,7,3,5,'2022-05-11 02:13:49',0,1),(22,8,4,14,'2022-05-11 02:14:08',0,1),(23,8,3,4,'2022-05-11 02:14:25',0,1),(24,8,3,5,'2022-05-11 02:14:25',0,1),(25,9,4,15,'2022-05-11 02:14:43',0,1),(26,9,3,4,'2022-05-11 02:15:02',0,1),(27,9,3,5,'2022-05-11 02:15:02',0,1),(28,10,4,16,'2022-05-11 02:15:20',0,1),(29,10,3,4,'2022-05-11 02:15:39',0,1),(30,10,3,5,'2022-05-11 02:15:39',0,1),(31,11,4,17,'2022-05-11 02:15:58',0,1),(32,11,3,4,'2022-05-11 02:16:20',0,1),(33,11,3,5,'2022-05-11 02:16:20',0,1),(34,12,4,18,'2022-05-11 02:16:40',0,1),(35,12,3,4,'2022-05-11 02:16:59',0,1),(36,12,3,5,'2022-05-11 02:16:59',0,1),(37,13,4,19,'2022-05-11 02:17:17',0,1),(38,13,3,4,'2022-05-11 02:17:37',0,1),(39,13,3,5,'2022-05-11 02:17:37',0,1),(40,14,4,20,'2022-05-11 02:17:56',0,1),(41,14,3,4,'2022-05-11 02:18:16',0,1),(42,14,3,5,'2022-05-11 02:18:16',0,1),(43,15,4,21,'2022-05-11 02:18:35',0,1),(44,15,3,4,'2022-05-11 02:18:53',0,1),(45,15,3,5,'2022-05-11 02:18:53',0,1),(46,16,4,22,'2022-05-11 02:19:12',0,1),(47,16,3,4,'2022-05-11 02:19:31',0,1),(48,16,3,5,'2022-05-11 02:19:31',0,1),(49,17,4,23,'2022-05-11 02:19:51',0,1),(50,17,3,4,'2022-05-11 02:20:11',0,1),(51,17,3,5,'2022-05-11 02:20:11',0,1),(52,18,4,24,'2022-05-11 02:20:30',0,1),(53,18,3,4,'2022-05-11 02:20:48',0,1),(54,18,3,5,'2022-05-11 02:20:48',0,1),(55,19,4,25,'2022-05-11 02:21:07',0,1),(56,19,3,4,'2022-05-11 02:21:25',0,1),(57,19,3,5,'2022-05-11 02:21:25',0,1);
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
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:08:55','2022-05-11 02:08:58',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:09:22','2022-05-11 02:09:24',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:10:19','2022-05-11 02:10:21',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:11:30','2022-05-11 02:11:32',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:12:21','2022-05-11 02:12:24',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:13:00','2022-05-11 02:13:02',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:13:35','2022-05-11 02:13:37',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:14:18','2022-05-11 02:14:20',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:14:54','2022-05-11 02:14:56',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:15:31','2022-05-11 02:15:33',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:16:08','2022-05-11 02:16:11',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:16:50','2022-05-11 02:16:53',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:17:28','2022-05-11 02:17:30',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:18:06','2022-05-11 02:18:08',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:18:46','2022-05-11 02:18:48',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:19:22','2022-05-11 02:19:25',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:20:01','2022-05-11 02:20:04',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:20:40','2022-05-11 02:20:42',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2022-05-11 02:21:18','2022-05-11 02:21:20',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=950 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (516,'11-'),(658,'21st'),(339,'aalborg'),(792,'abattoir'),(831,'abnormal'),(425,'academic'),(10,'academy'),(524,'accepted'),(389,'accompanying'),(710,'achieving'),(468,'acid'),(541,'acids'),(239,'action'),(931,'actor'),(924,'actors'),(375,'added'),(422,'address'),(472,'adipose'),(136,'administered'),(351,'administration'),(746,'adopted'),(747,'advocated'),(820,'affected'),(32,'affects'),(788,'african'),(930,'agree'),(853,'aid'),(461,'aim'),(407,'al-khafaji'),(74,'alberta'),(148,'alexandria'),(647,'analyses'),(43,'analysis'),(499,'analyzed'),(497,'animals'),(724,'anthracnose'),(896,'antibiotics'),(867,'antimicrobial'),(578,'antonio'),(608,'appears'),(377,'applications'),(350,'applied'),(555,'aquifer'),(20,'archival'),(642,'areas'),(155,'argument'),(949,'arguments'),(765,'ash'),(462,'assess'),(547,'assessed'),(603,'assessments'),(654,'atlantic'),(22,'attitude'),(452,'australian'),(854,'authorities'),(403,'authority'),(342,'availability'),(477,'averaging'),(493,'backfat'),(154,'background'),(714,'baiyewu'),(779,'barcelona'),(664,'barriers'),(476,'barrows'),(559,'barton'),(404,'based'),(397,'basin'),(361,'basins'),(666,'basis'),(602,'bearings'),(791,'beef'),(106,'began'),(167,'beliefs'),(689,'belonging'),(38,'benchmark'),(52,'benefit'),(592,'blanco'),(4,'bologna'),(58,'brazil'),(402,'brazos'),(816,'breeds'),(617,'buda'),(804,'bulls'),(454,'butyrate'),(514,'c18'),(518,'c20'),(108,'called'),(785,'cameroon'),(102,'canada'),(372,'capabilities'),(300,'cape'),(818,'carcass'),(799,'carcasses'),(546,'carefully'),(1,'carlo'),(679,'carried'),(653,'case'),(904,'cases'),(822,'category'),(5,'catherine'),(783,'cattle'),(787,'central'),(659,'century'),(606,'cfs'),(447,'challenges'),(628,'change'),(434,'chapter'),(798,'characteristics'),(201,'children'),(57,'china'),(771,'chips'),(451,'christopher'),(515,'cis'),(206,'citizens'),(243,'citizenship'),(174,'claim'),(163,'claims'),(88,'classroom'),(903,'clinical'),(697,'close'),(501,'close-'),(655,'coast'),(887,'coli'),(871,'coliforms'),(278,'colleagues'),(495,'collected'),(581,'collection'),(933,'collective'),(929,'collectively'),(63,'collectivistic'),(196,'college'),(188,'com-mitments'),(720,'combating'),(168,'commitments'),(178,'common'),(252,'commons'),(47,'communication'),(691,'communities'),(673,'community'),(16,'comparative'),(923,'compare'),(41,'compared'),(53,'comparisons'),(182,'competencies'),(36,'compiled'),(392,'complete'),(849,'completely'),(369,'complex'),(500,'composition'),(78,'computer'),(900,'concentration'),(576,'concept'),(317,'conclusive'),(846,'condemned'),(384,'condensed'),(340,'condensing'),(561,'conditions'),(216,'conducted'),(204,'confident'),(318,'conflicting'),(912,'conjugative'),(637,'connection'),(553,'connectivity'),(938,'consensus'),(730,'considered'),(59,'consistent'),(177,'consists'),(526,'consortium'),(18,'construct'),(398,'contained'),(277,'contemporary'),(506,'content'),(69,'context'),(644,'continual'),(207,'continue'),(333,'continuous'),(675,'contributing'),(942,'contributors'),(859,'control'),(444,'coordinated'),(111,'core'),(2,'corino'),(197,'cork'),(328,'corporate'),(687,'council'),(35,'countries'),(703,'country'),(112,'courses'),(270,'coward'),(829,'cows'),(228,'cps'),(72,'craig'),(37,'create'),(225,'creative'),(591,'creek'),(156,'critique'),(749,'crop'),(772,'cubes'),(757,'cultivars'),(68,'cultural'),(31,'culture'),(692,'cultures'),(947,'cuny'),(105,'curriculum'),(149,'dana'),(649,'daniel'),(21,'data'),(385,'dataset'),(366,'datasets'),(258,'decades1'),(925,'decide'),(939,'decision'),(237,'decision-making'),(371,'decision-support'),(332,'decisions'),(159,'deep'),(682,'defining'),(29,'degree'),(683,'delivering'),(641,'demands'),(97,'demonstrate'),(677,'describes'),(412,'design'),(651,'designing'),(755,'destruction'),(736,'devastating'),(401,'develop'),(373,'developed'),(198,'developing'),(124,'development'),(290,'developments'),(146,'diaga'),(537,'dietary'),(482,'diets'),(533,'differed'),(897,'difference'),(189,'difficult'),(936,'difficulty'),(147,'diouf'),(449,'directions'),(160,'disagreement'),(261,'disciplines'),(627,'discontinuity'),(242,'discussed'),(684,'discussions'),(729,'disease'),(717,'diseases'),(595,'dissipated'),(259,'distinguished'),(843,'distress'),(331,'distribution'),(192,'diverge'),(662,'diversity'),(577,'divide'),(322,'dividend'),(304,'dividends'),(194,'domatilia'),(572,'downstream'),(589,'drainage'),(626,'dramatic'),(855,'draw'),(560,'drought'),(601,'droughts'),(734,'dry'),(527,'dry-cured'),(850,'due'),(630,'dynamic'),(320,'economists'),(517,'ecosenoic'),(833,'ectoparasites'),(741,'edible'),(91,'education'),(554,'edwards'),(71,'effect'),(49,'effectiveness'),(234,'effects'),(199,'efficacy'),(48,'efficiency'),(705,'egalitarianism'),(244,'elinor'),(661,'embracing'),(427,'emerging'),(688,'emphasises'),(307,'empirical'),(144,'employed'),(24,'employees'),(913,'encoding'),(832,'encountered'),(569,'endangered'),(359,'endeavors'),(419,'engineering'),(431,'engineers'),(223,'enhance'),(379,'enhanced'),(240,'enhancing'),(839,'enlarged'),(880,'enterobacteriacea'),(414,'environmental'),(922,'environments'),(200,'equip'),(19,'equivalence'),(886,'escherichia'),(575,'established'),(699,'ethnic'),(700,'ethno-linguistic'),(337,'evaluation'),(308,'evidence'),(28,'examine'),(140,'examined'),(672,'examines'),(70,'exerts'),(55,'exhibited'),(448,'exist'),(81,'existing'),(586,'exists'),(357,'expanding'),(253,'expe-'),(433,'experiences'),(612,'extended'),(614,'extensive'),(291,'fabio'),(12,'facets'),(42,'factor'),(45,'factors'),(882,'faeces'),(421,'failed'),(751,'fallowing'),(465,'fat'),(834,'fatigue'),(488,'fats'),(467,'fatty'),(374,'features'),(490,'fed'),(722,'field'),(883,'fifteen'),(474,'fifty-four'),(769,'finally'),(319,'financial'),(330,'financing'),(176,'find'),(61,'findings'),(11,'finland'),(948,'finocchiaro'),(314,'firm'),(600,'flow'),(607,'flowing'),(396,'flows'),(848,'flukes'),(344,'focus'),(162,'fogelin'),(157,'fogelins'),(173,'fogelin’s'),(548,'food'),(766,'found'),(166,'framework'),(247,'frank'),(170,'fruitfully'),(813,'fulani'),(334,'function'),(767,'fungal'),(836,'fungal-like'),(312,'future'),(668,'gender'),(781,'general'),(660,'genuinely'),(763,'gins'),(131,'goal'),(944,'goverance'),(100,'government'),(98,'grade'),(620,'gradient'),(629,'gradients'),(209,'graduation'),(585,'groundwater'),(584,'groundwater-level'),(910,'group'),(378,'growing'),(256,'growth'),(812,'gudali'),(323,'guidance'),(807,'guinea'),(528,'ham'),(180,'hand'),(294,'hansen'),(753,'healthy'),(470,'heavy'),(808,'high'),(65,'higher'),(504,'highest'),(706,'highlights'),(143,'hired'),(126,'hiring'),(875,'hospital'),(881,'human'),(634,'hydraulic'),(583,'hydrogeologic'),(552,'hydrologic'),(597,'hydrologically'),(436,'identification'),(885,'identified'),(571,'immediately'),(388,'impacts'),(119,'implement'),(104,'implementation'),(928,'implemented'),(83,'implications'),(707,'importance'),(858,'improve'),(455,'improves'),(542,'improving'),(695,'include'),(400,'included'),(748,'includes'),(640,'increased'),(538,'increases'),(530,'index'),(246,'indiana'),(690,'individual'),(40,'individually'),(62,'individuals'),(756,'infected'),(768,'infection'),(874,'infections'),(463,'influence'),(609,'influenced'),(633,'influences'),(109,'information'),(205,'informed'),(110,'infused'),(523,'ing'),(636,'inherent'),(899,'inhibitory'),(94,'initiatives'),(382,'input'),(920,'institutions'),(222,'instruction'),(424,'integrates'),(145,'integrating'),(86,'integration'),(289,'intellectual'),(681,'intention'),(652,'intercultural'),(676,'interculturality'),(283,'interest'),(164,'interlocutors'),(443,'internships'),(336,'intuitive'),(152,'investigating'),(329,'investment'),(326,'investors'),(236,'involve'),(698,'involvement'),(435,'involves'),(521,'iodine'),(877,'iran'),(76,'irvine'),(876,'isfahan'),(481,'isoenergetic'),(872,'isolated'),(884,'isolates'),(90,'issue'),(795,'january'),(13,'job'),(298,'john'),(121,'jurisdictions'),(865,'karbasizaed'),(406,'karim'),(9,'kekkonen'),(889,'kelebsiella'),(210,'key'),(202,'knowledge'),(551,'kumiega'),(6,'kwantes'),(616,'kyle'),(249,'laerhoven'),(835,'lameness'),(667,'language'),(368,'large'),(420,'largely'),(794,'largest'),(711,'lasting'),(531,'layers'),(238,'leads'),(213,'learn'),(208,'learners'),(117,'learning'),(441,'led'),(450,'leo'),(838,'lesions'),(99,'level'),(520,'levels'),(429,'leveraged'),(446,'limitations'),(519,'linoleic'),(513,'linolenic'),(550,'lise'),(306,'literature'),(774,'live'),(847,'liver'),(761,'locally'),(262,'long'),(464,'long-term'),(596,'longer'),(801,'longissimus'),(271,'los'),(732,'losses'),(619,'low'),(510,'lowest'),(852,'lungs'),(840,'lymph'),(273,'mackenzie'),(762,'made'),(485,'maize'),(89,'major'),(266,'managed'),(324,'management'),(103,'mandated'),(796,'march'),(557,'marcos'),(409,'margaret'),(75,'mark'),(737,'marked'),(823,'markedly'),(740,'marketable'),(479,'matched'),(754,'material'),(815,'mbororo'),(230,'means'),(825,'meat'),(130,'meet'),(721,'menace'),(657,'met'),(868,'metal'),(905,'metals'),(383,'methodology'),(901,'mic'),(276,'mid-1980s'),(704,'militate'),(898,'minimal'),(267,'mismanaged'),(184,'mistakenly'),(399,'model'),(347,'modeling'),(343,'models'),(405,'modifying'),(645,'monitoring'),(511,'monounsaturated'),(73,'montgomerie'),(775,'months'),(410,'morse'),(727,'mosaic'),(231,'motivate'),(241,'motivation'),(512,'mufa'),(919,'multi-level'),(915,'multidrug-resistance'),(671,'multiethnic'),(670,'multilingual'),(26,'multinational'),(895,'multiple'),(299,'mwandenga'),(715,'nairobi'),(30,'national'),(39,'nations'),(33,'nature'),(367,'necessarily'),(643,'necessitates'),(921,'networked'),(142,'newly'),(656,'nicaragua'),(718,'nigeria'),(15,'nine-nation'),(841,'nodes'),(844,'nodular'),(623,'non-drought'),(594,'normal'),(625,'north'),(873,'nosocomial'),(338,'novak'),(605,'numerical'),(212,'nurturing'),(780,'nutrition'),(543,'nutritional'),(861,'observed'),(316,'offer'),(486,'oil'),(590,'onion'),(169,'order'),(27,'organization'),(46,'organizational'),(439,'organizations'),(845,'organs'),(806,'origin'),(391,'original'),(245,'ostrom'),(663,'overcome'),(292,'paglieri'),(132,'paper'),(805,'parameters'),(525,'parma'),(186,'part'),(214,'participate'),(678,'participatory'),(438,'partner'),(257,'past'),(648,'patricia'),(911,'pattern'),(878,'patterns'),(708,'pedagogy'),(665,'people'),(191,'people’s'),(892,'percent'),(456,'performance'),(459,'period'),(613,'periods'),(353,'permit'),(364,'permits'),(51,'personal'),(908,'persons'),(940,'perverse'),(150,'phillips'),(471,'pig'),(458,'piglets'),(503,'pigs'),(295,'pinto'),(269,'places'),(567,'plan'),(356,'planning'),(752,'planting'),(870,'plasmid'),(890,'pneumoniae'),(84,'policy'),(508,'polyunsaturated'),(286,'pool'),(639,'population'),(742,'portions'),(233,'positive'),(894,'possess'),(325,'potential'),(621,'potentiometric'),(701,'power'),(321,'practical'),(85,'practice'),(797,'pre-slaughter'),(817,'predominant'),(830,'pregnant'),(432,'present'),(219,'presented'),(719,'presents'),(860,'prevent'),(60,'previous'),(563,'primary'),(416,'principles'),(181,'pro-cedural'),(226,'problem'),(935,'problematic'),(187,'procedural'),(770,'processing'),(811,'production'),(175,'productive'),(123,'professional'),(469,'profile'),(879,'profiles'),(582,'program'),(856,'programmes'),(442,'project-based'),(437,'projects'),(862,'promote'),(709,'promoting'),(635,'properties'),(288,'property'),(539,'proportion'),(313,'prospects'),(568,'protect'),(370,'provide'),(101,'province'),(93,'provincial'),(137,'public'),(509,'pufa'),(615,'pumping'),(941,'punishing'),(171,'pursue'),(544,'quality'),(739,'quantity'),(573,'questions'),(574,'raised'),(713,'rana'),(478,'randomized'),(487,'rapeseed'),(638,'rapid'),(139,'rate'),(937,'reaching'),(821,'rearing'),(296,'reason'),(315,'recent'),(610,'recharge'),(297,'reclaimed'),(800,'recorded'),(914,'recovered'),(814,'red'),(738,'reduction'),(744,'reductions'),(502,'reflected'),(363,'reflects'),(172,'refute'),(725,'regarded'),(282,'region'),(354,'regional'),(284,'regions'),(702,'relations'),(909,'relationship'),(335,'rely'),(888,'remaining'),(390,'removed'),(64,'report'),(803,'represent'),(786,'representative'),(395,'represents'),(141,'require'),(118,'required'),(80,'requirements'),(66,'research'),(275,'researchers'),(387,'reservoir'),(365,'reservoirs'),(869,'resistance'),(758,'resistant'),(287,'resource'),(265,'resources'),(115,'respect'),(842,'respiratory'),(138,'response'),(34,'responses'),(599,'result'),(522,'result-'),(134,'results'),(44,'revealed'),(305,'review'),(272,'reyes'),(254,'rienced'),(352,'rights'),(360,'river'),(161,'robert'),(211,'role'),(293,'rome'),(777,'rosanna'),(778,'rossi'),(735,'rot'),(750,'rotation'),(349,'routinely'),(943,'ruled'),(790,'safety'),(494,'samples'),(556,'san'),(926,'sanction'),(932,'sanctioned'),(934,'sanctioning'),(927,'sanctions'),(14,'satisfaction'),(56,'satisfied'),(505,'saturated'),(809,'savannah'),(260,'scholars'),(120,'school'),(280,'sec-'),(549,'security'),(579,'segments'),(386,'selected'),(203,'self-belief'),(224,'self-efficacy'),(918,'self-organization'),(598,'separated'),(107,'september'),(562,'serves'),(413,'service'),(423,'service-learning'),(393,'set'),(426,'setting'),(891,'seventy'),(731,'severe'),(507,'sfa'),(165,'share'),(153,'shared'),(327,'shareholding'),(773,'shelf'),(536,'show'),(827,'showed'),(220,'showing'),(232,'shown'),(618,'shows'),(311,'signal'),(309,'signaling'),(302,'signalling'),(906,'significant'),(534,'significantly'),(826,'similar'),(380,'simplifying'),(381,'simulation'),(604,'simulations'),(25,'single'),(782,'situation'),(79,'skill'),(95,'skills'),(837,'skin'),(492,'slaughter'),(784,'slaughtered'),(491,'slaughtering'),(624,'slopes'),(217,'social'),(215,'society'),(453,'sodium'),(195,'sokoloff'),(227,'solving'),(566,'source'),(565,'south-central'),(570,'species'),(264,'specific'),(113,'specifies'),(726,'spread'),(558,'springs'),(680,'staff'),(127,'standards'),(408,'stanford'),(362,'state'),(355,'statewide'),(723,'storage'),(745,'stored'),(893,'strains'),(125,'strategies'),(221,'strategy'),(394,'streamflows'),(857,'strengthen'),(632,'structural'),(54,'structures'),(440,'student'),(96,'students'),(263,'studied'),(218,'studies'),(17,'study'),(789,'sub-region'),(532,'subcutaneous'),(255,'substantial'),(445,'successful'),(67,'suggest'),(310,'suggests'),(133,'summarizes'),(489,'supplement-'),(466,'supplementation'),(483,'supplemented'),(564,'supply'),(50,'support'),(183,'supporters'),(694,'supporting'),(588,'surface'),(23,'survey'),(415,'sustainability'),(411,'sustainable'),(348,'system'),(345,'systems'),(669,'takes'),(484,'tallow'),(229,'taught'),(430,'teach'),(82,'teachers'),(129,'teachers’'),(545,'technological'),(87,'technology'),(116,'technology”'),(759,'tecto'),(866,'tehran'),(135,'telephone'),(496,'ten'),(346,'texas'),(303,'theory'),(158,'thesis'),(760,'thiabendazole'),(802,'thoracis'),(693,'time'),(268,'times'),(473,'tissue'),(92,'today'),(907,'tolerant'),(428,'tool'),(179,'topic'),(418,'topics'),(151,'toronto'),(281,'tors'),(828,'toughest'),(301,'town'),(863,'trade'),(250,'traditions'),(712,'transformation'),(810,'transhumance'),(498,'treatment'),(535,'treatments'),(646,'trend'),(251,'trends'),(851,'tuberculosis'),(743,'tubers'),(122,'turning'),(376,'types'),(685,'understanding'),(3,'university'),(696,'university’s'),(631,'unknown'),(529,'unsaturation'),(128,'upgrade'),(190,'uphold'),(674,'uraccan'),(8,'urho'),(864,'vajiheh'),(916,'valerie'),(235,'valuable'),(902,'values'),(248,'van'),(622,'variation'),(824,'varied'),(358,'variety'),(587,'vicinity'),(77,'victoria'),(185,'view'),(728,'virus'),(417,'vital'),(611,'vulnerable'),(686,'wales'),(341,'water'),(580,'water-level'),(457,'weaned'),(460,'weaning'),(819,'weight'),(480,'weights'),(593,'wet'),(475,'white'),(193,'widely'),(917,'williamson'),(7,'windsor'),(274,'wittfogel'),(650,'wolverhampton'),(764,'wood'),(946,'woods'),(279,'work'),(285,'world'),(716,'yam'),(733,'yams'),(793,'yaoundé'),(776,'year'),(945,'zita'),(114,'“expected'),(540,'“healthy”');
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(9,3,2),(25,3,2),(25,3,6),(33,3,3),(41,3,2),(49,3,2),(57,3,3),(57,3,8),(65,3,2),(73,3,2),(81,3,3),(89,3,3),(89,3,7),(97,3,4),(105,3,2),(113,3,2),(115,3,28),(115,3,37),(115,3,80),(121,3,2),(129,3,3),(137,3,2),(145,3,2),(1,4,3),(9,5,0),(9,6,1),(9,7,3),(145,7,3),(9,8,4),(9,9,5),(9,10,6),(9,11,7),(10,12,0),(10,13,1),(11,13,14),(11,13,70),(10,14,2),(11,14,15),(11,14,60),(11,14,71),(10,15,3),(10,16,4),(10,17,5),(58,17,2),(59,17,0),(99,17,1),(107,17,43),(114,17,4),(115,17,18),(10,18,6),(11,18,43),(10,19,7),(11,19,44),(11,20,0),(11,21,1),(107,21,39),(107,21,47),(107,21,64),(107,21,127),(107,21,203),(131,21,110),(11,22,2),(11,23,3),(13,23,1),(27,23,62),(29,23,4),(11,24,4),(11,24,48),(13,24,0),(29,24,10),(11,25,5),(11,26,6),(13,26,2),(11,27,7),(11,28,8),(11,29,9),(107,29,176),(11,30,10),(11,30,64),(27,30,7),(29,30,6),(97,30,3),(11,31,11),(115,31,15),(117,31,8),(11,32,12),(11,33,13),(11,33,69),(107,33,157),(11,34,16),(11,35,17),(11,36,18),(11,37,19),(11,38,20),(11,39,21),(11,39,57),(11,40,22),(147,40,3),(11,41,23),(139,41,15),(139,41,36),(11,42,24),(11,42,38),(11,43,25),(107,43,45),(107,43,63),(11,44,26),(11,45,27),(115,45,61),(11,46,28),(11,46,30),(11,46,33),(11,46,40),(11,47,29),(11,47,41),(27,47,27),(11,48,31),(11,49,32),(11,50,34),(27,50,80),(51,50,49),(11,51,35),(11,51,45),(11,52,36),(11,52,46),(11,53,37),(11,54,39),(11,55,42),(11,56,47),(11,56,50),(11,57,49),(11,58,51),(11,59,52),(139,59,62),(11,60,53),(11,61,54),(11,61,62),(51,61,27),(11,62,55),(11,63,56),(11,64,58),(11,65,59),(99,65,96),(11,66,61),(51,66,26),(51,66,40),(115,66,35),(115,66,81),(131,66,1),(11,67,63),(43,67,33),(107,67,98),(11,68,65),(11,69,66),(51,69,31),(11,70,67),(11,71,68),(99,71,87),(25,72,0),(25,73,1),(25,74,3),(27,74,18),(27,74,38),(27,74,68),(29,74,5),(25,75,4),(25,76,5),(25,77,7),(26,78,0),(27,78,54),(27,78,72),(29,78,2),(26,79,1),(26,80,2),(26,81,3),(75,81,25),(26,82,4),(27,82,40),(27,82,79),(27,82,84),(26,83,5),(51,83,65),(75,83,17),(107,83,87),(26,84,6),(75,84,16),(75,84,22),(26,85,7),(27,86,0),(27,87,1),(27,87,10),(27,87,28),(29,87,1),(27,88,2),(50,88,3),(51,88,70),(27,89,3),(51,89,0),(107,89,9),(107,89,85),(27,90,4),(75,90,14),(27,91,5),(51,91,2),(53,91,0),(91,91,8),(93,91,2),(115,91,7),(27,92,6),(27,93,8),(29,93,7),(27,94,9),(27,95,11),(27,95,55),(27,95,73),(29,95,3),(51,95,6),(27,96,12),(27,96,34),(115,96,39),(27,97,13),(27,98,14),(27,99,15),(107,99,164),(107,99,195),(27,100,16),(27,101,17),(27,101,67),(27,102,19),(27,103,20),(27,104,21),(27,105,22),(27,105,29),(27,105,43),(114,105,2),(115,105,43),(115,105,53),(115,105,65),(27,106,23),(27,107,24),(27,108,25),(27,109,26),(27,110,30),(27,111,31),(27,112,32),(27,113,33),(27,114,35),(27,115,36),(27,116,37),(27,117,39),(51,117,38),(51,117,50),(51,117,56),(90,117,0),(93,117,4),(27,118,41),(42,118,3),(43,118,19),(43,118,41),(27,119,42),(27,120,44),(27,120,65),(27,120,74),(51,120,24),(27,121,45),(27,121,66),(27,121,75),(27,122,46),(27,123,47),(29,123,8),(27,124,48),(29,124,9),(59,124,6),(91,124,3),(93,124,0),(115,124,31),(115,124,63),(27,125,49),(27,125,81),(115,125,44),(123,125,5),(123,125,50),(27,126,50),(27,127,51),(27,128,52),(27,129,53),(27,130,56),(27,131,57),(51,131,1),(27,132,58),(51,132,15),(27,133,59),(27,134,60),(99,134,112),(139,134,82),(27,135,61),(27,136,63),(27,137,64),(27,138,69),(107,138,165),(27,139,70),(27,140,71),(27,141,76),(27,142,77),(27,143,78),(27,144,82),(27,144,83),(123,144,6),(29,145,0),(33,146,0),(33,147,1),(33,148,2),(41,149,0),(41,150,1),(41,151,3),(42,152,0),(43,152,16),(42,153,1),(43,153,17),(43,153,29),(43,153,38),(42,154,2),(43,154,6),(43,154,18),(43,154,23),(43,154,42),(42,155,4),(43,155,12),(43,155,21),(43,155,44),(42,156,5),(42,157,6),(42,158,7),(42,159,8),(42,160,9),(43,161,0),(43,162,1),(43,162,34),(43,163,2),(43,164,3),(43,165,4),(43,166,5),(51,166,58),(43,167,7),(43,167,26),(43,167,39),(43,167,50),(50,167,2),(51,167,20),(43,168,8),(43,168,31),(43,169,9),(51,169,21),(43,170,10),(43,171,11),(43,172,13),(43,173,14),(43,174,15),(43,175,20),(43,175,43),(43,176,22),(43,177,24),(43,178,25),(61,178,0),(61,178,3),(131,178,48),(131,178,82),(43,179,27),(43,179,53),(43,180,28),(43,180,54),(43,181,30),(43,182,32),(43,183,35),(43,184,36),(43,185,37),(43,186,40),(51,186,39),(43,187,45),(43,188,46),(43,189,47),(43,190,48),(43,191,49),(43,192,51),(43,193,52),(123,193,16),(49,194,0),(49,195,1),(49,196,3),(49,197,4),(50,198,0),(83,198,56),(107,198,11),(50,199,1),(51,199,19),(51,200,3),(51,201,4),(51,201,46),(51,201,60),(51,202,5),(51,203,7),(51,204,8),(51,205,9),(59,205,32),(51,206,10),(51,206,11),(51,207,12),(115,207,10),(51,208,13),(51,209,14),(51,210,16),(51,211,17),(51,212,18),(51,213,22),(51,213,69),(51,214,23),(51,215,25),(51,216,28),(107,216,44),(51,217,29),(51,217,63),(91,217,14),(115,217,91),(117,217,11),(51,218,30),(51,219,32),(83,219,55),(123,219,13),(51,220,33),(51,221,34),(51,222,35),(51,223,36),(51,224,37),(51,224,55),(51,224,67),(51,225,41),(51,226,42),(51,227,43),(51,228,44),(51,228,52),(51,229,45),(51,230,47),(51,231,48),(51,232,51),(51,233,53),(51,234,54),(83,234,79),(99,234,138),(51,235,57),(51,236,59),(51,237,61),(51,238,62),(51,239,64),(51,240,66),(51,241,68),(51,242,71),(91,242,58),(53,243,1),(57,244,0),(57,245,1),(57,246,2),(57,246,7),(57,247,4),(57,248,5),(57,249,6),(58,250,0),(58,251,1),(58,252,3),(59,252,1),(59,252,28),(59,253,2),(59,254,3),(59,255,4),(59,256,5),(98,256,3),(107,256,185),(59,257,7),(107,257,79),(107,257,101),(59,258,8),(59,259,9),(59,260,10),(59,260,34),(59,261,11),(59,261,35),(59,262,12),(59,263,13),(59,263,26),(59,264,14),(59,264,27),(82,264,5),(59,265,15),(59,266,16),(59,267,17),(59,268,18),(59,269,19),(59,270,20),(59,271,21),(59,272,22),(59,273,23),(59,274,24),(59,275,25),(59,276,29),(59,277,30),(59,278,31),(59,279,33),(59,280,36),(59,281,37),(59,282,38),(115,282,25),(115,282,76),(139,282,88),(59,283,39),(147,283,36),(59,284,40),(59,285,41),(91,285,38),(61,286,1),(61,287,2),(61,288,4),(61,289,5),(61,290,6),(65,291,0),(65,292,1),(65,293,3),(66,294,0),(66,295,1),(66,296,2),(66,297,3),(73,298,0),(81,298,0),(73,299,1),(73,300,3),(105,300,3),(73,301,4),(105,301,4),(74,302,0),(74,303,1),(75,303,1),(74,304,2),(75,304,3),(74,305,3),(123,305,0),(74,306,4),(74,307,5),(75,307,9),(74,308,6),(75,308,10),(75,308,13),(75,309,0),(75,310,2),(107,310,67),(75,311,4),(75,312,5),(91,312,24),(91,312,59),(107,312,204),(75,313,6),(75,314,7),(75,315,8),(75,316,11),(75,317,12),(75,318,15),(75,319,18),(75,320,19),(75,321,20),(75,322,21),(75,322,37),(75,323,23),(75,324,24),(75,324,36),(82,324,7),(83,324,20),(83,324,52),(107,324,89),(122,324,2),(123,324,4),(123,324,49),(75,325,26),(107,325,76),(139,325,85),(75,326,27),(75,327,28),(75,328,29),(75,329,30),(75,330,31),(75,331,32),(75,332,33),(75,332,38),(147,332,16),(147,332,35),(75,333,34),(75,334,35),(75,335,39),(75,336,40),(75,337,41),(81,338,1),(81,339,2),(82,340,0),(82,341,1),(82,341,6),(83,341,1),(83,341,8),(83,341,19),(83,341,25),(83,341,51),(83,341,64),(83,341,80),(83,341,106),(85,341,0),(107,341,4),(107,341,163),(107,341,187),(109,341,0),(82,342,2),(83,342,2),(83,342,107),(107,342,90),(82,343,3),(82,344,4),(83,344,50),(82,345,8),(83,345,53),(83,346,0),(83,346,105),(107,346,7),(83,347,3),(83,347,18),(83,347,35),(83,347,38),(83,347,108),(83,348,4),(83,348,11),(83,348,36),(83,348,61),(83,348,78),(83,348,102),(83,348,109),(131,348,50),(131,348,62),(83,349,5),(83,350,6),(83,350,94),(83,351,7),(83,352,9),(83,352,65),(83,352,81),(83,353,10),(83,354,12),(131,354,127),(83,355,13),(83,356,14),(83,357,15),(91,357,61),(83,358,16),(83,359,17),(83,360,21),(83,360,82),(83,360,99),(83,360,112),(107,360,58),(107,360,116),(83,361,22),(83,362,23),(83,363,24),(83,363,62),(83,364,26),(83,365,27),(83,365,67),(83,366,28),(83,366,49),(83,367,29),(83,368,30),(99,368,15),(83,369,31),(83,370,32),(107,370,202),(131,370,2),(83,371,33),(83,372,34),(83,373,37),(83,373,74),(83,374,39),(83,375,40),(83,376,41),(83,377,42),(83,377,44),(83,378,43),(83,379,45),(83,380,46),(83,381,47),(83,382,48),(83,382,88),(83,383,54),(83,383,93),(83,384,57),(83,384,91),(83,384,96),(83,385,58),(83,385,71),(83,385,89),(83,385,92),(83,385,110),(83,386,59),(83,386,77),(131,386,32),(83,387,60),(83,387,101),(83,388,63),(83,389,66),(83,390,68),(83,391,69),(83,391,85),(83,392,70),(83,392,86),(83,393,72),(107,393,128),(83,394,73),(83,395,75),(83,396,76),(83,397,83),(83,397,113),(83,398,84),(83,399,87),(83,399,97),(91,399,27),(91,399,39),(91,399,53),(91,399,62),(107,399,97),(115,399,46),(115,399,49),(83,400,90),(83,401,95),(83,402,98),(83,402,111),(83,403,100),(83,404,103),(91,404,32),(83,405,104),(89,406,0),(89,407,1),(89,408,2),(89,408,6),(91,408,34),(89,409,4),(89,410,5),(90,411,1),(91,411,2),(91,411,22),(91,411,30),(91,411,37),(90,412,2),(91,412,23),(91,412,31),(91,412,48),(90,413,3),(91,413,15),(93,413,3),(91,414,0),(91,415,1),(93,415,5),(91,416,4),(91,417,5),(91,418,6),(91,419,7),(93,419,1),(91,420,9),(91,421,10),(91,422,11),(107,422,36),(91,423,12),(91,423,28),(91,424,13),(91,425,16),(91,426,17),(147,426,1),(147,426,6),(91,427,18),(91,428,19),(91,429,20),(91,430,21),(91,430,29),(91,431,25),(91,431,36),(91,432,26),(91,433,33),(91,434,35),(91,435,40),(91,436,41),(91,437,42),(91,438,43),(91,438,51),(91,439,44),(91,439,52),(91,440,45),(91,441,46),(91,442,47),(91,443,49),(91,444,50),(91,445,54),(91,446,55),(91,447,56),(115,447,0),(91,448,57),(115,448,11),(91,449,60),(97,450,0),(97,451,1),(97,452,2),(98,453,0),(98,454,1),(98,455,2),(98,456,4),(98,457,5),(98,458,6),(98,459,7),(123,459,96),(98,460,8),(99,461,0),(131,461,0),(131,461,115),(99,462,2),(99,463,3),(107,463,175),(130,463,0),(99,464,4),(99,464,114),(130,464,1),(99,465,5),(99,465,134),(99,465,141),(131,465,70),(99,466,6),(99,466,116),(99,466,125),(99,467,7),(99,467,42),(99,467,48),(99,467,58),(99,467,66),(99,467,71),(99,467,118),(99,467,131),(130,467,5),(99,468,8),(99,468,43),(99,468,49),(99,468,59),(99,468,67),(99,468,72),(99,468,79),(99,468,84),(99,468,89),(99,468,119),(130,468,6),(99,469,9),(99,469,120),(138,469,5),(139,469,65),(99,470,10),(99,470,121),(130,470,8),(138,470,1),(139,470,1),(139,470,51),(139,470,58),(139,470,74),(99,471,11),(99,471,122),(99,471,133),(99,472,12),(99,472,123),(99,473,13),(99,473,108),(99,473,124),(99,474,14),(99,475,16),(131,475,52),(99,476,17),(99,477,18),(99,478,19),(99,479,20),(99,480,21),(99,481,22),(99,482,23),(99,483,24),(99,483,51),(99,484,25),(99,485,26),(99,486,27),(99,486,29),(99,486,127),(99,487,28),(99,487,126),(99,488,30),(99,488,52),(99,488,117),(130,488,4),(99,489,31),(99,490,32),(99,490,55),(99,490,62),(99,490,75),(99,491,33),(99,492,34),(131,492,30),(99,493,35),(99,493,45),(99,493,53),(99,493,92),(99,493,107),(130,493,10),(99,494,36),(99,495,37),(107,495,65),(99,496,38),(99,497,39),(99,498,40),(99,498,86),(99,499,41),(99,500,44),(99,500,50),(130,500,7),(131,500,38),(99,501,46),(99,502,47),(99,503,54),(101,503,0),(130,503,9),(99,504,56),(99,504,63),(99,504,76),(99,505,57),(99,506,60),(99,506,64),(99,506,74),(99,506,77),(131,506,71),(99,507,61),(99,508,65),(99,509,68),(99,510,69),(99,511,70),(99,512,73),(99,513,78),(99,514,80),(99,514,97),(99,515,81),(99,516,82),(99,517,83),(99,518,85),(99,519,88),(99,520,90),(99,520,95),(107,520,139),(107,520,152),(99,521,91),(99,522,93),(99,523,94),(99,524,98),(99,525,99),(99,526,100),(99,527,101),(99,528,102),(99,529,103),(99,530,104),(99,531,105),(99,532,106),(99,533,109),(99,534,110),(107,534,149),(99,535,111),(99,536,113),(99,537,115),(130,537,3),(99,538,128),(123,538,93),(99,539,129),(99,540,130),(99,541,132),(99,542,135),(99,543,136),(99,544,137),(99,544,140),(131,544,12),(131,544,36),(131,544,69),(99,545,139),(99,546,142),(99,547,143),(101,548,1),(133,548,1),(101,549,2),(133,549,2),(105,550,0),(105,551,1),(106,552,0),(107,552,25),(107,552,61),(107,552,177),(106,553,1),(106,554,2),(107,554,0),(107,554,32),(107,554,92),(106,555,3),(107,555,1),(107,555,33),(107,555,93),(107,555,173),(106,556,4),(107,556,18),(107,556,27),(107,556,80),(107,556,102),(107,556,134),(107,556,179),(107,556,198),(106,557,5),(107,557,19),(107,557,81),(107,557,103),(107,557,135),(107,557,180),(107,557,199),(106,558,6),(106,558,8),(107,558,10),(107,558,20),(107,558,30),(107,558,82),(107,558,84),(107,558,105),(107,558,136),(107,558,145),(107,558,182),(107,558,200),(106,559,7),(107,559,29),(107,559,83),(107,559,104),(107,559,144),(107,559,181),(106,560,9),(107,560,34),(107,560,66),(107,560,106),(107,560,140),(107,560,153),(106,561,10),(107,561,35),(107,561,62),(107,561,107),(131,561,23),(131,561,84),(107,562,2),(115,562,72),(107,563,3),(107,564,5),(131,564,121),(107,565,6),(107,566,8),(107,566,156),(107,567,12),(107,568,13),(123,568,81),(107,569,14),(107,570,15),(107,571,16),(107,572,17),(107,573,21),(107,573,37),(107,574,22),(107,575,23),(107,576,24),(107,577,26),(107,577,49),(107,577,54),(107,577,69),(107,577,109),(107,578,28),(107,579,31),(107,579,74),(107,580,38),(107,581,40),(107,582,41),(107,582,197),(107,583,42),(107,583,205),(107,584,46),(107,585,48),(107,585,68),(107,585,77),(107,585,91),(107,585,108),(107,585,194),(107,586,50),(107,587,51),(107,587,124),(107,588,52),(107,588,133),(107,588,147),(107,589,53),(107,590,55),(107,590,113),(107,591,56),(107,591,114),(107,592,57),(107,592,115),(107,593,59),(107,594,60),(107,595,70),(107,596,71),(107,597,72),(107,598,73),(107,599,75),(107,600,78),(107,601,86),(107,602,88),(107,603,94),(107,604,95),(107,605,96),(107,606,99),(107,607,100),(107,608,110),(107,608,117),(107,609,111),(107,610,112),(107,610,121),(107,611,118),(107,612,119),(107,613,120),(107,613,142),(107,613,155),(107,614,122),(107,615,123),(107,616,125),(107,616,137),(107,616,143),(107,616,166),(107,616,189),(107,617,126),(107,617,190),(107,617,201),(107,618,129),(107,619,130),(131,619,72),(107,620,131),(107,621,132),(107,621,146),(107,621,160),(107,622,138),(107,623,141),(107,623,154),(107,624,148),(107,625,150),(107,626,151),(107,627,158),(107,627,174),(107,628,159),(107,629,161),(107,630,162),(107,631,167),(107,632,168),(107,633,169),(107,634,170),(107,635,171),(107,636,172),(107,637,178),(107,638,183),(107,639,184),(107,640,186),(107,641,188),(107,642,191),(107,643,192),(107,644,193),(107,645,196),(107,646,206),(107,647,207),(113,648,0),(113,649,1),(113,650,3),(114,651,0),(114,652,1),(115,652,42),(115,652,64),(114,653,3),(115,653,17),(114,654,5),(115,654,20),(114,655,6),(115,655,21),(114,656,7),(115,656,22),(115,657,1),(115,658,2),(117,658,0),(115,659,3),(117,659,1),(115,660,4),(115,661,5),(115,662,6),(117,662,2),(115,663,8),(115,664,9),(115,665,12),(115,666,13),(115,666,47),(115,666,86),(115,667,14),(117,667,7),(115,668,16),(117,668,9),(115,669,19),(115,670,23),(117,670,3),(115,671,24),(117,671,4),(115,672,26),(115,673,27),(115,673,50),(115,674,29),(115,675,30),(115,676,32),(115,676,88),(115,677,33),(115,678,34),(115,678,84),(117,678,5),(115,679,36),(131,679,41),(115,680,38),(115,681,40),(115,682,41),(115,683,45),(115,684,48),(115,685,51),(115,686,52),(115,687,54),(115,688,55),(115,689,56),(115,690,57),(147,690,30),(115,691,58),(115,691,71),(115,692,59),(115,693,60),(115,694,62),(115,695,66),(115,696,67),(115,697,68),(115,698,69),(115,699,70),(115,700,73),(115,701,74),(115,702,75),(115,703,77),(115,704,78),(115,705,79),(117,705,10),(115,706,82),(115,707,83),(115,708,85),(117,708,6),(115,709,87),(115,710,89),(115,711,90),(115,712,92),(117,712,12),(121,713,0),(121,714,1),(121,715,3),(122,716,0),(123,716,3),(123,716,20),(123,716,34),(123,716,82),(123,716,89),(122,717,1),(123,717,2),(123,717,12),(123,717,19),(123,717,33),(123,717,55),(123,717,70),(131,717,125),(122,718,3),(123,718,9),(123,719,1),(123,720,7),(123,720,53),(123,721,8),(123,722,10),(123,722,18),(123,722,54),(123,723,11),(123,723,32),(123,723,69),(123,723,79),(123,723,86),(123,724,14),(123,725,15),(123,726,17),(123,727,21),(123,728,22),(123,729,23),(123,730,24),(123,730,30),(131,730,19),(123,731,25),(123,731,46),(123,732,26),(123,733,27),(123,733,37),(123,733,48),(123,734,28),(123,734,35),(123,734,75),(123,735,29),(123,735,36),(123,736,31),(123,737,38),(123,738,39),(123,739,40),(123,740,41),(123,741,42),(123,742,43),(123,743,44),(123,743,83),(123,743,90),(123,744,45),(123,745,47),(123,746,51),(123,747,52),(123,748,56),(123,749,57),(123,749,65),(123,750,58),(123,751,59),(123,752,60),(123,753,61),(139,753,12),(139,753,38),(139,753,60),(123,754,62),(123,755,63),(123,756,64),(123,757,66),(123,757,68),(123,758,67),(123,759,71),(123,760,72),(123,761,73),(123,762,74),(147,762,23),(123,763,76),(123,764,77),(123,765,78),(123,766,80),(123,767,84),(123,768,85),(139,768,87),(123,769,87),(123,770,88),(123,771,91),(123,772,92),(123,773,94),(123,774,95),(123,775,97),(123,776,98),(131,776,67),(129,777,0),(129,778,1),(129,779,2),(130,780,2),(131,781,3),(131,782,4),(131,783,5),(131,783,25),(131,783,43),(131,783,63),(131,783,117),(133,783,0),(131,784,6),(131,784,35),(131,784,80),(131,785,7),(131,785,18),(131,786,8),(131,787,9),(131,788,10),(131,789,11),(131,790,13),(131,791,14),(131,791,120),(131,792,15),(131,793,16),(131,794,17),(131,795,20),(131,796,21),(131,797,22),(131,798,24),(131,799,26),(131,799,31),(131,799,99),(131,800,27),(131,801,28),(131,801,39),(131,802,29),(131,802,40),(131,803,33),(131,804,34),(131,805,37),(131,806,42),(131,807,44),(131,808,45),(147,808,28),(131,809,46),(131,810,47),(131,811,49),(131,811,118),(131,812,51),(131,812,75),(131,813,53),(131,814,54),(131,815,55),(131,816,56),(131,816,74),(131,817,57),(131,818,58),(131,819,59),(131,820,60),(131,820,108),(131,821,61),(131,822,64),(131,823,65),(131,824,66),(131,825,68),(131,825,78),(131,826,73),(131,827,76),(131,828,77),(131,829,79),(131,830,81),(131,831,83),(131,832,85),(131,833,86),(131,834,87),(131,835,88),(131,836,89),(131,837,90),(131,838,91),(131,838,98),(131,839,92),(131,840,93),(131,841,94),(131,842,95),(131,843,96),(131,844,97),(131,845,100),(131,846,101),(131,846,105),(131,847,102),(131,848,103),(131,849,104),(131,850,106),(147,850,18),(131,851,107),(131,852,109),(131,853,111),(131,854,112),(131,855,113),(131,856,114),(131,857,116),(131,858,119),(131,859,122),(131,860,123),(131,861,124),(131,862,126),(131,863,128),(137,864,0),(137,865,1),(137,866,3),(138,867,0),(139,867,0),(139,867,67),(138,868,2),(139,868,2),(139,868,59),(138,869,3),(139,869,3),(139,869,34),(139,869,68),(139,869,73),(138,870,4),(139,870,5),(139,870,64),(139,870,71),(138,871,6),(139,871,7),(139,871,84),(138,872,7),(139,872,9),(139,872,29),(139,872,55),(139,872,79),(138,873,8),(139,873,10),(139,873,18),(139,873,30),(139,873,80),(139,873,86),(138,874,9),(139,874,11),(139,874,19),(139,874,31),(139,874,81),(138,875,10),(139,875,56),(138,876,11),(138,877,12),(139,878,4),(139,879,6),(139,880,8),(139,881,13),(139,881,39),(139,882,14),(139,882,40),(139,882,50),(139,883,16),(139,884,17),(139,885,20),(139,886,21),(139,887,22),(139,888,23),(139,889,24),(139,890,25),(139,891,26),(139,892,27),(139,893,28),(139,893,37),(139,893,47),(139,893,54),(139,893,78),(139,894,32),(139,895,33),(139,896,35),(139,896,76),(139,897,41),(139,898,42),(139,899,43),(139,900,44),(139,901,45),(139,902,46),(139,903,48),(139,904,49),(139,905,52),(139,905,75),(139,906,53),(139,907,57),(139,908,61),(139,909,63),(139,910,66),(147,910,37),(139,911,69),(139,912,70),(139,913,72),(139,914,77),(139,915,83),(145,916,0),(145,917,1),(146,918,0),(149,918,0),(146,919,1),(149,919,1),(146,920,2),(149,920,2),(146,921,3),(146,922,4),(147,923,0),(147,924,2),(147,924,9),(147,924,31),(147,925,4),(147,926,5),(147,927,7),(147,928,8),(147,929,10),(147,929,24),(147,930,11),(147,931,12),(147,932,13),(147,933,14),(147,933,33),(147,934,15),(147,934,26),(147,934,34),(147,935,17),(147,936,19),(147,937,20),(147,938,21),(147,939,22),(147,940,25),(147,941,27),(147,942,29),(147,943,32),(149,944,3),(153,945,0),(153,946,1),(153,947,2),(154,948,0),(154,949,1),(154,949,2);
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
INSERT INTO `submissions` VALUES (1,1,1,'2022-05-11 02:09:04','2022-05-11 02:09:04','2022-05-11 02:09:04',5,'en_US',1,0,0),(2,1,2,'2022-05-11 02:09:59','2022-05-11 02:09:32','2022-05-11 02:09:32',5,'en_US',3,0,0),(3,1,4,'2022-05-11 02:11:10','2022-05-11 02:10:35','2022-05-11 02:10:35',5,'en_US',3,0,0),(4,1,5,'2022-05-11 02:11:59','2022-05-11 02:11:37','2022-05-11 02:11:37',5,'en_US',4,0,0),(5,1,6,'2022-05-11 02:12:40','2022-05-11 02:12:31','2022-05-11 02:12:31',5,'en_US',3,0,0),(6,1,7,'2022-05-11 02:13:15','2022-05-11 02:13:07','2022-05-11 02:13:07',5,'en_US',3,0,0),(7,1,8,'2022-05-11 02:13:58','2022-05-11 02:13:49','2022-05-11 02:13:49',5,'en_US',3,0,0),(8,1,9,'2022-05-11 02:14:33','2022-05-11 02:14:25','2022-05-11 02:14:25',5,'en_US',3,0,0),(9,1,10,'2022-05-11 02:15:11','2022-05-11 02:15:02','2022-05-11 02:15:02',5,'en_US',3,0,0),(10,1,11,'2022-05-11 02:15:48','2022-05-11 02:15:39','2022-05-11 02:15:39',5,'en_US',3,0,0),(11,1,12,'2022-05-11 02:16:29','2022-05-11 02:16:20','2022-05-11 02:16:20',5,'en_US',3,0,0),(12,1,13,'2022-05-11 02:17:07','2022-05-11 02:16:59','2022-05-11 02:16:59',5,'en_US',3,0,0),(13,1,14,'2022-05-11 02:17:46','2022-05-11 02:17:37','2022-05-11 02:17:37',5,'en_US',3,0,0),(14,1,15,'2022-05-11 02:18:25','2022-05-11 02:18:16','2022-05-11 02:18:16',5,'en_US',3,0,0),(15,1,16,'2022-05-11 02:19:02','2022-05-11 02:18:53','2022-05-11 02:18:53',5,'en_US',3,0,0),(16,1,17,'2022-05-11 02:19:41','2022-05-11 02:19:31','2022-05-11 02:19:31',5,'en_US',3,0,0),(17,1,18,'2022-05-11 02:20:20','2022-05-11 02:20:11','2022-05-11 02:20:11',5,'en_US',3,0,0),(18,1,19,'2022-05-11 02:20:57','2022-05-11 02:20:48','2022-05-11 02:20:48',5,'en_US',3,0,0),(19,1,20,'2022-05-11 02:21:34','2022-05-11 02:21:25','2022-05-11 02:21:25',5,'en_US',3,0,0);
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$waTAsrKVjp5WQXOwNt7wnOSwml5SQMDfv4UybzervyOGHTkkhygZC','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-11 02:05:58',NULL,'2022-05-11 02:08:07',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$sW7m0s5bQSBUiMzG62AEre0kpRswVh8rnHSkZK4509UzWKQJ5B9EC','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-05-11 02:07:04',NULL,'2022-05-11 02:07:55',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$.HoIap74oRXn/1CCM9qM4OxLAI57/T2txY37w2Hxlh.hr.Zp.yAJy','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-05-11 02:07:13',NULL,'2022-05-11 02:21:26',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$lSxTu2V1m0qbsHXXxNPBZuWKsf3dUI6E4G/p2iJscTg5COrBdg4SW','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-05-11 02:07:22',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$9crUgfiT8bUaKW32ZsDgFOxiefC0gFTswkogykGnc5WJut/zbWAiu','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-05-11 02:07:34',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$tzljjL6dSkeY1SZ7QDc0XuelW0L869s6fqtStVJfRRqNROuA9GHli','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-05-11 02:07:46',NULL,NULL,0,0,NULL,0,NULL,1),(7,'ccorino','$2y$10$geyYhvbx2bpl71ntXEXFi.GfwbAGkJwWM1RCi2neE18QtYsq3r.Uy','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-05-11 02:08:40',NULL,'2022-05-11 02:08:41',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$SvNiRM9Udh4Omka4A1FrbOJOCvdv9O9lsT/f3LGbfjBZgEr2JxWG.','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-05-11 02:09:08',NULL,'2022-05-11 02:09:08',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$P1a26JWY2It3ZzwQMrfOAe7hK4tbh/wmq/.HQG6.goxBZkceEEU8q','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-05-11 02:10:04',NULL,'2022-05-11 02:10:04',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$q8VWTL5nzw5C9rYER/4oF.DT3p.iJF0w6LAHKqKhnuHQcDol/.At.','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG',NULL,NULL,NULL,'2022-05-11 02:11:16',NULL,'2022-05-11 02:11:16',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$Kghb5cdMf70636hQfwX4puIwPZd0UwW1aapUd9rezUhVTzJi.oXm2','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-05-11 02:12:07',NULL,'2022-05-11 02:12:07',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$Hei/aRbVxPNzc97w29uyQ.GvR8iMqnTboFhFMBibwUva9.fjLTNKC','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE',NULL,NULL,NULL,'2022-05-11 02:12:45',NULL,'2022-05-11 02:12:46',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$..TZmtHYzLlco/6vmBgjFesbu/wvHDC1xoTSYet.4OcPDijAr07T.','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-05-11 02:13:20',NULL,'2022-05-11 02:13:20',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$I0PEX.ziCZ0LR5n6LcwEfOtbQVEWYZS7T6BunWCyHp2ajNcoXLYJO','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-05-11 02:14:04',NULL,'2022-05-11 02:14:04',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$KRYl0Wd8.a/GpZHCd2frsOen9u1BcOP3geujEpkDPXbpxAQsnL/qu','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-05-11 02:14:39',NULL,'2022-05-11 02:14:39',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$sdorM9sXUaftKRKTfQLQ6uXLZ4sheqPYqLH2AOQo6g1D5Nfjtq5bm','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK',NULL,NULL,NULL,'2022-05-11 02:15:16',NULL,'2022-05-11 02:15:17',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$ExSQ677miL9FlDDsCcoi8eMhN5xRqLUmHvu5.0BXg2654tdLzg2A6','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-05-11 02:15:54',NULL,'2022-05-11 02:15:54',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$2y.RvJZxLbJ39TdhjGQhBuvOkR23fqCPRIsTeDweMqEOO/Z8H2Fgq','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU',NULL,NULL,NULL,'2022-05-11 02:16:35',NULL,'2022-05-11 02:16:36',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$2PGjGjgDQGwa8NE4c6PMpe2WY2qN3L7BQQO31sskTOm/pRqFv17G.','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-05-11 02:17:13',NULL,'2022-05-11 02:17:14',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$4kYHrvm1ys3hgjGsahDJ.e1O2gz5qjcp8sA5o0rw7DPAzV4j5XTiW','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB',NULL,NULL,NULL,'2022-05-11 02:17:52',NULL,'2022-05-11 02:17:52',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$oL1m0kIHK8dYEdJh5Pksl.wbMKnJcpd9bEhyhPMWkx.qkDM8g14A.','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE',NULL,NULL,NULL,'2022-05-11 02:18:31',NULL,'2022-05-11 02:18:31',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$YtLzN3YStdxwG6IfOkId/OrJ6vgq9moHT9v4WBZhcaEPRj3QeE.Vq','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES',NULL,NULL,NULL,'2022-05-11 02:19:08',NULL,'2022-05-11 02:19:08',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$I32nG/zgzGyIi5UZP9hChu4gp6SRiBwztAw7li22zL.fgNUxw919y','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR',NULL,NULL,NULL,'2022-05-11 02:19:47',NULL,'2022-05-11 02:19:47',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$OMI11eSIv/wBLbgwxakMfe2vt4abjpkla9vVCOhLyUgLohgsyf98G','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-05-11 02:20:26',NULL,'2022-05-11 02:20:26',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$FE97njqN7b58Um0R3sPwXezOQH32unxRjUCSz9Hp4TSfVQGkQOIX2','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-05-11 02:21:03',NULL,'2022-05-11 02:21:03',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-05-11 02:05:58',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2022-05-11 02:05:58',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.generic','usageEvent','',0,0),(1,0,1,0,'2022-05-11 02:05:58',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,2,0,0,'2022-05-11 02:05:58',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,1,3,0,'2022-05-11 02:05:58',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(2,2,0,0,'2022-05-11 02:05:58',1,'plugins.generic','crossref','',0,0),(1,2,0,0,'2022-05-11 02:05:58',1,'plugins.generic','acron','AcronPlugin',1,1),(0,1,0,0,'2022-05-11 02:05:58',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,1,0,0,'2022-05-11 02:05:58',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,1,0,0,'2022-05-11 02:05:58',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2022-05-11 02:05:58',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2022-05-11 02:05:55',1,'core','ops','',0,1);
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

-- Dump completed on 2022-05-11  2:21:35
