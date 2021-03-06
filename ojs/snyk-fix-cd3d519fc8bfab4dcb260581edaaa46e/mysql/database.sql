-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: ojs-ci
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
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`)
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
INSERT INTO `author_settings` VALUES (1,'','country','ZA'),(1,'en_US','affiliation','University of Cape Town'),(1,'en_US','familyName','Mwandenga'),(1,'en_US','givenName','Alan'),(2,'','country','ZA'),(2,'en_US','affiliation',NULL),(2,'en_US','biography',NULL),(2,'en_US','familyName','Ipsum'),(2,'en_US','givenName','Lorem'),(2,'en_US','preferredPublicName',NULL),(2,'fr_CA','affiliation',NULL),(2,'fr_CA','biography',NULL),(2,'fr_CA','familyName',NULL),(2,'fr_CA','givenName',NULL),(2,'fr_CA','preferredPublicName',NULL),(3,'','country','ZA'),(3,'en_US','affiliation','University of Cape Town'),(3,'en_US','familyName','Mwandenga Version 2'),(3,'en_US','givenName','Alan'),(4,'','country','ZA'),(4,'en_US','familyName','Ipsum'),(4,'en_US','givenName','Lorem'),(5,'','country','IT'),(5,'en_US','affiliation','University of Bologna'),(5,'en_US','familyName','Corino'),(5,'en_US','givenName','Carlo'),(6,'','country','CA'),(6,'en_US','affiliation','University of Windsor'),(6,'en_US','familyName','Kwantes'),(6,'en_US','givenName','Catherine'),(7,'','country','CA'),(7,'en_US','affiliation','University of Alberta'),(7,'en_US','familyName','Montgomerie'),(7,'en_US','givenName','Craig'),(8,'','country','CA'),(8,'','orcid',''),(8,'','url',''),(8,'en_US','affiliation','University of Victoria'),(8,'en_US','biography',''),(8,'en_US','familyName','Irvine'),(8,'en_US','givenName','Mark'),(8,'en_US','preferredPublicName',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(9,'','country','EG'),(9,'en_US','affiliation','Alexandria University'),(9,'en_US','familyName','Diouf'),(9,'en_US','givenName','Diaga'),(10,'','country','CA'),(10,'en_US','affiliation','University of Toronto'),(10,'en_US','familyName','Phillips'),(10,'en_US','givenName','Dana'),(11,'','country','IE'),(11,'en_US','affiliation','University College Cork'),(11,'en_US','familyName','Sokoloff'),(11,'en_US','givenName','Domatilia'),(12,'','country','US'),(12,'en_US','affiliation','Indiana University'),(12,'en_US','familyName','Ostrom'),(12,'en_US','givenName','Elinor'),(13,'','country','US'),(13,'','orcid',''),(13,'','url',''),(13,'en_US','affiliation','Indiana University'),(13,'en_US','biography',''),(13,'en_US','familyName','van Laerhoven'),(13,'en_US','givenName','Frank'),(13,'en_US','preferredPublicName',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(14,'','country','IT'),(14,'en_US','affiliation','University of Rome'),(14,'en_US','familyName','Paglieri'),(14,'en_US','givenName','Fabio'),(15,'','country','DK'),(15,'en_US','affiliation','Aalborg University'),(15,'en_US','familyName','Novak'),(15,'en_US','givenName','John'),(16,'','country','US'),(16,'en_US','affiliation','Stanford University'),(16,'en_US','familyName','Al-Khafaji'),(16,'en_US','givenName','Karim'),(17,'','country','US'),(17,'','orcid',''),(17,'','url',''),(17,'en_US','affiliation','Stanford University'),(17,'en_US','biography',''),(17,'en_US','familyName','Morse'),(17,'en_US','givenName','Margaret'),(17,'en_US','preferredPublicName',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(18,'','country','AU'),(18,'en_US','affiliation','Australian National University'),(18,'en_US','familyName','Christopher'),(18,'en_US','givenName','Leo'),(19,'','country','ZA'),(19,'en_US','affiliation','University of Cape Town'),(19,'en_US','familyName','Kumiega'),(19,'en_US','givenName','Lise'),(20,'','country','GB'),(20,'en_US','affiliation','University of Wolverhampton'),(20,'en_US','familyName','Daniel'),(20,'en_US','givenName','Patricia'),(21,'','country','KE'),(21,'en_US','affiliation','University of Nairobi'),(21,'en_US','familyName','Baiyewu'),(21,'en_US','givenName','Rana'),(22,'','country','ES'),(22,'en_US','affiliation','Barcelona University'),(22,'en_US','familyName','Rossi'),(22,'en_US','givenName','Rosanna'),(23,'','country','IR'),(23,'en_US','affiliation','University of Tehran'),(23,'en_US','familyName','Karbasizaed'),(23,'en_US','givenName','Vajiheh'),(24,'','country','CA'),(24,'en_US','affiliation','University of Windsor'),(24,'en_US','familyName','Williamson'),(24,'en_US','givenName','Valerie'),(25,'','country','US'),(25,'en_US','affiliation','CUNY'),(25,'en_US','familyName','Woods'),(25,'en_US','givenName','Zita');
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
INSERT INTO `authors` VALUES (1,'amwandenga@mailinator.com',1,1,0.00,14),(2,'lorem@mailinator.com',1,1,0.00,14),(3,'amwandenga@mailinator.com',1,2,0.00,14),(4,'lorem@mailinator.com',1,2,0.00,14),(5,'ccorino@mailinator.com',1,3,0.00,14),(6,'ckwantes@mailinator.com',1,4,0.00,14),(7,'cmontgomerie@mailinator.com',1,5,0.00,14),(8,'mirvine@mailinator.com',1,5,1.00,14),(9,'ddiouf@mailinator.com',1,6,0.00,14),(10,'dphillips@mailinator.com',1,7,0.00,14),(11,'dsokoloff@mailinator.com',1,8,0.00,14),(12,'eostrom@mailinator.com',1,9,0.00,14),(13,'fvanlaerhoven@mailinator.com',1,9,1.00,14),(14,'fpaglieri@mailinator.com',1,10,0.00,14),(15,'jnovak@mailinator.com',1,11,0.00,14),(16,'kalkhafaji@mailinator.com',1,12,0.00,14),(17,'mmorse@mailinator.com',1,12,1.00,14),(18,'lchristopher@mailinator.com',1,13,0.00,14),(19,'lkumiega@mailinator.com',1,14,0.00,14),(20,'pdaniel@mailinator.com',1,15,0.00,14),(21,'rbaiyewu@mailinator.com',1,16,0.00,14),(22,'rrossi@mailinator.com',1,17,0.00,14),(23,'vkarbasizaed@mailinator.com',1,18,0.00,14),(24,'vwilliamson@mailinator.com',1,19,0.00,14),(25,'zwoods@mailinator.com',1,20,0.00,14);
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
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`),
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
  `assoc_id` bigint(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (15,2,1.00),(16,2,2.00),(29,7,1.00),(30,7,2.00),(33,12,1.00),(34,12,2.00),(35,12,3.00),(36,12,4.00),(37,17,1.00),(38,17,2.00),(39,22,1.00),(40,22,2.00),(41,22,3.00),(42,22,4.00),(43,22,5.00),(44,22,6.00),(45,22,7.00),(46,37,1.00),(47,37,2.00),(48,42,1.00),(49,42,2.00),(50,42,3.00),(51,52,1.00),(52,57,1.00),(53,57,2.00),(54,57,3.00),(55,57,4.00),(56,62,1.00),(57,62,2.00),(58,67,1.00),(59,72,1.00),(60,72,2.00),(61,72,3.00),(62,72,4.00),(63,72,5.00),(64,72,6.00),(65,72,7.00),(66,72,8.00),(67,72,9.00),(68,72,10.00),(69,82,1.00),(70,82,2.00),(71,92,1.00),(72,92,2.00),(73,92,3.00);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (15,'en_US','submissionKeyword','Professional Development','string'),(16,'en_US','submissionKeyword','Social Transformation','string'),(29,'en_US','submissionKeyword','Professional Development','string'),(30,'en_US','submissionKeyword','Social Transformation','string'),(33,'en_US','submissionKeyword','pigs','string'),(34,'en_US','submissionKeyword','food security','string'),(35,'en_US','submissionKeyword','Professional Development','string'),(36,'en_US','submissionKeyword','Social Transformation','string'),(37,'en_US','submissionKeyword','employees','string'),(38,'en_US','submissionKeyword','survey','string'),(39,'en_US','submissionKeyword','Integrating Technology','string'),(40,'en_US','submissionKeyword','Computer Skills','string'),(41,'en_US','submissionKeyword','Survey','string'),(42,'en_US','submissionKeyword','Alberta','string'),(43,'en_US','submissionKeyword','National','string'),(44,'en_US','submissionKeyword','Provincial','string'),(45,'en_US','submissionKeyword','Professional Development','string'),(46,'en_US','submissionKeyword','education','string'),(47,'en_US','submissionKeyword','citizenship','string'),(48,'en_US','submissionKeyword','Common pool resource','string'),(49,'en_US','submissionKeyword','common property','string'),(50,'en_US','submissionKeyword','intellectual developments','string'),(51,'en_US','submissionKeyword','water','string'),(52,'en_US','submissionKeyword','Development','string'),(53,'en_US','submissionKeyword','engineering education','string'),(54,'en_US','submissionKeyword','service learning','string'),(55,'en_US','submissionKeyword','sustainability','string'),(56,'en_US','submissionKeyword','pigs','string'),(57,'en_US','submissionKeyword','food security','string'),(58,'en_US','submissionKeyword','water','string'),(59,'en_US','submissionKeyword','21st Century','string'),(60,'en_US','submissionKeyword','Diversity','string'),(61,'en_US','submissionKeyword','Multilingual','string'),(62,'en_US','submissionKeyword','Multiethnic','string'),(63,'en_US','submissionKeyword','Participatory Pedagogy','string'),(64,'en_US','submissionKeyword','Language','string'),(65,'en_US','submissionKeyword','Culture','string'),(66,'en_US','submissionKeyword','Gender','string'),(67,'en_US','submissionKeyword','Egalitarianism','string'),(68,'en_US','submissionKeyword','Social Transformation','string'),(69,'en_US','submissionKeyword','cattle','string'),(70,'en_US','submissionKeyword','food security','string'),(71,'en_US','submissionKeyword','Self-Organization','string'),(72,'en_US','submissionKeyword','Multi-Level Institutions','string'),(73,'en_US','submissionKeyword','Goverance','string');
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
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
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
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`)
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
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,8,'2022-07-07 23:06:16'),(2,1,1,3,1,3,1,'2022-07-07 23:06:45'),(3,1,NULL,4,NULL,3,7,'2022-07-07 23:06:58'),(4,2,NULL,1,NULL,3,8,'2022-07-07 23:09:57'),(5,2,2,3,1,6,11,'2022-07-07 23:10:25'),(6,3,NULL,1,NULL,3,8,'2022-07-07 23:11:09'),(7,3,3,3,1,3,1,'2022-07-07 23:11:33'),(8,5,NULL,1,NULL,3,8,'2022-07-07 23:12:34'),(9,5,4,3,1,3,1,'2022-07-07 23:12:57'),(10,5,NULL,4,NULL,3,7,'2022-07-07 23:13:12'),(11,6,NULL,1,NULL,3,8,'2022-07-07 23:14:02'),(12,6,5,3,1,3,1,'2022-07-07 23:14:25'),(13,6,NULL,4,NULL,3,7,'2022-07-07 23:14:41'),(14,7,NULL,1,NULL,3,8,'2022-07-07 23:15:22'),(15,9,NULL,1,NULL,3,8,'2022-07-07 23:16:51'),(16,9,7,3,1,3,1,'2022-07-07 23:17:14'),(17,9,NULL,4,NULL,3,7,'2022-07-07 23:17:29'),(18,10,NULL,1,NULL,3,8,'2022-07-07 23:18:16'),(19,12,NULL,1,NULL,3,8,'2022-07-07 23:19:56'),(20,13,NULL,1,NULL,3,8,'2022-07-07 23:20:47'),(21,13,10,3,1,3,2,'2022-07-07 23:22:13'),(22,15,NULL,1,NULL,3,8,'2022-07-07 23:23:05'),(23,15,11,3,1,3,1,'2022-07-07 23:23:29'),(24,15,NULL,4,NULL,3,7,'2022-07-07 23:23:44'),(25,17,NULL,1,NULL,3,8,'2022-07-07 23:24:48'),(26,17,12,3,1,3,1,'2022-07-07 23:25:11'),(27,17,NULL,4,NULL,3,7,'2022-07-07 23:25:26'),(28,18,NULL,1,NULL,3,9,'2022-07-07 23:27:39'),(29,19,NULL,1,NULL,3,8,'2022-07-07 23:28:13'),(30,19,13,3,1,3,1,'2022-07-07 23:28:36');
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
INSERT INTO `email_log` VALUES (1,1048585,1,3,'2022-07-07 23:06:16',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that an editor has reviewed your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(2,1048585,1,3,'2022-07-07 23:06:45',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(3,1048585,1,3,'2022-07-07 23:06:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Alan Mwandenga,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(4,1048585,2,3,'2022-07-07 23:09:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Your submission has been sent for review','<p>Dear Carlo Corino,</p><p>I am pleased to inform you that an editor has reviewed your submission, The influence of lactation on the quantity and quality of cashmere production, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(5,1048585,3,3,'2022-07-07 23:11:09',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been sent for review','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(6,1048585,3,3,'2022-07-07 23:11:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(7,1048585,5,3,'2022-07-07 23:12:34',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been sent for review','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that an editor has reviewed your submission, Genetic transformation of forest trees, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(8,1048585,5,3,'2022-07-07 23:12:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Genetic transformation of forest trees, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(9,1048585,5,3,'2022-07-07 23:13:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Diaga Diouf,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Genetic transformation of forest trees, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(10,1048585,6,3,'2022-07-07 23:14:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that an editor has reviewed your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(11,1048585,6,3,'2022-07-07 23:14:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(12,1048585,6,3,'2022-07-07 23:14:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Dana Phillips,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(13,1048585,7,3,'2022-07-07 23:15:22',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Your submission has been sent for review','<p>Dear Domatilia Sokoloff,</p><p>I am pleased to inform you that an editor has reviewed your submission, Developing efficacy beliefs in the classroom, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(14,1048585,7,8,'2022-07-07 23:15:55',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Developing efficacy beliefs in the classroom,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-08-04, if not before.<br />\n<br />\nPaul Hudson'),(15,1048585,9,3,'2022-07-07 23:16:51',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been sent for review','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that an editor has reviewed your submission, Hansen & Pinto: Reason Reclaimed, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(16,1048585,9,3,'2022-07-07 23:17:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Hansen & Pinto: Reason Reclaimed, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(17,1048585,9,3,'2022-07-07 23:17:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Fabio Paglieri,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Hansen & Pinto: Reason Reclaimed, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(18,1048585,10,3,'2022-07-07 23:18:16',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Your submission has been sent for review','<p>Dear John Novak,</p><p>I am pleased to inform you that an editor has reviewed your submission, Condensing Water Availability Models to Focus on Specific Water Management Systems, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(19,1048585,10,9,'2022-07-07 23:18:42',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-08-04, if not before.<br />\n<br />\nAisla McCrae'),(20,1048585,10,10,'2022-07-07 23:18:54',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-08-04, if not before.<br />\n<br />\nAdela Gallego'),(21,1048585,12,3,'2022-07-07 23:19:56',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Your submission has been sent for review','<p>Dear Leo Christopher,</p><p>I am pleased to inform you that an editor has reviewed your submission, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(22,1048585,13,3,'2022-07-07 23:20:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been sent for review','<p>Dear Lise Kumiega,</p><p>I am pleased to inform you that an editor has reviewed your submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(23,1048585,13,7,'2022-07-07 23:21:21',1073741829,'\"Julie Janssen\" <jjanssen@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-08-04, if not before.<br />\n<br />\nJulie Janssen'),(24,1048585,13,9,'2022-07-07 23:21:34',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-08-04, if not before.<br />\n<br />\nAisla McCrae'),(25,1048585,13,10,'2022-07-07 23:21:48',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions,&quot; for Journal of Public Knowledge. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-08-04, if not before.<br />\n<br />\nAdela Gallego'),(26,1048585,13,3,'2022-07-07 23:22:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear Lise Kumiega,</p><p>Your submission Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>. If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p><p>Daniel Barnes</p><hr><p>The following comments were received from reviewers.</p><p><strong>Reviewer 1:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 2:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 3:</strong><br>Recommendation: Resubmit for Review</p><p>Here are my review comments</p>'),(27,1048585,15,3,'2022-07-07 23:23:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been sent for review','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that an editor has reviewed your submission, Yam diseases and its management in Nigeria, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(28,1048585,15,3,'2022-07-07 23:23:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Yam diseases and its management in Nigeria, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(29,1048585,15,3,'2022-07-07 23:23:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Rana Baiyewu,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Yam diseases and its management in Nigeria, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(30,1048585,17,3,'2022-07-07 23:24:48',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been sent for review','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that an editor has reviewed your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(31,1048585,17,3,'2022-07-07 23:25:11',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(32,1048585,17,3,'2022-07-07 23:25:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Vajiheh Karbasizaed,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(33,1048585,18,3,'2022-07-07 23:27:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Your submission has been declined','<p>Dear Valerie Williamson,</p><p>I???m sorry to inform you that, after reviewing your submission, Self-Organization in Multi-Level Institutions in Networked Environments, the editor has found that it does not meet our requirements for publication in Journal of Public Knowledge.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(34,1048585,19,3,'2022-07-07 23:28:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been sent for review','<p>Dear Zita Woods,</p><p>I am pleased to inform you that an editor has reviewed your submission, Finocchiaro: Arguments About Arguments, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(35,1048585,19,3,'2022-07-07 23:28:36',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Finocchiaro: Arguments About Arguments, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>');
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
INSERT INTO `email_log_users` VALUES (1,17),(2,17),(3,17),(4,18),(5,19),(6,19),(7,21),(8,21),(9,21),(10,22),(11,22),(12,22),(13,23),(14,3),(14,4),(14,5),(15,25),(16,25),(17,25),(18,26),(19,3),(19,4),(19,5),(20,3),(20,4),(20,5),(21,28),(22,29),(23,3),(23,4),(23,5),(24,3),(24,4),(24,5),(25,3),(25,4),(25,5),(26,29),(27,31),(28,31),(29,31),(30,33),(31,33),(32,33),(33,34),(34,35),(35,35);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,0,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,0,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,0,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,0,NULL,NULL,NULL),(5,'USER_REGISTER',0,0,NULL,NULL,NULL),(6,'USER_VALIDATE_CONTEXT',0,0,NULL,NULL,NULL),(7,'USER_VALIDATE_SITE',0,0,NULL,NULL,NULL),(8,'REVIEWER_REGISTER',0,0,NULL,NULL,NULL),(9,'ISSUE_PUBLISH_NOTIFY',0,0,NULL,NULL,NULL),(10,'LOCKSS_EXISTING_ARCHIVE',0,0,NULL,NULL,NULL),(11,'LOCKSS_NEW_ARCHIVE',0,0,NULL,NULL,NULL),(12,'SUBMISSION_ACK',1,0,NULL,65536,1),(13,'SUBMISSION_ACK_NOT_USER',1,0,NULL,65536,1),(14,'EDITOR_ASSIGN',1,0,16,16,1),(15,'REVIEW_CANCEL',0,0,NULL,NULL,NULL),(16,'REVIEW_REINSTATE',0,0,NULL,NULL,NULL),(17,'REVIEW_REQUEST',0,0,NULL,NULL,NULL),(18,'REVIEW_REQUEST_SUBSEQUENT',0,0,NULL,NULL,NULL),(19,'REVIEW_RESPONSE_OVERDUE_AUTO',0,0,NULL,NULL,NULL),(20,'REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK',0,0,NULL,4096,3),(21,'REVIEW_CONFIRM',0,0,NULL,NULL,NULL),(22,'REVIEW_DECLINE',0,0,NULL,NULL,NULL),(23,'REVIEW_ACK',0,0,NULL,NULL,NULL),(24,'REVIEW_REMIND',0,0,NULL,NULL,NULL),(25,'REVIEW_REMIND_AUTO',0,0,NULL,NULL,NULL),(26,'REVIEW_REMIND_AUTO_ONECLICK',0,0,NULL,4096,3),(27,'EDITOR_DECISION_ACCEPT',0,0,NULL,NULL,NULL),(28,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,0,NULL,NULL,NULL),(29,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,0,NULL,NULL,NULL),(30,'EDITOR_DECISION_REVISIONS',0,0,NULL,NULL,NULL),(31,'EDITOR_DECISION_RESUBMIT',0,0,NULL,NULL,NULL),(32,'EDITOR_DECISION_DECLINE',0,0,NULL,NULL,NULL),(33,'EDITOR_DECISION_INITIAL_DECLINE',0,0,NULL,NULL,NULL),(34,'EDITOR_RECOMMENDATION',0,0,NULL,NULL,NULL),(35,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS',0,0,NULL,NULL,NULL),(36,'EDITOR_DECISION_BACK_TO_COPYEDITING',0,0,NULL,NULL,NULL),(37,'EDITOR_DECISION_BACK_TO_REVIEW',0,0,NULL,NULL,NULL),(38,'EDITOR_DECISION_BACK_TO_SUBMISSION',0,0,NULL,NULL,NULL),(39,'EDITOR_DECISION_NEW_ROUND',0,0,NULL,NULL,NULL),(40,'EDITOR_DECISION_REVERT_DECLINE',0,0,NULL,NULL,NULL),(41,'EDITOR_DECISION_REVERT_INITIAL_DECLINE',0,0,NULL,NULL,NULL),(42,'EDITOR_DECISION_SKIP_REVIEW',0,0,NULL,NULL,NULL),(43,'COPYEDIT_REQUEST',1,0,16,4097,4),(44,'LAYOUT_REQUEST',1,0,16,4097,5),(45,'LAYOUT_COMPLETE',1,0,4097,16,5),(46,'EMAIL_LINK',0,0,1048576,NULL,NULL),(47,'SUBSCRIPTION_NOTIFY',0,0,NULL,1048576,NULL),(48,'OPEN_ACCESS_NOTIFY',0,0,NULL,1048576,NULL),(49,'SUBSCRIPTION_BEFORE_EXPIRY',0,0,NULL,1048576,NULL),(50,'SUBSCRIPTION_AFTER_EXPIRY',0,0,NULL,1048576,NULL),(51,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,0,NULL,1048576,NULL),(52,'SUBSCRIPTION_PURCHASE_INDL',0,0,NULL,2097152,NULL),(53,'SUBSCRIPTION_PURCHASE_INSTL',0,0,NULL,2097152,NULL),(54,'SUBSCRIPTION_RENEW_INDL',0,0,NULL,2097152,NULL),(55,'SUBSCRIPTION_RENEW_INSTL',0,0,NULL,2097152,NULL),(56,'CITATION_EDITOR_AUTHOR_QUERY',0,0,NULL,NULL,4),(57,'REVISED_VERSION_NOTIFY',0,0,NULL,16,3),(58,'STATISTICS_REPORT_NOTIFICATION',1,0,16,17,NULL),(59,'ANNOUNCEMENT',0,0,16,1048576,NULL),(60,'EDITORIAL_REMINDER',0,0,16,1048576,NULL),(61,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(62,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL),(63,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL),(64,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','fr_CA','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisiter notre site Web pour consulter <a href=\"{$announcementUrl}\">l\'annonce compl??te</a>.','Ce courriel est envoy?? lorsqu\'une nouvelle annonce est cr????e.'),('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$recipientName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$senderName}<br />\nCopy-Editor, {$journalName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),('CITATION_EDITOR_AUTHOR_QUERY','fr_CA','Modification des r??f??rences bibliographiques','{$recipientName},<br />\n<br />\nPourriez-vous v??rifier ou nous fournir la r??f??rence bibliographique compl??te pour la r??f??rence suivante, provenant de votre article ?? {$submissionTitle} ??  :<br />\n<br />\n{$rawCitation}<br />\n<br />\nMerci!<br />\n<br />\n{$senderName}<br />\nR??viseur-e, revue {$journalName}<br />\n','Ce courriel permet aux r??viseurs-es de demander des renseignements additionnels ?? propos des r??f??rences bibliographiques cit??es par les auteurs-es.'),('COPYEDIT_REQUEST','en_US','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$journalName}</p><p>Please follow these steps to complete this task:</p><ol><li>1. Click on the Submission URL below.</li><li>2. Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>3. Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>4. Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}','This email is sent by an Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','fr_CA','Demande de r??vision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la r??vision du manuscrit intitul?? ?? {$submissionTitle} ?? pour la revue {$journalName} ?? l\'aide des ??tapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ??bauches finales et effectuer votre r??vision, tout en ajoutant des discussions sur la r??vision, le cas ??ch??ant.<br />\n3. Enregistrer le(s) fichier(s) r??vis??(s) et le(s) t??l??verser dans la section Version(s) r??vis??e(s).<br />\n4. Informer le,la r??dacteur-trice que tous les fichiers ont ??t?? r??vis??s et que l\'??tape de production peut d??buter.<br />\n<br />\nURL de la revue {$journalName} : {$journalUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}','##emails.copyeditRequest.description##'),('EDITORIAL_REMINDER','en_US','Outstanding editorial tasks for {$journalName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$journalUrl}\">{$journalName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>This is an automated email from {$journalName}. You are receiving this email because you are an editor. To unsubscribe from these emails, please visit your <a href=\"{$userProfileUrl}\">user profile</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>','This email is sent when a new announcement is created.'),('EDITORIAL_REMINDER','fr_CA','','','Ce courriel est envoy?? lorsqu\'une nouvelle annonce est cr????e.'),('EDITOR_ASSIGN','en_US','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. This template is available to select when an editor is assigned to a submission in the Participants area. This template should be used when the section editor has the ability to record editorial decisions.'),('EDITOR_ASSIGN','fr_CA','Assignation d\'un-e r??dacteur-trice','{$recipientName},<br />\n<br />\nLa soumission intitul??e ?? {$submissionTitle} ?? pour la revue {$journalName} vous a ??t?? attribu??e. Vous ??tes responsable, en tant que r??dacteur-trice de rubrique, de la faire cheminer ?? travers le processus ??ditorial.<br />\n<br />\nURL de la soumission??: {$submissionUrl}<br />\nNom d\'utilisateur-trice??: {$recipientUsername}<br />\n<br />\nMerci.','Ce courriel avise un,une r??dacteur-trice de rubrique que le,la r??dacteur-trice lui a assign?? la t??che de suivre une soumission durant le processus ??ditorial. Il fournit des renseignements sur la soumission, et comment acc??der au site Web de la revue.'),('EDITOR_DECISION_ACCEPT','en_US','Your submission has been accepted to {$journalName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}',NULL),('EDITOR_DECISION_ACCEPT','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$journalName}.<br />\n<br />\nNotre d??cision est d\'accepter votre soumission.',NULL),('EDITOR_DECISION_BACK_TO_COPYEDITING','en_US','Your submission has been sent back for copyediting','<p>Dear {$recipientName},</p>\n<p>Your submission, {$submissionTitle}, has been sent back to the copy editing stage. \nIt will undergo further copy editing and formatting to prepare it for publication.</p>\n<p>Your submission is still forthcoming in a future issue of {$journalName}. It was moved back to the copy editing stage because it is not yet ready for the final galleys to be prepared for publication.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_BACK_TO_COPYEDITING','fr_CA','','',NULL),('EDITOR_DECISION_BACK_TO_REVIEW','en_US','Your submission has been sent back for review','<p>Dear {$recipientName},</p>\n<p>Your submission, {$submissionTitle}, has been sent back to the review stage. \nIt will undergo further review before it can be accepted for publication.</p>\n<p>Occasionally, a decision to accept a submission will be recorded accidentally \nin our system and we must send it back to review. I apologize for any confusion \nthis has caused. We will work to complete any further review quickly so that you \nhave a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_BACK_TO_REVIEW','fr_CA','','',NULL),('EDITOR_DECISION_BACK_TO_SUBMISSION','en_US','Your submission has been sent back for editorial review','<p>Dear {$recipientName},</p>\n<p>Your submission, {$submissionTitle}, has been sent back to the submission stage. \nAn editor will look it over before it is sent for peer review.</p>\n<p>Occasionally, a decision to send a submission for peer review will be recorded accidentally \nin our system and we must send it back to the submission stage. I apologize for any confusion \nthis may have caused.</p><p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_BACK_TO_SUBMISSION','fr_CA','','',NULL),('EDITOR_DECISION_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$journalName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}',NULL),('EDITOR_DECISION_DECLINE','fr_CA','D??cision du r??dacteur','{$authors}:<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$journalName}.<br />\n<br />\nNotre d??cision est de refuser votre soumission.',NULL),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>I???m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$journalName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}',NULL),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','D??cision du r??dacteur','\n			{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ??  la revue {$journalName}.<br />\n<br />\nNotre d??cision est de refuser votre soumission.',NULL),('EDITOR_DECISION_NEW_ROUND','en_US','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_NEW_ROUND','fr_CA','','',NULL),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en_US','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$journalName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}',NULL),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',NULL),('EDITOR_DECISION_RESUBMIT','en_US','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}',NULL),('EDITOR_DECISION_RESUBMIT','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$journalName}.<br />\n<br />\nNotre d??cision est de vous demander d\'apporter des r??visions ?? votre soumission et de la soumettre ?? nouveau.',NULL),('EDITOR_DECISION_REVERT_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',NULL),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',NULL),('EDITOR_DECISION_REVISIONS','en_US','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}',NULL),('EDITOR_DECISION_REVISIONS','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$journalName}.<br />\n<br />\nNotre d??cision est de vous demander d\'apporter des r??visions ?? votre soumission.',NULL),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>',NULL),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$journalName}.<br />\n<br />\nNotre d??cision est d\'envoyer votre soumission en ??valuation.<br />\n<br />\nURL de la soumission : {$submissionUrl}',NULL),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$journalName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}',NULL),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nL\'??dition de votre soumission ?? {$submissionTitle} ?? est compl??t??e. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}',NULL),('EDITOR_DECISION_SKIP_REVIEW','en_US','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p>\nYour submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_SKIP_REVIEW','fr_CA','','',NULL),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is:<br />{$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>',NULL),('EDITOR_RECOMMENDATION','fr_CA','Recommandation du r??dacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission ?? {$submissionTitle} ?? ?? la revue {$journalName} est de : {$recommendation}',NULL),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authors} published in Vol {$volume}, No {$number} ({$year}) of {$journalName} at &quot;{$submissionUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('EMAIL_LINK','fr_CA','Article potentiellement int??ressant','Je pense que l\'article suivant pourrait vous int??resser : ?? {$submissionTitle} ?? par {$authors}, publi?? dans le volume {$volume}, num??ro {$number} de ({$year}) de la revue {$journalName}, ?? l\'adresse suivante : {$submissionUrl}.','Ce mod??le de courriel fournit ?? un,une lecteur-trice inscrit-e l\'occasion d\'envoyer de l\'information ?? quelqu\'un qui peut ??tre int??ress?? par un article en particulier. Il est disponible via Outils de lecture et doit ??tre activ?? par le,la directeur-trice de la revue ?? la page Gestion des outils de lecture.'),('ISSUE_PUBLISH_NOTIFY','en_US','A new issue is now available: {$issueIdentification}','<p>Dear Reader,</p><p>{$journalName} is pleased to announce the publication of our latest issue: {$issueIdentification}. We invite you to visit the table of contents and review the articles and items of interest. Many thanks to our authors, reviewers, and editors for their valuable contributions to this work, and to our readers for your continued interest.</p><p>Sincerely,</p>{$signature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new submission that is published separately from an issue, using a continuous publishing model.'),('ISSUE_PUBLISH_NOTIFY','fr_CA','Parution du dernier num??ro','Lecteurs-trices,<br />\n<br />\nLe plus r??cent num??ro de la revue {$journalName} vient d\'??tre publi?? ?? l\'adresse suivante??: {$journalUrl}. Nous vous invitons ?? consulter le sommaire, puis ?? visiter notre site Web pour y lire les articles qui vous int??ressent.<br />\n<br />\nNous vous remercions de l\'int??r??t que vous portez ?? notre revue,<br />\n{$signature}','Ce courriel est envoy?? ?? tous et toutes les lecteurs-trices inscrits-es, via le lien ?? Aviser les utilisateurs-trices ?? sur la page d\'accueil du,de la r??dacteur-trice. Il avise les lecteurs-trices qu\'un nouveau num??ro est publi?? et les invite ?? visiter la revue en cliquant sur l\'URL fourni.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>','This email from the Layout Editor notifies an editor that the galleys have been completed.'),('LAYOUT_COMPLETE','fr_CA','Mise en page des ??preuves termin??e','{$recipientName},<br />\n<br />\nLes ??preuves du manuscrit intitul?? ?? {$submissionTitle} ?? pour la revue {$journalName} sont maintenant pr??tes pour la relecture.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec moi.<br />\n<br />\n{$senderName}','Ce courriel du,de la responsable de la mise en page au,?? la r??dacteur-trice de rubrique l\'avise que l\'??tape de mise en page est compl??t??e.'),('LAYOUT_REQUEST','en_US','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$journalName}</p><ol><li>1. Click on the Submission URL above.</li><li>2. Download the Production Ready files and use them to create the galleys according to the journal\'s standards.</li><li>3. Upload the galleys to the Publication section of the submission.</li><li>4. Use the  Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}','This email from an Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','fr_CA','Demande de mise en page des ??preuves','{$recipientName},<br />\n<br />\nJ\'aimerais que vous pr??pariez les ??preuves du manuscrit intitul?? ?? {$submissionTitle} ?? pour la revue {$journalName} ?? l\'aide des ??tapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et utiliser les fichiers disponibles sous Fichiers pr??ts pour la production pour cr??er les ??preuves en fonction des normes de la revue.<br />\n3. T??l??verser les ??preuves dans la section ??preuves.<br />\n4. Informer le,la r??dacteur-trice, via une discussion sur la production, que les ??preuves ont ??t?? t??l??vers??es et qu\'elles sont pr??tes.<br />\n<br />\nURL de la revue {$journalName} : {$journalUrl}<br />\nURL du manuscrit : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.','Ce courriel du,de la r??dacteur-trice de rubrique au, ?? la responsable de la mise en page l\'avise qu\'il ou elle a ??t?? assign??-e ?? la r??alisation de la mise en page de la soumission. Il fournit les renseignements sur la soumission et comment acc??der ?? celle-ci.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$journalName}','Dear [University Librarian]<br />\n<br />\n{$journalName} &amp;lt;{$journalUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$journalUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$signature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_EXISTING_ARCHIVE','fr_CA','Demande d\'archivage pour la revue {$journalName}','Cher,Ch??re [Biblioth??caire universitaire],<br />\n<br />\n{$journalName} &lt;{$journalUrl}&gt; est une revue pour laquelle un membre de votre facult??, [nom du membre], agit ?? titre de [titre de la position occup??e]. La revue d??sire mettre en place un syst??me d\'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe - Plusieurs exemplaires assurent la s??curit??) avec votre biblioth??que ainsi que celles d\'autres universit??s.<br />\n<br />\n[Br??ve description de la revue]<br />\n<br />\nL\'adresse URL pour le LOCKSS Publisher Manifest pour notre revue est : {$journalUrl}/gateway/lockss<br />\n<br />\nNous croyons savoir que vous participez d??j?? ?? LOCKSS. Si nous pouvons vous fournir des m??tadonn??es suppl??mentaires afin d\'inscrire notre revue avec votre version de LOCKSS, il nous fera plaisir de vous les fournir.<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel demande ?? un-e conservateur,trice d\'archives LOCKSS d\'envisager d\'inclure cette revue dans leur archive. Il fournit l\'adresse URL du LOCKSS Publisher Manifest de la revue.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$journalName}','Dear [University Librarian]<br />\n<br />\n{$journalName} &amp;lt;{$journalUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;https://lockss.org&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$signature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('LOCKSS_NEW_ARCHIVE','fr_CA','Demande d\'archivage pour la revue {$journalName}','Cher,Ch??re [Biblioth??caire universitaire],<br />\n<br />\n{$journalName} &lt;{$journalUrl}&gt;, est une revue pour laquelle un membre de votre facult??, [nom du membre], agit ?? titre de [titre de la fonction occup??e]. La revue d??sire mettre en place un syst??me d\'archivage conforme LOCKSS (Lots of Copies Keep Stuff Safe) avec votre biblioth??que et celles d\'autres universit??s.<br />\n<br />\n[Br??ve description de la revue]<br />\n<br />\nLe programme LOCKSS &lt;http://lockss.org/&gt;, une initiative de biblioth??caires et d\'??diteurs internationaux, est une belle d??monstration d\'un d??p??t d\'archives assurant la pr??servation des documents. Voir les d??tails ci-dessous. Le logiciel est gratuit et fonctionne sur tout ordinateur personnel. Il est facile de le mettre en ligne et ne requiert que tr??s peu de maintenance.<br />\n<br />\nPour nous aider dans le processus d\'archivage de notre revue, nous vous invitons ?? devenir membre de la communaut?? LOCKSS, pour aider ?? recueillir et pr??server des titres produits par votre facult?? et par d\'autres chercheurs ?? travers le monde. Pour ce faire, veuillez demander ?? quelqu\'un de votre personnel de visiter le site Internet de LOCKSS pour voir les informations sur le fonctionnement du syst??me. Nous attendons de vos nouvelles sur la faisabilit??, pour vous, de fournir un support d\'archivage pour cette revue.<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel encourage le ou la destinaire ?? participer ?? l\'initiative LOCKSS et ?? inclure cette revue dans leur archives. Il fournit de l\'information au sujet de LOCKSS et des fa??ons de s\'impliquer dans le projet.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$journalName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('MANUAL_PAYMENT_NOTIFICATION','fr_CA','Avis de paiement manuel','Un paiement manuel doit ??tre trait?? pour la revue {$journalName} et l\'utilisateur {$userFullName} (nom d\'utilisateur &quot;{$userName}&quot;).<br />\n<br />\nL\'??l??ment factur?? est &quot;{$itemName}&quot;.<br />\nLe co??t est de {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nCe courriel a ??t?? g??n??r?? par le plugiciel de paiement manuel du Open Journal Systems.','Ce mod??le de courriel est utilis?? pour aviser un directeur de revue que le paiement manuel a ??t?? demand??.'),('NOTIFICATION','en_US','New notification from {$journalName}','You have a new notification from {$journalName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\n{$signature}\n<hr />{$unsubscribeLink}',NULL),('NOTIFICATION','fr_CA','Nouvel avis de {$journalName}','Vous avez un nouvel avis de {$journalName} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$notificationUrl}<br />\n<br />\n{$signature}\n<hr />{$unsubscribeLink}',NULL),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$journalName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message ?? propos de la revue {$journalName}','Pri??re de saisir votre message.','Message blanc par d??faut utilis?? pour concevoir d\'autres messages.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$journalName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$journalUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$signature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('OPEN_ACCESS_NOTIFY','fr_CA','Le num??ro est maintenant en libre acc??s','Chers lecteurs et lectrices,<br />\n<br />\nLa revue {$journalName} vient de rendre disponible en libre acc??s le num??ro suivant. Nous vous invitons ?? lire ici le sommaire puis visiter notre site Web ({$journalUrl}) pour lire les articles et autres textes qui pourraient vous int??resser.<br />\n<br />\nMerci de votre int??r??t continu pour notre travail.<br />\n{$signature}','Ce courriel est envoy?? aux lecteurs-trices inscrits-es qui ont demand?? ?? recevoir un avis par courriel quand un num??ro devient disponible en libre acc??s.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$journalName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$journalName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez ??t?? inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis ?? {$journalName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID ?? cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ic??ne identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce mod??le de courriel est utilis?? pour r??cup??rer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$journalName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$journalName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'acc??s au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez ??t?? inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit ?? {$submissionTitle} ?? soumis ?? {$journalName}.\n<br/>\n<br/>\nVeuillez nous autoriser ?? ajouter votre identifiant ORCID ?? cette soumission et ?? ajouter ??galement la soumission ?? votre dossier ORCID suite ?? sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'acc??s en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ic??ne identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce mod??le de courriel est utilis?? pour demander aux auteurs-es l\'acc??s ?? leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\n{$signature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','R??initialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a ??t?? r??initialis?? avec succ??s. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec la revue.<br />\n<br />\nVotre nom d\'utilisateur-trice??: {$recipientUsername}<br />\nMot de passe??: {$password}<br />\n<br />\n{$signature}','Ce courriel est envoy?? ?? l\'utilisateur-trice inscrit-e lorsqu\'il a r??ussi ?? r??initialiser son mot de passe en ayant suivi la proc??dure d??crite dans le courriel ?? Confirmation de la r??initialisation du mot de passe ??.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la r??initialisation du mot de passe','Nous avons re??u une demande concernant la r??initialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du pr??sent message, votre mot de passe restera le m??me. Si vous souhaitez r??initialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nR??initialisation de mon mot de passe??: {$passwordResetUrl}<br />\n<br />\n{$signature}','Ce courriel est envoy?? ?? l\'utilisateur-trice inscrit-e qui nous signale avoir oubli?? son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL ?? cliquer pour pouvoir r??initialiser son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$journalName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PAYPAL_INVESTIGATE_PAYMENT','fr_CA','Activit?? inhabituelle de PayPal','L\'Open Journal Systems a remarqu?? une activit?? inhabituelle concernant la prise en charge du paiement PayPal pour la revue {$journalName}. Cette activit?? pourrait n??cessiter une attention particuli??re ou une intervention manuelle.<br />\n                       <br />\nCe courriel a ??t?? g??n??r?? par le plugiciel PayPal du Open Journal Systems.<br />\n<br />\nInformation compl??te de la demande :<br />\n{$postInfo}<br />\n<br />\nInformation suppl??mentaire (si fournie) :<br />\n{$additionalInfo}<br />\n<br />\nVariables serveur :<br />\n{$serverVars}<br />\n','Ce mod??le de courriel est utilis?? pour aviser un contact principal d\'une revue qu\'une activit?? inhabituelle ou requ??rant une intervention manuelle a ??t?? remarqu??e par le plugiciel PayPal.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$journalName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$journalName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','fr_CA','Inscription en tant qu\'??valuateur-trice pour la revue {$journalName}','Compte tenu de votre expertise, nous avons pris l\'initiative d\'inscrire votre nom dans la base de donn??es des ??valuateurs-trices de la revue {$journalName}. Cela ne vous engage d\'aucune fa??on, mais nous permet simplement de solliciter vos services pour l\'??valuation d\'une soumission. Si vous ??tes invit??-e ?? effectuer une ??valuation, vous recevrez le titre et le r??sum?? de l\'article en question, et serez toujours libre d\'accepter ou de refuser une telle invitation. ?? tout moment, il vous est ??galement possible de demander ?? ce que votre nom soit retir?? de la liste des ??valuateurs-trices.<br />\n<br />\nNous vous acheminons un nom d\'utilisateur-trice et un mot de passe, car tous deux sont requis pour tout ??change avec la revue via son site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise ?? jour de votre profil, y compris vos domaines d\'int??r??t en mati??re d\'??valuation.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoy?? ?? un,une ??valuateur-trice nouvellement inscrit-e, afin de lui souhaiter la bienvenue dans le syst??me et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('REVIEW_ACK','en_US','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>',NULL),('REVIEW_ACK','fr_CA','Accus?? de r??ception de l\'??valuation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir ??valu?? la soumission intitul??e ?? {$submissionTitle} ?? pour la revue {$journalName}. Nous vous sommes reconnaissants de votre contribution ?? la qualit?? des travaux que nous publions.',NULL),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.',NULL),('REVIEW_CANCEL','fr_CA','Annulation de la demande d\'??valuation','{$recipientName},<br />\n<br />\nNous avons d??cid?? d\'annuler notre demande concernant l\'??valuation du manuscrit intitul?? ?? {$submissionTitle} ?? pour la revue {$journalName}. Nous sommes d??sol??s des inconv??nients que cela pourrait vous causer et esp??rons que nous pourrons de nouveau faire appel ?? vous pour contribuer au processus de r??vision par les pairs de cette revue dans le futur.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec nous.',NULL),('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}',NULL),('REVIEW_CONFIRM','fr_CA','Acceptation d\'??valuation','R??dacteurs-trices,<br />\n<br />\nJe suis en mesure d\'??valuer la soumission intitul??e ?? {$submissionTitle} ?? pour la revue {$journalName}. Je vous remercie d\'avoir pens?? ?? moi. Je devrais ??tre en mesure de compl??ter l\'??valuation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}',NULL),('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}',NULL),('REVIEW_DECLINE','fr_CA','Refus d\'??valuation','R??dacteurs-trices,<br />\n<br />\nPour le moment, il m\'est impossible d\'??valuer la soumission intitul??e ?? {$submissionTitle} ?? pour la revue {$journalName}. Je vous remercie d\'avoir pens?? ?? moi. N\'h??sitez pas ?? communiquer avec moi pour un autre projet.<br />\n<br />\n{$senderName}',NULL),('REVIEW_REINSTATE','en_US','Can you still review something for {$journalName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$journalName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this journal\'s review process, you can login to the journal to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}',NULL),('REVIEW_REINSTATE','fr_CA','R??int??gration de la demande d\'??valuation','{$recipientName},<br />\n<br />\nNous souhaitons r??tablir notre demande d\'??valuation de la soumission, ?? {$ submissionTitle} ?? pour  la revue {$ contextName}. Nous esp??rons que vous pourrez contribuer au processus d\'??valuation de cette revue.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec moi.',NULL),('REVIEW_REMIND','en_US','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$journalName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can login to the journal and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}',NULL),('REVIEW_REMIND','fr_CA','Rappel d\'??valuation d\'une soumission','{$recipientName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'??valuation de la soumission ?? {$submissionTitle} ?? pour la revue {$journalName}. Nous esp??rions recevoir votre ??valuation avant le {$reviewDueDate}. Nous serions heureux de la recevoir d??s que possible.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour r??initialiser votre mot de passe (lequel vous sera envoy?? par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission??: {$reviewAssignmentUrl}<br />\n<br />\nVeuillez confirmer que vous ??tes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous esp??rons avoir de vos nouvelles tr??s bient??t.<br />\n<br />\n{$signature}',NULL),('REVIEW_REMIND_AUTO','en_US','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please login to the journal and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}',NULL),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'??valuation d\'une soumission','{$recipientName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'??valuation de la soumission ?? {$submissionTitle} ?? pour la revue {$journalName}. Puisque nous n\'avons pas re??u, comme nous l\'esp??rions, votre ??valuation avant le {$reviewDueDate}, ce courriel a ??t?? g??n??r?? et envoy?? automatiquement apr??s l\'??ch??ance du d??lai. Nous serions toutefois heureux de recevoir votre ??valuation d??s que possible.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour r??initialiser votre mot de passe (lequel vous sera envoy?? par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission??: {$reviewAssignmentUrl}<br />\n<br />\nVeuillez confirmer que vous ??tes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous esp??rons avoir de vos nouvelles tr??s bient??t.<br />\n<br />\n{$signature}',NULL),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$signature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'??valuation d\'une soumission','{$recipientName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'??valuation de la soumission ?? {$submissionTitle} ?? pour la revue {$journalName}. Puisque nous n\'avons pas re??u, comme nous l\'esp??rions, votre ??valuation avant le {$reviewDueDate}, ce courriel a ??t?? g??n??r?? et envoy?? automatiquement apr??s l\'??ch??ance du d??lai. Nous serions toutefois heureux de recevoir votre ??valuation d??s que possible.<br />\n<br />\nURL de la soumission??: {$reviewAssignmentUrl}<br />\n<br />\nVeuillez confirmer que vous ??tes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous esp??rons avoir de vos nouvelles tr??s bient??t.<br />\n<br />\n{$signature}','Ce courriel est envoy?? automatiquement lorsque la date d\'??ch??ance de remise d\'une ??valuation est r??volue (voir Options d\'??valuation sous Param??tres > Flux des travaux > ??valuation) et que l\'acc??s de l\'??valuateur-trice en un clic est activ??. Les t??ches planifi??es doivent ??tre activ??es et configur??es (voir le fichier de configuration du site).'),('REVIEW_REQUEST','en_US','Invitation to review','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$journalName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p>Abstract</p>{$submissionAbstract}<p>Please accept or decline the review by {$responseDueDate}</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}',NULL),('REVIEW_REQUEST','fr_CA','Demande d\'??valuation d\'un article','{$recipientName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e ??valuateur-trice pour le manuscrit intitul?? ?? {$submissionTitle} ?? qui a ??t?? soumis ?? la revue {$journalName}. Vous trouverez un r??sum?? de la soumission ci-dessous. Nous esp??rons que vous accepterez ce travail essentiel ?? la publication de la revue.<br />\n<br />\nVeuillez acc??der au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l\'??valuation ou non. Vous pouvez ??galement y consulter la soumission et y enregistrer votre ??valuation et votre recommandation. Le site Web se trouve ?? l\'adresse suivante??: {$journalUrl}<br />\n<br />\nLa date d\'??ch??ance de l\'??valuation a ??t?? fix??e au {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas de nom d\'utilisateur-trice et de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour r??initialiser votre mot de passe (lequel vous sera envoy?? par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}<br />\n<br />\nURL de la soumission??: {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez ?? notre demande.<br />\n<br />\n{$signature}<br />\n<br />\n?? {$submissionTitle} ??<br />\n<br />\n{$submissionAbstract}',NULL),('REVIEW_REQUEST_SUBSEQUENT','en_US','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission. {$journalName}.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p>Abstract</p>{$submissionAbstract}<p>Please accept or decline the review by {$responseDueDate}.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}',NULL),('REVIEW_REQUEST_SUBSEQUENT','fr_CA','Demande d\'??valuation d\'un article','{$recipientName},<br />\n<br />\nCeci concerne le manuscrit ?? {$submissionTitle} ??, qui est pr??sentement ??valu?? par {$journalName}.<br />\n<br />\nSuivant l\'??valuation de la derni??re version du manuscrit, l\'auteur a soumis une version r??vis??e de son document. Nous appr??cierions que vous ??valuiez cette nouvelle version.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez ?? cette ??valuation ou non, ou encore pour acc??der ?? la soumission et y enregistrer votre ??valuation et vos recommandations. Le site Web est {$journalUrl}<br />\n<br />\nL\'??valuation est due pour le {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour r??initialiser votre mot de passe (lequel vous sera envoy?? par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez ?? notre demande.<br />\n<br />\n{$signature}<br />\n<br />\n?? {$submissionTitle} ?? <br />\n<br />\n{$submissionAbstract}',NULL),('REVIEW_RESPONSE_OVERDUE_AUTO','en_US','Will you be able to review this for us?','<p>Dear {$recipientName},</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>You are receiving this email because we have not yet received a confirmation from you indicating whether or not you are able to undertake the review of this submission.</p><p>Please let us know whether or not you are able to undertake this review by using our submission management software to accept or decline this request.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>{$submissionTitle}</p><p>Abstract</p>{$submissionAbstract}<p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}',NULL),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','Rappel de demande d\'??valuation d\'un article','{$recipientName},<br />\nCeci est un petit rappel concernant notre demande d\'??valuation de ?? {$submissionTitle} ?? pour la revue {$journalName}. Puisque nous n\'avons pas re??u, comme nous l\'esp??rions, une r??ponse avant le {$responseDueDate}, ce courriel a ??t?? g??n??r?? et envoy?? automatiquement apr??s l\'??ch??ance du d??lai.\n<br />\nNous pensons que vous seriez un-e excellent-e ??valuateur-trice pour le manuscrit. Vous trouverez un r??sum?? de la soumission ci-dessous. Nous esp??rons que vous envisagerez d\'entreprendre cette t??che essentielle ?? la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez ?? cette ??valuation ou non, ou encore pour acc??der ?? la soumission et y enregistrer votre ??valuation et vos recommandations. Le site Web est {$journalUrl}<br />\n<br />\nL\'??valuation est d?? pour le {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour r??initialiser votre mot de passe (lequel vous sera envoy?? par courriel avec votre nom d\'utilisateur-trice). {$passwordResetUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez ?? notre demande.<br />\n<br />\n{$signature}<br />\n<br />\n?? {$submissionTitle} ??<br />\n<br />\n{$submissionAbstract}',NULL),('REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK','en_US','Article Review Request','{$recipientName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$journalName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK','fr_CA','Demande d\'??valuation d\'un article','{$recipientName},<br />\nCeci est un petit rappel concernant notre demande d\'??valuation de la soumission ?? {$submissionTitle} ?? pour la revue {$journalName}. Puisque nous n\'avons pas re??u, comme nous l\'esp??rions, une r??ponse avant le {$responseDueDate}, ce courriel a ??t?? g??n??r?? et envoy?? automatiquement apr??s l\'??ch??ance du d??lai.\n<br />\nNous pensons que vous seriez un-e excellent-e ??valuateur-trice pour le manuscrit. Vous trouverez un r??sum?? de la soumission ci-dessous. Nous esp??rons que vous envisagerez d\'entreprendre cette t??che essentielle ?? la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez ?? cette ??valuation ou non, ou encore pour acc??der ?? la soumission et y enregistrer votre ??valuation et vos recommandations.<br />\n<br />\nL\'??valuation est d?? pour le {$reviewDueDate}.<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez ?? notre demande.<br />\n<br />\n{$signature}<br />\n<br />\n?? {$submissionTitle} ??<br />\n<br />\n{$submissionAbstract}','Ce courriel est automatiquement envoy?? lorsque la date d\'??ch??ance de confirmation d\'un,une ??valuateur-trice est ??coul??e (voir Options de r??vision sous Param??tres &gt; Flux des travaux &gt; R??vision) et l\'acc??s de l\'??valuateur-trice en un clic est activ??. Les t??ches planifi??es doivent ??tre configur??es et activ??es (voir le fichier de configuration du site).'),('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authors}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$signature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('REVISED_VERSION_NOTIFY','fr_CA','Version r??vis??e t??l??vers??e','R??dacteurs-trices,<br />\n<br />\nUne version r??vis??e de ?? {$submissionTitle} ?? a ??t?? t??l??vers??e par l\'auteur-e {$authors}.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\n<br />\n{$signature}','Ce courriel est envoy?? automatiquement au,?? la r??dacteur-trice assign??-e quand un-e auteur-e t??l??verse une version r??vis??e d\'un article.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$signature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','Activit?? ??ditoriale pour {$month} {$year}','\n{$name}, <br />\n<br />\nLe rapport d\'activit?? ??ditoriale de votre revue pour {$month} {$year} est maintenant disponible. Les principales statistiques pour ce mois sont affich??es ci-dessous.<br />\n<ul>\n	<li> Nouvelles soumissions pour ce mois : {$newSubmissions} </li>\n	<li> Soumissions refus??es pour ce mois : {$declinedSubmissions} </li>\n	<li> Soumissions accept??es pour ce mois : {$acceptedSubmissions} </li>\n	<li> Nombre total de soumissions dans la plateforme : {$totalSubmissions} </li>\n</ul>\nConnectez-vous au site de la revue pour voir davantage de <a href=\"{$editorialStatsLink}\">tendances dans l\'activit?? ??ditoriale</a> ainsi que des <a href=\"{$publicationStatsLink}\">statistiques relatives aux articles publi??s</a>. Le rapport complet des tendances de l\'activit?? ??ditoriale de ce mois-ci est joint au pr??sent envoi.<br />\n<br />\nCordialement,<br />\n{$signature}','Ce courriel est envoy?? automatiquement chaque mois aux r??dacteurs et r??dactrices en chef et aux directeurs et directrices de revues pour leur fournir un aper??u de l\'int??grit?? du syst??me.'),('SUBMISSION_ACK','en_US','Thank you for your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$journalName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p>{$signature}','This email, when enabled, is automatically sent to an author when they submit to the journal. It provides information about tracking the submission through the editorial process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accus?? de r??ception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitul?? ?? {$submissionTitle} ?? ?? la revue {$journalName}. Gr??ce ?? notre syst??me de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'??dition en acc??dant au site Web de la revue :<br />\n<br />\nURL de la soumission??: {$submissionUrl}<br />\nNom d\'utilisateur-trice??: {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec nous. Nous vous remercions d\'avoir pens?? ?? notre revue pour la publication de vos travaux.<br />\n<br />\n{$signature}','##emails.submissionAck.description##'),('SUBMISSION_ACK_NOT_USER','en_US','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$journalName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering this journal as a venue for your work.</p><p>Kind regards,</p>{$signature}','This email, when enabled, is automatically sent to authors named on a submission who are not the submitting author.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accus?? de r??ception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitul?? , ?? {$submissionTitle} ?? , a ??t?? soumis par {$submitterName} ?? la revue {$journalName}.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec nous. Nous vous remercions d\'avoir pens?? ?? la revue {$journalName} pour la publication de vos travaux.<br />\n<br />\n{$signature}','Ce courriel, lorsque activ??, est envoy?? automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OJS signal??s-es comme effectuant la soumission.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$signature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY','fr_CA','Abonnement expir??','{$recipientName},<br />\n<br />\nVotre abonnement ?? la revue {$journalName} est expir??.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d\'utilisateur-trice, soit ?? {$recipientUsername} ??.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec nous.<br />\n<br />\n{$signature}','Ce courriel avise un-e abonn??-e que son abonnement est expir??. Il fournit l\'adresse URL de la revue, ainsi que les instructions pour y acc??der.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$signature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','fr_CA','Abonnement expir?? - Dernier rappel','{$recipientName},<br />\n<br />\nVotre abonnement ?? la revue {$journalName} est expir??. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoy??.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration???: {$expiryDate}<br />\n<br />\nPour renouveller votre abonnement, aveuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d\'utilisateur-trice, soit ?? {$recipientUsername} ??.<br />\n<br />\nSi vous avez des questions, ne h??sitez pas ?? communiquer avec nous.<br />\n<br />\n{$signature}','Ce courriel avise un-e abonn??-e que son abonnement est expir??. Il donne l\'adresse URL de la revue ainsi que les instructions pour y acc??der.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$signature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_BEFORE_EXPIRY','fr_CA','Avis d\'expiration de l\'abonnement','{$recipientName},<br />\n<br />\nVotre abonnement ?? la revue {$journalName} expirera bient??t.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nAfin d\'assurer la continuit?? de votre acc??s ?? cette revue, nous vous invitons ?? aller sur le site Web de la revue et ?? renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d\'utilisateur-trice, soit ?? {$recipientUsername} ??.<br />\n<br />\nSi vous avez des questions, ne pas h??siter ?? communiquer avec nous.<br />\n<br />\n{$signature}','Ce courriel avise un-e abonn??-e que son abonnement expirera sous peu. Il fournit l\'adresse URL de la revue, ainsi que les instructions pour y acc??der.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$recipientName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$journalName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$signature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_NOTIFY','fr_CA','Avis d\'abonnement','{$recipientName},<br />\n<br />\nVous ??tes maintenant abonn??-e ?? notre syst??me de gestion de revue en ligne pour la revue {$journalName}, avec le type d\'abonnement suivant ??:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour acc??der au contenu destin?? seulement aux abonn??s, connectez-vous au syst??me ?? l\'aide de votre nom d\'utilisateur-trice??: {$recipientUsername}.<br />\n<br />\nUne fois connect??-e dans le syst??me, vous pouvez, en tout temps, modifier les renseignements de votre profil et votre mot de passe.<br />\n<br />\nVeuillez prendre note que si vous disposez d\'un abonnement institutionnel, les utilisateurs-trices n\'ont pas ?? entrer de nom d\'utilisateur-trice puisque le syst??me authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec nous.<br />\n<br />\n{$signature}','Ce courriel avise un,une lecteur-trice inscrit-e que le,la directeur-trice de la revue lui a cr???? un abonnement. Il fournit l\'adresse URL de la revue ainsi que les instructions pour y acc??der.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INDL','fr_CA','Souscription ?? un abonnement individuel','Une souscription en ligne ?? un abonnement individuel pour la revue {$journalName} avec les renseignements suivants :<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nInformation d\'adh??sion (si fournie) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivante.<br />\n<br />\nURL d\'abonnement : {$subscriptionUrl}<br/>\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement individuel a ??t?? souscrit en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour acc??der ?? l\'abonnement souscrit.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$journalName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','fr_CA','Souscription ?? un abonnement institutionnel','Souscription en ligne ?? un abonnement institutionnel pour la revue {$journalName} avec les renseignements suivants. Pour activer cet abonnement, veuillez utiliser l\'URL d\'abonnement fourni et fixer le statut de l\'abonnement ?? ?? actif ??.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\n??tablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adh??sion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant :<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement institutionnel a ??t?? souscrit en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour acc??der ?? l\'abonnement souscrit.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INDL','fr_CA','Renouvellement d\'abonnement individuel','Un abonnement individuel a ??t?? renouvel?? en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adh??sion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement individuel a ??t?? renouvel?? en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour acc??der ?? l\'abonnement renouvel??.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','fr_CA','Renouvellement d\'abonnement institutionnel','Un abonnement institutionnel a ??t?? renouvel?? en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\n??tablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adh??sion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n','Ce courriel informe le,la responsable des abonnements qu\'un abonnement institutionnel a ??t?? renouvel?? en ligne. Il fournit des renseignements sommaires sur l\'abonnement et le lien pour acc??der ?? l\'abonnement renouvel??.'),('USER_REGISTER','en_US','Journal Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$journalName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription ?? la revue','{$recipientName},<br />\n<br />\nVous ??tes d??sormais inscrit-e en tant qu\'utilisateur-trice pour la revue {$journalName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec la revue via son site Web. ?? n\'importe quel moment, vous pouvez demander ?? ??tre retir??-e de la liste des utilisateurs-trices de la revue en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice??: {$recipientUsername}<br />\nMot de passe??: {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoy?? ?? utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue ?? la revue et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$journalName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}',NULL),('USER_VALIDATE_CONTEXT','fr_CA','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez cr???? un compte pour la revue {$journalName}. Pour pouvoir commencer ?? l\'utiliser il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'?? suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$signature}',NULL),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}',NULL),('USER_VALIDATE_SITE','fr_CA','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez cr???? un compte dans {$siteTitle}. Avant de pouvoir commencer ?? l\'utiliser, il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'?? suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$signature}',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,17,'2022-07-07 23:05:57',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,17,'2022-07-07 23:06:00',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,17,'2022-07-07 23:06:00',1342177288,'submission.event.fileRevised',0),(4,515,1,17,'2022-07-07 23:06:00',1342177296,'submission.event.fileEdited',0),(5,1048585,1,17,'2022-07-07 23:06:00',1342177296,'submission.event.fileEdited',0),(6,1048585,1,17,'2022-07-07 23:06:05',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,17,'2022-07-07 23:06:06',268435457,'submission.event.submissionSubmitted',0),(8,1048585,1,3,'2022-07-07 23:06:16',805306371,'editor.submission.decision.sendExternalReview.log',0),(9,515,2,3,'2022-07-07 23:06:17',1342177281,'submission.event.fileUploaded',0),(10,1048585,1,3,'2022-07-07 23:06:17',1342177288,'submission.event.fileRevised',0),(11,1048585,1,3,'2022-07-07 23:06:26',1073741825,'log.review.reviewerAssigned',0),(12,1048585,1,3,'2022-07-07 23:06:33',1073741825,'log.review.reviewerAssigned',0),(13,1048585,1,3,'2022-07-07 23:06:40',1073741825,'log.review.reviewerAssigned',0),(14,1048585,1,3,'2022-07-07 23:06:45',805306371,'editor.submission.decision.accept.log',0),(15,1048585,1,3,'2022-07-07 23:06:52',268435459,'submission.event.participantAdded',0),(16,1048585,1,3,'2022-07-07 23:06:58',805306371,'editor.submission.decision.sendToProduction.log',0),(17,1048585,1,3,'2022-07-07 23:07:07',268435459,'submission.event.participantAdded',0),(18,1048585,1,3,'2022-07-07 23:07:12',268435459,'submission.event.participantAdded',0),(19,1048585,1,3,'2022-07-07 23:07:21',268435458,'submission.event.general.metadataUpdated',0),(20,1048585,1,3,'2022-07-07 23:07:25',268435458,'submission.event.general.metadataUpdated',0),(21,1048585,1,3,'2022-07-07 23:07:26',268435458,'submission.event.general.metadataUpdated',0),(22,1048585,1,3,'2022-07-07 23:07:33',268435458,'submission.event.general.metadataUpdated',0),(23,515,3,3,'2022-07-07 23:07:43',1342177281,'submission.event.fileUploaded',0),(24,1048585,1,3,'2022-07-07 23:07:43',1342177288,'submission.event.fileRevised',0),(25,515,3,3,'2022-07-07 23:07:44',1342177296,'submission.event.fileEdited',0),(26,1048585,1,3,'2022-07-07 23:07:44',1342177296,'submission.event.fileEdited',0),(27,1048585,1,3,'2022-07-07 23:07:56',268435459,'submission.event.participantAdded',0),(28,1048585,1,17,'2022-07-07 23:08:02',268435458,'submission.event.general.metadataUpdated',0),(29,1048585,1,3,'2022-07-07 23:08:08',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,1,3,'2022-07-07 23:08:09',268435462,'publication.event.published',0),(31,1048585,1,3,'2022-07-07 23:08:19',268435463,'publication.event.unpublished',0),(32,1048585,1,3,'2022-07-07 23:08:26',268435462,'publication.event.published',0),(33,1048585,1,3,'2022-07-07 23:08:30',268435458,'submission.event.general.metadataUpdated',0),(34,1048585,1,3,'2022-07-07 23:08:30',268435458,'submission.event.general.metadataUpdated',0),(35,1048585,1,3,'2022-07-07 23:08:30',268435464,'publication.event.versionCreated',0),(36,1048585,1,3,'2022-07-07 23:08:41',268435458,'submission.event.general.metadataUpdated',0),(37,1048585,1,3,'2022-07-07 23:08:53',268435458,'submission.event.general.metadataUpdated',0),(38,1048585,1,3,'2022-07-07 23:08:54',268435462,'publication.event.versionPublished',0),(39,1048585,1,3,'2022-07-07 23:09:07',268435463,'publication.event.versionUnpublished',0),(40,1048585,1,3,'2022-07-07 23:09:13',268435459,'submission.event.participantAdded',0),(41,1048585,1,3,'2022-07-07 23:09:23',268435459,'submission.event.participantAdded',0),(42,1048585,2,18,'2022-07-07 23:09:37',268435458,'submission.event.general.metadataUpdated',0),(43,515,4,18,'2022-07-07 23:09:40',1342177281,'submission.event.fileUploaded',0),(44,1048585,2,18,'2022-07-07 23:09:40',1342177288,'submission.event.fileRevised',0),(45,515,4,18,'2022-07-07 23:09:40',1342177296,'submission.event.fileEdited',0),(46,1048585,2,18,'2022-07-07 23:09:40',1342177296,'submission.event.fileEdited',0),(47,1048585,2,18,'2022-07-07 23:09:44',268435458,'submission.event.general.metadataUpdated',0),(48,1048585,2,18,'2022-07-07 23:09:45',268435457,'submission.event.submissionSubmitted',0),(49,1048585,2,3,'2022-07-07 23:09:57',805306371,'editor.submission.decision.sendExternalReview.log',0),(50,515,5,3,'2022-07-07 23:09:57',1342177281,'submission.event.fileUploaded',0),(51,1048585,2,3,'2022-07-07 23:09:57',1342177288,'submission.event.fileRevised',0),(52,1048585,2,3,'2022-07-07 23:10:05',268435459,'submission.event.participantAdded',0),(53,1048585,2,3,'2022-07-07 23:10:09',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,2,6,'2022-07-07 23:10:25',805306372,'editor.submission.recommend.accept.log',0),(55,1048585,3,19,'2022-07-07 23:10:48',268435458,'submission.event.general.metadataUpdated',0),(56,515,6,19,'2022-07-07 23:10:51',1342177281,'submission.event.fileUploaded',0),(57,1048585,3,19,'2022-07-07 23:10:51',1342177288,'submission.event.fileRevised',0),(58,515,6,19,'2022-07-07 23:10:51',1342177296,'submission.event.fileEdited',0),(59,1048585,3,19,'2022-07-07 23:10:51',1342177296,'submission.event.fileEdited',0),(60,1048585,3,19,'2022-07-07 23:10:57',268435458,'submission.event.general.metadataUpdated',0),(61,1048585,3,19,'2022-07-07 23:10:58',268435457,'submission.event.submissionSubmitted',0),(62,1048585,3,3,'2022-07-07 23:11:09',805306371,'editor.submission.decision.sendExternalReview.log',0),(63,515,7,3,'2022-07-07 23:11:09',1342177281,'submission.event.fileUploaded',0),(64,1048585,3,3,'2022-07-07 23:11:09',1342177288,'submission.event.fileRevised',0),(65,1048585,3,3,'2022-07-07 23:11:20',1073741825,'log.review.reviewerAssigned',0),(66,1048585,3,3,'2022-07-07 23:11:27',1073741825,'log.review.reviewerAssigned',0),(67,1048585,3,3,'2022-07-07 23:11:33',805306371,'editor.submission.decision.accept.log',0),(68,1048585,3,3,'2022-07-07 23:11:41',268435459,'submission.event.participantAdded',0),(69,1048585,4,20,'2022-07-07 23:11:53',268435458,'submission.event.general.metadataUpdated',0),(70,515,8,20,'2022-07-07 23:11:56',1342177281,'submission.event.fileUploaded',0),(71,1048585,4,20,'2022-07-07 23:11:56',1342177288,'submission.event.fileRevised',0),(72,515,8,20,'2022-07-07 23:11:56',1342177296,'submission.event.fileEdited',0),(73,1048585,4,20,'2022-07-07 23:11:56',1342177296,'submission.event.fileEdited',0),(74,1048585,4,20,'2022-07-07 23:12:05',268435458,'submission.event.general.metadataUpdated',0),(75,1048585,4,20,'2022-07-07 23:12:06',268435457,'submission.event.submissionSubmitted',0),(76,1048585,5,21,'2022-07-07 23:12:16',268435458,'submission.event.general.metadataUpdated',0),(77,515,9,21,'2022-07-07 23:12:18',1342177281,'submission.event.fileUploaded',0),(78,1048585,5,21,'2022-07-07 23:12:18',1342177288,'submission.event.fileRevised',0),(79,515,9,21,'2022-07-07 23:12:18',1342177296,'submission.event.fileEdited',0),(80,1048585,5,21,'2022-07-07 23:12:18',1342177296,'submission.event.fileEdited',0),(81,1048585,5,21,'2022-07-07 23:12:21',268435458,'submission.event.general.metadataUpdated',0),(82,1048585,5,21,'2022-07-07 23:12:22',268435457,'submission.event.submissionSubmitted',0),(83,1048585,5,3,'2022-07-07 23:12:34',805306371,'editor.submission.decision.sendExternalReview.log',0),(84,515,10,3,'2022-07-07 23:12:34',1342177281,'submission.event.fileUploaded',0),(85,1048585,5,3,'2022-07-07 23:12:34',1342177288,'submission.event.fileRevised',0),(86,1048585,5,3,'2022-07-07 23:12:44',1073741825,'log.review.reviewerAssigned',0),(87,1048585,5,3,'2022-07-07 23:12:51',1073741825,'log.review.reviewerAssigned',0),(88,1048585,5,3,'2022-07-07 23:12:57',805306371,'editor.submission.decision.accept.log',0),(89,1048585,5,3,'2022-07-07 23:13:05',268435459,'submission.event.participantAdded',0),(90,1048585,5,3,'2022-07-07 23:13:12',805306371,'editor.submission.decision.sendToProduction.log',0),(91,1048585,5,3,'2022-07-07 23:13:22',268435459,'submission.event.participantAdded',0),(92,1048585,5,3,'2022-07-07 23:13:28',268435459,'submission.event.participantAdded',0),(93,1048585,6,22,'2022-07-07 23:13:40',268435458,'submission.event.general.metadataUpdated',0),(94,515,11,22,'2022-07-07 23:13:42',1342177281,'submission.event.fileUploaded',0),(95,1048585,6,22,'2022-07-07 23:13:42',1342177288,'submission.event.fileRevised',0),(96,515,11,22,'2022-07-07 23:13:43',1342177296,'submission.event.fileEdited',0),(97,1048585,6,22,'2022-07-07 23:13:43',1342177296,'submission.event.fileEdited',0),(98,1048585,6,22,'2022-07-07 23:13:49',268435458,'submission.event.general.metadataUpdated',0),(99,1048585,6,22,'2022-07-07 23:13:50',268435457,'submission.event.submissionSubmitted',0),(100,1048585,6,3,'2022-07-07 23:14:02',805306371,'editor.submission.decision.sendExternalReview.log',0),(101,515,12,3,'2022-07-07 23:14:02',1342177281,'submission.event.fileUploaded',0),(102,1048585,6,3,'2022-07-07 23:14:02',1342177288,'submission.event.fileRevised',0),(103,1048585,6,3,'2022-07-07 23:14:12',1073741825,'log.review.reviewerAssigned',0),(104,1048585,6,3,'2022-07-07 23:14:20',1073741825,'log.review.reviewerAssigned',0),(105,1048585,6,3,'2022-07-07 23:14:25',805306371,'editor.submission.decision.accept.log',0),(106,1048585,6,3,'2022-07-07 23:14:35',268435459,'submission.event.participantAdded',0),(107,1048585,6,3,'2022-07-07 23:14:41',805306371,'editor.submission.decision.sendToProduction.log',0),(108,1048585,6,3,'2022-07-07 23:14:51',268435459,'submission.event.participantAdded',0),(109,1048585,7,23,'2022-07-07 23:15:02',268435458,'submission.event.general.metadataUpdated',0),(110,515,13,23,'2022-07-07 23:15:04',1342177281,'submission.event.fileUploaded',0),(111,1048585,7,23,'2022-07-07 23:15:04',1342177288,'submission.event.fileRevised',0),(112,515,13,23,'2022-07-07 23:15:05',1342177296,'submission.event.fileEdited',0),(113,1048585,7,23,'2022-07-07 23:15:05',1342177296,'submission.event.fileEdited',0),(114,1048585,7,23,'2022-07-07 23:15:08',268435458,'submission.event.general.metadataUpdated',0),(115,1048585,7,23,'2022-07-07 23:15:09',268435457,'submission.event.submissionSubmitted',0),(116,1048585,7,3,'2022-07-07 23:15:22',805306371,'editor.submission.decision.sendExternalReview.log',0),(117,515,14,3,'2022-07-07 23:15:22',1342177281,'submission.event.fileUploaded',0),(118,1048585,7,3,'2022-07-07 23:15:22',1342177288,'submission.event.fileRevised',0),(119,1048585,7,3,'2022-07-07 23:15:32',1073741825,'log.review.reviewerAssigned',0),(120,1048585,7,3,'2022-07-07 23:15:39',1073741825,'log.review.reviewerAssigned',0),(121,1048585,7,3,'2022-07-07 23:15:47',1073741825,'log.review.reviewerAssigned',0),(122,1048585,7,8,'2022-07-07 23:15:55',1073741830,'log.review.reviewAccepted',0),(123,1048585,7,8,'2022-07-07 23:15:59',1073741848,'log.review.reviewReady',0),(124,1048585,8,24,'2022-07-07 23:16:10',268435458,'submission.event.general.metadataUpdated',0),(125,515,15,24,'2022-07-07 23:16:12',1342177281,'submission.event.fileUploaded',0),(126,1048585,8,24,'2022-07-07 23:16:12',1342177288,'submission.event.fileRevised',0),(127,515,15,24,'2022-07-07 23:16:13',1342177296,'submission.event.fileEdited',0),(128,1048585,8,24,'2022-07-07 23:16:13',1342177296,'submission.event.fileEdited',0),(129,1048585,8,24,'2022-07-07 23:16:21',268435458,'submission.event.general.metadataUpdated',0),(130,1048585,8,24,'2022-07-07 23:16:22',268435457,'submission.event.submissionSubmitted',0),(131,1048585,9,25,'2022-07-07 23:16:32',268435458,'submission.event.general.metadataUpdated',0),(132,515,16,25,'2022-07-07 23:16:35',1342177281,'submission.event.fileUploaded',0),(133,1048585,9,25,'2022-07-07 23:16:35',1342177288,'submission.event.fileRevised',0),(134,515,16,25,'2022-07-07 23:16:35',1342177296,'submission.event.fileEdited',0),(135,1048585,9,25,'2022-07-07 23:16:35',1342177296,'submission.event.fileEdited',0),(136,1048585,9,25,'2022-07-07 23:16:38',268435458,'submission.event.general.metadataUpdated',0),(137,1048585,9,25,'2022-07-07 23:16:39',268435457,'submission.event.submissionSubmitted',0),(138,1048585,9,3,'2022-07-07 23:16:51',805306371,'editor.submission.decision.sendExternalReview.log',0),(139,515,17,3,'2022-07-07 23:16:51',1342177281,'submission.event.fileUploaded',0),(140,1048585,9,3,'2022-07-07 23:16:51',1342177288,'submission.event.fileRevised',0),(141,1048585,9,3,'2022-07-07 23:17:01',1073741825,'log.review.reviewerAssigned',0),(142,1048585,9,3,'2022-07-07 23:17:08',1073741825,'log.review.reviewerAssigned',0),(143,1048585,9,3,'2022-07-07 23:17:14',805306371,'editor.submission.decision.accept.log',0),(144,1048585,9,3,'2022-07-07 23:17:22',268435459,'submission.event.participantAdded',0),(145,1048585,9,3,'2022-07-07 23:17:29',805306371,'editor.submission.decision.sendToProduction.log',0),(146,1048585,9,3,'2022-07-07 23:17:38',268435459,'submission.event.participantAdded',0),(147,1048585,9,3,'2022-07-07 23:17:44',268435459,'submission.event.participantAdded',0),(148,1048585,10,26,'2022-07-07 23:17:55',268435458,'submission.event.general.metadataUpdated',0),(149,515,18,26,'2022-07-07 23:17:57',1342177281,'submission.event.fileUploaded',0),(150,1048585,10,26,'2022-07-07 23:17:57',1342177288,'submission.event.fileRevised',0),(151,515,18,26,'2022-07-07 23:17:58',1342177296,'submission.event.fileEdited',0),(152,1048585,10,26,'2022-07-07 23:17:58',1342177296,'submission.event.fileEdited',0),(153,1048585,10,26,'2022-07-07 23:18:02',268435458,'submission.event.general.metadataUpdated',0),(154,1048585,10,26,'2022-07-07 23:18:03',268435457,'submission.event.submissionSubmitted',0),(155,1048585,10,3,'2022-07-07 23:18:16',805306371,'editor.submission.decision.sendExternalReview.log',0),(156,515,19,3,'2022-07-07 23:18:17',1342177281,'submission.event.fileUploaded',0),(157,1048585,10,3,'2022-07-07 23:18:17',1342177288,'submission.event.fileRevised',0),(158,1048585,10,3,'2022-07-07 23:18:26',1073741825,'log.review.reviewerAssigned',0),(159,1048585,10,3,'2022-07-07 23:18:34',1073741825,'log.review.reviewerAssigned',0),(160,1048585,10,9,'2022-07-07 23:18:42',1073741830,'log.review.reviewAccepted',0),(161,1048585,10,9,'2022-07-07 23:18:46',1073741848,'log.review.reviewReady',0),(162,1048585,10,10,'2022-07-07 23:18:54',1073741830,'log.review.reviewAccepted',0),(163,1048585,10,10,'2022-07-07 23:18:59',1073741848,'log.review.reviewReady',0),(164,1048585,11,27,'2022-07-07 23:19:10',268435458,'submission.event.general.metadataUpdated',0),(165,515,20,27,'2022-07-07 23:19:13',1342177281,'submission.event.fileUploaded',0),(166,1048585,11,27,'2022-07-07 23:19:13',1342177288,'submission.event.fileRevised',0),(167,515,20,27,'2022-07-07 23:19:13',1342177296,'submission.event.fileEdited',0),(168,1048585,11,27,'2022-07-07 23:19:13',1342177296,'submission.event.fileEdited',0),(169,1048585,11,27,'2022-07-07 23:19:21',268435458,'submission.event.general.metadataUpdated',0),(170,1048585,11,27,'2022-07-07 23:19:23',268435457,'submission.event.submissionSubmitted',0),(171,1048585,12,28,'2022-07-07 23:19:33',268435458,'submission.event.general.metadataUpdated',0),(172,515,21,28,'2022-07-07 23:19:35',1342177281,'submission.event.fileUploaded',0),(173,1048585,12,28,'2022-07-07 23:19:35',1342177288,'submission.event.fileRevised',0),(174,515,21,28,'2022-07-07 23:19:36',1342177296,'submission.event.fileEdited',0),(175,1048585,12,28,'2022-07-07 23:19:36',1342177296,'submission.event.fileEdited',0),(176,1048585,12,28,'2022-07-07 23:19:41',268435458,'submission.event.general.metadataUpdated',0),(177,1048585,12,28,'2022-07-07 23:19:43',268435457,'submission.event.submissionSubmitted',0),(178,1048585,12,3,'2022-07-07 23:19:56',805306371,'editor.submission.decision.sendExternalReview.log',0),(179,515,22,3,'2022-07-07 23:19:56',1342177281,'submission.event.fileUploaded',0),(180,1048585,12,3,'2022-07-07 23:19:56',1342177288,'submission.event.fileRevised',0),(181,1048585,12,3,'2022-07-07 23:20:06',1073741825,'log.review.reviewerAssigned',0),(182,1048585,12,3,'2022-07-07 23:20:13',1073741825,'log.review.reviewerAssigned',0),(183,1048585,13,29,'2022-07-07 23:20:25',268435458,'submission.event.general.metadataUpdated',0),(184,515,23,29,'2022-07-07 23:20:27',1342177281,'submission.event.fileUploaded',0),(185,1048585,13,29,'2022-07-07 23:20:27',1342177288,'submission.event.fileRevised',0),(186,515,23,29,'2022-07-07 23:20:28',1342177296,'submission.event.fileEdited',0),(187,1048585,13,29,'2022-07-07 23:20:28',1342177296,'submission.event.fileEdited',0),(188,1048585,13,29,'2022-07-07 23:20:33',268435458,'submission.event.general.metadataUpdated',0),(189,1048585,13,29,'2022-07-07 23:20:34',268435457,'submission.event.submissionSubmitted',0),(190,1048585,13,3,'2022-07-07 23:20:47',805306371,'editor.submission.decision.sendExternalReview.log',0),(191,515,24,3,'2022-07-07 23:20:48',1342177281,'submission.event.fileUploaded',0),(192,1048585,13,3,'2022-07-07 23:20:48',1342177288,'submission.event.fileRevised',0),(193,1048585,13,3,'2022-07-07 23:20:57',1073741825,'log.review.reviewerAssigned',0),(194,1048585,13,3,'2022-07-07 23:21:05',1073741825,'log.review.reviewerAssigned',0),(195,1048585,13,3,'2022-07-07 23:21:12',1073741825,'log.review.reviewerAssigned',0),(196,1048585,13,7,'2022-07-07 23:21:21',1073741830,'log.review.reviewAccepted',0),(197,1048585,13,7,'2022-07-07 23:21:25',1073741848,'log.review.reviewReady',0),(198,1048585,13,9,'2022-07-07 23:21:34',1073741830,'log.review.reviewAccepted',0),(199,1048585,13,9,'2022-07-07 23:21:39',1073741848,'log.review.reviewReady',0),(200,1048585,13,10,'2022-07-07 23:21:48',1073741830,'log.review.reviewAccepted',0),(201,1048585,13,10,'2022-07-07 23:21:52',1073741848,'log.review.reviewReady',0),(202,1048585,13,3,'2022-07-07 23:22:13',805306371,'editor.submission.decision.requestRevisions.log',0),(203,1048585,13,3,'2022-07-07 23:22:13',1073741856,'submission.event.decisionReviewerEmailSent',0),(204,1048585,14,30,'2022-07-07 23:22:28',268435458,'submission.event.general.metadataUpdated',0),(205,515,25,30,'2022-07-07 23:22:30',1342177281,'submission.event.fileUploaded',0),(206,1048585,14,30,'2022-07-07 23:22:30',1342177288,'submission.event.fileRevised',0),(207,515,25,30,'2022-07-07 23:22:30',1342177296,'submission.event.fileEdited',0),(208,1048585,14,30,'2022-07-07 23:22:30',1342177296,'submission.event.fileEdited',0),(209,1048585,14,30,'2022-07-07 23:22:35',268435458,'submission.event.general.metadataUpdated',0),(210,1048585,14,30,'2022-07-07 23:22:36',268435457,'submission.event.submissionSubmitted',0),(211,1048585,15,31,'2022-07-07 23:22:46',268435458,'submission.event.general.metadataUpdated',0),(212,515,26,31,'2022-07-07 23:22:48',1342177281,'submission.event.fileUploaded',0),(213,1048585,15,31,'2022-07-07 23:22:48',1342177288,'submission.event.fileRevised',0),(214,515,26,31,'2022-07-07 23:22:49',1342177296,'submission.event.fileEdited',0),(215,1048585,15,31,'2022-07-07 23:22:49',1342177296,'submission.event.fileEdited',0),(216,1048585,15,31,'2022-07-07 23:22:52',268435458,'submission.event.general.metadataUpdated',0),(217,1048585,15,31,'2022-07-07 23:22:53',268435457,'submission.event.submissionSubmitted',0),(218,1048585,15,3,'2022-07-07 23:23:05',805306371,'editor.submission.decision.sendExternalReview.log',0),(219,515,27,3,'2022-07-07 23:23:06',1342177281,'submission.event.fileUploaded',0),(220,1048585,15,3,'2022-07-07 23:23:06',1342177288,'submission.event.fileRevised',0),(221,1048585,15,3,'2022-07-07 23:23:16',1073741825,'log.review.reviewerAssigned',0),(222,1048585,15,3,'2022-07-07 23:23:23',1073741825,'log.review.reviewerAssigned',0),(223,1048585,15,3,'2022-07-07 23:23:29',805306371,'editor.submission.decision.accept.log',0),(224,1048585,15,3,'2022-07-07 23:23:37',268435459,'submission.event.participantAdded',0),(225,1048585,15,3,'2022-07-07 23:23:44',805306371,'editor.submission.decision.sendToProduction.log',0),(226,1048585,15,3,'2022-07-07 23:23:53',268435459,'submission.event.participantAdded',0),(227,1048585,16,32,'2022-07-07 23:24:04',268435458,'submission.event.general.metadataUpdated',0),(228,515,28,32,'2022-07-07 23:24:07',1342177281,'submission.event.fileUploaded',0),(229,1048585,16,32,'2022-07-07 23:24:07',1342177288,'submission.event.fileRevised',0),(230,515,28,32,'2022-07-07 23:24:07',1342177296,'submission.event.fileEdited',0),(231,1048585,16,32,'2022-07-07 23:24:07',1342177296,'submission.event.fileEdited',0),(232,1048585,16,32,'2022-07-07 23:24:13',268435458,'submission.event.general.metadataUpdated',0),(233,1048585,16,32,'2022-07-07 23:24:14',268435457,'submission.event.submissionSubmitted',0),(234,1048585,17,33,'2022-07-07 23:24:23',268435458,'submission.event.general.metadataUpdated',0),(235,515,29,33,'2022-07-07 23:24:26',1342177281,'submission.event.fileUploaded',0),(236,1048585,17,33,'2022-07-07 23:24:26',1342177288,'submission.event.fileRevised',0),(237,515,29,33,'2022-07-07 23:24:27',1342177296,'submission.event.fileEdited',0),(238,1048585,17,33,'2022-07-07 23:24:27',1342177296,'submission.event.fileEdited',0),(239,1048585,17,33,'2022-07-07 23:24:34',268435458,'submission.event.general.metadataUpdated',0),(240,1048585,17,33,'2022-07-07 23:24:35',268435457,'submission.event.submissionSubmitted',0),(241,1048585,17,3,'2022-07-07 23:24:48',805306371,'editor.submission.decision.sendExternalReview.log',0),(242,515,30,3,'2022-07-07 23:24:49',1342177281,'submission.event.fileUploaded',0),(243,1048585,17,3,'2022-07-07 23:24:49',1342177288,'submission.event.fileRevised',0),(244,1048585,17,3,'2022-07-07 23:24:58',1073741825,'log.review.reviewerAssigned',0),(245,1048585,17,3,'2022-07-07 23:25:05',1073741825,'log.review.reviewerAssigned',0),(246,1048585,17,3,'2022-07-07 23:25:11',805306371,'editor.submission.decision.accept.log',0),(247,1048585,17,3,'2022-07-07 23:25:19',268435459,'submission.event.participantAdded',0),(248,1048585,17,3,'2022-07-07 23:25:26',805306371,'editor.submission.decision.sendToProduction.log',0),(249,1048585,17,3,'2022-07-07 23:25:35',268435459,'submission.event.participantAdded',0),(250,1048585,17,3,'2022-07-07 23:25:41',268435459,'submission.event.participantAdded',0),(251,515,31,3,'2022-07-07 23:25:50',1342177281,'submission.event.fileUploaded',0),(252,1048585,17,3,'2022-07-07 23:25:50',1342177288,'submission.event.fileRevised',0),(253,515,31,3,'2022-07-07 23:25:51',1342177296,'submission.event.fileEdited',0),(254,1048585,17,3,'2022-07-07 23:25:51',1342177296,'submission.event.fileEdited',0),(255,1048585,17,3,'2022-07-07 23:26:01',268435458,'submission.event.general.metadataUpdated',0),(256,1048585,17,3,'2022-07-07 23:26:02',268435462,'publication.event.scheduled',0),(257,1048585,17,3,'2022-07-07 23:26:09',268435462,'publication.event.published',0),(258,1048585,17,3,'2022-07-07 23:26:20',268435463,'publication.event.unpublished',0),(259,1048585,17,3,'2022-07-07 23:26:20',268435462,'publication.event.scheduled',0),(260,1048585,17,3,'2022-07-07 23:26:31',268435462,'publication.event.published',0),(261,1048585,17,3,'2022-07-07 23:26:43',268435463,'publication.event.unpublished',0),(262,1048585,17,3,'2022-07-07 23:26:43',268435458,'submission.event.general.metadataUpdated',0),(263,1048585,17,3,'2022-07-07 23:27:00',268435458,'submission.event.general.metadataUpdated',0),(264,1048585,17,3,'2022-07-07 23:27:01',268435462,'publication.event.published',0),(265,1048585,18,34,'2022-07-07 23:27:18',268435458,'submission.event.general.metadataUpdated',0),(266,515,32,34,'2022-07-07 23:27:20',1342177281,'submission.event.fileUploaded',0),(267,1048585,18,34,'2022-07-07 23:27:20',1342177288,'submission.event.fileRevised',0),(268,515,32,34,'2022-07-07 23:27:21',1342177296,'submission.event.fileEdited',0),(269,1048585,18,34,'2022-07-07 23:27:21',1342177296,'submission.event.fileEdited',0),(270,1048585,18,34,'2022-07-07 23:27:24',268435458,'submission.event.general.metadataUpdated',0),(271,1048585,18,34,'2022-07-07 23:27:25',268435457,'submission.event.submissionSubmitted',0),(272,1048585,18,3,'2022-07-07 23:27:39',805306371,'editor.submission.decision.decline.log',0),(273,1048585,19,35,'2022-07-07 23:27:52',268435458,'submission.event.general.metadataUpdated',0),(274,515,33,35,'2022-07-07 23:27:55',1342177281,'submission.event.fileUploaded',0),(275,1048585,19,35,'2022-07-07 23:27:55',1342177288,'submission.event.fileRevised',0),(276,515,33,35,'2022-07-07 23:27:55',1342177296,'submission.event.fileEdited',0),(277,1048585,19,35,'2022-07-07 23:27:55',1342177296,'submission.event.fileEdited',0),(278,1048585,19,35,'2022-07-07 23:27:58',268435458,'submission.event.general.metadataUpdated',0),(279,1048585,19,35,'2022-07-07 23:27:59',268435457,'submission.event.submissionSubmitted',0),(280,1048585,19,3,'2022-07-07 23:28:13',805306371,'editor.submission.decision.sendExternalReview.log',0),(281,515,34,3,'2022-07-07 23:28:14',1342177281,'submission.event.fileUploaded',0),(282,1048585,19,3,'2022-07-07 23:28:14',1342177288,'submission.event.fileRevised',0),(283,1048585,19,3,'2022-07-07 23:28:23',1073741825,'log.review.reviewerAssigned',0),(284,1048585,19,3,'2022-07-07 23:28:31',1073741825,'log.review.reviewerAssigned',0),(285,1048585,19,3,'2022-07-07 23:28:36',805306371,'editor.submission.decision.accept.log',0),(286,1048585,19,3,'2022-07-07 23:28:45',268435459,'submission.event.participantAdded',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','2','int'),(2,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','amwandenga','string'),(3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','amwandenga','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','amwandenga','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(5,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','amwandenga','string'),(8,'decision','8','int'),(8,'editorId','3','int'),(8,'editorName','Daniel Barnes','string'),(8,'submissionId','1','int'),(9,'fileId','1','int'),(9,'fileStage','4','int'),(9,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(9,'sourceSubmissionFileId','1','int'),(9,'submissionFileId','2','int'),(9,'submissionId','1','int'),(9,'username','dbarnes','string'),(10,'fileId','1','int'),(10,'fileStage','4','int'),(10,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','dbarnes','string'),(11,'reviewAssignmentId','1','string'),(11,'reviewerName','Julie Janssen','string'),(11,'round','1','int'),(11,'stageId','3','int'),(11,'submissionId','1','int'),(12,'reviewAssignmentId','2','string'),(12,'reviewerName','Aisla McCrae','string'),(12,'round','1','int'),(12,'stageId','3','int'),(12,'submissionId','1','int'),(13,'reviewAssignmentId','3','string'),(13,'reviewerName','Adela Gallego','string'),(13,'round','1','int'),(13,'stageId','3','int'),(13,'submissionId','1','int'),(14,'decision','1','int'),(14,'editorId','3','int'),(14,'editorName','Daniel Barnes','string'),(14,'submissionId','1','int'),(15,'name','Sarah Vogt','string'),(15,'userGroupName','Copyeditor','string'),(15,'username','svogt','string'),(16,'decision','7','int'),(16,'editorId','3','int'),(16,'editorName','Daniel Barnes','string'),(16,'submissionId','1','int'),(17,'name','Stephen Hellier','string'),(17,'userGroupName','Layout Editor','string'),(17,'username','shellier','string'),(18,'name','Sabine Kumar','string'),(18,'userGroupName','Proofreader','string'),(18,'username','skumar','string'),(23,'fileId','2','int'),(23,'fileStage','10','int'),(23,'originalFileName','article.pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','3','int'),(23,'submissionId','1','int'),(23,'username','dbarnes','string'),(24,'fileId','2','int'),(24,'fileStage','10','int'),(24,'name','article.pdf','string'),(24,'submissionFileId','3','int'),(24,'submissionId','1','int'),(24,'username','dbarnes','string'),(25,'fileId','2','int'),(25,'fileStage','10','int'),(25,'originalFileName','article.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','3','int'),(25,'submissionId','1','int'),(25,'username','dbarnes','string'),(26,'fileId','2','int'),(26,'fileStage','10','int'),(26,'name','article.pdf','string'),(26,'originalFileName','article.pdf','string'),(26,'sourceSubmissionFileId',NULL,'string'),(26,'submissionFileId','3','int'),(26,'submissionId','1','int'),(26,'username','dbarnes','string'),(27,'name','Alan Mwandenga','string'),(27,'userGroupName','Author','string'),(27,'username','amwandenga','string'),(40,'name','Stephanie Berardo','string'),(40,'userGroupName','Section editor','string'),(40,'username','sberardo','string'),(41,'name','Stephanie Berardo','string'),(41,'userGroupName','Section editor','string'),(41,'username','sberardo','string'),(43,'fileId','3','int'),(43,'fileStage','2','int'),(43,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(43,'sourceSubmissionFileId',NULL,'string'),(43,'submissionFileId','4','int'),(43,'submissionId','2','int'),(43,'username','ccorino','string'),(44,'fileId','3','int'),(44,'fileStage','2','int'),(44,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(44,'submissionFileId','4','int'),(44,'submissionId','2','int'),(44,'username','ccorino','string'),(45,'fileId','3','int'),(45,'fileStage','2','int'),(45,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(45,'sourceSubmissionFileId',NULL,'string'),(45,'submissionFileId','4','int'),(45,'submissionId','2','int'),(45,'username','ccorino','string'),(46,'fileId','3','int'),(46,'fileStage','2','int'),(46,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(46,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','4','int'),(46,'submissionId','2','int'),(46,'username','ccorino','string'),(49,'decision','8','int'),(49,'editorId','3','int'),(49,'editorName','Daniel Barnes','string'),(49,'submissionId','2','int'),(50,'fileId','3','int'),(50,'fileStage','4','int'),(50,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(50,'sourceSubmissionFileId','4','int'),(50,'submissionFileId','5','int'),(50,'submissionId','2','int'),(50,'username','dbarnes','string'),(51,'fileId','3','int'),(51,'fileStage','4','int'),(51,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(51,'submissionFileId','5','int'),(51,'submissionId','2','int'),(51,'username','dbarnes','string'),(52,'name','Minoti Inoue','string'),(52,'userGroupName','Section editor','string'),(52,'username','minoue','string'),(54,'decision','11','int'),(54,'editorId','6','int'),(54,'editorName','Minoti Inoue','string'),(54,'submissionId','2','int'),(56,'fileId','4','int'),(56,'fileStage','2','int'),(56,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','6','int'),(56,'submissionId','3','int'),(56,'username','ckwantes','string'),(57,'fileId','4','int'),(57,'fileStage','2','int'),(57,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(57,'submissionFileId','6','int'),(57,'submissionId','3','int'),(57,'username','ckwantes','string'),(58,'fileId','4','int'),(58,'fileStage','2','int'),(58,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','6','int'),(58,'submissionId','3','int'),(58,'username','ckwantes','string'),(59,'fileId','4','int'),(59,'fileStage','2','int'),(59,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(59,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(59,'sourceSubmissionFileId',NULL,'string'),(59,'submissionFileId','6','int'),(59,'submissionId','3','int'),(59,'username','ckwantes','string'),(62,'decision','8','int'),(62,'editorId','3','int'),(62,'editorName','Daniel Barnes','string'),(62,'submissionId','3','int'),(63,'fileId','4','int'),(63,'fileStage','4','int'),(63,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(63,'sourceSubmissionFileId','6','int'),(63,'submissionFileId','7','int'),(63,'submissionId','3','int'),(63,'username','dbarnes','string'),(64,'fileId','4','int'),(64,'fileStage','4','int'),(64,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(64,'submissionFileId','7','int'),(64,'submissionId','3','int'),(64,'username','dbarnes','string'),(65,'reviewAssignmentId','4','string'),(65,'reviewerName','Aisla McCrae','string'),(65,'round','1','int'),(65,'stageId','3','int'),(65,'submissionId','3','int'),(66,'reviewAssignmentId','5','string'),(66,'reviewerName','Adela Gallego','string'),(66,'round','1','int'),(66,'stageId','3','int'),(66,'submissionId','3','int'),(67,'decision','1','int'),(67,'editorId','3','int'),(67,'editorName','Daniel Barnes','string'),(67,'submissionId','3','int'),(68,'name','Maria Fritz','string'),(68,'userGroupName','Copyeditor','string'),(68,'username','mfritz','string'),(70,'fileId','5','int'),(70,'fileStage','2','int'),(70,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','8','int'),(70,'submissionId','4','int'),(70,'username','cmontgomerie','string'),(71,'fileId','5','int'),(71,'fileStage','2','int'),(71,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(71,'submissionFileId','8','int'),(71,'submissionId','4','int'),(71,'username','cmontgomerie','string'),(72,'fileId','5','int'),(72,'fileStage','2','int'),(72,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(72,'sourceSubmissionFileId',NULL,'string'),(72,'submissionFileId','8','int'),(72,'submissionId','4','int'),(72,'username','cmontgomerie','string'),(73,'fileId','5','int'),(73,'fileStage','2','int'),(73,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(73,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','8','int'),(73,'submissionId','4','int'),(73,'username','cmontgomerie','string'),(77,'fileId','6','int'),(77,'fileStage','2','int'),(77,'originalFileName','Genetic transformation of forest trees.pdf','string'),(77,'sourceSubmissionFileId',NULL,'string'),(77,'submissionFileId','9','int'),(77,'submissionId','5','int'),(77,'username','ddiouf','string'),(78,'fileId','6','int'),(78,'fileStage','2','int'),(78,'name','Genetic transformation of forest trees.pdf','string'),(78,'submissionFileId','9','int'),(78,'submissionId','5','int'),(78,'username','ddiouf','string'),(79,'fileId','6','int'),(79,'fileStage','2','int'),(79,'originalFileName','Genetic transformation of forest trees.pdf','string'),(79,'sourceSubmissionFileId',NULL,'string'),(79,'submissionFileId','9','int'),(79,'submissionId','5','int'),(79,'username','ddiouf','string'),(80,'fileId','6','int'),(80,'fileStage','2','int'),(80,'name','Genetic transformation of forest trees.pdf','string'),(80,'originalFileName','Genetic transformation of forest trees.pdf','string'),(80,'sourceSubmissionFileId',NULL,'string'),(80,'submissionFileId','9','int'),(80,'submissionId','5','int'),(80,'username','ddiouf','string'),(83,'decision','8','int'),(83,'editorId','3','int'),(83,'editorName','Daniel Barnes','string'),(83,'submissionId','5','int'),(84,'fileId','6','int'),(84,'fileStage','4','int'),(84,'originalFileName','Genetic transformation of forest trees.pdf','string'),(84,'sourceSubmissionFileId','9','int'),(84,'submissionFileId','10','int'),(84,'submissionId','5','int'),(84,'username','dbarnes','string'),(85,'fileId','6','int'),(85,'fileStage','4','int'),(85,'name','Genetic transformation of forest trees.pdf','string'),(85,'submissionFileId','10','int'),(85,'submissionId','5','int'),(85,'username','dbarnes','string'),(86,'reviewAssignmentId','6','string'),(86,'reviewerName','Paul Hudson','string'),(86,'round','1','int'),(86,'stageId','3','int'),(86,'submissionId','5','int'),(87,'reviewAssignmentId','7','string'),(87,'reviewerName','Adela Gallego','string'),(87,'round','1','int'),(87,'stageId','3','int'),(87,'submissionId','5','int'),(88,'decision','1','int'),(88,'editorId','3','int'),(88,'editorName','Daniel Barnes','string'),(88,'submissionId','5','int'),(89,'name','Maria Fritz','string'),(89,'userGroupName','Copyeditor','string'),(89,'username','mfritz','string'),(90,'decision','7','int'),(90,'editorId','3','int'),(90,'editorName','Daniel Barnes','string'),(90,'submissionId','5','int'),(91,'name','Graham Cox','string'),(91,'userGroupName','Layout Editor','string'),(91,'username','gcox','string'),(92,'name','Catherine Turner','string'),(92,'userGroupName','Proofreader','string'),(92,'username','cturner','string'),(94,'fileId','7','int'),(94,'fileStage','2','int'),(94,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(94,'sourceSubmissionFileId',NULL,'string'),(94,'submissionFileId','11','int'),(94,'submissionId','6','int'),(94,'username','dphillips','string'),(95,'fileId','7','int'),(95,'fileStage','2','int'),(95,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(95,'submissionFileId','11','int'),(95,'submissionId','6','int'),(95,'username','dphillips','string'),(96,'fileId','7','int'),(96,'fileStage','2','int'),(96,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(96,'sourceSubmissionFileId',NULL,'string'),(96,'submissionFileId','11','int'),(96,'submissionId','6','int'),(96,'username','dphillips','string'),(97,'fileId','7','int'),(97,'fileStage','2','int'),(97,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(97,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','11','int'),(97,'submissionId','6','int'),(97,'username','dphillips','string'),(100,'decision','8','int'),(100,'editorId','3','int'),(100,'editorName','Daniel Barnes','string'),(100,'submissionId','6','int'),(101,'fileId','7','int'),(101,'fileStage','4','int'),(101,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(101,'sourceSubmissionFileId','11','int'),(101,'submissionFileId','12','int'),(101,'submissionId','6','int'),(101,'username','dbarnes','string'),(102,'fileId','7','int'),(102,'fileStage','4','int'),(102,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(102,'submissionFileId','12','int'),(102,'submissionId','6','int'),(102,'username','dbarnes','string'),(103,'reviewAssignmentId','8','string'),(103,'reviewerName','Julie Janssen','string'),(103,'round','1','int'),(103,'stageId','3','int'),(103,'submissionId','6','int'),(104,'reviewAssignmentId','9','string'),(104,'reviewerName','Adela Gallego','string'),(104,'round','1','int'),(104,'stageId','3','int'),(104,'submissionId','6','int'),(105,'decision','1','int'),(105,'editorId','3','int'),(105,'editorName','Daniel Barnes','string'),(105,'submissionId','6','int'),(106,'name','Maria Fritz','string'),(106,'userGroupName','Copyeditor','string'),(106,'username','mfritz','string'),(107,'decision','7','int'),(107,'editorId','3','int'),(107,'editorName','Daniel Barnes','string'),(107,'submissionId','6','int'),(108,'name','Graham Cox','string'),(108,'userGroupName','Layout Editor','string'),(108,'username','gcox','string'),(110,'fileId','8','int'),(110,'fileStage','2','int'),(110,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(110,'sourceSubmissionFileId',NULL,'string'),(110,'submissionFileId','13','int'),(110,'submissionId','7','int'),(110,'username','dsokoloff','string'),(111,'fileId','8','int'),(111,'fileStage','2','int'),(111,'name','Developing efficacy beliefs in the classroom.pdf','string'),(111,'submissionFileId','13','int'),(111,'submissionId','7','int'),(111,'username','dsokoloff','string'),(112,'fileId','8','int'),(112,'fileStage','2','int'),(112,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(112,'sourceSubmissionFileId',NULL,'string'),(112,'submissionFileId','13','int'),(112,'submissionId','7','int'),(112,'username','dsokoloff','string'),(113,'fileId','8','int'),(113,'fileStage','2','int'),(113,'name','Developing efficacy beliefs in the classroom.pdf','string'),(113,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(113,'sourceSubmissionFileId',NULL,'string'),(113,'submissionFileId','13','int'),(113,'submissionId','7','int'),(113,'username','dsokoloff','string'),(116,'decision','8','int'),(116,'editorId','3','int'),(116,'editorName','Daniel Barnes','string'),(116,'submissionId','7','int'),(117,'fileId','8','int'),(117,'fileStage','4','int'),(117,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(117,'sourceSubmissionFileId','13','int'),(117,'submissionFileId','14','int'),(117,'submissionId','7','int'),(117,'username','dbarnes','string'),(118,'fileId','8','int'),(118,'fileStage','4','int'),(118,'name','Developing efficacy beliefs in the classroom.pdf','string'),(118,'submissionFileId','14','int'),(118,'submissionId','7','int'),(118,'username','dbarnes','string'),(119,'reviewAssignmentId','10','string'),(119,'reviewerName','Paul Hudson','string'),(119,'round','1','int'),(119,'stageId','3','int'),(119,'submissionId','7','int'),(120,'reviewAssignmentId','11','string'),(120,'reviewerName','Aisla McCrae','string'),(120,'round','1','int'),(120,'stageId','3','int'),(120,'submissionId','7','int'),(121,'reviewAssignmentId','12','string'),(121,'reviewerName','Adela Gallego','string'),(121,'round','1','int'),(121,'stageId','3','int'),(121,'submissionId','7','int'),(122,'reviewAssignmentId','10','int'),(122,'reviewerName','Paul Hudson','string'),(122,'round','1','int'),(122,'submissionId','7','int'),(123,'reviewAssignmentId','10','int'),(123,'reviewerName','Paul Hudson','string'),(123,'round','1','int'),(123,'submissionId','7','int'),(125,'fileId','9','int'),(125,'fileStage','2','int'),(125,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','15','int'),(125,'submissionId','8','int'),(125,'username','eostrom','string'),(126,'fileId','9','int'),(126,'fileStage','2','int'),(126,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(126,'submissionFileId','15','int'),(126,'submissionId','8','int'),(126,'username','eostrom','string'),(127,'fileId','9','int'),(127,'fileStage','2','int'),(127,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','15','int'),(127,'submissionId','8','int'),(127,'username','eostrom','string'),(128,'fileId','9','int'),(128,'fileStage','2','int'),(128,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(128,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(128,'sourceSubmissionFileId',NULL,'string'),(128,'submissionFileId','15','int'),(128,'submissionId','8','int'),(128,'username','eostrom','string'),(132,'fileId','10','int'),(132,'fileStage','2','int'),(132,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','16','int'),(132,'submissionId','9','int'),(132,'username','fpaglieri','string'),(133,'fileId','10','int'),(133,'fileStage','2','int'),(133,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(133,'submissionFileId','16','int'),(133,'submissionId','9','int'),(133,'username','fpaglieri','string'),(134,'fileId','10','int'),(134,'fileStage','2','int'),(134,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','16','int'),(134,'submissionId','9','int'),(134,'username','fpaglieri','string'),(135,'fileId','10','int'),(135,'fileStage','2','int'),(135,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(135,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(135,'sourceSubmissionFileId',NULL,'string'),(135,'submissionFileId','16','int'),(135,'submissionId','9','int'),(135,'username','fpaglieri','string'),(138,'decision','8','int'),(138,'editorId','3','int'),(138,'editorName','Daniel Barnes','string'),(138,'submissionId','9','int'),(139,'fileId','10','int'),(139,'fileStage','4','int'),(139,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(139,'sourceSubmissionFileId','16','int'),(139,'submissionFileId','17','int'),(139,'submissionId','9','int'),(139,'username','dbarnes','string'),(140,'fileId','10','int'),(140,'fileStage','4','int'),(140,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(140,'submissionFileId','17','int'),(140,'submissionId','9','int'),(140,'username','dbarnes','string'),(141,'reviewAssignmentId','13','string'),(141,'reviewerName','Julie Janssen','string'),(141,'round','1','int'),(141,'stageId','3','int'),(141,'submissionId','9','int'),(142,'reviewAssignmentId','14','string'),(142,'reviewerName','Adela Gallego','string'),(142,'round','1','int'),(142,'stageId','3','int'),(142,'submissionId','9','int'),(143,'decision','1','int'),(143,'editorId','3','int'),(143,'editorName','Daniel Barnes','string'),(143,'submissionId','9','int'),(144,'name','Sarah Vogt','string'),(144,'userGroupName','Copyeditor','string'),(144,'username','svogt','string'),(145,'decision','7','int'),(145,'editorId','3','int'),(145,'editorName','Daniel Barnes','string'),(145,'submissionId','9','int'),(146,'name','Stephen Hellier','string'),(146,'userGroupName','Layout Editor','string'),(146,'username','shellier','string'),(147,'name','Sabine Kumar','string'),(147,'userGroupName','Proofreader','string'),(147,'username','skumar','string'),(149,'fileId','11','int'),(149,'fileStage','2','int'),(149,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(149,'sourceSubmissionFileId',NULL,'string'),(149,'submissionFileId','18','int'),(149,'submissionId','10','int'),(149,'username','jnovak','string'),(150,'fileId','11','int'),(150,'fileStage','2','int'),(150,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(150,'submissionFileId','18','int'),(150,'submissionId','10','int'),(150,'username','jnovak','string'),(151,'fileId','11','int'),(151,'fileStage','2','int'),(151,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(151,'sourceSubmissionFileId',NULL,'string'),(151,'submissionFileId','18','int'),(151,'submissionId','10','int'),(151,'username','jnovak','string'),(152,'fileId','11','int'),(152,'fileStage','2','int'),(152,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(152,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(152,'sourceSubmissionFileId',NULL,'string'),(152,'submissionFileId','18','int'),(152,'submissionId','10','int'),(152,'username','jnovak','string'),(155,'decision','8','int'),(155,'editorId','3','int'),(155,'editorName','Daniel Barnes','string'),(155,'submissionId','10','int'),(156,'fileId','11','int'),(156,'fileStage','4','int'),(156,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(156,'sourceSubmissionFileId','18','int'),(156,'submissionFileId','19','int'),(156,'submissionId','10','int'),(156,'username','dbarnes','string'),(157,'fileId','11','int'),(157,'fileStage','4','int'),(157,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(157,'submissionFileId','19','int'),(157,'submissionId','10','int'),(157,'username','dbarnes','string'),(158,'reviewAssignmentId','15','string'),(158,'reviewerName','Aisla McCrae','string'),(158,'round','1','int'),(158,'stageId','3','int'),(158,'submissionId','10','int'),(159,'reviewAssignmentId','16','string'),(159,'reviewerName','Adela Gallego','string'),(159,'round','1','int'),(159,'stageId','3','int'),(159,'submissionId','10','int'),(160,'reviewAssignmentId','15','int'),(160,'reviewerName','Aisla McCrae','string'),(160,'round','1','int'),(160,'submissionId','10','int'),(161,'reviewAssignmentId','15','int'),(161,'reviewerName','Aisla McCrae','string'),(161,'round','1','int'),(161,'submissionId','10','int'),(162,'reviewAssignmentId','16','int'),(162,'reviewerName','Adela Gallego','string'),(162,'round','1','int'),(162,'submissionId','10','int'),(163,'reviewAssignmentId','16','int'),(163,'reviewerName','Adela Gallego','string'),(163,'round','1','int'),(163,'submissionId','10','int'),(165,'fileId','12','int'),(165,'fileStage','2','int'),(165,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(165,'sourceSubmissionFileId',NULL,'string'),(165,'submissionFileId','20','int'),(165,'submissionId','11','int'),(165,'username','kalkhafaji','string'),(166,'fileId','12','int'),(166,'fileStage','2','int'),(166,'name','Learning Sustainable Design through Service.pdf','string'),(166,'submissionFileId','20','int'),(166,'submissionId','11','int'),(166,'username','kalkhafaji','string'),(167,'fileId','12','int'),(167,'fileStage','2','int'),(167,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(167,'sourceSubmissionFileId',NULL,'string'),(167,'submissionFileId','20','int'),(167,'submissionId','11','int'),(167,'username','kalkhafaji','string'),(168,'fileId','12','int'),(168,'fileStage','2','int'),(168,'name','Learning Sustainable Design through Service.pdf','string'),(168,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(168,'sourceSubmissionFileId',NULL,'string'),(168,'submissionFileId','20','int'),(168,'submissionId','11','int'),(168,'username','kalkhafaji','string'),(172,'fileId','13','int'),(172,'fileStage','2','int'),(172,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(172,'sourceSubmissionFileId',NULL,'string'),(172,'submissionFileId','21','int'),(172,'submissionId','12','int'),(172,'username','lchristopher','string'),(173,'fileId','13','int'),(173,'fileStage','2','int'),(173,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(173,'submissionFileId','21','int'),(173,'submissionId','12','int'),(173,'username','lchristopher','string'),(174,'fileId','13','int'),(174,'fileStage','2','int'),(174,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(174,'sourceSubmissionFileId',NULL,'string'),(174,'submissionFileId','21','int'),(174,'submissionId','12','int'),(174,'username','lchristopher','string'),(175,'fileId','13','int'),(175,'fileStage','2','int'),(175,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(175,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(175,'sourceSubmissionFileId',NULL,'string'),(175,'submissionFileId','21','int'),(175,'submissionId','12','int'),(175,'username','lchristopher','string'),(178,'decision','8','int'),(178,'editorId','3','int'),(178,'editorName','Daniel Barnes','string'),(178,'submissionId','12','int'),(179,'fileId','13','int'),(179,'fileStage','4','int'),(179,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(179,'sourceSubmissionFileId','21','int'),(179,'submissionFileId','22','int'),(179,'submissionId','12','int'),(179,'username','dbarnes','string'),(180,'fileId','13','int'),(180,'fileStage','4','int'),(180,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(180,'submissionFileId','22','int'),(180,'submissionId','12','int'),(180,'username','dbarnes','string'),(181,'reviewAssignmentId','17','string'),(181,'reviewerName','Julie Janssen','string'),(181,'round','1','int'),(181,'stageId','3','int'),(181,'submissionId','12','int'),(182,'reviewAssignmentId','18','string'),(182,'reviewerName','Paul Hudson','string'),(182,'round','1','int'),(182,'stageId','3','int'),(182,'submissionId','12','int'),(184,'fileId','14','int'),(184,'fileStage','2','int'),(184,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(184,'sourceSubmissionFileId',NULL,'string'),(184,'submissionFileId','23','int'),(184,'submissionId','13','int'),(184,'username','lkumiega','string'),(185,'fileId','14','int'),(185,'fileStage','2','int'),(185,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(185,'submissionFileId','23','int'),(185,'submissionId','13','int'),(185,'username','lkumiega','string'),(186,'fileId','14','int'),(186,'fileStage','2','int'),(186,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(186,'sourceSubmissionFileId',NULL,'string'),(186,'submissionFileId','23','int'),(186,'submissionId','13','int'),(186,'username','lkumiega','string'),(187,'fileId','14','int'),(187,'fileStage','2','int'),(187,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(187,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(187,'sourceSubmissionFileId',NULL,'string'),(187,'submissionFileId','23','int'),(187,'submissionId','13','int'),(187,'username','lkumiega','string'),(190,'decision','8','int'),(190,'editorId','3','int'),(190,'editorName','Daniel Barnes','string'),(190,'submissionId','13','int'),(191,'fileId','14','int'),(191,'fileStage','4','int'),(191,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(191,'sourceSubmissionFileId','23','int'),(191,'submissionFileId','24','int'),(191,'submissionId','13','int'),(191,'username','dbarnes','string'),(192,'fileId','14','int'),(192,'fileStage','4','int'),(192,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(192,'submissionFileId','24','int'),(192,'submissionId','13','int'),(192,'username','dbarnes','string'),(193,'reviewAssignmentId','19','string'),(193,'reviewerName','Julie Janssen','string'),(193,'round','1','int'),(193,'stageId','3','int'),(193,'submissionId','13','int'),(194,'reviewAssignmentId','20','string'),(194,'reviewerName','Aisla McCrae','string'),(194,'round','1','int'),(194,'stageId','3','int'),(194,'submissionId','13','int'),(195,'reviewAssignmentId','21','string'),(195,'reviewerName','Adela Gallego','string'),(195,'round','1','int'),(195,'stageId','3','int'),(195,'submissionId','13','int'),(196,'reviewAssignmentId','19','int'),(196,'reviewerName','Julie Janssen','string'),(196,'round','1','int'),(196,'submissionId','13','int'),(197,'reviewAssignmentId','19','int'),(197,'reviewerName','Julie Janssen','string'),(197,'round','1','int'),(197,'submissionId','13','int'),(198,'reviewAssignmentId','20','int'),(198,'reviewerName','Aisla McCrae','string'),(198,'round','1','int'),(198,'submissionId','13','int'),(199,'reviewAssignmentId','20','int'),(199,'reviewerName','Aisla McCrae','string'),(199,'round','1','int'),(199,'submissionId','13','int'),(200,'reviewAssignmentId','21','int'),(200,'reviewerName','Adela Gallego','string'),(200,'round','1','int'),(200,'submissionId','13','int'),(201,'reviewAssignmentId','21','int'),(201,'reviewerName','Adela Gallego','string'),(201,'round','1','int'),(201,'submissionId','13','int'),(202,'decision','2','int'),(202,'editorId','3','int'),(202,'editorName','Daniel Barnes','string'),(202,'submissionId','13','int'),(203,'recipientCount','3','int'),(203,'subject','Thank you for your review','string'),(205,'fileId','15','int'),(205,'fileStage','2','int'),(205,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(205,'sourceSubmissionFileId',NULL,'string'),(205,'submissionFileId','25','int'),(205,'submissionId','14','int'),(205,'username','pdaniel','string'),(206,'fileId','15','int'),(206,'fileStage','2','int'),(206,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(206,'submissionFileId','25','int'),(206,'submissionId','14','int'),(206,'username','pdaniel','string'),(207,'fileId','15','int'),(207,'fileStage','2','int'),(207,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(207,'sourceSubmissionFileId',NULL,'string'),(207,'submissionFileId','25','int'),(207,'submissionId','14','int'),(207,'username','pdaniel','string'),(208,'fileId','15','int'),(208,'fileStage','2','int'),(208,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(208,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(208,'sourceSubmissionFileId',NULL,'string'),(208,'submissionFileId','25','int'),(208,'submissionId','14','int'),(208,'username','pdaniel','string'),(212,'fileId','16','int'),(212,'fileStage','2','int'),(212,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(212,'sourceSubmissionFileId',NULL,'string'),(212,'submissionFileId','26','int'),(212,'submissionId','15','int'),(212,'username','rbaiyewu','string'),(213,'fileId','16','int'),(213,'fileStage','2','int'),(213,'name','Yam diseases and its management in Nigeria.pdf','string'),(213,'submissionFileId','26','int'),(213,'submissionId','15','int'),(213,'username','rbaiyewu','string'),(214,'fileId','16','int'),(214,'fileStage','2','int'),(214,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(214,'sourceSubmissionFileId',NULL,'string'),(214,'submissionFileId','26','int'),(214,'submissionId','15','int'),(214,'username','rbaiyewu','string'),(215,'fileId','16','int'),(215,'fileStage','2','int'),(215,'name','Yam diseases and its management in Nigeria.pdf','string'),(215,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(215,'sourceSubmissionFileId',NULL,'string'),(215,'submissionFileId','26','int'),(215,'submissionId','15','int'),(215,'username','rbaiyewu','string'),(218,'decision','8','int'),(218,'editorId','3','int'),(218,'editorName','Daniel Barnes','string'),(218,'submissionId','15','int'),(219,'fileId','16','int'),(219,'fileStage','4','int'),(219,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(219,'sourceSubmissionFileId','26','int'),(219,'submissionFileId','27','int'),(219,'submissionId','15','int'),(219,'username','dbarnes','string'),(220,'fileId','16','int'),(220,'fileStage','4','int'),(220,'name','Yam diseases and its management in Nigeria.pdf','string'),(220,'submissionFileId','27','int'),(220,'submissionId','15','int'),(220,'username','dbarnes','string'),(221,'reviewAssignmentId','22','string'),(221,'reviewerName','Paul Hudson','string'),(221,'round','1','int'),(221,'stageId','3','int'),(221,'submissionId','15','int'),(222,'reviewAssignmentId','23','string'),(222,'reviewerName','Aisla McCrae','string'),(222,'round','1','int'),(222,'stageId','3','int'),(222,'submissionId','15','int'),(223,'decision','1','int'),(223,'editorId','3','int'),(223,'editorName','Daniel Barnes','string'),(223,'submissionId','15','int'),(224,'name','Sarah Vogt','string'),(224,'userGroupName','Copyeditor','string'),(224,'username','svogt','string'),(225,'decision','7','int'),(225,'editorId','3','int'),(225,'editorName','Daniel Barnes','string'),(225,'submissionId','15','int'),(226,'name','Stephen Hellier','string'),(226,'userGroupName','Layout Editor','string'),(226,'username','shellier','string'),(228,'fileId','17','int'),(228,'fileStage','2','int'),(228,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(228,'sourceSubmissionFileId',NULL,'string'),(228,'submissionFileId','28','int'),(228,'submissionId','16','int'),(228,'username','rrossi','string'),(229,'fileId','17','int'),(229,'fileStage','2','int'),(229,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(229,'submissionFileId','28','int'),(229,'submissionId','16','int'),(229,'username','rrossi','string'),(230,'fileId','17','int'),(230,'fileStage','2','int'),(230,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(230,'sourceSubmissionFileId',NULL,'string'),(230,'submissionFileId','28','int'),(230,'submissionId','16','int'),(230,'username','rrossi','string'),(231,'fileId','17','int'),(231,'fileStage','2','int'),(231,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(231,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(231,'sourceSubmissionFileId',NULL,'string'),(231,'submissionFileId','28','int'),(231,'submissionId','16','int'),(231,'username','rrossi','string'),(235,'fileId','18','int'),(235,'fileStage','2','int'),(235,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(235,'sourceSubmissionFileId',NULL,'string'),(235,'submissionFileId','29','int'),(235,'submissionId','17','int'),(235,'username','vkarbasizaed','string'),(236,'fileId','18','int'),(236,'fileStage','2','int'),(236,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(236,'submissionFileId','29','int'),(236,'submissionId','17','int'),(236,'username','vkarbasizaed','string'),(237,'fileId','18','int'),(237,'fileStage','2','int'),(237,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(237,'sourceSubmissionFileId',NULL,'string'),(237,'submissionFileId','29','int'),(237,'submissionId','17','int'),(237,'username','vkarbasizaed','string'),(238,'fileId','18','int'),(238,'fileStage','2','int'),(238,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(238,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(238,'sourceSubmissionFileId',NULL,'string'),(238,'submissionFileId','29','int'),(238,'submissionId','17','int'),(238,'username','vkarbasizaed','string'),(241,'decision','8','int'),(241,'editorId','3','int'),(241,'editorName','Daniel Barnes','string'),(241,'submissionId','17','int'),(242,'fileId','18','int'),(242,'fileStage','4','int'),(242,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(242,'sourceSubmissionFileId','29','int'),(242,'submissionFileId','30','int'),(242,'submissionId','17','int'),(242,'username','dbarnes','string'),(243,'fileId','18','int'),(243,'fileStage','4','int'),(243,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(243,'submissionFileId','30','int'),(243,'submissionId','17','int'),(243,'username','dbarnes','string'),(244,'reviewAssignmentId','24','string'),(244,'reviewerName','Julie Janssen','string'),(244,'round','1','int'),(244,'stageId','3','int'),(244,'submissionId','17','int'),(245,'reviewAssignmentId','25','string'),(245,'reviewerName','Paul Hudson','string'),(245,'round','1','int'),(245,'stageId','3','int'),(245,'submissionId','17','int'),(246,'decision','1','int'),(246,'editorId','3','int'),(246,'editorName','Daniel Barnes','string'),(246,'submissionId','17','int'),(247,'name','Maria Fritz','string'),(247,'userGroupName','Copyeditor','string'),(247,'username','mfritz','string'),(248,'decision','7','int'),(248,'editorId','3','int'),(248,'editorName','Daniel Barnes','string'),(248,'submissionId','17','int'),(249,'name','Graham Cox','string'),(249,'userGroupName','Layout Editor','string'),(249,'username','gcox','string'),(250,'name','Catherine Turner','string'),(250,'userGroupName','Proofreader','string'),(250,'username','cturner','string'),(251,'fileId','19','int'),(251,'fileStage','10','int'),(251,'originalFileName','article.pdf','string'),(251,'sourceSubmissionFileId',NULL,'string'),(251,'submissionFileId','31','int'),(251,'submissionId','17','int'),(251,'username','dbarnes','string'),(252,'fileId','19','int'),(252,'fileStage','10','int'),(252,'name','article.pdf','string'),(252,'submissionFileId','31','int'),(252,'submissionId','17','int'),(252,'username','dbarnes','string'),(253,'fileId','19','int'),(253,'fileStage','10','int'),(253,'originalFileName','article.pdf','string'),(253,'sourceSubmissionFileId',NULL,'string'),(253,'submissionFileId','31','int'),(253,'submissionId','17','int'),(253,'username','dbarnes','string'),(254,'fileId','19','int'),(254,'fileStage','10','int'),(254,'name','article.pdf','string'),(254,'originalFileName','article.pdf','string'),(254,'sourceSubmissionFileId',NULL,'string'),(254,'submissionFileId','31','int'),(254,'submissionId','17','int'),(254,'username','dbarnes','string'),(266,'fileId','20','int'),(266,'fileStage','2','int'),(266,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(266,'sourceSubmissionFileId',NULL,'string'),(266,'submissionFileId','32','int'),(266,'submissionId','18','int'),(266,'username','vwilliamson','string'),(267,'fileId','20','int'),(267,'fileStage','2','int'),(267,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(267,'submissionFileId','32','int'),(267,'submissionId','18','int'),(267,'username','vwilliamson','string'),(268,'fileId','20','int'),(268,'fileStage','2','int'),(268,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(268,'sourceSubmissionFileId',NULL,'string'),(268,'submissionFileId','32','int'),(268,'submissionId','18','int'),(268,'username','vwilliamson','string'),(269,'fileId','20','int'),(269,'fileStage','2','int'),(269,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(269,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(269,'sourceSubmissionFileId',NULL,'string'),(269,'submissionFileId','32','int'),(269,'submissionId','18','int'),(269,'username','vwilliamson','string'),(272,'decision','9','int'),(272,'editorId','3','int'),(272,'editorName','Daniel Barnes','string'),(272,'submissionId','18','int'),(274,'fileId','21','int'),(274,'fileStage','2','int'),(274,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(274,'sourceSubmissionFileId',NULL,'string'),(274,'submissionFileId','33','int'),(274,'submissionId','19','int'),(274,'username','zwoods','string'),(275,'fileId','21','int'),(275,'fileStage','2','int'),(275,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(275,'submissionFileId','33','int'),(275,'submissionId','19','int'),(275,'username','zwoods','string'),(276,'fileId','21','int'),(276,'fileStage','2','int'),(276,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(276,'sourceSubmissionFileId',NULL,'string'),(276,'submissionFileId','33','int'),(276,'submissionId','19','int'),(276,'username','zwoods','string'),(277,'fileId','21','int'),(277,'fileStage','2','int'),(277,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(277,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(277,'sourceSubmissionFileId',NULL,'string'),(277,'submissionFileId','33','int'),(277,'submissionId','19','int'),(277,'username','zwoods','string'),(280,'decision','8','int'),(280,'editorId','3','int'),(280,'editorName','Daniel Barnes','string'),(280,'submissionId','19','int'),(281,'fileId','21','int'),(281,'fileStage','4','int'),(281,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(281,'sourceSubmissionFileId','33','int'),(281,'submissionFileId','34','int'),(281,'submissionId','19','int'),(281,'username','dbarnes','string'),(282,'fileId','21','int'),(282,'fileStage','4','int'),(282,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(282,'submissionFileId','34','int'),(282,'submissionId','19','int'),(282,'username','dbarnes','string'),(283,'reviewAssignmentId','26','string'),(283,'reviewerName','Paul Hudson','string'),(283,'round','1','int'),(283,'stageId','3','int'),(283,'submissionId','19','int'),(284,'reviewAssignmentId','27','string'),(284,'reviewerName','Aisla McCrae','string'),(284,'round','1','int'),(284,'stageId','3','int'),(284,'submissionId','19','int'),(285,'decision','1','int'),(285,'editorId','3','int'),(285,'editorName','Daniel Barnes','string'),(285,'submissionId','19','int'),(286,'name','Sarah Vogt','string'),(286,'userGroupName','Copyeditor','string'),(286,'username','svogt','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'journals/1/articles/1/62c766d82a080.pdf','application/pdf'),(2,'journals/1/articles/1/62c7673f7a57d.pdf','application/pdf'),(3,'journals/1/articles/2/62c767b464c22.pdf','application/pdf'),(4,'journals/1/articles/3/62c767fb542f2.pdf','application/pdf'),(5,'journals/1/articles/4/62c7683c3b31e.pdf','application/pdf'),(6,'journals/1/articles/5/62c7685293988.pdf','application/pdf'),(7,'journals/1/articles/6/62c768a6dffae.pdf','application/pdf'),(8,'journals/1/articles/7/62c768f8e2cb5.pdf','application/pdf'),(9,'journals/1/articles/8/62c7693cdc29b.pdf','application/pdf'),(10,'journals/1/articles/9/62c76953521d9.pdf','application/pdf'),(11,'journals/1/articles/10/62c769a5c88b5.pdf','application/pdf'),(12,'journals/1/articles/11/62c769f0f0933.pdf','application/pdf'),(13,'journals/1/articles/12/62c76a07e8e62.pdf','application/pdf'),(14,'journals/1/articles/13/62c76a3be4d61.pdf','application/pdf'),(15,'journals/1/articles/14/62c76ab6a942b.pdf','application/pdf'),(16,'journals/1/articles/15/62c76ac8dcf6c.pdf','application/pdf'),(17,'journals/1/articles/16/62c76b1728f69.pdf','application/pdf'),(18,'journals/1/articles/17/62c76b2abd480.pdf','application/pdf'),(19,'journals/1/articles/17/62c76b7e4d739.pdf','application/pdf'),(20,'journals/1/articles/18/62c76bd8d32e0.pdf','application/pdf'),(21,'journals/1/articles/19/62c76bfb83a65.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(2,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(3,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::lib.pkp.classes.galley.Galley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(4,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(5,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(6,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(7,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(9,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(11,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(13,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(15,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(16,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(17,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),(18,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),(19,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(20,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(21,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),(22,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(23,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(24,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(25,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(26,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(27,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'DataCite XML export','plugins.generic.datacite.filter.DataciteXmlFilter',0,0,0),(2,2,0,'DataCite XML export','plugins.generic.datacite.filter.DataciteXmlFilter',0,0,0),(3,3,0,'DataCite XML export','plugins.generic.datacite.filter.DataciteXmlFilter',0,0,0),(4,4,0,'Crossref XML issue export','plugins.generic.crossref.filter.IssueCrossrefXmlFilter',0,0,0),(5,5,0,'Crossref XML issue export','plugins.generic.crossref.filter.ArticleCrossrefXmlFilter',0,0,0),(6,6,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(7,7,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),(8,8,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),(9,9,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),(10,10,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),(11,11,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),(12,12,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),(13,13,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(14,14,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(15,16,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),(16,15,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(17,17,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),(18,18,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0),(19,19,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(20,20,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(21,21,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0),(22,22,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(23,23,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(24,24,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(25,25,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(26,26,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),(27,27,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0);
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
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Article Text','string'),(1,'fr_CA','name','Texte de l\'article','string'),(2,'en_US','name','Research Instrument','string'),(2,'fr_CA','name','Instruments de recherche','string'),(3,'en_US','name','Research Materials','string'),(3,'fr_CA','name','Documents de recherche','string'),(4,'en_US','name','Research Results','string'),(4,'fr_CA','name','R??sultats de recherche','string'),(5,'en_US','name','Transcripts','string'),(5,'fr_CA','name','Transcriptions','string'),(6,'en_US','name','Data Analysis','string'),(6,'fr_CA','name','Analyse de donn??es','string'),(7,'en_US','name','Data Set','string'),(7,'fr_CA','name','Ensemble de donn??es','string'),(8,'en_US','name','Source Texts','string'),(8,'fr_CA','name','Textes source','string'),(9,'en_US','name','Multimedia','string'),(9,'fr_CA','name','Multim??dias','string'),(10,'en_US','name','Image','string'),(10,'fr_CA','name','Image','string'),(11,'en_US','name','HTML Stylesheet','string'),(11,'fr_CA','name','Feuille de style HTML','string'),(12,'en_US','name','Other','string'),(12,'fr_CA','name','Autre','string');
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
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`)
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
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
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
  `label` varchar(255) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
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
  `setting_type` varchar(6) DEFAULT NULL,
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
INSERT INTO `issue_settings` VALUES (1,'en_US','description','',NULL),(1,'en_US','title','',NULL),(1,'fr_CA','description','',NULL),(1,'fr_CA','title','',NULL),(2,'en_US','description','',NULL),(2,'en_US','title','',NULL),(2,'fr_CA','description','',NULL),(2,'fr_CA','title','',NULL);
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
  `published` smallint(6) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT '0',
  `show_number` smallint(6) NOT NULL DEFAULT '0',
  `show_year` smallint(6) NOT NULL DEFAULT '0',
  `show_title` smallint(6) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`),
  KEY `issues_url_path` (`url_path`),
  KEY `issues_doi_id_foreign` (`doi_id`),
  CONSTRAINT `issues_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'2',2014,1,'2022-07-07 23:05:31',NULL,'2022-07-07 23:27:07',1,NULL,1,1,1,0,NULL,NULL,'',NULL),(2,1,2,'1',2015,0,NULL,NULL,'2022-07-07 23:27:06',1,NULL,1,1,1,0,NULL,NULL,'',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
  `setting_value` mediumtext,
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
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copyrightYearBasis','issue',NULL),(1,'','copySubmissionAckAddress','',NULL),(1,'','copySubmissionAckPrimaryContact','0',NULL),(1,'','country','IS',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','doiSuffixType','default',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableDois','1',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','membershipFee','0',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','onlineIssn','0378-5955',NULL),(1,'','printIssn','0378-5955',NULL),(1,'','publicationFee','0',NULL),(1,'','publisherInstitution','Public Knowledge Project',NULL),(1,'','purchaseArticleFee','0',NULL),(1,'','registrationAgency','',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgeJ Pub Know',NULL),(1,'en_US','acronym','JPKJPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the five-step process.',NULL),(1,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://clockss.org\">More...</a>',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://www.lockss.org\">More...</a>',NULL),(1,'en_US','name','Journal of Public Knowledge',NULL),(1,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),(1,'fr_CA','authorInformation','Int??ress??-e ?? soumettre ?? cette revue ? Nous vous recommandons de consulter les politiques de rubrique de la revue ?? la page <a href=\"http://localhost/index.php/publicknowledge/about\">?? propos de la revue</a> ainsi que les <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Directives aux auteurs</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> aupr??s de la revue avant de pr??senter une soumission, ou s\'ils et elles sont d??j?? inscrits-es, simplement <a href=\"http://localhost/index.php/publicknowledge/login\">ouvrir une session</a> et acc??der au tableau de bord pour commencer les 5 ??tapes du processus.',NULL),(1,'fr_CA','clockssLicense','Cette revue utilise le syst??me CLOCKSS pour cr??er un syst??me d\'archivage distribu?? parmi les biblioth??ques participantes et permet ?? ces biblioth??ques de cr??er des archives permanentes de la revue ?? des fins de conservation et de reconstitution. <a href=\"https://clockss.org\">En apprendre davantage... </a>',NULL),(1,'fr_CA','librarianInformation','Nous incitons les biblioth??caires ?? lister cette revue dans leur fonds de revues num??riques. Aussi, il peut ??tre pertinent de mentionner que ce syst??me de publication en libre acc??s est con??u pour ??tre h??berg?? par les biblioth??ques de recherche pour que les membres de leurs facult??s l\'utilisent avec les revues dans lesquelles ils sont impliqu??s (voir <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'fr_CA','lockssLicense','Cette revue utilise le syst??me LOCKSS pour cr??er un syst??me de distribution des archives parmi les biblioth??ques participantes et afin de permettre ?? ces biblioth??ques de cr??er des archives permanentes pour fins de pr??servation et de restauration. <a href=\"https://lockss.org\">En apprendre davantage...</a>',NULL),(1,'fr_CA','name','Journal de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette revue fournit le libre acc??s imm??diat ?? son contenu se basant sur le principe que rendre la recherche disponible au public gratuitement facilite un plus grand ??change du savoir, ?? l\'??chelle de la plan??te.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et courriels saisis dans le site de cette revue seront utilis??s exclusivement aux fins indiqu??es par cette revue et ne serviront ?? aucune autre fin, ni ?? toute autre partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous invitons les lecteurs-trices ?? s\'inscrire pour recevoir les avis de publication de cette revue. Utiliser le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">S\'inscrire</a> en haut de la page d\'accueil de la revue. Cette inscription permettra au,?? la lecteur-trice de recevoir par courriel le sommaire de chaque nouveau num??ro de la revue. Cette liste permet aussi ?? la revue de revendiquer un certain niveau de soutien ou de lectorat. Voir la <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">D??claration de confidentialit??</a> de la revue qui certifie aux lecteurs-trices que leur nom et leur courriel ne seront pas utilis??s ?? d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"La soumission n\'a pas d??j?? ??t?? publi??e et n\'est pas consid??r??e actuellement par une autre revue. Si ce n\'est pas le cas, fournir une explication dans le champ ?? Commentaires au,?? la r??dacteur-trice ??.\"},{\"order\":2,\"content\":\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\"},{\"order\":3,\"content\":\"Lorsque possible, les URL des r??f??rences ont ??t?? fournies.\"},{\"order\":4,\"content\":\"Le texte est ?? simple interligne, utilise une police de 12 points, emploie l\'italique plut??t que le soulign?? (sauf pour les adresses URL) et place toutes les illustrations, figures et tableaux aux endroits appropri??s dans le texte plut??t qu\'?? la fin.\"},{\"order\":5,\"content\":\"Le texte se conforme aux exigences stylistiques et bibliographiques d??crites dans les  <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\">Directives aux auteurs<\\/a>, qui se trouvent dans la section ?? ?? propos de la revue ??.\"}]',NULL);
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  `current_issue_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`),
  KEY `journals_current_issue_id_foreign` (`current_issue_id`),
  CONSTRAINT `journals_current_issue_id_foreign` FOREIGN KEY (`current_issue_id`) REFERENCES `issues` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'publicknowledge',1.00,'en_US',1,1);
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
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_CURRENT'),(16,1,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_ABOUT'),(20,1,NULL,'NMI_TYPE_SUBMISSIONS'),(21,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(22,1,NULL,'NMI_TYPE_PRIVACY'),(23,1,NULL,'NMI_TYPE_CONTACT'),(24,1,NULL,'NMI_TYPE_SEARCH');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2022-07-07 23:10:25','2022-07-07 23:10:25','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The influence of lactation on the quantity and quality of cashmere production.</p><p>My recommendation is:<br />Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/index/2/3\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (6,1,3,2,16777217,'2022-07-07 23:06:06',NULL,1048585,1),(8,1,4,2,16777217,'2022-07-07 23:06:06',NULL,1048585,1),(10,1,5,2,16777217,'2022-07-07 23:06:06',NULL,1048585,1),(12,1,0,2,16777243,'2022-07-07 23:06:06',NULL,1048585,1),(13,1,0,2,16777245,'2022-07-07 23:06:06',NULL,1048585,1),(15,1,0,2,16777236,'2022-07-07 23:06:16','2022-07-07 23:06:20',523,1),(17,1,7,3,16777227,'2022-07-07 23:06:26',NULL,517,1),(19,1,9,3,16777227,'2022-07-07 23:06:33',NULL,517,2),(21,1,10,3,16777227,'2022-07-07 23:06:40',NULL,517,3),(28,1,17,2,16777235,'2022-07-07 23:06:58',NULL,1048585,1),(35,1,3,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(37,1,4,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(39,1,5,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(41,1,12,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(43,1,14,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(45,1,16,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(47,1,17,3,16777259,'2022-07-07 23:08:30',NULL,1048585,1),(51,1,3,2,16777217,'2022-07-07 23:09:45',NULL,1048585,2),(53,1,4,2,16777217,'2022-07-07 23:09:45',NULL,1048585,2),(55,1,5,2,16777217,'2022-07-07 23:09:45',NULL,1048585,2),(57,1,0,2,16777243,'2022-07-07 23:09:45',NULL,1048585,2),(58,1,0,2,16777245,'2022-07-07 23:09:45',NULL,1048585,2),(60,1,0,2,16777236,'2022-07-07 23:09:57','2022-07-07 23:10:01',523,2),(61,1,18,2,16777231,'2022-07-07 23:09:57',NULL,1048585,2),(63,1,3,3,16777249,'2022-07-07 23:10:25',NULL,1048586,1),(65,1,4,3,16777249,'2022-07-07 23:10:25',NULL,1048586,1),(67,1,5,3,16777249,'2022-07-07 23:10:25',NULL,1048586,1),(69,1,3,2,16777217,'2022-07-07 23:10:57',NULL,1048585,3),(71,1,4,2,16777217,'2022-07-07 23:10:57',NULL,1048585,3),(73,1,5,2,16777217,'2022-07-07 23:10:58',NULL,1048585,3),(75,1,0,2,16777243,'2022-07-07 23:10:58',NULL,1048585,3),(76,1,0,2,16777245,'2022-07-07 23:10:58',NULL,1048585,3),(78,1,0,2,16777236,'2022-07-07 23:11:09','2022-07-07 23:11:13',523,3),(80,1,9,3,16777227,'2022-07-07 23:11:20',NULL,517,4),(82,1,10,3,16777227,'2022-07-07 23:11:27',NULL,517,5),(84,1,19,2,16777230,'2022-07-07 23:11:33',NULL,1048585,3),(85,1,3,2,16777251,'2022-07-07 23:11:33','2022-07-07 23:11:37',1048585,3),(86,1,4,2,16777251,'2022-07-07 23:11:33',NULL,1048585,3),(87,1,5,2,16777251,'2022-07-07 23:11:33',NULL,1048585,3),(90,1,3,2,16777217,'2022-07-07 23:12:06',NULL,1048585,4),(92,1,4,2,16777217,'2022-07-07 23:12:06',NULL,1048585,4),(94,1,5,2,16777217,'2022-07-07 23:12:06',NULL,1048585,4),(96,1,0,2,16777243,'2022-07-07 23:12:06',NULL,1048585,4),(97,1,0,2,16777245,'2022-07-07 23:12:06',NULL,1048585,4),(100,1,3,2,16777217,'2022-07-07 23:12:22',NULL,1048585,5),(102,1,4,2,16777217,'2022-07-07 23:12:22',NULL,1048585,5),(104,1,5,2,16777217,'2022-07-07 23:12:22',NULL,1048585,5),(106,1,0,2,16777243,'2022-07-07 23:12:22',NULL,1048585,5),(107,1,0,2,16777245,'2022-07-07 23:12:22',NULL,1048585,5),(109,1,0,2,16777236,'2022-07-07 23:12:34','2022-07-07 23:12:38',523,4),(111,1,8,3,16777227,'2022-07-07 23:12:44',NULL,517,6),(113,1,10,3,16777227,'2022-07-07 23:12:51',NULL,517,7),(120,1,21,2,16777235,'2022-07-07 23:13:12',NULL,1048585,5),(121,1,3,2,16777254,'2022-07-07 23:13:12','2022-07-07 23:13:17',1048585,5),(122,1,4,2,16777254,'2022-07-07 23:13:12',NULL,1048585,5),(123,1,5,2,16777254,'2022-07-07 23:13:12',NULL,1048585,5),(126,1,3,2,16777217,'2022-07-07 23:13:50',NULL,1048585,6),(128,1,4,2,16777217,'2022-07-07 23:13:50',NULL,1048585,6),(130,1,5,2,16777217,'2022-07-07 23:13:50',NULL,1048585,6),(132,1,0,2,16777243,'2022-07-07 23:13:50',NULL,1048585,6),(133,1,0,2,16777245,'2022-07-07 23:13:50',NULL,1048585,6),(135,1,0,2,16777236,'2022-07-07 23:14:02','2022-07-07 23:14:06',523,5),(137,1,7,3,16777227,'2022-07-07 23:14:12',NULL,517,8),(139,1,10,3,16777227,'2022-07-07 23:14:20',NULL,517,9),(146,1,22,2,16777235,'2022-07-07 23:14:41',NULL,1048585,6),(147,1,3,2,16777254,'2022-07-07 23:14:41','2022-07-07 23:14:46',1048585,6),(148,1,4,2,16777254,'2022-07-07 23:14:41',NULL,1048585,6),(149,1,5,2,16777254,'2022-07-07 23:14:41',NULL,1048585,6),(151,1,3,2,16777217,'2022-07-07 23:15:09',NULL,1048585,7),(153,1,4,2,16777217,'2022-07-07 23:15:09',NULL,1048585,7),(155,1,5,2,16777217,'2022-07-07 23:15:09',NULL,1048585,7),(157,1,0,2,16777243,'2022-07-07 23:15:09',NULL,1048585,7),(158,1,0,2,16777245,'2022-07-07 23:15:09',NULL,1048585,7),(160,1,0,2,16777236,'2022-07-07 23:15:22','2022-07-07 23:15:26',523,6),(161,1,23,2,16777231,'2022-07-07 23:15:22',NULL,1048585,7),(164,1,9,3,16777227,'2022-07-07 23:15:39',NULL,517,11),(166,1,10,3,16777227,'2022-07-07 23:15:47',NULL,517,12),(168,1,3,2,16777219,'2022-07-07 23:15:59',NULL,517,10),(170,1,4,2,16777219,'2022-07-07 23:15:59',NULL,517,10),(172,1,5,2,16777219,'2022-07-07 23:15:59',NULL,517,10),(175,1,3,2,16777217,'2022-07-07 23:16:22',NULL,1048585,8),(177,1,4,2,16777217,'2022-07-07 23:16:22',NULL,1048585,8),(179,1,5,2,16777217,'2022-07-07 23:16:22',NULL,1048585,8),(181,1,0,2,16777243,'2022-07-07 23:16:22',NULL,1048585,8),(182,1,0,2,16777245,'2022-07-07 23:16:22',NULL,1048585,8),(185,1,3,2,16777217,'2022-07-07 23:16:38',NULL,1048585,9),(187,1,6,2,16777217,'2022-07-07 23:16:39',NULL,1048585,9),(189,1,0,2,16777243,'2022-07-07 23:16:39',NULL,1048585,9),(190,1,0,2,16777245,'2022-07-07 23:16:39',NULL,1048585,9),(192,1,0,2,16777236,'2022-07-07 23:16:51','2022-07-07 23:16:55',523,7),(194,1,7,3,16777227,'2022-07-07 23:17:01',NULL,517,13),(196,1,10,3,16777227,'2022-07-07 23:17:08',NULL,517,14),(202,1,25,2,16777235,'2022-07-07 23:17:29',NULL,1048585,9),(203,1,3,2,16777254,'2022-07-07 23:17:29','2022-07-07 23:17:33',1048585,9),(204,1,6,2,16777254,'2022-07-07 23:17:29',NULL,1048585,9),(207,1,3,2,16777217,'2022-07-07 23:18:02',NULL,1048585,10),(209,1,4,2,16777217,'2022-07-07 23:18:02',NULL,1048585,10),(211,1,5,2,16777217,'2022-07-07 23:18:02',NULL,1048585,10),(213,1,0,2,16777243,'2022-07-07 23:18:03',NULL,1048585,10),(214,1,0,2,16777245,'2022-07-07 23:18:03',NULL,1048585,10),(216,1,0,2,16777236,'2022-07-07 23:18:16','2022-07-07 23:18:20',523,8),(217,1,26,2,16777231,'2022-07-07 23:18:16',NULL,1048585,10),(222,1,3,2,16777219,'2022-07-07 23:18:46',NULL,517,15),(224,1,4,2,16777219,'2022-07-07 23:18:46',NULL,517,15),(226,1,5,2,16777219,'2022-07-07 23:18:46',NULL,517,15),(228,1,3,2,16777219,'2022-07-07 23:18:59',NULL,517,16),(230,1,4,2,16777219,'2022-07-07 23:18:59',NULL,517,16),(232,1,5,2,16777219,'2022-07-07 23:18:59',NULL,517,16),(235,1,3,2,16777217,'2022-07-07 23:19:22',NULL,1048585,11),(237,1,4,2,16777217,'2022-07-07 23:19:22',NULL,1048585,11),(239,1,5,2,16777217,'2022-07-07 23:19:22',NULL,1048585,11),(241,1,0,2,16777243,'2022-07-07 23:19:23',NULL,1048585,11),(242,1,0,2,16777245,'2022-07-07 23:19:23',NULL,1048585,11),(245,1,3,2,16777217,'2022-07-07 23:19:42',NULL,1048585,12),(247,1,4,2,16777217,'2022-07-07 23:19:42',NULL,1048585,12),(249,1,5,2,16777217,'2022-07-07 23:19:42',NULL,1048585,12),(251,1,0,2,16777243,'2022-07-07 23:19:43',NULL,1048585,12),(252,1,0,2,16777245,'2022-07-07 23:19:43',NULL,1048585,12),(254,1,0,2,16777236,'2022-07-07 23:19:56','2022-07-07 23:20:00',523,9),(255,1,28,2,16777231,'2022-07-07 23:19:56',NULL,1048585,12),(256,1,7,3,16777227,'2022-07-07 23:20:06',NULL,517,17),(258,1,8,3,16777227,'2022-07-07 23:20:13',NULL,517,18),(260,1,3,2,16777217,'2022-07-07 23:20:34',NULL,1048585,13),(262,1,4,2,16777217,'2022-07-07 23:20:34',NULL,1048585,13),(264,1,5,2,16777217,'2022-07-07 23:20:34',NULL,1048585,13),(266,1,0,2,16777243,'2022-07-07 23:20:34',NULL,1048585,13),(267,1,0,2,16777245,'2022-07-07 23:20:34',NULL,1048585,13),(269,1,0,2,16777236,'2022-07-07 23:20:47','2022-07-07 23:20:51',523,10),(277,1,3,2,16777219,'2022-07-07 23:21:25',NULL,517,19),(279,1,4,2,16777219,'2022-07-07 23:21:25',NULL,517,19),(281,1,5,2,16777219,'2022-07-07 23:21:25',NULL,517,19),(283,1,3,2,16777219,'2022-07-07 23:21:38',NULL,517,20),(285,1,4,2,16777219,'2022-07-07 23:21:39',NULL,517,20),(287,1,5,2,16777219,'2022-07-07 23:21:39',NULL,517,20),(289,1,3,2,16777219,'2022-07-07 23:21:52',NULL,517,21),(291,1,4,2,16777219,'2022-07-07 23:21:52',NULL,517,21),(293,1,5,2,16777219,'2022-07-07 23:21:52',NULL,517,21),(295,1,29,3,16777232,'2022-07-07 23:22:13',NULL,1048585,13),(296,1,3,2,16777217,'2022-07-07 23:22:36',NULL,1048585,14),(298,1,4,2,16777217,'2022-07-07 23:22:36',NULL,1048585,14),(300,1,5,2,16777217,'2022-07-07 23:22:36',NULL,1048585,14),(302,1,0,2,16777243,'2022-07-07 23:22:36',NULL,1048585,14),(303,1,0,2,16777245,'2022-07-07 23:22:36',NULL,1048585,14),(305,1,3,2,16777217,'2022-07-07 23:22:52',NULL,1048585,15),(307,1,4,2,16777217,'2022-07-07 23:22:52',NULL,1048585,15),(309,1,5,2,16777217,'2022-07-07 23:22:52',NULL,1048585,15),(311,1,0,2,16777243,'2022-07-07 23:22:52',NULL,1048585,15),(312,1,0,2,16777245,'2022-07-07 23:22:52',NULL,1048585,15),(314,1,0,2,16777236,'2022-07-07 23:23:05','2022-07-07 23:23:10',523,11),(316,1,8,3,16777227,'2022-07-07 23:23:16',NULL,517,22),(318,1,9,3,16777227,'2022-07-07 23:23:23',NULL,517,23),(325,1,31,2,16777235,'2022-07-07 23:23:44',NULL,1048585,15),(326,1,3,2,16777254,'2022-07-07 23:23:44','2022-07-07 23:23:48',1048585,15),(327,1,4,2,16777254,'2022-07-07 23:23:44',NULL,1048585,15),(328,1,5,2,16777254,'2022-07-07 23:23:44',NULL,1048585,15),(330,1,3,2,16777217,'2022-07-07 23:24:14',NULL,1048585,16),(332,1,4,2,16777217,'2022-07-07 23:24:14',NULL,1048585,16),(334,1,5,2,16777217,'2022-07-07 23:24:14',NULL,1048585,16),(336,1,0,2,16777243,'2022-07-07 23:24:14',NULL,1048585,16),(337,1,0,2,16777245,'2022-07-07 23:24:14',NULL,1048585,16),(339,1,3,2,16777217,'2022-07-07 23:24:35',NULL,1048585,17),(341,1,4,2,16777217,'2022-07-07 23:24:35',NULL,1048585,17),(343,1,5,2,16777217,'2022-07-07 23:24:35',NULL,1048585,17),(345,1,0,2,16777243,'2022-07-07 23:24:35',NULL,1048585,17),(346,1,0,2,16777245,'2022-07-07 23:24:35',NULL,1048585,17),(348,1,0,2,16777236,'2022-07-07 23:24:48','2022-07-07 23:24:53',523,12),(350,1,7,3,16777227,'2022-07-07 23:24:58',NULL,517,24),(352,1,8,3,16777227,'2022-07-07 23:25:05',NULL,517,25),(359,1,33,2,16777235,'2022-07-07 23:25:26',NULL,1048585,17),(365,1,3,2,16777217,'2022-07-07 23:27:25',NULL,1048585,18),(367,1,4,2,16777217,'2022-07-07 23:27:25',NULL,1048585,18),(369,1,5,2,16777217,'2022-07-07 23:27:25',NULL,1048585,18),(371,1,0,2,16777243,'2022-07-07 23:27:25',NULL,1048585,18),(372,1,0,2,16777245,'2022-07-07 23:27:25',NULL,1048585,18),(374,1,34,2,16777234,'2022-07-07 23:27:39',NULL,1048585,18),(375,1,3,2,16777217,'2022-07-07 23:27:59',NULL,1048585,19),(377,1,6,2,16777217,'2022-07-07 23:27:59',NULL,1048585,19),(379,1,0,2,16777243,'2022-07-07 23:27:59',NULL,1048585,19),(380,1,0,2,16777245,'2022-07-07 23:27:59',NULL,1048585,19),(382,1,0,2,16777236,'2022-07-07 23:28:13','2022-07-07 23:28:17',523,13),(384,1,8,3,16777227,'2022-07-07 23:28:23',NULL,517,26),(386,1,9,3,16777227,'2022-07-07 23:28:31',NULL,517,27),(388,1,35,2,16777230,'2022-07-07 23:28:36',NULL,1048585,19),(389,1,3,2,16777251,'2022-07-07 23:28:36','2022-07-07 23:28:41',1048585,19),(390,1,6,2,16777251,'2022-07-07 23:28:36',NULL,1048585,19);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"lib.pkp.classes.task.DepositDois\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"lib.pkp.classes.task.EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInJournalIndex','false','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('pdfjsviewerplugin',1,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','62c7653d0fd9f','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
  `is_approved` smallint(6) NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  KEY `publication_galleys_doi_id_foreign` (`doi_id`),
  CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',3,0.00,'',0,'',NULL),(2,'en_US',2,'PDF Version 2',3,0.00,'',0,'pdf',NULL),(3,'en_US',18,'PDF',31,0.00,'',0,'',NULL);
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'','copyrightYear','2022'),(1,'','issueId','1'),(1,'','pages','71-98'),(1,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(1,'en_US','copyrightHolder','Journal of Public Knowledge'),(1,'en_US','coverImage','[]'),(1,'en_US','prefix','The'),(1,'en_US','subtitle','A Review Of The Literature And Empirical Evidence'),(1,'en_US','title','Signalling Theory Dividends'),(1,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(1,'fr_CA','coverImage','[]'),(2,'','categoryIds','[]'),(2,'','copyrightYear','2022'),(2,'','issueId','1'),(2,'','pages','71-98'),(2,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(2,'en_US','copyrightHolder','Journal of Public Knowledge'),(2,'en_US','coverImage','[]'),(2,'en_US','prefix','The'),(2,'en_US','subtitle','A Review Of The Literature And Empirical Evidence'),(2,'en_US','title','Signalling Theory Dividends Version 2'),(2,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(2,'fr_CA','coverImage','[]'),(3,'','categoryIds','[]'),(3,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are ???expected to know, be able to do, and be like with respect to technology??? (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers??? computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(5,'fr_CA','abstract',''),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Genetic transformation of forest trees'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin???s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people???s beliefs diverge widely regarding the topic at hand.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Developing efficacy beliefs in the classroom'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Traditions and Trends in the Study of the Commons'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'en_US','abstract','<p>None.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(11,'fr_CA','abstract',''),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Learning Sustainable Design through Service'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of ???healthy??? fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(14,'fr_CA','abstract',''),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university???s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Yam diseases and its management in Nigeria'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaound??, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2022'),(18,'','issueId','1'),(18,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(18,'en_US','copyrightHolder','Journal of Public Knowledge'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(19,'fr_CA','abstract',''),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title',''),(20,'','categoryIds','[]'),(20,'en_US','abstract','<p>None.</p>'),(20,'en_US','prefix',''),(20,'en_US','subtitle',''),(20,'en_US','title','Finocchiaro: Arguments About Arguments'),(20,'fr_CA','abstract',''),(20,'fr_CA','prefix',''),(20,'fr_CA','subtitle',''),(20,'fr_CA','title','');
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
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
INSERT INTO `publications` VALUES (1,0,'2022-07-07','2022-07-07 23:08:26',1,1,0.00,1,3,'mwandenga-signalling-theory',1,NULL),(2,0,'2022-07-07','2022-07-07 23:09:07',3,1,0.00,1,1,'mwandenga',2,NULL),(3,0,NULL,'2022-07-07 23:10:09',5,1,0.00,2,1,NULL,1,NULL),(4,0,NULL,'2022-07-07 23:10:57',6,1,0.00,3,1,NULL,1,NULL),(5,0,NULL,'2022-07-07 23:12:05',7,1,0.00,4,1,NULL,1,NULL),(6,0,NULL,'2022-07-07 23:12:21',9,1,0.00,5,1,NULL,1,NULL),(7,0,NULL,'2022-07-07 23:13:49',10,1,0.00,6,1,NULL,1,NULL),(8,0,NULL,'2022-07-07 23:15:08',11,1,0.00,7,1,NULL,1,NULL),(9,0,NULL,'2022-07-07 23:16:21',12,1,0.00,8,1,NULL,1,NULL),(10,0,NULL,'2022-07-07 23:16:38',14,2,0.00,9,1,NULL,1,NULL),(11,0,NULL,'2022-07-07 23:18:01',15,1,0.00,10,1,NULL,1,NULL),(12,0,NULL,'2022-07-07 23:19:21',16,1,0.00,11,1,NULL,1,NULL),(13,0,NULL,'2022-07-07 23:19:41',18,1,0.00,12,1,NULL,1,NULL),(14,0,NULL,'2022-07-07 23:20:33',19,1,0.00,13,1,NULL,1,NULL),(15,0,NULL,'2022-07-07 23:22:35',20,1,0.00,14,1,NULL,1,NULL),(16,0,NULL,'2022-07-07 23:22:52',21,1,0.00,15,1,NULL,1,NULL),(17,0,NULL,'2022-07-07 23:24:13',22,1,0.00,16,1,NULL,1,NULL),(18,0,'2022-07-07','2022-07-07 23:27:01',23,1,0.00,17,3,NULL,1,NULL),(19,0,NULL,'2022-07-07 23:27:24',24,1,0.00,18,1,NULL,1,NULL),(20,0,NULL,'2022-07-07 23:27:58',25,2,0.00,19,1,NULL,1,NULL);
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
INSERT INTO `queries` VALUES (1,1048585,2,3,1.00,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,7,NULL,NULL,'2022-07-07 23:06:26','2022-07-07 23:06:26',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:06:26',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,1,9,NULL,NULL,'2022-07-07 23:06:33','2022-07-07 23:06:33',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:06:33',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(3,1,10,NULL,NULL,'2022-07-07 23:06:40','2022-07-07 23:06:40',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:06:40',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(4,3,9,NULL,NULL,'2022-07-07 23:11:20','2022-07-07 23:11:20',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:11:20',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,0),(5,3,10,NULL,NULL,'2022-07-07 23:11:27','2022-07-07 23:11:27',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:11:27',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2022-07-07 23:12:44','2022-07-07 23:12:44',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:12:44',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(7,5,10,NULL,NULL,'2022-07-07 23:12:51','2022-07-07 23:12:51',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:12:51',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(8,6,7,NULL,NULL,'2022-07-07 23:14:12','2022-07-07 23:14:12',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:14:12',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,0),(9,6,10,NULL,NULL,'2022-07-07 23:14:20','2022-07-07 23:14:20',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:14:20',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,1,NULL,0),(10,7,8,NULL,5,'2022-07-07 23:15:32','2022-07-07 23:15:32','2022-07-07 23:15:55','2022-07-07 23:15:59',NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:15:59',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,4,NULL,0),(11,7,9,NULL,NULL,'2022-07-07 23:15:39','2022-07-07 23:15:40',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:15:40',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(12,7,10,NULL,NULL,'2022-07-07 23:15:47','2022-07-07 23:15:47',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:15:47',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(13,9,7,NULL,NULL,'2022-07-07 23:17:01','2022-07-07 23:17:01',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:17:01',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,0),(14,9,10,NULL,NULL,'2022-07-07 23:17:08','2022-07-07 23:17:08',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:17:08',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,1,NULL,0),(15,10,9,NULL,2,'2022-07-07 23:18:26','2022-07-07 23:18:26','2022-07-07 23:18:42','2022-07-07 23:18:46',NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:18:46',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,0),(16,10,10,NULL,3,'2022-07-07 23:18:34','2022-07-07 23:18:34','2022-07-07 23:18:54','2022-07-07 23:18:59',NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:18:59',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,0),(17,12,7,NULL,NULL,'2022-07-07 23:20:06','2022-07-07 23:20:06',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:20:06',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,1,NULL,0),(18,12,8,NULL,NULL,'2022-07-07 23:20:13','2022-07-07 23:20:13',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:20:13',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,1,NULL,0),(19,13,7,NULL,2,'2022-07-07 23:20:57','2022-07-07 23:20:57','2022-07-07 23:21:21','2022-07-07 23:21:25','2022-07-07 23:22:13','2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:22:13',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,0),(20,13,9,NULL,2,'2022-07-07 23:21:05','2022-07-07 23:21:05','2022-07-07 23:21:34','2022-07-07 23:21:39','2022-07-07 23:22:13','2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:22:13',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,0),(21,13,10,NULL,3,'2022-07-07 23:21:12','2022-07-07 23:21:12','2022-07-07 23:21:48','2022-07-07 23:21:52','2022-07-07 23:22:13','2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:22:13',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,0),(22,15,8,NULL,NULL,'2022-07-07 23:23:16','2022-07-07 23:23:16',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:23:16',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,0),(23,15,9,NULL,NULL,'2022-07-07 23:23:23','2022-07-07 23:23:23',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:23:23',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,1,NULL,0),(24,17,7,NULL,NULL,'2022-07-07 23:24:58','2022-07-07 23:24:58',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:24:58',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,0),(25,17,8,NULL,NULL,'2022-07-07 23:25:05','2022-07-07 23:25:05',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:25:05',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,1,NULL,0),(26,19,8,NULL,NULL,'2022-07-07 23:28:23','2022-07-07 23:28:23',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:28:23',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,0),(27,19,9,NULL,NULL,'2022-07-07 23:28:31','2022-07-07 23:28:31',NULL,NULL,NULL,'2022-08-04 00:00:00','2022-08-04 00:00:00','2022-07-07 23:28:31',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,1,NULL,0);
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
INSERT INTO `review_files` VALUES (1,2),(2,2),(3,2),(4,7),(5,7),(6,10),(7,10),(8,12),(9,12),(10,14),(11,14),(12,14),(13,17),(14,17),(15,19),(16,19),(17,22),(18,22),(19,24),(20,24),(21,24),(22,27),(23,27),(24,30),(25,30),(26,34),(27,34);
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
INSERT INTO `review_round_files` VALUES (1,1,3,2),(2,2,3,5),(3,3,3,7),(5,4,3,10),(6,5,3,12),(7,6,3,14),(9,7,3,17),(10,8,3,19),(12,9,3,22),(13,10,3,24),(15,11,3,27),(17,12,3,30),(19,13,3,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES (1,1,3,1,NULL,4),(2,2,3,1,NULL,14),(3,3,3,1,NULL,4),(4,5,3,1,NULL,4),(5,6,3,1,NULL,4),(6,7,3,1,NULL,8),(7,9,3,1,NULL,4),(8,10,3,1,NULL,8),(9,12,3,1,NULL,7),(10,13,3,1,NULL,1),(11,15,3,1,NULL,4),(12,17,3,1,NULL,4),(13,19,3,1,NULL,4);
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
INSERT INTO `scheduled_tasks` VALUES ('classes.tasks.SubscriptionExpiryReminder','2022-07-07 22:58:54'),('lib.pkp.classes.task.DepositDois','2022-07-07 22:58:54'),('lib.pkp.classes.task.EditorialReminders','2022-07-07 22:58:54'),('lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers','2022-07-07 22:58:54'),('lib.pkp.classes.task.ReviewReminder','2022-07-07 22:58:54'),('lib.pkp.classes.task.StatisticsReport','2022-07-07 22:58:54'),('plugins.generic.usageStats.UsageStatsLoader','2022-07-07 22:58:54');
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `editor_restricted` smallint(6) NOT NULL DEFAULT '0',
  `meta_indexed` smallint(6) NOT NULL DEFAULT '0',
  `meta_reviewed` smallint(6) NOT NULL DEFAULT '1',
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT '0',
  `hide_title` smallint(6) NOT NULL DEFAULT '0',
  `hide_author` smallint(6) NOT NULL DEFAULT '0',
  `is_inactive` smallint(6) NOT NULL DEFAULT '0',
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
INSERT INTO `sections` VALUES (1,1,0,1.00,0,1,1,0,0,0,0,500),(2,1,0,2.00,0,1,1,1,0,0,0,0);
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
INSERT INTO `sessions` VALUES ('0q5s1nrsrqirttovitav1l2r2s',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236411,1657236427,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657236428;s:5:\"token\";s:32:\"bf77c217353edaf0a08ed9e9a8160b9a\";}','localhost'),('0u1tendpndnft9m731qpv9rrdi',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235123,1657235135,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657235135;s:5:\"token\";s:32:\"e5dab65588ac77267f92e907dccfd0d6\";}','localhost'),('0vaklkcho2dngrbpl6uip5f5n7',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235150,1657235166,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235166;s:5:\"token\";s:32:\"907351b7c38c75ff8b1d2733cbe622b9\";}username|s:10:\"amwandenga\";userId|i:17;','localhost'),('2gdi4t934a8gmch586lao0kplm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236257,1657236351,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236351;s:5:\"token\";s:32:\"f6b360a4471cb710114e0fdca18bd559\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('34g8v80f0thfu8mgda7p4jlifa',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657234789,1657235089,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1657235089;s:5:\"token\";s:32:\"8359ddcff482c10cface9a298522e107\";}','localhost'),('3crephnn2h9c21vkougk6ag3s9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236366,1657236377,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657236374;s:5:\"token\";s:32:\"745a1979cceb0ffe2abb09e9fbf23b11\";}','localhost'),('3im9v967rgcn4ktfiqd3en7dis',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236399,1657236411,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657236411;s:5:\"token\";s:32:\"812b8a0cfa4cf63f077c7aee2cc1db48\";}','localhost'),('3s10025t5i1mhsmhe2u2225dp1',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236430,1657236462,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236463;s:5:\"token\";s:32:\"edd96139de80b9ec79fcbef49ea6ac77\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('42g81m493lkv0lg0hbpg68nta5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235167,1657235233,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657235233;s:5:\"token\";s:32:\"9a352b5c123cfd3f7217bd049154ca21\";}','localhost'),('50bhe1n8rbmbstcnncb11fvvpa',24,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235762,1657235782,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235782;s:5:\"token\";s:32:\"19167537c625393c7b21f80b3abe223d\";}username|s:7:\"eostrom\";userId|i:24;','localhost'),('6uarn5847386fgnnuffqfjp3l4',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235349,1657235358,0,'userId|i:5;username|s:8:\"sberardo\";csrf|a:2:{s:9:\"timestamp\";i:1657235359;s:5:\"token\";s:32:\"fb9a5fe97e1ebb15d0a1a8c192fa07c5\";}signedInAs|i:3;','localhost'),('74vt0tr2ug8pvi9ngqp28laihu',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235271,1657235283,0,'username|s:10:\"amwandenga\";csrf|a:2:{s:9:\"timestamp\";i:1657235283;s:5:\"token\";s:32:\"df60e6fae5bc159894e44d417c18d37f\";}userId|i:17;','localhost'),('7nfe34p28qolkmuhq43tr2t2gn',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235265,1657235271,0,'userId|i:17;username|s:10:\"amwandenga\";csrf|a:2:{s:9:\"timestamp\";i:1657235271;s:5:\"token\";s:32:\"bfa976682157b79e4240f375bb69d4a7\";}','localhost'),('7q022aidsccen8s7rl82an5vs9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236465,1657236526,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236526;s:5:\"token\";s:32:\"97bed33943463b00f76a0c712c8d928c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('7tn1a7m160i1k879mtpb5602l5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235342,1657235348,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657235348;s:5:\"token\";s:32:\"3a6c8adb8cf76dcefd2c3941b30b2ce7\";}','localhost'),('8qr8f504rho6gncjvrimdhfsfh',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657234767,1657234777,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657234777;s:5:\"token\";s:32:\"d18193c6b7e232b612ca14c9f7f54208\";}','localhost'),('8rrsco5mleh8uq52r3u7cunb0n',30,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236140,1657236156,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236156;s:5:\"token\";s:32:\"773aae184a195bd21583e7fde35fe59c\";}username|s:7:\"pdaniel\";userId|i:30;','localhost'),('9cu56jilr0or7072jo6joha0p0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235295,1657235306,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657235306;s:5:\"token\";s:32:\"4a2f9dc584e6637eda48641db6112342\";}userId|i:3;','localhost'),('9l8ibcbj9lqu9skc8vmkvclrje',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235942,1657235963,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235962;s:5:\"token\";s:32:\"8638db4610f3037b2c70a98d30a1f958\";}username|s:10:\"kalkhafaji\";userId|i:27;','localhost'),('ahv947ahdbnfhl7atig601gu56',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657234734,1657234748,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657234748;s:5:\"token\";s:32:\"076a1e175da3fcec5ea2af08315cfd15\";}','localhost'),('dd51dpu54eioi58emmrq12d4ia',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235370,1657235438,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235438;s:5:\"token\";s:32:\"79432909649a78096bd2f3a748faab2c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ems456l07tq8gbs19ofmf4h30d',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235094,1657235121,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657235121;s:5:\"token\";s:32:\"c6f75b16d4906baa7f3984a8b7aee747\";}','localhost'),('fbt7qgqmm4u285jmhhsln5i9vi',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235441,1657235503,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235503;s:5:\"token\";s:32:\"0d4c9e20c51ba2d8723aa67eccaf7411\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fonavecd5goqofn3b798u32nnt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235612,1657235692,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235692;s:5:\"token\";s:32:\"a125d0d099cadcdb903611ebef431278\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('gmrk9vo9otj2e0887mncfo7lvg',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235283,1657235294,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657235295;s:5:\"token\";s:32:\"58fb5d1b9450b5e3f47f9917a8e113eb\";}','localhost'),('hae3n8sal1fjt56b81n1sn3ult',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235694,1657235760,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235760;s:5:\"token\";s:32:\"4a0a1a97883df95ecbc7300c6f1b4c1e\";}username|s:7:\"phudson\";','localhost'),('jgpm6c3q10mum6bd0d8soo1vok',20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235505,1657235526,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235526;s:5:\"token\";s:32:\"4795262b6306be89728d1588d8657964\";}username|s:12:\"cmontgomerie\";userId|i:20;','localhost'),('ls758ji51rdi9tufq9fkiecud3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236353,1657236365,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657236365;s:5:\"token\";s:32:\"6489b3aece706e53cb0d421b7a8e44db\";}','localhost'),('m1asu3hq9h4mfhn5cta0ltch1t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236389,1657236399,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657236397;s:5:\"token\";s:32:\"5fb5f2103f29c40d411cfb03404a9e83\";}','localhost'),('m53l54fodp3ufe5a2tcdgifqo1',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235359,1657235369,0,'userId|i:5;username|s:8:\"sberardo\";csrf|a:2:{s:9:\"timestamp\";i:1657235369;s:5:\"token\";s:32:\"70b34023144e3a78b0d1a204a3be2fdd\";}signedInAs|i:3;','localhost'),('m8dh2slf6r21r1d5ru2g2dbhh2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235784,1657235865,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235865;s:5:\"token\";s:32:\"1bdc35ea1c3482c413014439083bf129\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('n0ep4ap6og7eoh6eltgoic7i7g',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235528,1657235609,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235609;s:5:\"token\";s:32:\"3f7ee6995403a768c3afbf6720ceb64a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('o67vncbtvmuos7i0sg7hqhk1ql',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236377,1657236389,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657236389;s:5:\"token\";s:32:\"5fee46718c074216f12d6507345e8d5b\";}','localhost'),('o707ahvihecpm51d0bepe32f4v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235334,1657235341,0,'','localhost'),('q9aibrr69lg4l6muh49ukofs93',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236017,1657236138,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236138;s:5:\"token\";s:32:\"4a7ef91499157e662970857892b6728c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('qgdmrbva8ditrtlchammug34o7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235965,1657236014,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236013;s:5:\"token\";s:32:\"072746a5924d2e10449f56ee559899bf\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('s86l080qdjvs2k5k5r64mg4dbv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235234,1657235264,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657235264;s:5:\"token\";s:32:\"5abc0584a2947433056b6b236f0468b3\";}','localhost'),('t9d9d0lni4j4cp9tb3v02gnnlk',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657234748,1657234766,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657234766;s:5:\"token\";s:32:\"b62e765e16fa9400083a5ba62e5a3f84\";}','localhost'),('tehq6ead15k6imsud9f3n7csga',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235137,1657235148,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657235147;s:5:\"token\";s:32:\"2388a80c1d411ec78a8c5cdcbce5a1ec\";}','localhost'),('uv61p2nac5lpal1ahkis918co2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236158,1657236234,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236234;s:5:\"token\";s:32:\"ae51f6c5b6237b047bb581e499aad79a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('v1rbntfsb1ro3h8n6c0ikh14nh',32,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657236236,1657236254,0,'csrf|a:2:{s:9:\"timestamp\";i:1657236254;s:5:\"token\";s:32:\"369140f5f601dbe3bcf70fcf5c583f28\";}username|s:6:\"rrossi\";userId|i:32;','localhost'),('v7aqqmnb74t34bo31fap8787dg',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235306,1657235334,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1657235334;s:5:\"token\";s:32:\"43403669faccc46cb8325929c10180dd\";}','localhost'),('vgc9l6ghga5iv0freamtmfvp4t',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657234777,1657234787,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1657234787;s:5:\"token\";s:32:\"fa371212a579a48a466206cf2caf8bc5\";}','localhost'),('vss8cpedash6c0htq5tnd0jhb4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/103.0.5060.53 Safari/537.36',1657235868,1657235939,0,'csrf|a:2:{s:9:\"timestamp\";i:1657235939;s:5:\"token\";s:32:\"ba425ceb8042481081454402c9508cd4\";}username|s:8:\"agallego\";','localhost');
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
  `recommend_only` smallint(6) NOT NULL DEFAULT '0',
  `can_change_metadata` smallint(6) NOT NULL DEFAULT '0',
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
INSERT INTO `stage_assignments` VALUES (1,1,14,17,'2022-07-07 23:07:56',0,1),(2,1,3,3,'2022-07-07 23:06:06',0,1),(3,1,5,4,'2022-07-07 23:06:06',0,1),(4,1,5,5,'2022-07-07 23:09:23',1,0),(5,1,7,12,'2022-07-07 23:06:52',0,0),(6,1,11,14,'2022-07-07 23:07:07',0,0),(7,1,13,16,'2022-07-07 23:07:12',0,0),(8,2,14,18,'2022-07-07 23:09:37',0,0),(9,2,3,3,'2022-07-07 23:09:45',0,1),(10,2,5,4,'2022-07-07 23:09:45',0,1),(11,2,5,5,'2022-07-07 23:09:45',0,1),(12,2,5,6,'2022-07-07 23:10:05',1,1),(13,3,14,19,'2022-07-07 23:10:48',0,0),(14,3,3,3,'2022-07-07 23:10:57',0,1),(15,3,5,4,'2022-07-07 23:10:57',0,1),(16,3,5,5,'2022-07-07 23:10:57',0,1),(17,3,7,11,'2022-07-07 23:11:41',0,0),(18,4,14,20,'2022-07-07 23:11:53',0,0),(19,4,3,3,'2022-07-07 23:12:06',0,1),(20,4,5,4,'2022-07-07 23:12:06',0,1),(21,4,5,5,'2022-07-07 23:12:06',0,1),(22,5,14,21,'2022-07-07 23:12:16',0,0),(23,5,3,3,'2022-07-07 23:12:22',0,1),(24,5,5,4,'2022-07-07 23:12:22',0,1),(25,5,5,5,'2022-07-07 23:12:22',0,1),(26,5,7,11,'2022-07-07 23:13:05',0,0),(27,5,11,13,'2022-07-07 23:13:22',0,0),(28,5,13,15,'2022-07-07 23:13:28',0,0),(29,6,14,22,'2022-07-07 23:13:40',0,0),(30,6,3,3,'2022-07-07 23:13:50',0,1),(31,6,5,4,'2022-07-07 23:13:50',0,1),(32,6,5,5,'2022-07-07 23:13:50',0,1),(33,6,7,11,'2022-07-07 23:14:34',0,0),(34,6,11,13,'2022-07-07 23:14:51',0,0),(35,7,14,23,'2022-07-07 23:15:02',0,0),(36,7,3,3,'2022-07-07 23:15:09',0,1),(37,7,5,4,'2022-07-07 23:15:09',0,1),(38,7,5,5,'2022-07-07 23:15:09',0,1),(39,8,14,24,'2022-07-07 23:16:10',0,0),(40,8,3,3,'2022-07-07 23:16:22',0,1),(41,8,5,4,'2022-07-07 23:16:22',0,1),(42,8,5,5,'2022-07-07 23:16:22',0,1),(43,9,14,25,'2022-07-07 23:16:32',0,0),(44,9,3,3,'2022-07-07 23:16:38',0,1),(45,9,5,6,'2022-07-07 23:16:38',0,1),(46,9,7,12,'2022-07-07 23:17:22',0,0),(47,9,11,14,'2022-07-07 23:17:38',0,0),(48,9,13,16,'2022-07-07 23:17:44',0,0),(49,10,14,26,'2022-07-07 23:17:55',0,0),(50,10,3,3,'2022-07-07 23:18:02',0,1),(51,10,5,4,'2022-07-07 23:18:02',0,1),(52,10,5,5,'2022-07-07 23:18:02',0,1),(53,11,14,27,'2022-07-07 23:19:10',0,0),(54,11,3,3,'2022-07-07 23:19:22',0,1),(55,11,5,4,'2022-07-07 23:19:22',0,1),(56,11,5,5,'2022-07-07 23:19:22',0,1),(57,12,14,28,'2022-07-07 23:19:33',0,0),(58,12,3,3,'2022-07-07 23:19:42',0,1),(59,12,5,4,'2022-07-07 23:19:42',0,1),(60,12,5,5,'2022-07-07 23:19:42',0,1),(61,13,14,29,'2022-07-07 23:20:25',0,0),(62,13,3,3,'2022-07-07 23:20:34',0,1),(63,13,5,4,'2022-07-07 23:20:34',0,1),(64,13,5,5,'2022-07-07 23:20:34',0,1),(65,14,14,30,'2022-07-07 23:22:28',0,0),(66,14,3,3,'2022-07-07 23:22:36',0,1),(67,14,5,4,'2022-07-07 23:22:36',0,1),(68,14,5,5,'2022-07-07 23:22:36',0,1),(69,15,14,31,'2022-07-07 23:22:46',0,0),(70,15,3,3,'2022-07-07 23:22:52',0,1),(71,15,5,4,'2022-07-07 23:22:52',0,1),(72,15,5,5,'2022-07-07 23:22:52',0,1),(73,15,7,12,'2022-07-07 23:23:37',0,0),(74,15,11,14,'2022-07-07 23:23:53',0,0),(75,16,14,32,'2022-07-07 23:24:04',0,0),(76,16,3,3,'2022-07-07 23:24:14',0,1),(77,16,5,4,'2022-07-07 23:24:14',0,1),(78,16,5,5,'2022-07-07 23:24:14',0,1),(79,17,14,33,'2022-07-07 23:24:23',0,0),(80,17,3,3,'2022-07-07 23:24:35',0,1),(81,17,5,4,'2022-07-07 23:24:35',0,1),(82,17,5,5,'2022-07-07 23:24:35',0,1),(83,17,7,11,'2022-07-07 23:25:19',0,0),(84,17,11,13,'2022-07-07 23:25:35',0,0),(85,17,13,15,'2022-07-07 23:25:41',0,0),(86,18,14,34,'2022-07-07 23:27:18',0,0),(87,18,3,3,'2022-07-07 23:27:25',0,1),(88,18,5,4,'2022-07-07 23:27:25',0,1),(89,18,5,5,'2022-07-07 23:27:25',0,1),(90,19,14,35,'2022-07-07 23:27:52',0,0),(91,19,3,3,'2022-07-07 23:27:59',0,1),(92,19,5,6,'2022-07-07 23:27:59',0,1),(93,19,7,12,'2022-07-07 23:28:45',0,0);
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
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,4),(1,1,530,5),(1,2,530,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,7,10,8,'','<p>Here are my review comments</p>','2022-07-07 23:15:59',NULL,1),(2,1,4096,10,15,9,'','<p>Here are my review comments</p>','2022-07-07 23:18:46',NULL,1),(3,1,4096,10,16,10,'','<p>Here are my review comments</p>','2022-07-07 23:18:59',NULL,1),(4,1,4096,13,19,7,'','<p>Here are my review comments</p>','2022-07-07 23:21:25',NULL,1),(5,1,4096,13,20,9,'','<p>Here are my review comments</p>','2022-07-07 23:21:38',NULL,1),(6,1,4096,13,21,10,'','<p>Here are my review comments</p>','2022-07-07 23:21:52',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3),(5,5,3),(6,6,4),(7,7,4),(8,8,5),(9,9,6),(10,10,6),(11,11,7),(12,12,7),(13,13,8),(14,14,8),(15,15,9),(16,16,10),(17,17,10),(18,18,11),(19,19,11),(20,20,12),(21,21,13),(22,22,13),(23,23,14),(24,24,14),(25,25,15),(26,26,16),(27,27,16),(28,28,17),(29,29,18),(30,30,18),(31,31,19),(32,32,20),(33,33,21),(34,34,21);
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(2,'en_US','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(3,'en_US','name','article.pdf','string'),(3,'fr_CA','name','','string'),(4,'en_US','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'en_US','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(6,'en_US','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(7,'en_US','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(8,'en_US','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(9,'en_US','name','Genetic transformation of forest trees.pdf','string'),(10,'en_US','name','Genetic transformation of forest trees.pdf','string'),(11,'en_US','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(12,'en_US','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(13,'en_US','name','Developing efficacy beliefs in the classroom.pdf','string'),(14,'en_US','name','Developing efficacy beliefs in the classroom.pdf','string'),(15,'en_US','name','Traditions and Trends in the Study of the Commons.pdf','string'),(16,'en_US','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(17,'en_US','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(18,'en_US','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(19,'en_US','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(20,'en_US','name','Learning Sustainable Design through Service.pdf','string'),(21,'en_US','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(22,'en_US','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(23,'en_US','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(24,'en_US','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(25,'en_US','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(26,'en_US','name','Yam diseases and its management in Nigeria.pdf','string'),(27,'en_US','name','Yam diseases and its management in Nigeria.pdf','string'),(28,'en_US','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(29,'en_US','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(30,'en_US','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(31,'en_US','name','article.pdf','string'),(31,'fr_CA','name','','string'),(32,'en_US','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(33,'en_US','name','Finocchiaro: Arguments About Arguments.pdf','string'),(34,'en_US','name','Finocchiaro: Arguments About Arguments.pdf','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:06:00','2022-07-07 23:06:00',17,NULL,NULL),(2,1,1,1,1,4,NULL,NULL,NULL,'2022-07-07 23:06:17','2022-07-07 23:06:17',17,523,1),(3,1,2,NULL,1,10,NULL,NULL,NULL,'2022-07-07 23:07:43','2022-07-07 23:07:44',3,521,1),(4,2,3,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:09:40','2022-07-07 23:09:40',18,NULL,NULL),(5,2,3,4,1,4,NULL,NULL,NULL,'2022-07-07 23:09:57','2022-07-07 23:09:57',18,523,2),(6,3,4,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:10:51','2022-07-07 23:10:51',19,NULL,NULL),(7,3,4,6,1,4,NULL,NULL,NULL,'2022-07-07 23:11:09','2022-07-07 23:11:09',19,523,3),(8,4,5,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:11:56','2022-07-07 23:11:56',20,NULL,NULL),(9,5,6,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:12:18','2022-07-07 23:12:18',21,NULL,NULL),(10,5,6,9,1,4,NULL,NULL,NULL,'2022-07-07 23:12:34','2022-07-07 23:12:34',21,523,4),(11,6,7,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:13:42','2022-07-07 23:13:43',22,NULL,NULL),(12,6,7,11,1,4,NULL,NULL,NULL,'2022-07-07 23:14:02','2022-07-07 23:14:02',22,523,5),(13,7,8,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:15:04','2022-07-07 23:15:05',23,NULL,NULL),(14,7,8,13,1,4,NULL,NULL,NULL,'2022-07-07 23:15:22','2022-07-07 23:15:22',23,523,6),(15,8,9,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:16:12','2022-07-07 23:16:13',24,NULL,NULL),(16,9,10,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:16:35','2022-07-07 23:16:35',25,NULL,NULL),(17,9,10,16,1,4,NULL,NULL,NULL,'2022-07-07 23:16:51','2022-07-07 23:16:51',25,523,7),(18,10,11,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:17:57','2022-07-07 23:17:58',26,NULL,NULL),(19,10,11,18,1,4,NULL,NULL,NULL,'2022-07-07 23:18:17','2022-07-07 23:18:17',26,523,8),(20,11,12,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:19:13','2022-07-07 23:19:13',27,NULL,NULL),(21,12,13,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:19:35','2022-07-07 23:19:36',28,NULL,NULL),(22,12,13,21,1,4,NULL,NULL,NULL,'2022-07-07 23:19:56','2022-07-07 23:19:56',28,523,9),(23,13,14,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:20:27','2022-07-07 23:20:28',29,NULL,NULL),(24,13,14,23,1,4,NULL,NULL,NULL,'2022-07-07 23:20:48','2022-07-07 23:20:48',29,523,10),(25,14,15,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:22:30','2022-07-07 23:22:30',30,NULL,NULL),(26,15,16,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:22:48','2022-07-07 23:22:49',31,NULL,NULL),(27,15,16,26,1,4,NULL,NULL,NULL,'2022-07-07 23:23:06','2022-07-07 23:23:06',31,523,11),(28,16,17,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:24:07','2022-07-07 23:24:07',32,NULL,NULL),(29,17,18,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:24:26','2022-07-07 23:24:27',33,NULL,NULL),(30,17,18,29,1,4,NULL,NULL,NULL,'2022-07-07 23:24:49','2022-07-07 23:24:49',33,523,12),(31,17,19,NULL,1,10,NULL,NULL,NULL,'2022-07-07 23:25:50','2022-07-07 23:25:51',3,521,3),(32,18,20,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:27:20','2022-07-07 23:27:21',34,NULL,NULL),(33,19,21,NULL,1,2,NULL,NULL,NULL,'2022-07-07 23:27:55','2022-07-07 23:27:55',35,NULL,NULL),(34,19,21,33,1,4,NULL,NULL,NULL,'2022-07-07 23:28:14','2022-07-07 23:28:14',35,523,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (1,'alan'),(89,'antibiotics'),(56,'antimicrobial'),(4,'cape'),(97,'cases'),(96,'clinical'),(80,'coli'),(62,'coliforms'),(75,'compared'),(93,'concentration'),(23,'conclusive'),(25,'conflicting'),(106,'conjugative'),(102,'consistent'),(43,'continuous'),(38,'corporate'),(42,'decisions'),(49,'development'),(90,'difference'),(41,'distribution'),(31,'dividend'),(10,'dividends'),(29,'economists'),(13,'empirical'),(107,'encoding'),(71,'enterobacteriacea'),(79,'escherichia'),(47,'evaluation'),(14,'evidence'),(34,'existing'),(74,'faeces'),(76,'fifteen'),(28,'financial'),(40,'financing'),(20,'firm'),(44,'function'),(18,'future'),(104,'group'),(32,'guidance'),(72,'healthy'),(57,'heavy'),(66,'hospital'),(73,'human'),(78,'identified'),(27,'implications'),(111,'infection'),(65,'infections'),(92,'inhibitory'),(46,'intuitive'),(39,'investment'),(36,'investors'),(7,'ipsum'),(68,'iran'),(67,'isfahan'),(63,'isolated'),(77,'isolates'),(24,'issue'),(54,'karbasizaed'),(82,'kelebsiella'),(12,'literature'),(6,'lorem'),(33,'management'),(58,'metal'),(98,'metals'),(94,'mic'),(91,'minimal'),(110,'multidrug-resistance'),(88,'multiple'),(2,'mwandenga'),(64,'nosocomial'),(22,'offer'),(105,'pattern'),(69,'patterns'),(85,'percent'),(101,'persons'),(60,'plasmid'),(83,'pneumoniae'),(26,'policy'),(87,'possess'),(35,'potential'),(30,'practical'),(48,'professional'),(61,'profile'),(70,'profiles'),(19,'prospects'),(21,'recent'),(108,'recovered'),(112,'region'),(103,'relationship'),(45,'rely'),(81,'remaining'),(59,'resistance'),(109,'results'),(11,'review'),(84,'seventy'),(37,'shareholding'),(17,'signal'),(15,'signaling'),(8,'signalling'),(99,'significant'),(50,'social'),(86,'strains'),(16,'suggests'),(55,'tehran'),(9,'theory'),(100,'tolerant'),(5,'town'),(51,'transformation'),(3,'university'),(53,'vajiheh'),(95,'values'),(52,'version');
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
INSERT INTO `submission_search_object_keywords` VALUES (9,1,0),(9,2,1),(9,3,2),(49,3,2),(9,4,3),(9,5,4),(9,6,5),(9,7,6),(10,8,0),(10,9,1),(11,9,1),(10,10,2),(11,10,3),(10,11,3),(10,12,4),(10,13,5),(11,13,9),(10,14,6),(11,14,10),(11,14,13),(11,15,0),(11,16,2),(11,17,4),(11,18,5),(11,19,6),(11,20,7),(11,21,8),(11,22,11),(11,23,12),(11,24,14),(11,25,15),(11,26,16),(11,26,22),(11,27,17),(11,28,18),(11,29,19),(11,30,20),(11,31,21),(11,31,37),(11,32,23),(11,33,24),(11,33,36),(11,34,25),(11,35,26),(51,35,85),(11,36,27),(11,37,28),(11,38,29),(11,39,30),(11,40,31),(11,41,32),(11,42,33),(11,42,38),(11,43,34),(11,44,35),(11,45,39),(11,46,40),(11,47,41),(13,48,0),(13,49,1),(13,50,2),(13,51,3),(49,53,0),(49,54,1),(49,55,3),(50,56,0),(51,56,0),(51,56,67),(50,57,1),(51,57,1),(51,57,51),(51,57,58),(51,57,74),(50,58,2),(51,58,2),(51,58,59),(50,59,3),(51,59,3),(51,59,34),(51,59,68),(51,59,73),(50,60,4),(51,60,5),(51,60,64),(51,60,71),(50,61,5),(51,61,65),(50,62,6),(51,62,7),(51,62,84),(50,63,7),(51,63,9),(51,63,29),(51,63,55),(51,63,79),(50,64,8),(51,64,10),(51,64,18),(51,64,30),(51,64,80),(51,64,86),(50,65,9),(51,65,11),(51,65,19),(51,65,31),(51,65,81),(50,66,10),(51,66,56),(50,67,11),(50,68,12),(51,69,4),(51,70,6),(51,71,8),(51,72,12),(51,72,38),(51,72,60),(51,73,13),(51,73,39),(51,74,14),(51,74,40),(51,74,50),(51,75,15),(51,75,36),(51,76,16),(51,77,17),(51,78,20),(51,79,21),(51,80,22),(51,81,23),(51,82,24),(51,83,25),(51,84,26),(51,85,27),(51,86,28),(51,86,37),(51,86,47),(51,86,54),(51,86,78),(51,87,32),(51,88,33),(51,89,35),(51,89,76),(51,90,41),(51,91,42),(51,92,43),(51,93,44),(51,94,45),(51,95,46),(51,96,48),(51,97,49),(51,98,52),(51,98,75),(51,99,53),(51,100,57),(51,101,61),(51,102,62),(51,103,63),(51,104,66),(51,105,69),(51,106,70),(51,107,72),(51,108,77),(51,109,82),(51,110,83),(51,111,87),(51,112,88);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (9,1,1,0),(10,1,2,0),(11,1,4,0),(12,1,16,0),(13,1,17,0),(14,1,8,0),(15,1,32,0),(16,1,64,0),(49,17,1,0),(50,17,2,0),(51,17,4,0),(52,17,16,0),(53,17,17,0),(54,17,8,0),(55,17,32,0),(56,17,64,0);
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
INSERT INTO `submissions` VALUES (1,1,1,'2022-07-07 23:09:23','2022-07-07 23:06:06','2022-07-07 23:06:06',5,'en_US',3,0,0),(2,1,3,'2022-07-07 23:10:25','2022-07-07 23:09:45','2022-07-07 23:09:45',3,'en_US',1,0,0),(3,1,4,'2022-07-07 23:11:41','2022-07-07 23:10:57','2022-07-07 23:10:57',4,'en_US',1,0,0),(4,1,5,'2022-07-07 23:12:06','2022-07-07 23:12:06','2022-07-07 23:12:06',1,'en_US',1,0,0),(5,1,6,'2022-07-07 23:13:28','2022-07-07 23:12:22','2022-07-07 23:12:22',5,'en_US',1,0,0),(6,1,7,'2022-07-07 23:14:51','2022-07-07 23:13:50','2022-07-07 23:13:50',5,'en_US',1,0,0),(7,1,8,'2022-07-07 23:15:59','2022-07-07 23:15:09','2022-07-07 23:15:32',3,'en_US',1,0,0),(8,1,9,'2022-07-07 23:16:22','2022-07-07 23:16:22','2022-07-07 23:16:22',1,'en_US',1,0,0),(9,1,10,'2022-07-07 23:17:44','2022-07-07 23:16:38','2022-07-07 23:16:38',5,'en_US',1,0,0),(10,1,11,'2022-07-07 23:18:59','2022-07-07 23:18:02','2022-07-07 23:18:34',3,'en_US',1,0,0),(11,1,12,'2022-07-07 23:19:23','2022-07-07 23:19:22','2022-07-07 23:19:22',1,'en_US',1,0,0),(12,1,13,'2022-07-07 23:20:13','2022-07-07 23:19:42','2022-07-07 23:19:42',3,'en_US',1,0,0),(13,1,14,'2022-07-07 23:22:13','2022-07-07 23:20:34','2022-07-07 23:21:12',3,'en_US',1,0,0),(14,1,15,'2022-07-07 23:22:36','2022-07-07 23:22:36','2022-07-07 23:22:36',1,'en_US',1,0,0),(15,1,16,'2022-07-07 23:23:53','2022-07-07 23:22:52','2022-07-07 23:22:52',5,'en_US',1,0,0),(16,1,17,'2022-07-07 23:24:14','2022-07-07 23:24:14','2022-07-07 23:24:14',1,'en_US',1,0,0),(17,1,18,'2022-07-07 23:27:01','2022-07-07 23:24:35','2022-07-07 23:24:35',5,'en_US',3,0,0),(18,1,19,'2022-07-07 23:27:39','2022-07-07 23:27:25','2022-07-07 23:27:25',1,'en_US',4,0,0),(19,1,20,'2022-07-07 23:28:45','2022-07-07 23:27:59','2022-07-07 23:27:59',4,'en_US',1,0,0);
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
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT '0',
  `membership` smallint(6) NOT NULL DEFAULT '0',
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL,
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
  `status` smallint(6) NOT NULL DEFAULT '1',
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
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','Administrateur-trice du site','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','JM','string'),(2,'en_US','name','Journal manager','string'),(2,'fr_CA','abbrev','DIR','string'),(2,'fr_CA','name','Directeur-trice de la revue','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','JE','string'),(3,'en_US','name','Journal editor','string'),(3,'fr_CA','abbrev','R??D','string'),(3,'fr_CA','name','R??dacteur-trice','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'fr_CA','abbrev','DirProd','string'),(4,'fr_CA','name','Directeur-trice de production','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','SecE','string'),(5,'en_US','name','Section editor','string'),(5,'fr_CA','abbrev','R??DRUB','string'),(5,'fr_CA','name','R??dacteur-trice de rubrique','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(6,'','nameLocaleKey','default.groups.name.guestEditor','string'),(6,'en_US','abbrev','GE','string'),(6,'en_US','name','Guest editor','string'),(6,'fr_CA','abbrev','R??DINV','string'),(6,'fr_CA','name','R??dacteur-trice invit??-e','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(7,'','nameLocaleKey','default.groups.name.copyeditor','string'),(7,'en_US','abbrev','CE','string'),(7,'en_US','name','Copyeditor','string'),(7,'fr_CA','abbrev','R??V','string'),(7,'fr_CA','name','R??viseur-e','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(8,'','nameLocaleKey','default.groups.name.designer','string'),(8,'en_US','abbrev','Design','string'),(8,'en_US','name','Designer','string'),(8,'fr_CA','abbrev','Design','string'),(8,'fr_CA','name','Designer','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(9,'','nameLocaleKey','default.groups.name.funding','string'),(9,'en_US','abbrev','FC','string'),(9,'en_US','name','Funding coordinator','string'),(9,'fr_CA','abbrev','CF','string'),(9,'fr_CA','name','Coordonnateur-trice du financement','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(10,'','nameLocaleKey','default.groups.name.indexer','string'),(10,'en_US','abbrev','IND','string'),(10,'en_US','name','Indexer','string'),(10,'fr_CA','abbrev','Indx','string'),(10,'fr_CA','name','Indexeur-e','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(11,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(11,'en_US','abbrev','LE','string'),(11,'en_US','name','Layout Editor','string'),(11,'fr_CA','abbrev','RespMP','string'),(11,'fr_CA','name','Responsable de la mise en page','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(12,'','nameLocaleKey','default.groups.name.marketing','string'),(12,'en_US','abbrev','MS','string'),(12,'en_US','name','Marketing and sales coordinator','string'),(12,'fr_CA','abbrev','CVM','string'),(12,'fr_CA','name','Coordonnateur-trice des ventes et du marketing','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(13,'','nameLocaleKey','default.groups.name.proofreader','string'),(13,'en_US','abbrev','PR','string'),(13,'en_US','name','Proofreader','string'),(13,'fr_CA','abbrev','CorEp','string'),(13,'fr_CA','name','Correcteur-trice d\'??preuves','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(14,'','nameLocaleKey','default.groups.name.author','string'),(14,'en_US','abbrev','AU','string'),(14,'en_US','name','Author','string'),(14,'fr_CA','abbrev','AU','string'),(14,'fr_CA','name','Auteur-e','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(15,'','nameLocaleKey','default.groups.name.translator','string'),(15,'en_US','abbrev','Trans','string'),(15,'en_US','name','Translator','string'),(15,'fr_CA','abbrev','Trad','string'),(15,'fr_CA','name','Traducteur-trice','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(16,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(16,'en_US','abbrev','R','string'),(16,'en_US','name','Reviewer','string'),(16,'fr_CA','abbrev','??VAL','string'),(16,'fr_CA','name','??valuateur-trice','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(17,'','nameLocaleKey','default.groups.name.reader','string'),(17,'en_US','abbrev','Read','string'),(17,'en_US','name','Reader','string'),(17,'fr_CA','abbrev','Lect','string'),(17,'fr_CA','name','Lecteur-trice','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(18,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(18,'en_US','abbrev','SubM','string'),(18,'en_US','name','Subscription Manager','string'),(18,'fr_CA','abbrev','RespAB','string'),(18,'fr_CA','name','Responsable des abonnements','string');
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
  `is_default` smallint(6) NOT NULL DEFAULT '0',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `permit_self_registration` smallint(6) NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT '0',
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName','admin'),(1,'en_US','givenName','admin'),(2,'','orcid',''),(2,'en_US','affiliation','Universidad Nacional Aut??noma de M??xico'),(2,'en_US','biography',''),(2,'en_US','familyName','Vaca'),(2,'en_US','givenName','Ramiro'),(2,'en_US','preferredPublicName',''),(2,'en_US','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','preferredPublicName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en_US','affiliation','University of Melbourne'),(3,'en_US','biography',''),(3,'en_US','familyName','Barnes'),(3,'en_US','givenName','Daniel'),(3,'en_US','preferredPublicName',''),(3,'en_US','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en_US','affiliation','University of Chicago'),(4,'en_US','biography',''),(4,'en_US','familyName','Buskins'),(4,'en_US','givenName','David'),(4,'en_US','preferredPublicName',''),(4,'en_US','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en_US','affiliation','University of Toronto'),(5,'en_US','biography',''),(5,'en_US','familyName','Berardo'),(5,'en_US','givenName','Stephanie'),(5,'en_US','preferredPublicName',''),(5,'en_US','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en_US','affiliation','Kyoto University'),(6,'en_US','biography',''),(6,'en_US','familyName','Inoue'),(6,'en_US','givenName','Minoti'),(6,'en_US','preferredPublicName',''),(6,'en_US','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(6,'fr_CA','signature',''),(7,'','orcid',''),(7,'en_US','affiliation','Utrecht University'),(7,'en_US','biography',''),(7,'en_US','familyName','Janssen'),(7,'en_US','givenName','Julie'),(7,'en_US','preferredPublicName',''),(7,'en_US','signature',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(7,'fr_CA','signature',''),(8,'','orcid',''),(8,'en_US','affiliation','McGill University'),(8,'en_US','biography',''),(8,'en_US','familyName','Hudson'),(8,'en_US','givenName','Paul'),(8,'en_US','preferredPublicName',''),(8,'en_US','signature',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(8,'fr_CA','signature',''),(9,'','orcid',''),(9,'en_US','affiliation','University of Manitoba'),(9,'en_US','biography',''),(9,'en_US','familyName','McCrae'),(9,'en_US','givenName','Aisla'),(9,'en_US','preferredPublicName',''),(9,'en_US','signature',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(9,'fr_CA','signature',''),(10,'','orcid',''),(10,'en_US','affiliation','State University of New York'),(10,'en_US','biography',''),(10,'en_US','familyName','Gallego'),(10,'en_US','givenName','Adela'),(10,'en_US','preferredPublicName',''),(10,'en_US','signature',''),(10,'fr_CA','affiliation',''),(10,'fr_CA','biography',''),(10,'fr_CA','familyName',''),(10,'fr_CA','givenName',''),(10,'fr_CA','preferredPublicName',''),(10,'fr_CA','signature',''),(11,'','orcid',''),(11,'en_US','affiliation','Ghent University'),(11,'en_US','biography',''),(11,'en_US','familyName','Fritz'),(11,'en_US','givenName','Maria'),(11,'en_US','preferredPublicName',''),(11,'en_US','signature',''),(11,'fr_CA','affiliation',''),(11,'fr_CA','biography',''),(11,'fr_CA','familyName',''),(11,'fr_CA','givenName',''),(11,'fr_CA','preferredPublicName',''),(11,'fr_CA','signature',''),(12,'','orcid',''),(12,'en_US','affiliation','Universidad de Chile'),(12,'en_US','biography',''),(12,'en_US','familyName','Vogt'),(12,'en_US','givenName','Sarah'),(12,'en_US','preferredPublicName',''),(12,'en_US','signature',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(12,'fr_CA','signature',''),(13,'','orcid',''),(13,'en_US','affiliation','Duke University'),(13,'en_US','biography',''),(13,'en_US','familyName','Cox'),(13,'en_US','givenName','Graham'),(13,'en_US','preferredPublicName',''),(13,'en_US','signature',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(13,'fr_CA','signature',''),(14,'','orcid',''),(14,'en_US','affiliation','University of Cape Town'),(14,'en_US','biography',''),(14,'en_US','familyName','Hellier'),(14,'en_US','givenName','Stephen'),(14,'en_US','preferredPublicName',''),(14,'en_US','signature',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(14,'fr_CA','signature',''),(15,'','orcid',''),(15,'en_US','affiliation','Imperial College London'),(15,'en_US','biography',''),(15,'en_US','familyName','Turner'),(15,'en_US','givenName','Catherine'),(15,'en_US','preferredPublicName',''),(15,'en_US','signature',''),(15,'fr_CA','affiliation',''),(15,'fr_CA','biography',''),(15,'fr_CA','familyName',''),(15,'fr_CA','givenName',''),(15,'fr_CA','preferredPublicName',''),(15,'fr_CA','signature',''),(16,'','orcid',''),(16,'en_US','affiliation','National University of Singapore'),(16,'en_US','biography',''),(16,'en_US','familyName','Kumar'),(16,'en_US','givenName','Sabine'),(16,'en_US','preferredPublicName',''),(16,'en_US','signature',''),(16,'fr_CA','affiliation',''),(16,'fr_CA','biography',''),(16,'fr_CA','familyName',''),(16,'fr_CA','givenName',''),(16,'fr_CA','preferredPublicName',''),(16,'fr_CA','signature',''),(17,'en_US','affiliation','University of Cape Town'),(17,'en_US','familyName','Mwandenga'),(17,'en_US','givenName','Alan'),(18,'en_US','affiliation','University of Bologna'),(18,'en_US','familyName','Corino'),(18,'en_US','givenName','Carlo'),(19,'en_US','affiliation','University of Windsor'),(19,'en_US','familyName','Kwantes'),(19,'en_US','givenName','Catherine'),(20,'en_US','affiliation','University of Alberta'),(20,'en_US','familyName','Montgomerie'),(20,'en_US','givenName','Craig'),(21,'en_US','affiliation','Alexandria University'),(21,'en_US','familyName','Diouf'),(21,'en_US','givenName','Diaga'),(22,'en_US','affiliation','University of Toronto'),(22,'en_US','familyName','Phillips'),(22,'en_US','givenName','Dana'),(23,'en_US','affiliation','University College Cork'),(23,'en_US','familyName','Sokoloff'),(23,'en_US','givenName','Domatilia'),(24,'en_US','affiliation','Indiana University'),(24,'en_US','familyName','Ostrom'),(24,'en_US','givenName','Elinor'),(25,'en_US','affiliation','University of Rome'),(25,'en_US','familyName','Paglieri'),(25,'en_US','givenName','Fabio'),(26,'en_US','affiliation','Aalborg University'),(26,'en_US','familyName','Novak'),(26,'en_US','givenName','John'),(27,'en_US','affiliation','Stanford University'),(27,'en_US','familyName','Al-Khafaji'),(27,'en_US','givenName','Karim'),(28,'en_US','affiliation','Australian National University'),(28,'en_US','familyName','Christopher'),(28,'en_US','givenName','Leo'),(29,'en_US','affiliation','University of Cape Town'),(29,'en_US','familyName','Kumiega'),(29,'en_US','givenName','Lise'),(30,'en_US','affiliation','University of Wolverhampton'),(30,'en_US','familyName','Daniel'),(30,'en_US','givenName','Patricia'),(31,'en_US','affiliation','University of Nairobi'),(31,'en_US','familyName','Baiyewu'),(31,'en_US','givenName','Rana'),(32,'en_US','affiliation','Barcelona University'),(32,'en_US','familyName','Rossi'),(32,'en_US','givenName','Rosanna'),(33,'en_US','affiliation','University of Tehran'),(33,'en_US','familyName','Karbasizaed'),(33,'en_US','givenName','Vajiheh'),(34,'en_US','affiliation','University of Windsor'),(34,'en_US','familyName','Williamson'),(34,'en_US','givenName','Valerie'),(35,'en_US','affiliation','CUNY'),(35,'en_US','familyName','Woods'),(35,'en_US','givenName','Zita');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$QPzCaG2AQJ4nT0l7ImG5duHv8bx7zdeoawZJVSaQa49DEQh8sLEm.','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-07 22:58:49',NULL,'2022-07-07 23:05:37',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$eykcZLf5g4P/T/EG1EXTueAQ2uxKlbWn.EqWNqZLpz.3oFn6yFLoS','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-07-07 23:00:02',NULL,'2022-07-07 23:04:46',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$KxXFbX1mcRChuZhKxmzKzuADbKq8ysM9KcmTo4/bP1O8UxazchL4m','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-07-07 23:00:12',NULL,'2022-07-07 23:28:00',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$varEeCGgIuJgMsDFgMdYqu77ehHiEV/tF7vokPIYJiBQPjQR2JEra','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-07-07 23:00:23',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$8lp6Ko8FHqTJa9tAH2KhP.jDZz0oZeVKoBo.PKLlsH8v/oY1A3j.O','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-07-07 23:00:35',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$0b2zxDOMXZQVOiAgJeEud.MJBhnaWKpIgMQhmydJ2bGwp1LP35vWy','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-07-07 23:00:47',NULL,'2022-07-07 23:10:11',0,0,NULL,0,NULL,1),(7,'jjanssen','$2y$10$lww9Vzg9C77VWtaQ.9QqhO2vbGevA45c6j5ceoFHjL301HPwNoi8W','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2022-07-07 23:01:00',NULL,'2022-07-07 23:21:14',0,0,NULL,0,NULL,1),(8,'phudson','$2y$10$re0qN6ME9Swy0xSZL462b.Zxp1rwSdMdnjG470T3oFT8C2JN5u7GC','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-07-07 23:01:16',NULL,'2022-07-07 23:15:48',0,0,NULL,0,NULL,1),(9,'amccrae','$2y$10$O7j733pA7UVM8sZzMDYE8ennN15yx07ESCxXROJzZFKRwrZtCsslm','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-07-07 23:01:33',NULL,'2022-07-07 23:21:27',0,0,NULL,0,NULL,1),(10,'agallego','$2y$10$zA1aBMA8C8O9vV9u1Io5MuWpyxJzYm4DCuCikiBBSaZRumsTAeypC','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-07-07 23:01:53',NULL,'2022-07-07 23:21:40',0,0,NULL,0,NULL,1),(11,'mfritz','$2y$10$vw/ydaCTNa6mbgLRowXYcOgZ.FlZKdUNBWI4ARcg2HQSgcHiEmrYC','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2022-07-07 23:02:13',NULL,NULL,0,0,NULL,0,NULL,1),(12,'svogt','$2y$10$A9dtK1n/gCR5FkdQHqHwfuFghi0FBzmCZGO7Pn48wM5ek9vfLeuUG','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2022-07-07 23:02:35',NULL,NULL,0,0,NULL,0,NULL,1),(13,'gcox','$2y$10$xZ91vVPybHPzOIHV/zX7DuzHx9ybzUT9c3dpGR.nBlLyPpCxTguam','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-07-07 23:02:56',NULL,NULL,0,0,NULL,0,NULL,1),(14,'shellier','$2y$10$80p/TqrSRrpIcYUTmNv7cO4FRuBZIgg2F5SsPf3um8.oCbZiv.pAK','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2022-07-07 23:03:24',NULL,NULL,0,0,NULL,0,NULL,1),(15,'cturner','$2y$10$Tx811QZLxe.kVeZqdKHg4u7uTJEejIFgQD8th0S1Y5IenMObIq8s2','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2022-07-07 23:03:55',NULL,NULL,0,0,NULL,0,NULL,1),(16,'skumar','$2y$10$Lzirm7IxPyLZJyWYDT8CS.G8025q3m3zgaWKa.PApRg41Ed/2Ighm','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2022-07-07 23:04:29',NULL,NULL,0,0,NULL,0,NULL,1),(17,'amwandenga','$2y$10$8usYicrDpM8VKZCRqEMCBOa1TU/jDpHyY0OCvu4g8xIHcoCsMoINq','amwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-07-07 23:05:53',NULL,'2022-07-07 23:07:59',NULL,NULL,NULL,0,NULL,1),(18,'ccorino','$2y$10$oR.ixZ.xVcpjpR9dSrDeUOSyj5LUr0O9wfzu1KGqzXCjVMyrr57mK','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-07-07 23:09:33',NULL,'2022-07-07 23:09:33',NULL,NULL,NULL,0,NULL,1),(19,'ckwantes','$2y$10$8l9/bGi91zKQgyM0stOgA.XsQK43VAxlQhNH.D2k2LigqtqKg8.i2','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-07-07 23:10:44',NULL,'2022-07-07 23:10:44',NULL,NULL,NULL,0,NULL,1),(20,'cmontgomerie','$2y$10$ELkE2flzM6mKvGvm9pP3VurVvs/XtMk33e.fp33xuL6L/lmCxFG6u','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-07-07 23:11:49',NULL,'2022-07-07 23:11:49',NULL,NULL,NULL,0,NULL,1),(21,'ddiouf','$2y$10$odSWMZnIJnsD.6gOldjbfeFv0X3Iyjr1iIx5P98Mw5ozCvS8oZXXS','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG',NULL,NULL,NULL,'2022-07-07 23:12:11',NULL,'2022-07-07 23:12:11',NULL,NULL,NULL,0,NULL,1),(22,'dphillips','$2y$10$H8oTbJ6IL8i9NhCVV1HqJ.4uSzN8NaaoUqA5peOIeOId8/UZ2pJm6','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-07-07 23:13:35',NULL,'2022-07-07 23:13:35',NULL,NULL,NULL,0,NULL,1),(23,'dsokoloff','$2y$10$m5o5lUmNTd.5nkWgYqtW6.5jjrO7mSN0JYtOmMM2CaODKoofRMNMO','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE',NULL,NULL,NULL,'2022-07-07 23:14:57',NULL,'2022-07-07 23:14:57',NULL,NULL,NULL,0,NULL,1),(24,'eostrom','$2y$10$vBm.jarlWZ03/FDe/3qk7O.trY9nkSCH8BSg.fOecPSn.GLlGkCX6','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-07-07 23:16:05',NULL,'2022-07-07 23:16:05',NULL,NULL,NULL,0,NULL,1),(25,'fpaglieri','$2y$10$I3uHj3RjD72Qg.KQudXrSeZxOC1WBFJG4OqvFa9HJBnmzlKbPvN82','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-07-07 23:16:27',NULL,'2022-07-07 23:16:28',NULL,NULL,NULL,0,NULL,1),(26,'jnovak','$2y$10$yXQt5thd6KtxpAqScl/qSOLIkVQtnpe7AHEjjOLIeJL6kvqA99ZFK','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK',NULL,NULL,NULL,'2022-07-07 23:17:50',NULL,'2022-07-07 23:17:51',NULL,NULL,NULL,0,NULL,1),(27,'kalkhafaji','$2y$10$ZSv8m4I2yuSKobMCapUsG.wXUmZ3N/kUWrXbFvY.Ga5q3TkJgDwl6','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-07-07 23:19:05',NULL,'2022-07-07 23:19:05',NULL,NULL,NULL,0,NULL,1),(28,'lchristopher','$2y$10$0yTOqtmQvi0xpJcSneAnI.NWzJ9TJ4.3Xe2HneyUF2c3NcvDJCMMG','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU',NULL,NULL,NULL,'2022-07-07 23:19:28',NULL,'2022-07-07 23:19:29',NULL,NULL,NULL,0,NULL,1),(29,'lkumiega','$2y$10$/ulVHDXfsg.FBSHjxoiYgOoD9/3aBNqFL684.ijg847BsQIFgDZCa','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-07-07 23:20:20',NULL,'2022-07-07 23:20:20',NULL,NULL,NULL,0,NULL,1),(30,'pdaniel','$2y$10$.lrClv87B9j3GLY7Oua5d.cmEHH7fMhx7v0NKRPwqyUVQpwFaE356','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB',NULL,NULL,NULL,'2022-07-07 23:22:23',NULL,'2022-07-07 23:22:23',NULL,NULL,NULL,0,NULL,1),(31,'rbaiyewu','$2y$10$YKhhqfgKMZTjafQ.FbHS7OCfCAn4svdy4Mrb.iEyoF1bPjLiGVcFa','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE',NULL,NULL,NULL,'2022-07-07 23:22:41',NULL,'2022-07-07 23:22:41',NULL,NULL,NULL,0,NULL,1),(32,'rrossi','$2y$10$hiQxZYrbDH7YeUhpyqlmBe3rADNpy.HZuyqXsf8CNv8pNrkQd0gne','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES',NULL,NULL,NULL,'2022-07-07 23:23:59',NULL,'2022-07-07 23:24:00',NULL,NULL,NULL,0,NULL,1),(33,'vkarbasizaed','$2y$10$1ZyeabopSkU6E1Em3mT6suT8I8Z1AsgO1BV7qcn6AwH0FVDyu5dDy','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR',NULL,NULL,NULL,'2022-07-07 23:24:19',NULL,'2022-07-07 23:24:20',NULL,NULL,NULL,0,NULL,1),(34,'vwilliamson','$2y$10$nHn04KN6By0tePXPQ5Jw3OBJc8FCofFsnad.FHZ85jWf6O/lQpdr6','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-07-07 23:27:13',NULL,'2022-07-07 23:27:13',NULL,NULL,NULL,0,NULL,1),(35,'zwoods','$2y$10$1u3CqoO211B3cOGC85pVsO1YD5TEqg1OrCppjMqPKcuGM/Nj8B8Oa','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-07-07 23:27:48',NULL,'2022-07-07 23:27:48',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-07-07 22:58:50',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.auth','ldap','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,1,0,0,'2022-07-07 22:58:50',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,1,0,'2022-07-07 22:58:50',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.gateways','resolver','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(1,0,1,0,'2022-07-07 22:58:50',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,2,0,0,'2022-07-07 22:58:50',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2022-07-07 22:58:50',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2022-07-07 22:58:50',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,1,0,0,'2022-07-07 22:58:50',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(1,2,0,0,'2022-07-07 22:58:50',1,'plugins.generic','acron','AcronPlugin',1,1),(0,1,0,0,'2022-07-07 22:58:50',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(2,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','datacite','',0,0),(1,0,1,0,'2022-07-07 22:58:50',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(3,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','crossref','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.importexport','pubmed','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.reports','subscriptions','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.reports','views','',0,0),(2,0,0,0,'2022-07-07 22:58:50',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.reports','articles','',0,0),(1,1,0,0,'2022-07-07 22:58:50',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2022-07-07 22:58:50',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2022-07-07 22:58:46',1,'core','ojs2','',0,1),(1,1,0,0,'2022-07-07 22:59:07',1,'plugins.importexport','doaj','',0,0);
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

-- Dump completed on 2022-07-07 23:28:47
