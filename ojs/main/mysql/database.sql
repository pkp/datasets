-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: ojs-ci
-- ------------------------------------------------------
-- Server version	5.7.41-0ubuntu0.18.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about announcements, including localized properties like names and contents.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about announcement types, including localized properties like their names.';
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
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Announcement types allow for announcements to optionally be categorized.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','ZA'),(1,'en','affiliation','University of Cape Town'),(1,'en','familyName','Mwandenga'),(1,'en','givenName','Alan'),(2,'','country','BB'),(2,'en','familyName','Mansour'),(2,'en','givenName','Amina'),(2,'fr_CA','familyName',NULL),(2,'fr_CA','givenName',NULL),(4,'','country','ZA'),(4,'en','affiliation',NULL),(4,'en','biography',NULL),(4,'en','familyName','Riouf'),(4,'en','givenName','Nicolas'),(4,'en','preferredPublicName',NULL),(4,'fr_CA','affiliation',NULL),(4,'fr_CA','biography',NULL),(4,'fr_CA','familyName',NULL),(4,'fr_CA','givenName',NULL),(4,'fr_CA','preferredPublicName',NULL),(5,'','country','ZA'),(5,'en','affiliation','University of Cape Town'),(5,'en','familyName','Mwandenga Version 2'),(5,'en','givenName','Alan'),(6,'','country','BB'),(6,'en','familyName','Mansour'),(6,'en','givenName','Amina'),(7,'','country','ZA'),(7,'en','familyName','Riouf'),(7,'en','givenName','Nicolas'),(8,'','country','IT'),(8,'en','affiliation','University of Bologna'),(8,'en','familyName','Corino'),(8,'en','givenName','Carlo'),(9,'','country','CA'),(9,'en','affiliation','University of Windsor'),(9,'en','familyName','Kwantes'),(9,'en','givenName','Catherine'),(10,'','country','CA'),(10,'en','affiliation','University of Alberta'),(10,'en','familyName','Montgomerie'),(10,'en','givenName','Craig'),(11,'','country','CA'),(11,'en','affiliation','University of Victoria'),(11,'en','familyName','Irvine'),(11,'en','givenName','Mark'),(12,'','country','EG'),(12,'en','affiliation','Alexandria University'),(12,'en','familyName','Diouf'),(12,'en','givenName','Diaga'),(13,'','country','CA'),(13,'en','affiliation','University of Toronto'),(13,'en','familyName','Phillips'),(13,'en','givenName','Dana'),(14,'','country','IE'),(14,'en','affiliation','University College Cork'),(14,'en','familyName','Sokoloff'),(14,'en','givenName','Domatilia'),(15,'','country','US'),(15,'en','affiliation','Indiana University'),(15,'en','familyName','Ostrom'),(15,'en','givenName','Elinor'),(16,'','country','US'),(16,'en','affiliation','Indiana University'),(16,'en','familyName','van Laerhoven'),(16,'en','givenName','Frank'),(17,'','country','IT'),(17,'en','affiliation','University of Rome'),(17,'en','familyName','Paglieri'),(17,'en','givenName','Fabio'),(18,'','country','DK'),(18,'en','affiliation','Aalborg University'),(18,'en','familyName','Novak'),(18,'en','givenName','John'),(19,'','country','US'),(19,'en','affiliation','Stanford University'),(19,'en','familyName','Al-Khafaji'),(19,'en','givenName','Karim'),(20,'','country','US'),(20,'en','affiliation','Stanford University'),(20,'en','familyName','Morse'),(20,'en','givenName','Margaret'),(21,'','country','AU'),(21,'en','affiliation','Australian National University'),(21,'en','familyName','Christopher'),(21,'en','givenName','Leo'),(22,'','country','ZA'),(22,'en','affiliation','University of Cape Town'),(22,'en','familyName','Kumiega'),(22,'en','givenName','Lise'),(23,'','country','GB'),(23,'en','affiliation','University of Wolverhampton'),(23,'en','familyName','Daniel'),(23,'en','givenName','Patricia'),(24,'','country','KE'),(24,'en','affiliation','University of Nairobi'),(24,'en','familyName','Baiyewu'),(24,'en','givenName','Rana'),(25,'','country','ES'),(25,'en','affiliation','Barcelona University'),(25,'en','familyName','Rossi'),(25,'en','givenName','Rosanna'),(26,'','country','IR'),(26,'en','affiliation','University of Tehran'),(26,'en','familyName','Karbasizaed'),(26,'en','givenName','Vajiheh'),(27,'','country','CA'),(27,'en','affiliation','University of Windsor'),(27,'en','familyName','Williamson'),(27,'en','givenName','Valerie'),(28,'','country','US'),(28,'en','affiliation','CUNY'),(28,'en','familyName','Woods'),(28,'en','givenName','Zita');
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
  KEY `authors_publication_id` (`publication_id`),
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'amwandenga@mailinator.com',1,1,0.00,14),(2,'notanemailamansour@mailinator.com',1,1,1.00,14),(4,'nriouf@mailinator.com',1,1,2.00,14),(5,'amwandenga@mailinator.com',1,2,0.00,14),(6,'notanemailamansour@mailinator.com',1,2,1.00,14),(7,'nriouf@mailinator.com',1,2,2.00,14),(8,'ccorino@mailinator.com',1,3,0.00,14),(9,'ckwantes@mailinator.com',1,4,0.00,14),(10,'cmontgomerie@mailinator.com',1,5,0.00,14),(11,'mirvine@mailinator.com',1,5,0.00,14),(12,'ddiouf@mailinator.com',1,6,0.00,14),(13,'dphillips@mailinator.com',1,7,0.00,14),(14,'dsokoloff@mailinator.com',1,8,0.00,14),(15,'eostrom@mailinator.com',1,9,0.00,14),(16,'fvanlaerhoven@mailinator.com',1,9,0.00,14),(17,'fpaglieri@mailinator.com',1,10,0.00,14),(18,'jnovak@mailinator.com',1,11,0.00,14),(19,'kalkhafaji@mailinator.com',1,12,0.00,14),(20,'mmorse@mailinator.com',1,12,0.00,14),(21,'lchristopher@mailinator.com',1,13,0.00,14),(22,'lkumiega@mailinator.com',1,14,0.00,14),(23,'pdaniel@mailinator.com',1,15,0.00,14),(24,'rbaiyewu@mailinator.com',1,16,0.00,14),(25,'rrossi@mailinator.com',1,17,0.00,14),(26,'vkarbasizaed@mailinator.com',1,18,0.00,14),(27,'vwilliamson@mailinator.com',1,19,0.00,14),(28,'zwoods@mailinator.com',1,20,0.00,14);
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
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,'','sortOption','title-ASC'),(1,'en','description',''),(1,'en','title','Applied Science'),(1,'fr_CA','description',''),(1,'fr_CA','title',''),(2,'','sortOption','title-ASC'),(2,'en','description',''),(2,'en','title','Computer Science'),(2,'fr_CA','description',''),(2,'fr_CA','title',''),(3,'','sortOption','title-ASC'),(3,'en','description',''),(3,'en','title','Engineering'),(3,'fr_CA','description',''),(3,'fr_CA','title',''),(4,'','sortOption','title-ASC'),(4,'en','description',''),(4,'en','title','Social Sciences'),(4,'fr_CA','description',''),(4,'fr_CA','title',''),(5,'','sortOption','title-ASC'),(5,'en','description',''),(5,'en','title','Sociology'),(5,'fr_CA','description',''),(5,'fr_CA','title',''),(6,'','sortOption','title-ASC'),(6,'en','description',''),(6,'en','title','Anthropology'),(6,'fr_CA','description',''),(6,'fr_CA','title','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional data about citations, including localized content.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A citation made by an associated publication.';
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
  PRIMARY KEY (`completed_payment_id`),
  KEY `completed_payments_context_id` (`context_id`),
  KEY `completed_payments_user_id` (`user_id`),
  CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `completed_payments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of completed (fulfilled) payments relating to a payment type such as a subscription payment.';
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (15,2,1.00),(16,2,2.00),(27,7,1.00),(28,7,2.00),(31,12,1.00),(32,12,2.00),(33,12,3.00),(34,12,4.00),(35,17,1.00),(36,17,2.00),(37,22,1.00),(38,22,2.00),(39,22,3.00),(40,22,4.00),(41,22,5.00),(42,22,6.00),(43,22,7.00),(44,37,1.00),(45,37,2.00),(46,42,1.00),(47,42,2.00),(48,42,3.00),(49,52,1.00),(50,57,1.00),(51,57,2.00),(52,57,3.00),(53,57,4.00),(54,62,1.00),(55,62,2.00),(56,67,1.00),(57,72,1.00),(58,72,2.00),(59,72,3.00),(60,72,4.00),(61,72,5.00),(62,72,6.00),(63,72,7.00),(64,72,8.00),(65,72,9.00),(66,72,10.00),(67,82,1.00),(68,82,2.00),(69,92,1.00),(70,92,2.00),(71,92,3.00);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (15,'en','submissionKeyword','Professional Development','string'),(16,'en','submissionKeyword','Social Transformation','string'),(27,'en','submissionKeyword','Professional Development','string'),(28,'en','submissionKeyword','Social Transformation','string'),(31,'en','submissionKeyword','pigs','string'),(32,'en','submissionKeyword','food security','string'),(33,'en','submissionKeyword','Professional Development','string'),(34,'en','submissionKeyword','Social Transformation','string'),(35,'en','submissionKeyword','employees','string'),(36,'en','submissionKeyword','survey','string'),(37,'en','submissionKeyword','Integrating Technology','string'),(38,'en','submissionKeyword','Computer Skills','string'),(39,'en','submissionKeyword','Survey','string'),(40,'en','submissionKeyword','Alberta','string'),(41,'en','submissionKeyword','National','string'),(42,'en','submissionKeyword','Provincial','string'),(43,'en','submissionKeyword','Professional Development','string'),(44,'en','submissionKeyword','education','string'),(45,'en','submissionKeyword','citizenship','string'),(46,'en','submissionKeyword','Common pool resource','string'),(47,'en','submissionKeyword','common property','string'),(48,'en','submissionKeyword','intellectual developments','string'),(49,'en','submissionKeyword','water','string'),(50,'en','submissionKeyword','Development','string'),(51,'en','submissionKeyword','engineering education','string'),(52,'en','submissionKeyword','service learning','string'),(53,'en','submissionKeyword','sustainability','string'),(54,'en','submissionKeyword','pigs','string'),(55,'en','submissionKeyword','food security','string'),(56,'en','submissionKeyword','water','string'),(57,'en','submissionKeyword','21st Century','string'),(58,'en','submissionKeyword','Diversity','string'),(59,'en','submissionKeyword','Multilingual','string'),(60,'en','submissionKeyword','Multiethnic','string'),(61,'en','submissionKeyword','Participatory Pedagogy','string'),(62,'en','submissionKeyword','Language','string'),(63,'en','submissionKeyword','Culture','string'),(64,'en','submissionKeyword','Gender','string'),(65,'en','submissionKeyword','Egalitarianism','string'),(66,'en','submissionKeyword','Social Transformation','string'),(67,'en','submissionKeyword','cattle','string'),(68,'en','submissionKeyword','food security','string'),(69,'en','submissionKeyword','Self-Organization','string'),(70,'en','submissionKeyword','Multi-Level Institutions','string'),(71,'en','submissionKeyword','Goverance','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
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
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`),
  KEY `custom_issue_orders_issue_id` (`issue_id`),
  KEY `custom_issue_orders_journal_id` (`journal_id`),
  CONSTRAINT `custom_issue_orders_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  CONSTRAINT `custom_issue_orders_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ordering information for the issue list, when custom issue ordering is specified.';
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
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`),
  KEY `custom_section_orders_issue_id` (`issue_id`),
  KEY `custom_section_orders_section_id` (`section_id`),
  CONSTRAINT `custom_section_orders_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  CONSTRAINT `custom_section_orders_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ordering information for sections within issues, when issue-specific section ordering is specified.';
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
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about data object tombstones, including localized content.';
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about DOIs, including the registration agency.';
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
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all DOIs used in the system.';
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,3,'2023-03-23 11:27:58'),(2,1,1,3,1,3,2,'2023-03-23 11:28:27'),(3,1,NULL,4,NULL,3,7,'2023-03-23 11:28:41'),(4,2,NULL,1,NULL,3,3,'2023-03-23 11:33:36'),(5,2,2,3,1,6,9,'2023-03-23 11:33:58'),(6,3,NULL,1,NULL,3,3,'2023-03-23 11:34:33'),(7,3,3,3,1,3,2,'2023-03-23 11:34:54'),(8,5,NULL,1,NULL,3,3,'2023-03-23 11:35:41'),(9,5,4,3,1,3,2,'2023-03-23 11:36:01'),(10,5,NULL,4,NULL,3,7,'2023-03-23 11:36:14'),(11,6,NULL,1,NULL,3,3,'2023-03-23 11:36:53'),(12,6,5,3,1,3,2,'2023-03-23 11:37:13'),(13,6,NULL,4,NULL,3,7,'2023-03-23 11:37:25'),(14,7,NULL,1,NULL,3,3,'2023-03-23 11:38:00'),(15,9,NULL,1,NULL,3,3,'2023-03-23 11:39:14'),(16,9,7,3,1,3,2,'2023-03-23 11:39:34'),(17,9,NULL,4,NULL,3,7,'2023-03-23 11:39:47'),(18,10,NULL,1,NULL,3,3,'2023-03-23 11:40:27'),(19,12,NULL,1,NULL,3,3,'2023-03-23 11:41:46'),(20,13,NULL,1,NULL,3,3,'2023-03-23 11:42:30'),(21,13,10,3,1,3,4,'2023-03-23 11:43:44'),(22,15,NULL,1,NULL,3,3,'2023-03-23 11:44:30'),(23,15,11,3,1,3,2,'2023-03-23 11:44:51'),(24,15,NULL,4,NULL,3,7,'2023-03-23 11:45:03'),(25,17,NULL,1,NULL,3,3,'2023-03-23 11:45:53'),(26,17,12,3,1,3,2,'2023-03-23 11:46:13'),(27,17,NULL,4,NULL,3,7,'2023-03-23 11:46:26'),(28,18,NULL,1,NULL,3,8,'2023-03-23 11:48:53'),(29,19,NULL,1,NULL,3,3,'2023-03-23 11:49:24'),(30,19,13,3,1,3,2,'2023-03-23 11:49:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-03-23 11:27:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(2,1048585,1,0,'2023-03-23 11:27:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(3,1048585,1,0,'2023-03-23 11:27:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />Alan Mwandenga, Amina Mansour</p><p><b>Abstract</b></p><p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p><p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(4,1048585,1,0,'2023-03-23 11:27:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username amwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(5,1048585,1,0,'2023-03-23 11:27:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Amina Mansour\" <notanemailamansour@mailinator.com>','','','Submission confirmation','<p>Dear Amina Mansour,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Alan Mwandenga, provided the following details:</p><p>Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(6,1048585,1,3,'2023-03-23 11:27:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that an editor has reviewed your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(7,1048585,1,3,'2023-03-23 11:28:27',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Alan Mwandenga,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(8,1048585,1,3,'2023-03-23 11:28:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alan Mwandenga\" <amwandenga@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Alan Mwandenga,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(9,1048585,2,0,'2023-03-23 11:33:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(10,1048585,2,0,'2023-03-23 11:33:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(11,1048585,2,0,'2023-03-23 11:33:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(12,1048585,2,0,'2023-03-23 11:33:25',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, The influence of lactation on the quantity and quality of cashmere production, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(13,1048585,2,3,'2023-03-23 11:33:36',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Your submission has been sent for review','<p>Dear Carlo Corino,</p><p>I am pleased to inform you that an editor has reviewed your submission, The influence of lactation on the quantity and quality of cashmere production, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(14,1048585,3,0,'2023-03-23 11:34:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(15,1048585,3,0,'2023-03-23 11:34:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(16,1048585,3,0,'2023-03-23 11:34:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes</p><p><b>Abstract</b></p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(17,1048585,3,0,'2023-03-23 11:34:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(18,1048585,3,3,'2023-03-23 11:34:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been sent for review','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(19,1048585,3,3,'2023-03-23 11:34:54',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Catherine Kwantes,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(20,1048585,4,0,'2023-03-23 11:35:16',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(21,1048585,4,0,'2023-03-23 11:35:16',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(22,1048585,4,0,'2023-03-23 11:35:16',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(23,1048585,4,0,'2023-03-23 11:35:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(24,1048585,4,0,'2023-03-23 11:35:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission confirmation','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(25,1048585,5,0,'2023-03-23 11:35:29',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(26,1048585,5,0,'2023-03-23 11:35:29',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(27,1048585,5,0,'2023-03-23 11:35:29',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(28,1048585,5,0,'2023-03-23 11:35:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Genetic transformation of forest trees, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(29,1048585,5,3,'2023-03-23 11:35:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been sent for review','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that an editor has reviewed your submission, Genetic transformation of forest trees, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(30,1048585,5,3,'2023-03-23 11:36:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Diaga Diouf,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Genetic transformation of forest trees, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(31,1048585,5,3,'2023-03-23 11:36:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Diaga Diouf,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Genetic transformation of forest trees, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(32,1048585,6,0,'2023-03-23 11:36:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(33,1048585,6,0,'2023-03-23 11:36:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(34,1048585,6,0,'2023-03-23 11:36:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(35,1048585,6,0,'2023-03-23 11:36:41',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(36,1048585,6,3,'2023-03-23 11:36:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that an editor has reviewed your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(37,1048585,6,3,'2023-03-23 11:37:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Dana Phillips,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(38,1048585,6,3,'2023-03-23 11:37:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Dana Phillips,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(39,1048585,7,0,'2023-03-23 11:37:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(40,1048585,7,0,'2023-03-23 11:37:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(41,1048585,7,0,'2023-03-23 11:37:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(42,1048585,7,0,'2023-03-23 11:37:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Developing efficacy beliefs in the classroom, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(43,1048585,7,3,'2023-03-23 11:38:00',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Your submission has been sent for review','<p>Dear Domatilia Sokoloff,</p><p>I am pleased to inform you that an editor has reviewed your submission, Developing efficacy beliefs in the classroom, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(44,1048585,7,8,'2023-03-23 11:38:30',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #7 Sokoloff — Developing efficacy beliefs in the classroom','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">#7 Sokoloff — Developing efficacy beliefs in the classroom</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-20</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.'),(45,1048585,8,0,'2023-03-23 11:38:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world. <p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(46,1048585,8,0,'2023-03-23 11:38:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world. <p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(47,1048585,8,0,'2023-03-23 11:38:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Traditions and Trends in the Study of the Commons</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world. <p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(48,1048585,8,0,'2023-03-23 11:38:49',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Traditions and Trends in the Study of the Commons, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/8\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(49,1048585,8,0,'2023-03-23 11:38:49',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission confirmation','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Elinor Ostrom, provided the following details:</p><p>Traditions and Trends in the Study of the Commons<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(50,1048585,9,0,'2023-03-23 11:39:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(51,1048585,9,0,'2023-03-23 11:39:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Minoti Inoue\" <minoue@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Minoti Inoue,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(52,1048585,9,0,'2023-03-23 11:39:02',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Hansen & Pinto: Reason Reclaimed, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(53,1048585,9,3,'2023-03-23 11:39:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been sent for review','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that an editor has reviewed your submission, Hansen & Pinto: Reason Reclaimed, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(54,1048585,9,3,'2023-03-23 11:39:34',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Fabio Paglieri,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Hansen & Pinto: Reason Reclaimed, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(55,1048585,9,3,'2023-03-23 11:39:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Fabio Paglieri,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Hansen & Pinto: Reason Reclaimed, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(56,1048585,10,0,'2023-03-23 11:40:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(57,1048585,10,0,'2023-03-23 11:40:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(58,1048585,10,0,'2023-03-23 11:40:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(59,1048585,10,0,'2023-03-23 11:40:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear John Novak,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(60,1048585,10,3,'2023-03-23 11:40:27',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Your submission has been sent for review','<p>Dear John Novak,</p><p>I am pleased to inform you that an editor has reviewed your submission, Condensing Water Availability Models to Focus on Specific Water Management Systems, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(61,1048585,10,9,'2023-03-23 11:40:50',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Aisla McCrae accepted review assignment for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Aisla McCrae has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-20</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.'),(62,1048585,10,10,'2023-03-23 11:41:00',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">#10 Novak — Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-20</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.'),(63,1048585,11,0,'2023-03-23 11:41:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(64,1048585,11,0,'2023-03-23 11:41:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(65,1048585,11,0,'2023-03-23 11:41:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(66,1048585,11,0,'2023-03-23 11:41:20',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Learning Sustainable Design through Service, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(67,1048585,11,0,'2023-03-23 11:41:20',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission confirmation','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a submission to Journal of Public Knowledge. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(68,1048585,12,0,'2023-03-23 11:41:33',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(69,1048585,12,0,'2023-03-23 11:41:33',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(70,1048585,12,0,'2023-03-23 11:41:33',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(71,1048585,12,0,'2023-03-23 11:41:33',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(72,1048585,12,3,'2023-03-23 11:41:46',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Your submission has been sent for review','<p>Dear Leo Christopher,</p><p>I am pleased to inform you that an editor has reviewed your submission, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(73,1048585,13,0,'2023-03-23 11:42:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(74,1048585,13,0,'2023-03-23 11:42:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(75,1048585,13,0,'2023-03-23 11:42:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(76,1048585,13,0,'2023-03-23 11:42:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(77,1048585,13,3,'2023-03-23 11:42:30',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been sent for review','<p>Dear Lise Kumiega,</p><p>I am pleased to inform you that an editor has reviewed your submission, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(78,1048585,13,7,'2023-03-23 11:43:00',1073741829,'\"Julie Janssen\" <jjanssen@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Julie Janssen accepted review assignment for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Julie Janssen has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-20</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.'),(79,1048585,13,9,'2023-03-23 11:43:11',1073741829,'\"Aisla McCrae\" <amccrae@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Aisla McCrae accepted review assignment for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Aisla McCrae has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-20</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.'),(80,1048585,13,10,'2023-03-23 11:43:22',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>, \"Stephanie Berardo\" <sberardo@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Kumiega — Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-20</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.'),(81,1048585,13,3,'2023-03-23 11:43:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear Lise Kumiega,</p><p>Your submission Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>. If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p><p>Daniel Barnes</p><hr><p>The following comments were received from reviewers.</p><p><strong>Reviewer 1:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 2:</strong><br>Recommendation: Revisions Required</p><p>Here are my review comments</p><p><strong>Reviewer 3:</strong><br>Recommendation: Resubmit for Review</p><p>Here are my review comments</p>'),(82,1048585,14,0,'2023-03-23 11:44:04',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(83,1048585,14,0,'2023-03-23 11:44:04',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(84,1048585,14,0,'2023-03-23 11:44:04',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(85,1048585,14,0,'2023-03-23 11:44:04',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(86,1048585,15,0,'2023-03-23 11:44:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(87,1048585,15,0,'2023-03-23 11:44:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(88,1048585,15,0,'2023-03-23 11:44:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(89,1048585,15,0,'2023-03-23 11:44:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Yam diseases and its management in Nigeria, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(90,1048585,15,3,'2023-03-23 11:44:30',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been sent for review','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that an editor has reviewed your submission, Yam diseases and its management in Nigeria, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(91,1048585,15,3,'2023-03-23 11:44:51',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Rana Baiyewu,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Yam diseases and its management in Nigeria, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(92,1048585,15,3,'2023-03-23 11:45:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Rana Baiyewu,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Yam diseases and its management in Nigeria, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(93,1048585,16,0,'2023-03-23 11:45:26',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(94,1048585,16,0,'2023-03-23 11:45:26',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(95,1048585,16,0,'2023-03-23 11:45:26',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(96,1048585,16,0,'2023-03-23 11:45:26',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(97,1048585,17,0,'2023-03-23 11:45:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(98,1048585,17,0,'2023-03-23 11:45:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(99,1048585,17,0,'2023-03-23 11:45:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(100,1048585,17,0,'2023-03-23 11:45:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(101,1048585,17,3,'2023-03-23 11:45:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been sent for review','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that an editor has reviewed your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(102,1048585,17,3,'2023-03-23 11:46:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Vajiheh Karbasizaed,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(103,1048585,17,3,'2023-03-23 11:46:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Vajiheh Karbasizaed,</p><p>I am writing from Journal of Public Knowledge to let you know that the editing of your submission, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(104,1048585,18,0,'2023-03-23 11:48:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(105,1048585,18,0,'2023-03-23 11:48:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(106,1048585,18,0,'2023-03-23 11:48:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Stephanie Berardo,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(107,1048585,18,0,'2023-03-23 11:48:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Self-Organization in Multi-Level Institutions in Networked Environments, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/18\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(108,1048585,18,3,'2023-03-23 11:48:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Your submission has been declined','<p>Dear Valerie Williamson,</p><p>I’m sorry to inform you that, after reviewing your submission, Self-Organization in Multi-Level Institutions in Networked Environments, the editor has found that it does not meet our requirements for publication in Journal of Public Knowledge.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(109,1048585,19,0,'2023-03-23 11:49:10',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(110,1048585,19,0,'2023-03-23 11:49:10',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Minoti Inoue\" <minoue@mailinator.com>','','','You have been assigned as an editor on a submission to Journal of Public Knowledge','<p>Dear Minoti Inoue,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>If you find the submission to be relevant for Journal of Public Knowledge, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(111,1048585,19,0,'2023-03-23 11:49:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>Thank you for your submission to Journal of Public Knowledge. We have received your submission, Finocchiaro: Arguments About Arguments, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Thank you for considering Journal of Public Knowledge as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>'),(112,1048585,19,3,'2023-03-23 11:49:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been sent for review','<p>Dear Zita Woods,</p><p>I am pleased to inform you that an editor has reviewed your submission, Finocchiaro: Arguments About Arguments, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(113,1048585,19,3,'2023-03-23 11:49:45',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Your submission has been accepted to Journal of Public Knowledge','<p>Dear Zita Woods,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Finocchiaro: Arguments About Arguments, to meet or exceed our expectations. We are excited to publish your piece in Journal of Public Knowledge and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of Journal of Public Knowledge and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>');
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
INSERT INTO `email_log_users` VALUES (1,3),(2,4),(3,5),(4,17),(6,17),(7,17),(8,17),(9,3),(10,4),(11,5),(12,18),(13,18),(14,3),(15,4),(16,5),(17,19),(18,19),(19,19),(20,3),(21,4),(22,5),(23,20),(25,3),(26,4),(27,5),(28,21),(29,21),(30,21),(31,21),(32,3),(33,4),(34,5),(35,22),(36,22),(37,22),(38,22),(39,3),(40,4),(41,5),(42,23),(43,23),(44,3),(44,4),(44,5),(45,3),(46,4),(47,5),(48,24),(50,3),(51,6),(52,25),(53,25),(54,25),(55,25),(56,3),(57,4),(58,5),(59,26),(60,26),(61,3),(61,4),(61,5),(62,3),(62,4),(62,5),(63,3),(64,4),(65,5),(66,27),(68,3),(69,4),(70,5),(71,28),(72,28),(73,3),(74,4),(75,5),(76,29),(77,29),(78,3),(78,4),(78,5),(79,3),(79,4),(79,5),(80,3),(80,4),(80,5),(81,29),(82,3),(83,4),(84,5),(85,30),(86,3),(87,4),(88,5),(89,31),(90,31),(91,31),(92,31),(93,3),(94,4),(95,5),(96,32),(97,3),(98,4),(99,5),(100,33),(101,33),(102,33),(103,33),(104,3),(105,4),(106,5),(107,34),(108,34),(109,3),(110,6),(111,35),(112,35),(113,35);
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
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'COPYEDIT_REQUEST',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),(2,'CITATION_EDITOR_AUTHOR_QUERY',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),(3,'EDITOR_ASSIGN_SUBMISSION',1,'DISCUSSION_NOTIFICATION_SUBMISSION'),(4,'EDITOR_ASSIGN_REVIEW',1,'DISCUSSION_NOTIFICATION_REVIEW'),(5,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(6,'LAYOUT_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(7,'LAYOUT_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
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
  `locale` varchar(14) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),('ANNOUNCEMENT','fr_CA','','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisiter notre site Web pour consulter <a href=\"{$announcementUrl}\">l\'annonce complète</a>.'),('CITATION_EDITOR_AUTHOR_QUERY','en','Question About Citation','Citation Editing','{$recipientName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$senderName}<br />\nCopy-Editor, {$journalName}<br />\n'),('CITATION_EDITOR_AUTHOR_QUERY','fr_CA','','Modification des références bibliographiques','{$recipientName},<br />\n<br />\nPourriez-vous vérifier ou nous fournir la référence bibliographique complète pour la référence suivante, provenant de votre article « {$submissionTitle} »  :<br />\n<br />\n{$rawCitation}<br />\n<br />\nMerci!<br />\n<br />\n{$senderName}<br />\nRéviseur-e, revue {$journalName}<br />\n'),('COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$journalName}.</p><p>Kind regards,</p>{$signature}'),('COPYEDIT_REQUEST','fr_CA','','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$journalName} : {$journalUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),('DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$journalName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$journalName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$journalName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_REVIEW','fr_CA','','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$journalName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','','Un message à propos de la revue {$journalName}','Prière de saisir votre message.'),('EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$journalName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$journalUrl}\">{$journalName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),('EDITORIAL_REMINDER','fr_CA','','',''),('EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),('EDITOR_ASSIGN','fr_CA','','Vous avez été assigné-e en tant que rédacteur-trice pour la soumission {$journalName}','{$recipientName},<br />\n<br />\nLa soumission intitulée « {$submissionTitle} » pour la revue {$journalName} vous a été attribuée. Vous êtes responsable, en tant que rédacteur-trice de rubrique, de la faire cheminer à travers le processus éditorial.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nMerci.'),('EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Galleys</strong> section. Then schedule the work for publication by clicking the <strong>Schedule for Publication</strong> button.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),('EDITOR_ASSIGN_PRODUCTION','fr_CA','','Vous avez été assigné-e en tant que rédacteur-trice pour la soumission {$journalName}',''),('EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the peer review process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),('EDITOR_ASSIGN_REVIEW','fr_CA','','Vous avez été assigné-e en tant que rédacteur-trice pour la soumission {$journalName}',''),('EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$journalName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),('EDITOR_ASSIGN_SUBMISSION','fr_CA','','Vous avez été assigné-e en tant que rédacteur-trice pour la soumission {$journalName}','{$recipientName},<br />\n<br />\nLa soumission intitulée « {$submissionTitle} » pour la revue {$journalName} vous a été attribuée. Vous êtes responsable, en tant que rédacteur-trice de rubrique, de la faire cheminer à travers le processus éditorial.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nMerci.'),('EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$journalName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_ACCEPT','fr_CA','','Votre soumission a été acceptée dans la revue {$journalName}','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est d\'accepter votre soumission.'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','','',''),('EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','','',''),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','','',''),('EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$journalName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_DECLINE','fr_CA','','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$journalName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$journalName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_NEW_ROUND','fr_CA','','',''),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$journalName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),('EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','','',''),('EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_RESUBMIT','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),('EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',''),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),('EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_REVISIONS','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$journalName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$journalName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p>\nYour submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_SKIP_REVIEW','fr_CA','','Votre soumission a été envoyée à la révision linguistique',''),('EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),('EDITOR_RECOMMENDATION','fr_CA','','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$journalName} est de : {$recommendation}'),('ISSUE_PUBLISH_NOTIFY','en','Issue Published Notify','Just published: {$issueIdentification} of {$journalName}','<p>Dear {$recipientName},</p><p>We are pleased to announce the publication of <a href=\"{$issueUrl}\">{$issueIdentification}</a> of {$journalName}.  We invite you to read and share this work with your scholarly community.</p><p>Many thanks to our authors, reviewers, and editors for their valuable contributions, and to our readers for your continued interest.</p><p>Thank you,</p>{$signature}'),('ISSUE_PUBLISH_NOTIFY','fr_CA','','Parution du dernier numéro','<p>Lecteurs.trices,</p><p>La revue {$journalName} a le plaisir de vous annoncer la publication de son dernier numéro : {$issueIdentification}. Nous vous invitons à consulter le sommaire, puis à visiter notre site Web pour y lire les articles qui vous intéressent. Nous remercions vivement nos auteur.e.s, réviseur.e.s et rédacteur.trice.s pour leurs précieuses contributions à cet ouvrage, ainsi que nos lecteur.trice.s pour leur intérêt constant.</p><p>Cordialement,</p>{$signature}'),('LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$signature}</p>'),('LAYOUT_COMPLETE','fr_CA','','Mise en page des épreuves terminée','{$recipientName},<br />\n<br />\nLes épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} sont maintenant prêtes pour la relecture.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec moi.<br />\n<br />\n{$senderName}'),('LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the journal\'s standards.</li><li>Upload the galleys to the Publication section of the submission.</li><li>Use the  Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}'),('LAYOUT_REQUEST','fr_CA','','Demande de mise en page des épreuves','{$recipientName},<br />\n<br />\nJ\'aimerais que vous prépariez les épreuves du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Se connecter au site Web de la revue et utiliser les fichiers disponibles sous Fichiers prêts pour la production pour créer les épreuves en fonction des normes de la revue.<br />\n3. Téléverser les épreuves dans la section Épreuves.<br />\n4. Informer le,la rédacteur-trice, via une discussion sur la production, que les épreuves ont été téléversées et qu\'elles sont prêtes.<br />\n<br />\nURL de la revue {$journalName} : {$journalUrl}<br />\nURL du manuscrit : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas effectuer ce travail pour le moment ou si vous avez des questions, veuillez communiquer avec moi. Je vous remercie de votre collaboration.'),('MANUAL_PAYMENT_NOTIFICATION','en','Manual Payment Notify','Manual Payment Notification','A manual payment needs to be processed for the journal {$journalName} and the user {senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.'),('MANUAL_PAYMENT_NOTIFICATION','fr_CA','','Avis de paiement manuel','Un paiement manuel doit être traité pour la revue {$journalName} et l\'utilisateur {$senderName} (nom d\'utilisateur &quot;{$senderUsername}&quot;).<br />\n<br />\nL\'élément facturé est &quot;{$paymentName}&quot;.<br />\nLe coût est de {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.'),('OPEN_ACCESS_NOTIFY','en','Open Access Notify','Free to read: {$issueIdentification} of {$journalName} is now open access','<p>Dear {$recipientName},</p><p>We are pleased to inform you that <a href=\"{$issueUrl}\">{$issueIdentification}</a> of {$journalName} is now available under open access.  A subscription is no longer required to read this issue.</p><p>Thank you for your continuing interest in our work.</p>{$journalSignature}'),('OPEN_ACCESS_NOTIFY','fr_CA','','Le numéro est maintenant en libre accès','Chers lecteurs et lectrices,<br />\n<br />\nLa revue {$journalName} vient de rendre disponible en libre accès le numéro suivant. Nous vous invitons à lire ici le sommaire puis visiter notre site Web ({$journalUrl}) pour lire les articles et autres textes qui pourraient vous intéresser.<br />\n<br />\nMerci de votre intérêt continu pour notre travail.<br />\n{$journalSignature}'),('ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$journalName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$journalName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$journalName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$journalName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$journalName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$journalName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$journalName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),('PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),('PAYMENT_REQUEST_NOTIFICATION','en','Payment Request','Payment Request Notification','<p>Dear {$recipientName},</p><p>Congratulations on the acceptance of your submission, {$submissionTitle}, to {$journalName}. Now that your submission has been accepted, we would like to request payment of the publication fee.</p><p>This fee covers the production costs of bringing your submission to publication. To make the payment, please visit <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>If you have any questions, please see our <a href=\"{$submissionGuidelinesUrl}\">Submission Guidelines</a></p>'),('PAYMENT_REQUEST_NOTIFICATION','fr_CA','','',''),('REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$journalName}','<p>Dear {$recipientName},</p><p>In light of your expertise, we have registered your name in the reviewer database for {$journalName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.</p><p>We are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.</p><p>Username: {$recipientUsername}<br />Password: {$password}</p><p>Thank you,</p>{$signature}'),('REVIEWER_REGISTER','fr_CA','','Inscription en tant qu\'évaluateur-trice pour la revue {$journalName}','Compte tenu de votre expertise, nous avons pris l\'initiative d\'inscrire votre nom dans la base de données des évaluateurs-trices de la revue {$journalName}. Cela ne vous engage d\'aucune façon, mais nous permet simplement de solliciter vos services pour l\'évaluation d\'une soumission. Si vous êtes invité-e à effectuer une évaluation, vous recevrez le titre et le résumé de l\'article en question, et serez toujours libre d\'accepter ou de refuser une telle invitation. À tout moment, il vous est également possible de demander à ce que votre nom soit retiré de la liste des évaluateurs-trices.<br />\n<br />\nNous vous acheminons un nom d\'utilisateur-trice et un mot de passe, car tous deux sont requis pour tout échange avec la revue via son site Web. Vous pouvez, par exemple, si vous le souhaitez, effectuer la mise à jour de votre profil, y compris vos domaines d\'intérêt en matière d\'évaluation.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('REVIEW_ACK','fr_CA','','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),('REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','<p>Dear {$recipientName},</p><p>Recently, we asked you to review a submission to {$journalName}. We have decided to cancel the request for you to reivew the submission, {$submissionTitle}.</p><p>We apologize any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.</p><p>If you have any questions, please contact me.</p>{$signature}'),('REVIEW_CANCEL','fr_CA','','Annulation de la demande d\'évaluation','{$recipientName},<br />\n<br />\nNous avons décidé d\'annuler notre demande concernant l\'évaluation du manuscrit intitulé « {$submissionTitle} » pour la revue {$journalName}. Nous sommes désolés des inconvénients que cela pourrait vous causer et espérons que nous pourrons de nouveau faire appel à vous pour contribuer au processus de révision par les pairs de cette revue dans le futur.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.'),('REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),('REVIEW_COMPLETE','fr_CA','','',''),('REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.'),('REVIEW_CONFIRM','fr_CA','','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','en','Review Decline','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','fr_CA','','Refus d\'évaluation','Rédacteurs-trices,<br />\n<br />\nPour le moment, il m\'est impossible d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$journalName}. Je vous remercie d\'avoir pensé à moi. N\'hésitez pas à communiquer avec moi pour un autre projet.<br />\n<br />\n{$senderName}'),('REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$journalName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$journalName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),('REVIEW_EDIT','fr_CA','','',''),('REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$journalName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$journalName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REINSTATE','fr_CA','','Êtes-vous encore en mesure d\'évaluer des travaux pour la revue {$journalName} ?','<p>{$recipientName},</p><p>Nous avons récemment annulé notre demande vous demandant d\'évaluer la soumission, {$submissionTitle}, pour la revue {$journalName}. Nous sommes revenus sur cette décision et nous espérons que vous êtes toujours en mesure d\'effectuer l\'évaluation.</p><p>Si vous êtes en mesure d\'aider au processus d\'évaluation de cette revue, vous pouvez vous connecter au site de la revue pour voir la soumission, téléverser les fichiers d\'évaluation ainsi que soumettre votre évaluation.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec moi,</p><p>Cordialement,</p>{$signature}'),('REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$journalName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),('REVIEW_REMIND','fr_CA','','Rappel d\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$journalName}. Nous espérions recevoir votre évaluation avant le {$reviewDueDate}. Nous serions heureux de la recevoir dès que possible.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$lostPasswordUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$signature}'),('REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$journalSignature}'),('REVIEW_REMIND_AUTO','fr_CA','','Rappel automatique d\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de la soumission « {$submissionTitle} » pour la revue {$journalName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, votre évaluation avant le {$reviewDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai. Nous serions toutefois heureux de recevoir votre évaluation dès que possible.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$lostPasswordUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nVeuillez confirmer que vous êtes en mesure d\'effectuer ce travail essentiel pour la publication de notre revue. Nous espérons avoir de vos nouvelles très bientôt.<br />\n<br />\n{$journalSignature}'),('REVIEW_REQUEST','en','Review Request','Invitation to review','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$journalName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REQUEST','fr_CA','','Demande d\'évaluation d\'un article','{$recipientName},<br />\n<br />\nNous croyons que vous feriez un-e excellent-e évaluateur-trice pour le manuscrit intitulé « {$submissionTitle} » qui a été soumis à la revue {$journalName}. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous accepterez ce travail essentiel à la publication de la revue.<br />\n<br />\nVeuillez accéder au site Web de la revue avant le {$responseDueDate} pour nous laisser savoir si vous acceptez de faire l\'évaluation ou non. Vous pouvez également y consulter la soumission et y enregistrer votre évaluation et votre recommandation. Le site Web se trouve à l\'adresse suivante : {$journalUrl}<br />\n<br />\nLa date d\'échéance de l\'évaluation a été fixée au {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas de nom d\'utilisateur-trice et de mot de passe pour le site Web de la revue, cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$signature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}'),('REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REQUEST_SUBSEQUENT','fr_CA','','Demande d\'évaluation d\'un article','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir effectué l\'évaluation du manuscrit intitulé <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Suivant les commentaire de l\'évaluation de la dernière version du manuscrit, l\'auteur-e a soumis une version révisée de son document. Nous apprécierions que vous évaluiez cette nouvelle version dans le cadre d\'un second cycle d\'évaluation.</p>\n<p>Si vous êtes en mesure d\'effectuer cette évaluation, veuillez vous authentifier sur la page de la revue avant le {$responseDueDate} pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$journalUrl}<br />\n<br />\nL\'évaluation est due pour le {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$passwordLostUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$signature}<br />\n<br />\n« {$submissionTitle} » <br />\n<br />\n{$submissionAbstract}'),('REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$journalName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$journalName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),('REVIEW_RESEND_REQUEST','fr_CA','','',''),('REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Will you be able to review this for us?','<p>Dear {$recipientName},</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>You are receiving this email because we have not yet received a confirmation from you indicating whether or not you are able to undertake the review of this submission.</p><p>Please let us know whether or not you are able to undertake this review by using our submission management software to accept or decline this request.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>{$submissionTitle}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$journalSignature}'),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','Seriez-vous en mesure d\'évaluer ce manuscrit pour nous ?','{$recipientName},<br />\nCeci est un petit rappel concernant notre demande d\'évaluation de « {$submissionTitle} » pour la revue {$journalName}. Puisque nous n\'avons pas reçu, comme nous l\'espérions, une réponse avant le {$responseDueDate}, ce courriel a été généré et envoyé automatiquement après l\'échéance du délai.\n<br />\nNous pensons que vous seriez un-e excellent-e évaluateur-trice pour le manuscrit. Vous trouverez un résumé de la soumission ci-dessous. Nous espérons que vous envisagerez d\'entreprendre cette tâche essentielle à la publication de la revue.<br />\n<br />\nVeuillez vous authentifier sur la page de la revue pour y indiquer si vous participerez à cette évaluation ou non, ou encore pour accéder à la soumission et y enregistrer votre évaluation et vos recommandations. Le site Web est {$journalUrl}<br />\n<br />\nL\'évaluation est dû pour le {$reviewDueDate}.<br />\n<br />\nSi vous n\'avez pas vos nom d\'utilisateur-trice et mot de passe pour le site de la revue, vous pouvez utiliser le lien suivant pour réinitialiser votre mot de passe (lequel vous sera envoyé par courriel avec votre nom d\'utilisateur-trice). {$lostPasswordUrl}<br />\n<br />\nURL de la soumission : {$reviewAssignmentUrl}<br />\n<br />\nNous vous remercions de l\'attention que vous porterez à notre demande.<br />\n<br />\n{$journalSignature}<br />\n<br />\n« {$submissionTitle} »<br />\n<br />\n{$submissionAbstract}'),('REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.'),('REVISED_VERSION_NOTIFY','fr_CA','','Version révisée téléversée','Rédacteurs-trices,<br />\n<br />\nUne version révisée de « {$submissionTitle} » a été téléversée par l\'auteur-e {$submitterName}.<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\n<br />\n{$signature}'),('STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$journalSignature}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','Activité éditoriale pour {$month} {$year}','\n{$recipientName}, <br />\n<br />\nLe rapport d\'activité éditoriale de votre revue pour {$month} {$year} est maintenant disponible. Les principales statistiques pour ce mois sont affichées ci-dessous.<br />\n<ul>\n	<li> Nouvelles soumissions pour ce mois : {$newSubmissions} </li>\n	<li> Soumissions refusées pour ce mois : {$declinedSubmissions} </li>\n	<li> Soumissions acceptées pour ce mois : {$acceptedSubmissions} </li>\n	<li> Nombre total de soumissions dans la plateforme : {$totalSubmissions} </li>\n</ul>\nConnectez-vous au site de la revue pour voir davantage de <a href=\"{$editorialStatsLink}\">tendances dans l\'activité éditoriale</a> ainsi que des <a href=\"{$publicationStatsLink}\">statistiques relatives aux articles publiés</a>. Le rapport complet des tendances de l\'activité éditoriale de ce mois-ci est joint au présent envoi.<br />\n<br />\nCordialement,<br />\n{$journalSignature}'),('SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$journalName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$journalName} as a venue for your work.</p>{$journalSignature}'),('SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$journalName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$journalSignature}'),('SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$journalName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$journalName} as a venue for your work.</p><p>Kind regards,</p>{$journalSignature}'),('SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$journalName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$journalName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$journalSignature}'),('SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),('SUBMISSION_NEEDS_EDITOR','fr_CA','','',''),('SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$journalName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),('SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),('SUBSCRIPTION_AFTER_EXPIRY','en','Subscription Expired','Subscription Expired','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_AFTER_EXPIRY','fr_CA','','Abonnement expiré','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} est expiré.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveler votre abonnement, veuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session en utilisant votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en','Subscription Expired Last','Subscription Expired - Final Reminder','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','fr_CA','','Abonnement expiré - Dernier rappel','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} est expiré. Veuillez prendre note que ceci est le dernier rappel qui vous sera envoyé.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nPour renouveller votre abonnement, aveuillez vous rendre sur le site Web de la revue. Vous pouvez y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, ne hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_BEFORE_EXPIRY','en','Subscription Expires Soon','Notice of Subscription Expiry','{$recipientName}:<br />\n<br />\nYour {$journalName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_BEFORE_EXPIRY','fr_CA','','Avis d\'expiration de l\'abonnement','{$recipientName},<br />\n<br />\nVotre abonnement à la revue {$journalName} expirera bientôt.<br />\n<br />\n{$subscriptionType}<br />\nDate d\'expiration : {$expiryDate}<br />\n<br />\nAfin d\'assurer la continuité de votre accès à cette revue, nous vous invitons à aller sur le site Web de la revue et à renouveler votre abonnement. Vous pouvez vous y ouvrir une session avec votre nom d\'utilisateur-trice, soit « {$recipientUsername} ».<br />\n<br />\nSi vous avez des questions, ne pas hésiter à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_NOTIFY','en','Subscription Notify','Subscription Notification','{$recipientName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$journalName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_NOTIFY','fr_CA','','Avis d\'abonnement','{$recipientName},<br />\n<br />\nVous êtes maintenant abonné-e à notre système de gestion de revue en ligne pour la revue {$journalName}, avec le type d\'abonnement suivant  :<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPour accéder au contenu destiné seulement aux abonnés, connectez-vous au système à l\'aide de votre nom d\'utilisateur-trice : {$recipientUsername}.<br />\n<br />\nUne fois connecté-e dans le système, vous pouvez, en tout temps, modifier les renseignements de votre profil et votre mot de passe.<br />\n<br />\nVeuillez prendre note que si vous disposez d\'un abonnement institutionnel, les utilisateurs-trices n\'ont pas à entrer de nom d\'utilisateur-trice puisque le système authentifiera automatiquement les demandes.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous.<br />\n<br />\n{$subscriptionSignature}'),('SUBSCRIPTION_PURCHASE_INDL','en','Purchase Individual Subscription','Subscription Purchase: Individual','An individual subscription has been purchased online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),('SUBSCRIPTION_PURCHASE_INDL','fr_CA','','Souscription à un abonnement individuel','Une souscription en ligne à un abonnement individuel pour la revue {$journalName} avec les renseignements suivants :<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nInformation d\'adhésion (si fournie) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivante.<br />\n<br />\nURL d\'abonnement : {$subscriptionUrl}<br/>\n'),('SUBSCRIPTION_PURCHASE_INSTL','en','Purchase Institutional Subscription','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$journalName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),('SUBSCRIPTION_PURCHASE_INSTL','fr_CA','','Souscription à un abonnement institutionnel','Souscription en ligne à un abonnement institutionnel pour la revue {$journalName} avec les renseignements suivants. Pour activer cet abonnement, veuillez utiliser l\'URL d\'abonnement fourni et fixer le statut de l\'abonnement à « actif ».<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant :<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),('SUBSCRIPTION_RENEW_INDL','en','Renew Individual Subscription','Subscription Renewal: Individual','An individual subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),('SUBSCRIPTION_RENEW_INDL','fr_CA','','Renouvellement d\'abonnement individuel','Un abonnement individuel a été renouvelé en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nUtilisateur-trice :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),('SUBSCRIPTION_RENEW_INSTL','en','Renew Institutional Subscription','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),('SUBSCRIPTION_RENEW_INSTL','fr_CA','','Renouvellement d\'abonnement institutionnel','Un abonnement institutionnel a été renouvelé en ligne pour la revue {$journalName} avec les renseignements suivants.<br />\n<br />\nType d\'abonnement :<br />\n{$subscriptionType}<br />\n<br />\nÉtablissement :<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomaine (si fourni) :<br />\n{$domain}<br />\n<br />\nPlage d\'adresses IP (si fournie) :<br />\n{$ipRanges}<br />\n<br />\nPersonne-ressource :<br />\n{$subscriberDetails}<br />\n<br />\nRenseignements d\'adhésion (si fournis) :<br />\n{$membership}<br />\n<br />\nPour afficher ou modifier cet abonnement, veuillez utiliser l\'URL suivant.<br />\n<br />\nURL de l\'abonnement : {$subscriptionUrl}<br />\n'),('USER_REGISTER','en','User Created','Journal Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$journalName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_REGISTER','fr_CA','','Inscription à la revue','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour la revue {$journalName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec la revue via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices de la revue en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','en','Validate Email (Journal Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$journalName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$journalSignature}'),('USER_VALIDATE_CONTEXT','fr_CA','Validez l\'adresse courriel (enregistrement de la revue)','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte pour la revue {$journalName}. Pour pouvoir commencer à l\'utiliser il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$journalSignature}'),('USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),('USER_VALIDATE_SITE','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte dans {$siteTitle}. Avant de pouvoir commencer à l\'utiliser, il nous faut d\'abord valider votre adresse de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$siteSignature}'),('VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),('VERSION_CREATED','fr_CA','','','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
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
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,17,'2023-03-23 11:26:42',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,17,'2023-03-23 11:26:43',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,17,'2023-03-23 11:26:56',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,17,'2023-03-23 11:26:56',1342177288,'submission.event.fileRevised',0),(5,1048585,1,17,'2023-03-23 11:26:57',268435458,'submission.event.general.metadataUpdated',0),(6,515,1,17,'2023-03-23 11:26:57',1342177296,'submission.event.fileEdited',0),(7,1048585,1,17,'2023-03-23 11:26:57',1342177296,'submission.event.fileEdited',0),(8,515,2,17,'2023-03-23 11:26:58',1342177281,'submission.event.fileUploaded',0),(9,1048585,1,17,'2023-03-23 11:26:58',1342177288,'submission.event.fileRevised',0),(10,515,2,17,'2023-03-23 11:26:59',1342177296,'submission.event.fileEdited',0),(11,1048585,1,17,'2023-03-23 11:26:59',1342177296,'submission.event.fileEdited',0),(12,515,3,17,'2023-03-23 11:26:59',1342177281,'submission.event.fileUploaded',0),(13,1048585,1,17,'2023-03-23 11:26:59',1342177288,'submission.event.fileRevised',0),(14,515,3,17,'2023-03-23 11:27:00',1342177296,'submission.event.fileEdited',0),(15,1048585,1,17,'2023-03-23 11:27:00',1342177296,'submission.event.fileEdited',0),(16,515,4,17,'2023-03-23 11:27:00',1342177281,'submission.event.fileUploaded',0),(17,1048585,1,17,'2023-03-23 11:27:00',1342177288,'submission.event.fileRevised',0),(18,515,4,17,'2023-03-23 11:27:01',1342177296,'submission.event.fileEdited',0),(19,1048585,1,17,'2023-03-23 11:27:01',1342177296,'submission.event.fileEdited',0),(20,515,5,17,'2023-03-23 11:27:02',1342177281,'submission.event.fileUploaded',0),(21,1048585,1,17,'2023-03-23 11:27:02',1342177288,'submission.event.fileRevised',0),(22,515,5,17,'2023-03-23 11:27:03',1342177296,'submission.event.fileEdited',0),(23,1048585,1,17,'2023-03-23 11:27:03',1342177296,'submission.event.fileEdited',0),(24,515,6,17,'2023-03-23 11:27:03',1342177281,'submission.event.fileUploaded',0),(25,1048585,1,17,'2023-03-23 11:27:03',1342177288,'submission.event.fileRevised',0),(26,515,6,17,'2023-03-23 11:27:04',1342177296,'submission.event.fileEdited',0),(27,1048585,1,17,'2023-03-23 11:27:04',1342177296,'submission.event.fileEdited',0),(28,515,6,17,'2023-03-23 11:27:05',1342177282,'submission.event.fileDeleted',0),(29,1048585,1,17,'2023-03-23 11:27:39',268435457,'submission.event.submissionSubmitted',0),(30,1048585,1,3,'2023-03-23 11:27:58',805306371,'editor.submission.decision.sendExternalReview.log',0),(31,515,7,3,'2023-03-23 11:27:59',1342177281,'submission.event.fileUploaded',0),(32,1048585,1,3,'2023-03-23 11:27:59',1342177288,'submission.event.fileRevised',0),(33,515,8,3,'2023-03-23 11:27:59',1342177281,'submission.event.fileUploaded',0),(34,1048585,1,3,'2023-03-23 11:27:59',1342177288,'submission.event.fileRevised',0),(35,515,9,3,'2023-03-23 11:27:59',1342177281,'submission.event.fileUploaded',0),(36,1048585,1,3,'2023-03-23 11:27:59',1342177288,'submission.event.fileRevised',0),(37,515,10,3,'2023-03-23 11:27:59',1342177281,'submission.event.fileUploaded',0),(38,1048585,1,3,'2023-03-23 11:27:59',1342177288,'submission.event.fileRevised',0),(39,515,11,3,'2023-03-23 11:27:59',1342177281,'submission.event.fileUploaded',0),(40,1048585,1,3,'2023-03-23 11:27:59',1342177288,'submission.event.fileRevised',0),(41,1048585,1,3,'2023-03-23 11:28:08',1073741825,'log.review.reviewerAssigned',0),(42,1048585,1,3,'2023-03-23 11:28:15',1073741825,'log.review.reviewerAssigned',0),(43,1048585,1,3,'2023-03-23 11:28:22',1073741825,'log.review.reviewerAssigned',0),(44,1048585,1,3,'2023-03-23 11:28:27',805306371,'editor.submission.decision.accept.log',0),(45,1048585,1,3,'2023-03-23 11:28:35',268435459,'submission.event.participantAdded',0),(46,1048585,1,3,'2023-03-23 11:28:41',805306371,'editor.submission.decision.sendToProduction.log',0),(47,1048585,1,3,'2023-03-23 11:28:49',268435459,'submission.event.participantAdded',0),(48,1048585,1,3,'2023-03-23 11:28:54',268435459,'submission.event.participantAdded',0),(49,1048585,1,3,'2023-03-23 11:30:57',268435458,'submission.event.general.metadataUpdated',0),(50,1048585,1,3,'2023-03-23 11:30:59',268435458,'submission.event.general.metadataUpdated',0),(51,1048585,1,3,'2023-03-23 11:31:00',268435458,'submission.event.general.metadataUpdated',0),(52,1048585,1,3,'2023-03-23 11:31:04',268435458,'submission.event.general.metadataUpdated',0),(53,515,12,3,'2023-03-23 11:31:13',1342177281,'submission.event.fileUploaded',0),(54,1048585,1,3,'2023-03-23 11:31:13',1342177288,'submission.event.fileRevised',0),(55,515,12,3,'2023-03-23 11:31:14',1342177296,'submission.event.fileEdited',0),(56,1048585,1,3,'2023-03-23 11:31:14',1342177296,'submission.event.fileEdited',0),(57,1048585,1,3,'2023-03-23 11:31:29',268435459,'submission.event.participantAdded',0),(58,1048585,1,17,'2023-03-23 11:31:36',268435458,'submission.event.general.metadataUpdated',0),(59,1048585,1,3,'2023-03-23 11:31:43',268435458,'submission.event.general.metadataUpdated',0),(60,1048585,1,3,'2023-03-23 11:31:44',268435462,'publication.event.published',0),(61,1048585,1,3,'2023-03-23 11:31:56',268435463,'publication.event.unpublished',0),(62,1048585,1,3,'2023-03-23 11:32:02',268435462,'publication.event.published',0),(63,1048585,1,3,'2023-03-23 11:32:09',268435458,'submission.event.general.metadataUpdated',0),(64,1048585,1,3,'2023-03-23 11:32:09',268435464,'publication.event.versionCreated',0),(65,1048585,1,3,'2023-03-23 11:32:20',268435458,'submission.event.general.metadataUpdated',0),(66,1048585,1,3,'2023-03-23 11:32:30',268435458,'submission.event.general.metadataUpdated',0),(67,1048585,1,3,'2023-03-23 11:32:32',268435462,'publication.event.versionPublished',0),(68,1048585,1,3,'2023-03-23 11:32:45',268435463,'publication.event.versionUnpublished',0),(69,1048585,1,3,'2023-03-23 11:32:54',268435459,'submission.event.participantAdded',0),(70,1048585,1,3,'2023-03-23 11:33:06',268435459,'submission.event.participantAdded',0),(71,1048585,2,18,'2023-03-23 11:33:20',268435458,'submission.event.general.metadataUpdated',0),(72,1048585,2,18,'2023-03-23 11:33:21',268435458,'submission.event.general.metadataUpdated',0),(73,515,13,18,'2023-03-23 11:33:24',1342177281,'submission.event.fileUploaded',0),(74,1048585,2,18,'2023-03-23 11:33:24',1342177288,'submission.event.fileRevised',0),(75,515,13,18,'2023-03-23 11:33:24',1342177296,'submission.event.fileEdited',0),(76,1048585,2,18,'2023-03-23 11:33:24',1342177296,'submission.event.fileEdited',0),(77,1048585,2,18,'2023-03-23 11:33:25',268435457,'submission.event.submissionSubmitted',0),(78,1048585,2,3,'2023-03-23 11:33:36',805306371,'editor.submission.decision.sendExternalReview.log',0),(79,515,14,3,'2023-03-23 11:33:36',1342177281,'submission.event.fileUploaded',0),(80,1048585,2,3,'2023-03-23 11:33:36',1342177288,'submission.event.fileRevised',0),(81,1048585,2,3,'2023-03-23 11:33:43',268435459,'submission.event.participantAdded',0),(82,1048585,2,3,'2023-03-23 11:33:46',268435458,'submission.event.general.metadataUpdated',0),(83,1048585,2,6,'2023-03-23 11:33:58',805306372,'editor.submission.recommend.accept.log',0),(84,1048585,3,19,'2023-03-23 11:34:17',268435458,'submission.event.general.metadataUpdated',0),(85,1048585,3,19,'2023-03-23 11:34:18',268435458,'submission.event.general.metadataUpdated',0),(86,515,15,19,'2023-03-23 11:34:21',1342177281,'submission.event.fileUploaded',0),(87,1048585,3,19,'2023-03-23 11:34:21',1342177288,'submission.event.fileRevised',0),(88,515,15,19,'2023-03-23 11:34:21',1342177296,'submission.event.fileEdited',0),(89,1048585,3,19,'2023-03-23 11:34:21',1342177296,'submission.event.fileEdited',0),(90,1048585,3,19,'2023-03-23 11:34:22',268435457,'submission.event.submissionSubmitted',0),(91,1048585,3,3,'2023-03-23 11:34:33',805306371,'editor.submission.decision.sendExternalReview.log',0),(92,515,16,3,'2023-03-23 11:34:33',1342177281,'submission.event.fileUploaded',0),(93,1048585,3,3,'2023-03-23 11:34:33',1342177288,'submission.event.fileRevised',0),(94,1048585,3,3,'2023-03-23 11:34:42',1073741825,'log.review.reviewerAssigned',0),(95,1048585,3,3,'2023-03-23 11:34:49',1073741825,'log.review.reviewerAssigned',0),(96,1048585,3,3,'2023-03-23 11:34:54',805306371,'editor.submission.decision.accept.log',0),(97,1048585,3,3,'2023-03-23 11:35:01',268435459,'submission.event.participantAdded',0),(98,1048585,4,20,'2023-03-23 11:35:11',268435458,'submission.event.general.metadataUpdated',0),(99,1048585,4,20,'2023-03-23 11:35:11',268435458,'submission.event.general.metadataUpdated',0),(100,515,17,20,'2023-03-23 11:35:14',1342177281,'submission.event.fileUploaded',0),(101,1048585,4,20,'2023-03-23 11:35:14',1342177288,'submission.event.fileRevised',0),(102,515,17,20,'2023-03-23 11:35:15',1342177296,'submission.event.fileEdited',0),(103,1048585,4,20,'2023-03-23 11:35:15',1342177296,'submission.event.fileEdited',0),(104,1048585,4,20,'2023-03-23 11:35:16',268435457,'submission.event.submissionSubmitted',0),(105,1048585,5,21,'2023-03-23 11:35:24',268435458,'submission.event.general.metadataUpdated',0),(106,1048585,5,21,'2023-03-23 11:35:25',268435458,'submission.event.general.metadataUpdated',0),(107,515,18,21,'2023-03-23 11:35:28',1342177281,'submission.event.fileUploaded',0),(108,1048585,5,21,'2023-03-23 11:35:28',1342177288,'submission.event.fileRevised',0),(109,515,18,21,'2023-03-23 11:35:28',1342177296,'submission.event.fileEdited',0),(110,1048585,5,21,'2023-03-23 11:35:28',1342177296,'submission.event.fileEdited',0),(111,1048585,5,21,'2023-03-23 11:35:29',268435457,'submission.event.submissionSubmitted',0),(112,1048585,5,3,'2023-03-23 11:35:41',805306371,'editor.submission.decision.sendExternalReview.log',0),(113,515,19,3,'2023-03-23 11:35:41',1342177281,'submission.event.fileUploaded',0),(114,1048585,5,3,'2023-03-23 11:35:41',1342177288,'submission.event.fileRevised',0),(115,1048585,5,3,'2023-03-23 11:35:50',1073741825,'log.review.reviewerAssigned',0),(116,1048585,5,3,'2023-03-23 11:35:56',1073741825,'log.review.reviewerAssigned',0),(117,1048585,5,3,'2023-03-23 11:36:01',805306371,'editor.submission.decision.accept.log',0),(118,1048585,5,3,'2023-03-23 11:36:08',268435459,'submission.event.participantAdded',0),(119,1048585,5,3,'2023-03-23 11:36:14',805306371,'editor.submission.decision.sendToProduction.log',0),(120,1048585,5,3,'2023-03-23 11:36:22',268435459,'submission.event.participantAdded',0),(121,1048585,5,3,'2023-03-23 11:36:26',268435459,'submission.event.participantAdded',0),(122,1048585,6,22,'2023-03-23 11:36:36',268435458,'submission.event.general.metadataUpdated',0),(123,1048585,6,22,'2023-03-23 11:36:37',268435458,'submission.event.general.metadataUpdated',0),(124,515,20,22,'2023-03-23 11:36:40',1342177281,'submission.event.fileUploaded',0),(125,1048585,6,22,'2023-03-23 11:36:40',1342177288,'submission.event.fileRevised',0),(126,515,20,22,'2023-03-23 11:36:40',1342177296,'submission.event.fileEdited',0),(127,1048585,6,22,'2023-03-23 11:36:40',1342177296,'submission.event.fileEdited',0),(128,1048585,6,22,'2023-03-23 11:36:41',268435457,'submission.event.submissionSubmitted',0),(129,1048585,6,3,'2023-03-23 11:36:53',805306371,'editor.submission.decision.sendExternalReview.log',0),(130,515,21,3,'2023-03-23 11:36:53',1342177281,'submission.event.fileUploaded',0),(131,1048585,6,3,'2023-03-23 11:36:53',1342177288,'submission.event.fileRevised',0),(132,1048585,6,3,'2023-03-23 11:37:01',1073741825,'log.review.reviewerAssigned',0),(133,1048585,6,3,'2023-03-23 11:37:08',1073741825,'log.review.reviewerAssigned',0),(134,1048585,6,3,'2023-03-23 11:37:13',805306371,'editor.submission.decision.accept.log',0),(135,1048585,6,3,'2023-03-23 11:37:20',268435459,'submission.event.participantAdded',0),(136,1048585,6,3,'2023-03-23 11:37:25',805306371,'editor.submission.decision.sendToProduction.log',0),(137,1048585,6,3,'2023-03-23 11:37:33',268435459,'submission.event.participantAdded',0),(138,1048585,7,23,'2023-03-23 11:37:43',268435458,'submission.event.general.metadataUpdated',0),(139,1048585,7,23,'2023-03-23 11:37:44',268435458,'submission.event.general.metadataUpdated',0),(140,515,22,23,'2023-03-23 11:37:47',1342177281,'submission.event.fileUploaded',0),(141,1048585,7,23,'2023-03-23 11:37:47',1342177288,'submission.event.fileRevised',0),(142,515,22,23,'2023-03-23 11:37:47',1342177296,'submission.event.fileEdited',0),(143,1048585,7,23,'2023-03-23 11:37:47',1342177296,'submission.event.fileEdited',0),(144,1048585,7,23,'2023-03-23 11:37:48',268435457,'submission.event.submissionSubmitted',0),(145,1048585,7,3,'2023-03-23 11:38:00',805306371,'editor.submission.decision.sendExternalReview.log',0),(146,515,23,3,'2023-03-23 11:38:00',1342177281,'submission.event.fileUploaded',0),(147,1048585,7,3,'2023-03-23 11:38:00',1342177288,'submission.event.fileRevised',0),(148,1048585,7,3,'2023-03-23 11:38:09',1073741825,'log.review.reviewerAssigned',0),(149,1048585,7,3,'2023-03-23 11:38:16',1073741825,'log.review.reviewerAssigned',0),(150,1048585,7,3,'2023-03-23 11:38:22',1073741825,'log.review.reviewerAssigned',0),(151,1048585,7,8,'2023-03-23 11:38:30',1073741830,'log.review.reviewAccepted',0),(152,1048585,7,8,'2023-03-23 11:38:34',1073741848,'log.review.reviewReady',0),(153,1048585,8,24,'2023-03-23 11:38:43',268435458,'submission.event.general.metadataUpdated',0),(154,1048585,8,24,'2023-03-23 11:38:44',268435458,'submission.event.general.metadataUpdated',0),(155,515,24,24,'2023-03-23 11:38:47',1342177281,'submission.event.fileUploaded',0),(156,1048585,8,24,'2023-03-23 11:38:47',1342177288,'submission.event.fileRevised',0),(157,515,24,24,'2023-03-23 11:38:47',1342177296,'submission.event.fileEdited',0),(158,1048585,8,24,'2023-03-23 11:38:47',1342177296,'submission.event.fileEdited',0),(159,1048585,8,24,'2023-03-23 11:38:49',268435457,'submission.event.submissionSubmitted',0),(160,1048585,9,25,'2023-03-23 11:38:57',268435458,'submission.event.general.metadataUpdated',0),(161,1048585,9,25,'2023-03-23 11:38:58',268435458,'submission.event.general.metadataUpdated',0),(162,515,25,25,'2023-03-23 11:39:01',1342177281,'submission.event.fileUploaded',0),(163,1048585,9,25,'2023-03-23 11:39:01',1342177288,'submission.event.fileRevised',0),(164,515,25,25,'2023-03-23 11:39:01',1342177296,'submission.event.fileEdited',0),(165,1048585,9,25,'2023-03-23 11:39:01',1342177296,'submission.event.fileEdited',0),(166,1048585,9,25,'2023-03-23 11:39:02',268435457,'submission.event.submissionSubmitted',0),(167,1048585,9,3,'2023-03-23 11:39:14',805306371,'editor.submission.decision.sendExternalReview.log',0),(168,515,26,3,'2023-03-23 11:39:14',1342177281,'submission.event.fileUploaded',0),(169,1048585,9,3,'2023-03-23 11:39:14',1342177288,'submission.event.fileRevised',0),(170,1048585,9,3,'2023-03-23 11:39:23',1073741825,'log.review.reviewerAssigned',0),(171,1048585,9,3,'2023-03-23 11:39:29',1073741825,'log.review.reviewerAssigned',0),(172,1048585,9,3,'2023-03-23 11:39:34',805306371,'editor.submission.decision.accept.log',0),(173,1048585,9,3,'2023-03-23 11:39:41',268435459,'submission.event.participantAdded',0),(174,1048585,9,3,'2023-03-23 11:39:47',805306371,'editor.submission.decision.sendToProduction.log',0),(175,1048585,9,3,'2023-03-23 11:39:54',268435459,'submission.event.participantAdded',0),(176,1048585,9,3,'2023-03-23 11:39:59',268435459,'submission.event.participantAdded',0),(177,1048585,10,26,'2023-03-23 11:40:09',268435458,'submission.event.general.metadataUpdated',0),(178,1048585,10,26,'2023-03-23 11:40:10',268435458,'submission.event.general.metadataUpdated',0),(179,515,27,26,'2023-03-23 11:40:13',1342177281,'submission.event.fileUploaded',0),(180,1048585,10,26,'2023-03-23 11:40:13',1342177288,'submission.event.fileRevised',0),(181,515,27,26,'2023-03-23 11:40:13',1342177296,'submission.event.fileEdited',0),(182,1048585,10,26,'2023-03-23 11:40:13',1342177296,'submission.event.fileEdited',0),(183,1048585,10,26,'2023-03-23 11:40:14',268435457,'submission.event.submissionSubmitted',0),(184,1048585,10,3,'2023-03-23 11:40:27',805306371,'editor.submission.decision.sendExternalReview.log',0),(185,515,28,3,'2023-03-23 11:40:27',1342177281,'submission.event.fileUploaded',0),(186,1048585,10,3,'2023-03-23 11:40:27',1342177288,'submission.event.fileRevised',0),(187,1048585,10,3,'2023-03-23 11:40:36',1073741825,'log.review.reviewerAssigned',0),(188,1048585,10,3,'2023-03-23 11:40:42',1073741825,'log.review.reviewerAssigned',0),(189,1048585,10,9,'2023-03-23 11:40:50',1073741830,'log.review.reviewAccepted',0),(190,1048585,10,9,'2023-03-23 11:40:54',1073741848,'log.review.reviewReady',0),(191,1048585,10,10,'2023-03-23 11:41:00',1073741830,'log.review.reviewAccepted',0),(192,1048585,10,10,'2023-03-23 11:41:05',1073741848,'log.review.reviewReady',0),(193,1048585,11,27,'2023-03-23 11:41:14',268435458,'submission.event.general.metadataUpdated',0),(194,1048585,11,27,'2023-03-23 11:41:15',268435458,'submission.event.general.metadataUpdated',0),(195,515,29,27,'2023-03-23 11:41:18',1342177281,'submission.event.fileUploaded',0),(196,1048585,11,27,'2023-03-23 11:41:18',1342177288,'submission.event.fileRevised',0),(197,515,29,27,'2023-03-23 11:41:18',1342177296,'submission.event.fileEdited',0),(198,1048585,11,27,'2023-03-23 11:41:18',1342177296,'submission.event.fileEdited',0),(199,1048585,11,27,'2023-03-23 11:41:20',268435457,'submission.event.submissionSubmitted',0),(200,1048585,12,28,'2023-03-23 11:41:28',268435458,'submission.event.general.metadataUpdated',0),(201,1048585,12,28,'2023-03-23 11:41:29',268435458,'submission.event.general.metadataUpdated',0),(202,515,30,28,'2023-03-23 11:41:32',1342177281,'submission.event.fileUploaded',0),(203,1048585,12,28,'2023-03-23 11:41:32',1342177288,'submission.event.fileRevised',0),(204,515,30,28,'2023-03-23 11:41:32',1342177296,'submission.event.fileEdited',0),(205,1048585,12,28,'2023-03-23 11:41:32',1342177296,'submission.event.fileEdited',0),(206,1048585,12,28,'2023-03-23 11:41:33',268435457,'submission.event.submissionSubmitted',0),(207,1048585,12,3,'2023-03-23 11:41:46',805306371,'editor.submission.decision.sendExternalReview.log',0),(208,515,31,3,'2023-03-23 11:41:47',1342177281,'submission.event.fileUploaded',0),(209,1048585,12,3,'2023-03-23 11:41:47',1342177288,'submission.event.fileRevised',0),(210,1048585,12,3,'2023-03-23 11:41:56',1073741825,'log.review.reviewerAssigned',0),(211,1048585,12,3,'2023-03-23 11:42:02',1073741825,'log.review.reviewerAssigned',0),(212,1048585,13,29,'2023-03-23 11:42:12',268435458,'submission.event.general.metadataUpdated',0),(213,1048585,13,29,'2023-03-23 11:42:12',268435458,'submission.event.general.metadataUpdated',0),(214,515,32,29,'2023-03-23 11:42:15',1342177281,'submission.event.fileUploaded',0),(215,1048585,13,29,'2023-03-23 11:42:15',1342177288,'submission.event.fileRevised',0),(216,515,32,29,'2023-03-23 11:42:16',1342177296,'submission.event.fileEdited',0),(217,1048585,13,29,'2023-03-23 11:42:16',1342177296,'submission.event.fileEdited',0),(218,1048585,13,29,'2023-03-23 11:42:17',268435457,'submission.event.submissionSubmitted',0),(219,1048585,13,3,'2023-03-23 11:42:30',805306371,'editor.submission.decision.sendExternalReview.log',0),(220,515,33,3,'2023-03-23 11:42:30',1342177281,'submission.event.fileUploaded',0),(221,1048585,13,3,'2023-03-23 11:42:30',1342177288,'submission.event.fileRevised',0),(222,1048585,13,3,'2023-03-23 11:42:39',1073741825,'log.review.reviewerAssigned',0),(223,1048585,13,3,'2023-03-23 11:42:46',1073741825,'log.review.reviewerAssigned',0),(224,1048585,13,3,'2023-03-23 11:42:53',1073741825,'log.review.reviewerAssigned',0),(225,1048585,13,7,'2023-03-23 11:43:00',1073741830,'log.review.reviewAccepted',0),(226,1048585,13,7,'2023-03-23 11:43:04',1073741848,'log.review.reviewReady',0),(227,1048585,13,9,'2023-03-23 11:43:11',1073741830,'log.review.reviewAccepted',0),(228,1048585,13,9,'2023-03-23 11:43:15',1073741848,'log.review.reviewReady',0),(229,1048585,13,10,'2023-03-23 11:43:22',1073741830,'log.review.reviewAccepted',0),(230,1048585,13,10,'2023-03-23 11:43:26',1073741848,'log.review.reviewReady',0),(231,1048585,13,3,'2023-03-23 11:43:44',805306371,'editor.submission.decision.requestRevisions.log',0),(232,1048585,13,3,'2023-03-23 11:43:45',1073741856,'submission.event.decisionReviewerEmailSent',0),(233,1048585,14,30,'2023-03-23 11:43:59',268435458,'submission.event.general.metadataUpdated',0),(234,1048585,14,30,'2023-03-23 11:44:00',268435458,'submission.event.general.metadataUpdated',0),(235,515,34,30,'2023-03-23 11:44:03',1342177281,'submission.event.fileUploaded',0),(236,1048585,14,30,'2023-03-23 11:44:03',1342177288,'submission.event.fileRevised',0),(237,515,34,30,'2023-03-23 11:44:03',1342177296,'submission.event.fileEdited',0),(238,1048585,14,30,'2023-03-23 11:44:03',1342177296,'submission.event.fileEdited',0),(239,1048585,14,30,'2023-03-23 11:44:04',268435457,'submission.event.submissionSubmitted',0),(240,1048585,15,31,'2023-03-23 11:44:12',268435458,'submission.event.general.metadataUpdated',0),(241,1048585,15,31,'2023-03-23 11:44:13',268435458,'submission.event.general.metadataUpdated',0),(242,515,35,31,'2023-03-23 11:44:16',1342177281,'submission.event.fileUploaded',0),(243,1048585,15,31,'2023-03-23 11:44:16',1342177288,'submission.event.fileRevised',0),(244,515,35,31,'2023-03-23 11:44:16',1342177296,'submission.event.fileEdited',0),(245,1048585,15,31,'2023-03-23 11:44:16',1342177296,'submission.event.fileEdited',0),(246,1048585,15,31,'2023-03-23 11:44:17',268435457,'submission.event.submissionSubmitted',0),(247,1048585,15,3,'2023-03-23 11:44:30',805306371,'editor.submission.decision.sendExternalReview.log',0),(248,515,36,3,'2023-03-23 11:44:31',1342177281,'submission.event.fileUploaded',0),(249,1048585,15,3,'2023-03-23 11:44:31',1342177288,'submission.event.fileRevised',0),(250,1048585,15,3,'2023-03-23 11:44:39',1073741825,'log.review.reviewerAssigned',0),(251,1048585,15,3,'2023-03-23 11:44:46',1073741825,'log.review.reviewerAssigned',0),(252,1048585,15,3,'2023-03-23 11:44:51',805306371,'editor.submission.decision.accept.log',0),(253,1048585,15,3,'2023-03-23 11:44:58',268435459,'submission.event.participantAdded',0),(254,1048585,15,3,'2023-03-23 11:45:03',805306371,'editor.submission.decision.sendToProduction.log',0),(255,1048585,15,3,'2023-03-23 11:45:11',268435459,'submission.event.participantAdded',0),(256,1048585,16,32,'2023-03-23 11:45:21',268435458,'submission.event.general.metadataUpdated',0),(257,1048585,16,32,'2023-03-23 11:45:21',268435458,'submission.event.general.metadataUpdated',0),(258,515,37,32,'2023-03-23 11:45:24',1342177281,'submission.event.fileUploaded',0),(259,1048585,16,32,'2023-03-23 11:45:24',1342177288,'submission.event.fileRevised',0),(260,515,37,32,'2023-03-23 11:45:25',1342177296,'submission.event.fileEdited',0),(261,1048585,16,32,'2023-03-23 11:45:25',1342177296,'submission.event.fileEdited',0),(262,1048585,16,32,'2023-03-23 11:45:25',268435457,'submission.event.submissionSubmitted',0),(263,1048585,17,33,'2023-03-23 11:45:34',268435458,'submission.event.general.metadataUpdated',0),(264,1048585,17,33,'2023-03-23 11:45:35',268435458,'submission.event.general.metadataUpdated',0),(265,515,38,33,'2023-03-23 11:45:38',1342177281,'submission.event.fileUploaded',0),(266,1048585,17,33,'2023-03-23 11:45:38',1342177288,'submission.event.fileRevised',0),(267,515,38,33,'2023-03-23 11:45:38',1342177296,'submission.event.fileEdited',0),(268,1048585,17,33,'2023-03-23 11:45:38',1342177296,'submission.event.fileEdited',0),(269,1048585,17,33,'2023-03-23 11:45:39',268435457,'submission.event.submissionSubmitted',0),(270,1048585,17,3,'2023-03-23 11:45:53',805306371,'editor.submission.decision.sendExternalReview.log',0),(271,515,39,3,'2023-03-23 11:45:53',1342177281,'submission.event.fileUploaded',0),(272,1048585,17,3,'2023-03-23 11:45:53',1342177288,'submission.event.fileRevised',0),(273,1048585,17,3,'2023-03-23 11:46:02',1073741825,'log.review.reviewerAssigned',0),(274,1048585,17,3,'2023-03-23 11:46:09',1073741825,'log.review.reviewerAssigned',0),(275,1048585,17,3,'2023-03-23 11:46:13',805306371,'editor.submission.decision.accept.log',0),(276,1048585,17,3,'2023-03-23 11:46:20',268435459,'submission.event.participantAdded',0),(277,1048585,17,3,'2023-03-23 11:46:26',805306371,'editor.submission.decision.sendToProduction.log',0),(278,1048585,17,3,'2023-03-23 11:46:34',268435459,'submission.event.participantAdded',0),(279,1048585,17,3,'2023-03-23 11:46:39',268435459,'submission.event.participantAdded',0),(280,515,40,3,'2023-03-23 11:46:46',1342177281,'submission.event.fileUploaded',0),(281,1048585,17,3,'2023-03-23 11:46:46',1342177288,'submission.event.fileRevised',0),(282,515,40,3,'2023-03-23 11:46:47',1342177296,'submission.event.fileEdited',0),(283,1048585,17,3,'2023-03-23 11:46:47',1342177296,'submission.event.fileEdited',0),(284,1048585,17,3,'2023-03-23 11:46:59',268435458,'submission.event.general.metadataUpdated',0),(285,1048585,17,3,'2023-03-23 11:47:01',268435462,'publication.event.scheduled',0),(286,1048585,17,3,'2023-03-23 11:47:09',268435462,'publication.event.published',0),(287,1048585,17,3,'2023-03-23 11:47:23',268435463,'publication.event.unpublished',0),(288,1048585,17,3,'2023-03-23 11:47:23',268435462,'publication.event.scheduled',0),(289,1048585,17,3,'2023-03-23 11:47:37',268435462,'publication.event.published',0),(290,1048585,17,3,'2023-03-23 11:47:53',268435463,'publication.event.unpublished',0),(291,1048585,17,3,'2023-03-23 11:47:53',268435458,'submission.event.general.metadataUpdated',0),(292,1048585,17,3,'2023-03-23 11:48:14',268435458,'submission.event.general.metadataUpdated',0),(293,1048585,17,3,'2023-03-23 11:48:15',268435462,'publication.event.published',0),(294,1048585,18,34,'2023-03-23 11:48:34',268435458,'submission.event.general.metadataUpdated',0),(295,1048585,18,34,'2023-03-23 11:48:35',268435458,'submission.event.general.metadataUpdated',0),(296,515,41,34,'2023-03-23 11:48:38',1342177281,'submission.event.fileUploaded',0),(297,1048585,18,34,'2023-03-23 11:48:38',1342177288,'submission.event.fileRevised',0),(298,515,41,34,'2023-03-23 11:48:38',1342177296,'submission.event.fileEdited',0),(299,1048585,18,34,'2023-03-23 11:48:38',1342177296,'submission.event.fileEdited',0),(300,1048585,18,34,'2023-03-23 11:48:39',268435457,'submission.event.submissionSubmitted',0),(301,1048585,18,3,'2023-03-23 11:48:53',805306371,'editor.submission.decision.decline.log',0),(302,1048585,19,35,'2023-03-23 11:49:05',268435458,'submission.event.general.metadataUpdated',0),(303,1048585,19,35,'2023-03-23 11:49:06',268435458,'submission.event.general.metadataUpdated',0),(304,515,42,35,'2023-03-23 11:49:09',1342177281,'submission.event.fileUploaded',0),(305,1048585,19,35,'2023-03-23 11:49:09',1342177288,'submission.event.fileRevised',0),(306,515,42,35,'2023-03-23 11:49:09',1342177296,'submission.event.fileEdited',0),(307,1048585,19,35,'2023-03-23 11:49:09',1342177296,'submission.event.fileEdited',0),(308,1048585,19,35,'2023-03-23 11:49:10',268435457,'submission.event.submissionSubmitted',0),(309,1048585,19,3,'2023-03-23 11:49:24',805306371,'editor.submission.decision.sendExternalReview.log',0),(310,515,43,3,'2023-03-23 11:49:24',1342177281,'submission.event.fileUploaded',0),(311,1048585,19,3,'2023-03-23 11:49:24',1342177288,'submission.event.fileRevised',0),(312,1048585,19,3,'2023-03-23 11:49:33',1073741825,'log.review.reviewerAssigned',0),(313,1048585,19,3,'2023-03-23 11:49:39',1073741825,'log.review.reviewerAssigned',0),(314,1048585,19,3,'2023-03-23 11:49:44',805306371,'editor.submission.decision.accept.log',0),(315,1048585,19,3,'2023-03-23 11:49:51',268435459,'submission.event.participantAdded',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','amwandenga','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','amwandenga','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','amwandenga','string'),(7,'fileId','1','int'),(7,'fileStage','2','int'),(7,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(7,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(7,'sourceSubmissionFileId',NULL,'string'),(7,'submissionFileId','1','int'),(7,'submissionId','1','int'),(7,'username','amwandenga','string'),(8,'fileId','2','int'),(8,'fileStage','2','int'),(8,'originalFileName','structured-interview-guide.odt','string'),(8,'sourceSubmissionFileId',NULL,'string'),(8,'submissionFileId','2','int'),(8,'submissionId','1','int'),(8,'username','amwandenga','string'),(9,'fileId','2','int'),(9,'fileStage','2','int'),(9,'name','structured-interview-guide.odt','string'),(9,'submissionFileId','2','int'),(9,'submissionId','1','int'),(9,'username','amwandenga','string'),(10,'fileId','2','int'),(10,'fileStage','2','int'),(10,'originalFileName','structured-interview-guide.odt','string'),(10,'sourceSubmissionFileId',NULL,'string'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','amwandenga','string'),(11,'fileId','2','int'),(11,'fileStage','2','int'),(11,'name','structured-interview-guide.odt','string'),(11,'originalFileName','structured-interview-guide.odt','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','1','int'),(11,'username','amwandenga','string'),(12,'fileId','3','int'),(12,'fileStage','2','int'),(12,'originalFileName','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(12,'sourceSubmissionFileId',NULL,'string'),(12,'submissionFileId','3','int'),(12,'submissionId','1','int'),(12,'username','amwandenga','string'),(13,'fileId','3','int'),(13,'fileStage','2','int'),(13,'name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(13,'submissionFileId','3','int'),(13,'submissionId','1','int'),(13,'username','amwandenga','string'),(14,'fileId','3','int'),(14,'fileStage','2','int'),(14,'originalFileName','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(14,'sourceSubmissionFileId',NULL,'string'),(14,'submissionFileId','3','int'),(14,'submissionId','1','int'),(14,'username','amwandenga','string'),(15,'fileId','3','int'),(15,'fileStage','2','int'),(15,'name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(15,'originalFileName','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(15,'sourceSubmissionFileId',NULL,'string'),(15,'submissionFileId','3','int'),(15,'submissionId','1','int'),(15,'username','amwandenga','string'),(16,'fileId','4','int'),(16,'fileStage','2','int'),(16,'originalFileName','signalling-theory-dataset.pdf','string'),(16,'sourceSubmissionFileId',NULL,'string'),(16,'submissionFileId','4','int'),(16,'submissionId','1','int'),(16,'username','amwandenga','string'),(17,'fileId','4','int'),(17,'fileStage','2','int'),(17,'name','signalling-theory-dataset.pdf','string'),(17,'submissionFileId','4','int'),(17,'submissionId','1','int'),(17,'username','amwandenga','string'),(18,'fileId','4','int'),(18,'fileStage','2','int'),(18,'originalFileName','signalling-theory-dataset.pdf','string'),(18,'sourceSubmissionFileId',NULL,'string'),(18,'submissionFileId','4','int'),(18,'submissionId','1','int'),(18,'username','amwandenga','string'),(19,'fileId','4','int'),(19,'fileStage','2','int'),(19,'name','signalling-theory-dataset.pdf','string'),(19,'originalFileName','signalling-theory-dataset.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','4','int'),(19,'submissionId','1','int'),(19,'username','amwandenga','string'),(20,'fileId','5','int'),(20,'fileStage','2','int'),(20,'originalFileName','author-disclosure-form.docx','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','5','int'),(20,'submissionId','1','int'),(20,'username','amwandenga','string'),(21,'fileId','5','int'),(21,'fileStage','2','int'),(21,'name','author-disclosure-form.docx','string'),(21,'submissionFileId','5','int'),(21,'submissionId','1','int'),(21,'username','amwandenga','string'),(22,'fileId','5','int'),(22,'fileStage','2','int'),(22,'originalFileName','author-disclosure-form.docx','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','5','int'),(22,'submissionId','1','int'),(22,'username','amwandenga','string'),(23,'fileId','5','int'),(23,'fileStage','2','int'),(23,'name','author-disclosure-form.docx','string'),(23,'originalFileName','author-disclosure-form.docx','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','5','int'),(23,'submissionId','1','int'),(23,'username','amwandenga','string'),(24,'fileId','6','int'),(24,'fileStage','2','int'),(24,'originalFileName','delete-this-file.pdf','string'),(24,'sourceSubmissionFileId',NULL,'string'),(24,'submissionFileId','6','int'),(24,'submissionId','1','int'),(24,'username','amwandenga','string'),(25,'fileId','6','int'),(25,'fileStage','2','int'),(25,'name','delete-this-file.pdf','string'),(25,'submissionFileId','6','int'),(25,'submissionId','1','int'),(25,'username','amwandenga','string'),(26,'fileId','6','int'),(26,'fileStage','2','int'),(26,'originalFileName','delete-this-file.pdf','string'),(26,'sourceSubmissionFileId',NULL,'string'),(26,'submissionFileId','6','int'),(26,'submissionId','1','int'),(26,'username','amwandenga','string'),(27,'fileId','6','int'),(27,'fileStage','2','int'),(27,'name','delete-this-file.pdf','string'),(27,'originalFileName','delete-this-file.pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','6','int'),(27,'submissionId','1','int'),(27,'username','amwandenga','string'),(28,'fileStage','2','int'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','6','int'),(28,'submissionId','1','int'),(28,'username','amwandenga','string'),(30,'decision','3','int'),(30,'editorId','3','int'),(30,'editorName','Daniel Barnes','string'),(30,'submissionId','1','int'),(31,'fileId','5','int'),(31,'fileStage','4','int'),(31,'originalFileName','author-disclosure-form.docx','string'),(31,'sourceSubmissionFileId','5','int'),(31,'submissionFileId','7','int'),(31,'submissionId','1','int'),(31,'username','dbarnes','string'),(32,'fileId','5','int'),(32,'fileStage','4','int'),(32,'name','author-disclosure-form.docx','string'),(32,'submissionFileId','7','int'),(32,'submissionId','1','int'),(32,'username','dbarnes','string'),(33,'fileId','3','int'),(33,'fileStage','4','int'),(33,'originalFileName','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(33,'sourceSubmissionFileId','3','int'),(33,'submissionFileId','8','int'),(33,'submissionId','1','int'),(33,'username','dbarnes','string'),(34,'fileId','3','int'),(34,'fileStage','4','int'),(34,'name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(34,'submissionFileId','8','int'),(34,'submissionId','1','int'),(34,'username','dbarnes','string'),(35,'fileId','2','int'),(35,'fileStage','4','int'),(35,'originalFileName','structured-interview-guide.odt','string'),(35,'sourceSubmissionFileId','2','int'),(35,'submissionFileId','9','int'),(35,'submissionId','1','int'),(35,'username','dbarnes','string'),(36,'fileId','2','int'),(36,'fileStage','4','int'),(36,'name','structured-interview-guide.odt','string'),(36,'submissionFileId','9','int'),(36,'submissionId','1','int'),(36,'username','dbarnes','string'),(37,'fileId','1','int'),(37,'fileStage','4','int'),(37,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(37,'sourceSubmissionFileId','1','int'),(37,'submissionFileId','10','int'),(37,'submissionId','1','int'),(37,'username','dbarnes','string'),(38,'fileId','1','int'),(38,'fileStage','4','int'),(38,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(38,'submissionFileId','10','int'),(38,'submissionId','1','int'),(38,'username','dbarnes','string'),(39,'fileId','4','int'),(39,'fileStage','4','int'),(39,'originalFileName','signalling-theory-dataset.pdf','string'),(39,'sourceSubmissionFileId','4','int'),(39,'submissionFileId','11','int'),(39,'submissionId','1','int'),(39,'username','dbarnes','string'),(40,'fileId','4','int'),(40,'fileStage','4','int'),(40,'name','signalling-theory-dataset.pdf','string'),(40,'submissionFileId','11','int'),(40,'submissionId','1','int'),(40,'username','dbarnes','string'),(41,'reviewAssignmentId','1','int'),(41,'reviewerName','Julie Janssen','string'),(41,'round','1','int'),(41,'stageId','3','int'),(41,'submissionId','1','int'),(42,'reviewAssignmentId','2','int'),(42,'reviewerName','Aisla McCrae','string'),(42,'round','1','int'),(42,'stageId','3','int'),(42,'submissionId','1','int'),(43,'reviewAssignmentId','3','int'),(43,'reviewerName','Adela Gallego','string'),(43,'round','1','int'),(43,'stageId','3','int'),(43,'submissionId','1','int'),(44,'decision','2','int'),(44,'editorId','3','int'),(44,'editorName','Daniel Barnes','string'),(44,'submissionId','1','int'),(45,'name','Sarah Vogt','string'),(45,'userGroupName','Copyeditor','string'),(45,'username','svogt','string'),(46,'decision','7','int'),(46,'editorId','3','int'),(46,'editorName','Daniel Barnes','string'),(46,'submissionId','1','int'),(47,'name','Stephen Hellier','string'),(47,'userGroupName','Layout Editor','string'),(47,'username','shellier','string'),(48,'name','Sabine Kumar','string'),(48,'userGroupName','Proofreader','string'),(48,'username','skumar','string'),(53,'fileId','7','int'),(53,'fileStage','10','int'),(53,'originalFileName','article.pdf','string'),(53,'sourceSubmissionFileId',NULL,'string'),(53,'submissionFileId','12','int'),(53,'submissionId','1','int'),(53,'username','dbarnes','string'),(54,'fileId','7','int'),(54,'fileStage','10','int'),(54,'name','article.pdf','string'),(54,'submissionFileId','12','int'),(54,'submissionId','1','int'),(54,'username','dbarnes','string'),(55,'fileId','7','int'),(55,'fileStage','10','int'),(55,'originalFileName','article.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','12','int'),(55,'submissionId','1','int'),(55,'username','dbarnes','string'),(56,'fileId','7','int'),(56,'fileStage','10','int'),(56,'name','article.pdf','string'),(56,'originalFileName','article.pdf','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','12','int'),(56,'submissionId','1','int'),(56,'username','dbarnes','string'),(57,'name','Alan Mwandenga','string'),(57,'userGroupName','Author','string'),(57,'username','amwandenga','string'),(69,'name','Stephanie Berardo','string'),(69,'userGroupName','Section editor','string'),(69,'username','sberardo','string'),(70,'name','Stephanie Berardo','string'),(70,'userGroupName','Section editor','string'),(70,'username','sberardo','string'),(73,'fileId','8','int'),(73,'fileStage','2','int'),(73,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','13','int'),(73,'submissionId','2','int'),(73,'username','ccorino','string'),(74,'fileId','8','int'),(74,'fileStage','2','int'),(74,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(74,'submissionFileId','13','int'),(74,'submissionId','2','int'),(74,'username','ccorino','string'),(75,'fileId','8','int'),(75,'fileStage','2','int'),(75,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(75,'sourceSubmissionFileId',NULL,'string'),(75,'submissionFileId','13','int'),(75,'submissionId','2','int'),(75,'username','ccorino','string'),(76,'fileId','8','int'),(76,'fileStage','2','int'),(76,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(76,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(76,'sourceSubmissionFileId',NULL,'string'),(76,'submissionFileId','13','int'),(76,'submissionId','2','int'),(76,'username','ccorino','string'),(78,'decision','3','int'),(78,'editorId','3','int'),(78,'editorName','Daniel Barnes','string'),(78,'submissionId','2','int'),(79,'fileId','8','int'),(79,'fileStage','4','int'),(79,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(79,'sourceSubmissionFileId','13','int'),(79,'submissionFileId','14','int'),(79,'submissionId','2','int'),(79,'username','dbarnes','string'),(80,'fileId','8','int'),(80,'fileStage','4','int'),(80,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(80,'submissionFileId','14','int'),(80,'submissionId','2','int'),(80,'username','dbarnes','string'),(81,'name','Minoti Inoue','string'),(81,'userGroupName','Section editor','string'),(81,'username','minoue','string'),(83,'decision','9','int'),(83,'editorId','6','int'),(83,'editorName','Minoti Inoue','string'),(83,'submissionId','2','int'),(86,'fileId','9','int'),(86,'fileStage','2','int'),(86,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(86,'sourceSubmissionFileId',NULL,'string'),(86,'submissionFileId','15','int'),(86,'submissionId','3','int'),(86,'username','ckwantes','string'),(87,'fileId','9','int'),(87,'fileStage','2','int'),(87,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(87,'submissionFileId','15','int'),(87,'submissionId','3','int'),(87,'username','ckwantes','string'),(88,'fileId','9','int'),(88,'fileStage','2','int'),(88,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(88,'sourceSubmissionFileId',NULL,'string'),(88,'submissionFileId','15','int'),(88,'submissionId','3','int'),(88,'username','ckwantes','string'),(89,'fileId','9','int'),(89,'fileStage','2','int'),(89,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(89,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(89,'sourceSubmissionFileId',NULL,'string'),(89,'submissionFileId','15','int'),(89,'submissionId','3','int'),(89,'username','ckwantes','string'),(91,'decision','3','int'),(91,'editorId','3','int'),(91,'editorName','Daniel Barnes','string'),(91,'submissionId','3','int'),(92,'fileId','9','int'),(92,'fileStage','4','int'),(92,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(92,'sourceSubmissionFileId','15','int'),(92,'submissionFileId','16','int'),(92,'submissionId','3','int'),(92,'username','dbarnes','string'),(93,'fileId','9','int'),(93,'fileStage','4','int'),(93,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(93,'submissionFileId','16','int'),(93,'submissionId','3','int'),(93,'username','dbarnes','string'),(94,'reviewAssignmentId','4','int'),(94,'reviewerName','Aisla McCrae','string'),(94,'round','1','int'),(94,'stageId','3','int'),(94,'submissionId','3','int'),(95,'reviewAssignmentId','5','int'),(95,'reviewerName','Adela Gallego','string'),(95,'round','1','int'),(95,'stageId','3','int'),(95,'submissionId','3','int'),(96,'decision','2','int'),(96,'editorId','3','int'),(96,'editorName','Daniel Barnes','string'),(96,'submissionId','3','int'),(97,'name','Maria Fritz','string'),(97,'userGroupName','Copyeditor','string'),(97,'username','mfritz','string'),(100,'fileId','10','int'),(100,'fileStage','2','int'),(100,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(100,'sourceSubmissionFileId',NULL,'string'),(100,'submissionFileId','17','int'),(100,'submissionId','4','int'),(100,'username','cmontgomerie','string'),(101,'fileId','10','int'),(101,'fileStage','2','int'),(101,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(101,'submissionFileId','17','int'),(101,'submissionId','4','int'),(101,'username','cmontgomerie','string'),(102,'fileId','10','int'),(102,'fileStage','2','int'),(102,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(102,'sourceSubmissionFileId',NULL,'string'),(102,'submissionFileId','17','int'),(102,'submissionId','4','int'),(102,'username','cmontgomerie','string'),(103,'fileId','10','int'),(103,'fileStage','2','int'),(103,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(103,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(103,'sourceSubmissionFileId',NULL,'string'),(103,'submissionFileId','17','int'),(103,'submissionId','4','int'),(103,'username','cmontgomerie','string'),(107,'fileId','11','int'),(107,'fileStage','2','int'),(107,'originalFileName','Genetic transformation of forest trees.pdf','string'),(107,'sourceSubmissionFileId',NULL,'string'),(107,'submissionFileId','18','int'),(107,'submissionId','5','int'),(107,'username','ddiouf','string'),(108,'fileId','11','int'),(108,'fileStage','2','int'),(108,'name','Genetic transformation of forest trees.pdf','string'),(108,'submissionFileId','18','int'),(108,'submissionId','5','int'),(108,'username','ddiouf','string'),(109,'fileId','11','int'),(109,'fileStage','2','int'),(109,'originalFileName','Genetic transformation of forest trees.pdf','string'),(109,'sourceSubmissionFileId',NULL,'string'),(109,'submissionFileId','18','int'),(109,'submissionId','5','int'),(109,'username','ddiouf','string'),(110,'fileId','11','int'),(110,'fileStage','2','int'),(110,'name','Genetic transformation of forest trees.pdf','string'),(110,'originalFileName','Genetic transformation of forest trees.pdf','string'),(110,'sourceSubmissionFileId',NULL,'string'),(110,'submissionFileId','18','int'),(110,'submissionId','5','int'),(110,'username','ddiouf','string'),(112,'decision','3','int'),(112,'editorId','3','int'),(112,'editorName','Daniel Barnes','string'),(112,'submissionId','5','int'),(113,'fileId','11','int'),(113,'fileStage','4','int'),(113,'originalFileName','Genetic transformation of forest trees.pdf','string'),(113,'sourceSubmissionFileId','18','int'),(113,'submissionFileId','19','int'),(113,'submissionId','5','int'),(113,'username','dbarnes','string'),(114,'fileId','11','int'),(114,'fileStage','4','int'),(114,'name','Genetic transformation of forest trees.pdf','string'),(114,'submissionFileId','19','int'),(114,'submissionId','5','int'),(114,'username','dbarnes','string'),(115,'reviewAssignmentId','6','int'),(115,'reviewerName','Paul Hudson','string'),(115,'round','1','int'),(115,'stageId','3','int'),(115,'submissionId','5','int'),(116,'reviewAssignmentId','7','int'),(116,'reviewerName','Adela Gallego','string'),(116,'round','1','int'),(116,'stageId','3','int'),(116,'submissionId','5','int'),(117,'decision','2','int'),(117,'editorId','3','int'),(117,'editorName','Daniel Barnes','string'),(117,'submissionId','5','int'),(118,'name','Maria Fritz','string'),(118,'userGroupName','Copyeditor','string'),(118,'username','mfritz','string'),(119,'decision','7','int'),(119,'editorId','3','int'),(119,'editorName','Daniel Barnes','string'),(119,'submissionId','5','int'),(120,'name','Graham Cox','string'),(120,'userGroupName','Layout Editor','string'),(120,'username','gcox','string'),(121,'name','Catherine Turner','string'),(121,'userGroupName','Proofreader','string'),(121,'username','cturner','string'),(124,'fileId','12','int'),(124,'fileStage','2','int'),(124,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','20','int'),(124,'submissionId','6','int'),(124,'username','dphillips','string'),(125,'fileId','12','int'),(125,'fileStage','2','int'),(125,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(125,'submissionFileId','20','int'),(125,'submissionId','6','int'),(125,'username','dphillips','string'),(126,'fileId','12','int'),(126,'fileStage','2','int'),(126,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','20','int'),(126,'submissionId','6','int'),(126,'username','dphillips','string'),(127,'fileId','12','int'),(127,'fileStage','2','int'),(127,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(127,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','20','int'),(127,'submissionId','6','int'),(127,'username','dphillips','string'),(129,'decision','3','int'),(129,'editorId','3','int'),(129,'editorName','Daniel Barnes','string'),(129,'submissionId','6','int'),(130,'fileId','12','int'),(130,'fileStage','4','int'),(130,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(130,'sourceSubmissionFileId','20','int'),(130,'submissionFileId','21','int'),(130,'submissionId','6','int'),(130,'username','dbarnes','string'),(131,'fileId','12','int'),(131,'fileStage','4','int'),(131,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(131,'submissionFileId','21','int'),(131,'submissionId','6','int'),(131,'username','dbarnes','string'),(132,'reviewAssignmentId','8','int'),(132,'reviewerName','Julie Janssen','string'),(132,'round','1','int'),(132,'stageId','3','int'),(132,'submissionId','6','int'),(133,'reviewAssignmentId','9','int'),(133,'reviewerName','Adela Gallego','string'),(133,'round','1','int'),(133,'stageId','3','int'),(133,'submissionId','6','int'),(134,'decision','2','int'),(134,'editorId','3','int'),(134,'editorName','Daniel Barnes','string'),(134,'submissionId','6','int'),(135,'name','Maria Fritz','string'),(135,'userGroupName','Copyeditor','string'),(135,'username','mfritz','string'),(136,'decision','7','int'),(136,'editorId','3','int'),(136,'editorName','Daniel Barnes','string'),(136,'submissionId','6','int'),(137,'name','Graham Cox','string'),(137,'userGroupName','Layout Editor','string'),(137,'username','gcox','string'),(140,'fileId','13','int'),(140,'fileStage','2','int'),(140,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(140,'sourceSubmissionFileId',NULL,'string'),(140,'submissionFileId','22','int'),(140,'submissionId','7','int'),(140,'username','dsokoloff','string'),(141,'fileId','13','int'),(141,'fileStage','2','int'),(141,'name','Developing efficacy beliefs in the classroom.pdf','string'),(141,'submissionFileId','22','int'),(141,'submissionId','7','int'),(141,'username','dsokoloff','string'),(142,'fileId','13','int'),(142,'fileStage','2','int'),(142,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','22','int'),(142,'submissionId','7','int'),(142,'username','dsokoloff','string'),(143,'fileId','13','int'),(143,'fileStage','2','int'),(143,'name','Developing efficacy beliefs in the classroom.pdf','string'),(143,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(143,'sourceSubmissionFileId',NULL,'string'),(143,'submissionFileId','22','int'),(143,'submissionId','7','int'),(143,'username','dsokoloff','string'),(145,'decision','3','int'),(145,'editorId','3','int'),(145,'editorName','Daniel Barnes','string'),(145,'submissionId','7','int'),(146,'fileId','13','int'),(146,'fileStage','4','int'),(146,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(146,'sourceSubmissionFileId','22','int'),(146,'submissionFileId','23','int'),(146,'submissionId','7','int'),(146,'username','dbarnes','string'),(147,'fileId','13','int'),(147,'fileStage','4','int'),(147,'name','Developing efficacy beliefs in the classroom.pdf','string'),(147,'submissionFileId','23','int'),(147,'submissionId','7','int'),(147,'username','dbarnes','string'),(148,'reviewAssignmentId','10','int'),(148,'reviewerName','Paul Hudson','string'),(148,'round','1','int'),(148,'stageId','3','int'),(148,'submissionId','7','int'),(149,'reviewAssignmentId','11','int'),(149,'reviewerName','Aisla McCrae','string'),(149,'round','1','int'),(149,'stageId','3','int'),(149,'submissionId','7','int'),(150,'reviewAssignmentId','12','int'),(150,'reviewerName','Adela Gallego','string'),(150,'round','1','int'),(150,'stageId','3','int'),(150,'submissionId','7','int'),(151,'reviewAssignmentId','10','int'),(151,'reviewerName','Paul Hudson','string'),(151,'round','1','int'),(151,'submissionId','7','int'),(152,'reviewAssignmentId','10','int'),(152,'reviewerName','Paul Hudson','string'),(152,'round','1','int'),(152,'submissionId','7','int'),(155,'fileId','14','int'),(155,'fileStage','2','int'),(155,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(155,'sourceSubmissionFileId',NULL,'string'),(155,'submissionFileId','24','int'),(155,'submissionId','8','int'),(155,'username','eostrom','string'),(156,'fileId','14','int'),(156,'fileStage','2','int'),(156,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(156,'submissionFileId','24','int'),(156,'submissionId','8','int'),(156,'username','eostrom','string'),(157,'fileId','14','int'),(157,'fileStage','2','int'),(157,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(157,'sourceSubmissionFileId',NULL,'string'),(157,'submissionFileId','24','int'),(157,'submissionId','8','int'),(157,'username','eostrom','string'),(158,'fileId','14','int'),(158,'fileStage','2','int'),(158,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(158,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','24','int'),(158,'submissionId','8','int'),(158,'username','eostrom','string'),(162,'fileId','15','int'),(162,'fileStage','2','int'),(162,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(162,'sourceSubmissionFileId',NULL,'string'),(162,'submissionFileId','25','int'),(162,'submissionId','9','int'),(162,'username','fpaglieri','string'),(163,'fileId','15','int'),(163,'fileStage','2','int'),(163,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(163,'submissionFileId','25','int'),(163,'submissionId','9','int'),(163,'username','fpaglieri','string'),(164,'fileId','15','int'),(164,'fileStage','2','int'),(164,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(164,'sourceSubmissionFileId',NULL,'string'),(164,'submissionFileId','25','int'),(164,'submissionId','9','int'),(164,'username','fpaglieri','string'),(165,'fileId','15','int'),(165,'fileStage','2','int'),(165,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(165,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(165,'sourceSubmissionFileId',NULL,'string'),(165,'submissionFileId','25','int'),(165,'submissionId','9','int'),(165,'username','fpaglieri','string'),(167,'decision','3','int'),(167,'editorId','3','int'),(167,'editorName','Daniel Barnes','string'),(167,'submissionId','9','int'),(168,'fileId','15','int'),(168,'fileStage','4','int'),(168,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(168,'sourceSubmissionFileId','25','int'),(168,'submissionFileId','26','int'),(168,'submissionId','9','int'),(168,'username','dbarnes','string'),(169,'fileId','15','int'),(169,'fileStage','4','int'),(169,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(169,'submissionFileId','26','int'),(169,'submissionId','9','int'),(169,'username','dbarnes','string'),(170,'reviewAssignmentId','13','int'),(170,'reviewerName','Julie Janssen','string'),(170,'round','1','int'),(170,'stageId','3','int'),(170,'submissionId','9','int'),(171,'reviewAssignmentId','14','int'),(171,'reviewerName','Adela Gallego','string'),(171,'round','1','int'),(171,'stageId','3','int'),(171,'submissionId','9','int'),(172,'decision','2','int'),(172,'editorId','3','int'),(172,'editorName','Daniel Barnes','string'),(172,'submissionId','9','int'),(173,'name','Sarah Vogt','string'),(173,'userGroupName','Copyeditor','string'),(173,'username','svogt','string'),(174,'decision','7','int'),(174,'editorId','3','int'),(174,'editorName','Daniel Barnes','string'),(174,'submissionId','9','int'),(175,'name','Stephen Hellier','string'),(175,'userGroupName','Layout Editor','string'),(175,'username','shellier','string'),(176,'name','Sabine Kumar','string'),(176,'userGroupName','Proofreader','string'),(176,'username','skumar','string'),(179,'fileId','16','int'),(179,'fileStage','2','int'),(179,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(179,'sourceSubmissionFileId',NULL,'string'),(179,'submissionFileId','27','int'),(179,'submissionId','10','int'),(179,'username','jnovak','string'),(180,'fileId','16','int'),(180,'fileStage','2','int'),(180,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(180,'submissionFileId','27','int'),(180,'submissionId','10','int'),(180,'username','jnovak','string'),(181,'fileId','16','int'),(181,'fileStage','2','int'),(181,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(181,'sourceSubmissionFileId',NULL,'string'),(181,'submissionFileId','27','int'),(181,'submissionId','10','int'),(181,'username','jnovak','string'),(182,'fileId','16','int'),(182,'fileStage','2','int'),(182,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(182,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(182,'sourceSubmissionFileId',NULL,'string'),(182,'submissionFileId','27','int'),(182,'submissionId','10','int'),(182,'username','jnovak','string'),(184,'decision','3','int'),(184,'editorId','3','int'),(184,'editorName','Daniel Barnes','string'),(184,'submissionId','10','int'),(185,'fileId','16','int'),(185,'fileStage','4','int'),(185,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(185,'sourceSubmissionFileId','27','int'),(185,'submissionFileId','28','int'),(185,'submissionId','10','int'),(185,'username','dbarnes','string'),(186,'fileId','16','int'),(186,'fileStage','4','int'),(186,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(186,'submissionFileId','28','int'),(186,'submissionId','10','int'),(186,'username','dbarnes','string'),(187,'reviewAssignmentId','15','int'),(187,'reviewerName','Aisla McCrae','string'),(187,'round','1','int'),(187,'stageId','3','int'),(187,'submissionId','10','int'),(188,'reviewAssignmentId','16','int'),(188,'reviewerName','Adela Gallego','string'),(188,'round','1','int'),(188,'stageId','3','int'),(188,'submissionId','10','int'),(189,'reviewAssignmentId','15','int'),(189,'reviewerName','Aisla McCrae','string'),(189,'round','1','int'),(189,'submissionId','10','int'),(190,'reviewAssignmentId','15','int'),(190,'reviewerName','Aisla McCrae','string'),(190,'round','1','int'),(190,'submissionId','10','int'),(191,'reviewAssignmentId','16','int'),(191,'reviewerName','Adela Gallego','string'),(191,'round','1','int'),(191,'submissionId','10','int'),(192,'reviewAssignmentId','16','int'),(192,'reviewerName','Adela Gallego','string'),(192,'round','1','int'),(192,'submissionId','10','int'),(195,'fileId','17','int'),(195,'fileStage','2','int'),(195,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(195,'sourceSubmissionFileId',NULL,'string'),(195,'submissionFileId','29','int'),(195,'submissionId','11','int'),(195,'username','kalkhafaji','string'),(196,'fileId','17','int'),(196,'fileStage','2','int'),(196,'name','Learning Sustainable Design through Service.pdf','string'),(196,'submissionFileId','29','int'),(196,'submissionId','11','int'),(196,'username','kalkhafaji','string'),(197,'fileId','17','int'),(197,'fileStage','2','int'),(197,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(197,'sourceSubmissionFileId',NULL,'string'),(197,'submissionFileId','29','int'),(197,'submissionId','11','int'),(197,'username','kalkhafaji','string'),(198,'fileId','17','int'),(198,'fileStage','2','int'),(198,'name','Learning Sustainable Design through Service.pdf','string'),(198,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(198,'sourceSubmissionFileId',NULL,'string'),(198,'submissionFileId','29','int'),(198,'submissionId','11','int'),(198,'username','kalkhafaji','string'),(202,'fileId','18','int'),(202,'fileStage','2','int'),(202,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(202,'sourceSubmissionFileId',NULL,'string'),(202,'submissionFileId','30','int'),(202,'submissionId','12','int'),(202,'username','lchristopher','string'),(203,'fileId','18','int'),(203,'fileStage','2','int'),(203,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(203,'submissionFileId','30','int'),(203,'submissionId','12','int'),(203,'username','lchristopher','string'),(204,'fileId','18','int'),(204,'fileStage','2','int'),(204,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(204,'sourceSubmissionFileId',NULL,'string'),(204,'submissionFileId','30','int'),(204,'submissionId','12','int'),(204,'username','lchristopher','string'),(205,'fileId','18','int'),(205,'fileStage','2','int'),(205,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(205,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(205,'sourceSubmissionFileId',NULL,'string'),(205,'submissionFileId','30','int'),(205,'submissionId','12','int'),(205,'username','lchristopher','string'),(207,'decision','3','int'),(207,'editorId','3','int'),(207,'editorName','Daniel Barnes','string'),(207,'submissionId','12','int'),(208,'fileId','18','int'),(208,'fileStage','4','int'),(208,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(208,'sourceSubmissionFileId','30','int'),(208,'submissionFileId','31','int'),(208,'submissionId','12','int'),(208,'username','dbarnes','string'),(209,'fileId','18','int'),(209,'fileStage','4','int'),(209,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(209,'submissionFileId','31','int'),(209,'submissionId','12','int'),(209,'username','dbarnes','string'),(210,'reviewAssignmentId','17','int'),(210,'reviewerName','Julie Janssen','string'),(210,'round','1','int'),(210,'stageId','3','int'),(210,'submissionId','12','int'),(211,'reviewAssignmentId','18','int'),(211,'reviewerName','Paul Hudson','string'),(211,'round','1','int'),(211,'stageId','3','int'),(211,'submissionId','12','int'),(214,'fileId','19','int'),(214,'fileStage','2','int'),(214,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(214,'sourceSubmissionFileId',NULL,'string'),(214,'submissionFileId','32','int'),(214,'submissionId','13','int'),(214,'username','lkumiega','string'),(215,'fileId','19','int'),(215,'fileStage','2','int'),(215,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(215,'submissionFileId','32','int'),(215,'submissionId','13','int'),(215,'username','lkumiega','string'),(216,'fileId','19','int'),(216,'fileStage','2','int'),(216,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(216,'sourceSubmissionFileId',NULL,'string'),(216,'submissionFileId','32','int'),(216,'submissionId','13','int'),(216,'username','lkumiega','string'),(217,'fileId','19','int'),(217,'fileStage','2','int'),(217,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(217,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(217,'sourceSubmissionFileId',NULL,'string'),(217,'submissionFileId','32','int'),(217,'submissionId','13','int'),(217,'username','lkumiega','string'),(219,'decision','3','int'),(219,'editorId','3','int'),(219,'editorName','Daniel Barnes','string'),(219,'submissionId','13','int'),(220,'fileId','19','int'),(220,'fileStage','4','int'),(220,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(220,'sourceSubmissionFileId','32','int'),(220,'submissionFileId','33','int'),(220,'submissionId','13','int'),(220,'username','dbarnes','string'),(221,'fileId','19','int'),(221,'fileStage','4','int'),(221,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(221,'submissionFileId','33','int'),(221,'submissionId','13','int'),(221,'username','dbarnes','string'),(222,'reviewAssignmentId','19','int'),(222,'reviewerName','Julie Janssen','string'),(222,'round','1','int'),(222,'stageId','3','int'),(222,'submissionId','13','int'),(223,'reviewAssignmentId','20','int'),(223,'reviewerName','Aisla McCrae','string'),(223,'round','1','int'),(223,'stageId','3','int'),(223,'submissionId','13','int'),(224,'reviewAssignmentId','21','int'),(224,'reviewerName','Adela Gallego','string'),(224,'round','1','int'),(224,'stageId','3','int'),(224,'submissionId','13','int'),(225,'reviewAssignmentId','19','int'),(225,'reviewerName','Julie Janssen','string'),(225,'round','1','int'),(225,'submissionId','13','int'),(226,'reviewAssignmentId','19','int'),(226,'reviewerName','Julie Janssen','string'),(226,'round','1','int'),(226,'submissionId','13','int'),(227,'reviewAssignmentId','20','int'),(227,'reviewerName','Aisla McCrae','string'),(227,'round','1','int'),(227,'submissionId','13','int'),(228,'reviewAssignmentId','20','int'),(228,'reviewerName','Aisla McCrae','string'),(228,'round','1','int'),(228,'submissionId','13','int'),(229,'reviewAssignmentId','21','int'),(229,'reviewerName','Adela Gallego','string'),(229,'round','1','int'),(229,'submissionId','13','int'),(230,'reviewAssignmentId','21','int'),(230,'reviewerName','Adela Gallego','string'),(230,'round','1','int'),(230,'submissionId','13','int'),(231,'decision','4','int'),(231,'editorId','3','int'),(231,'editorName','Daniel Barnes','string'),(231,'submissionId','13','int'),(232,'recipientCount','3','int'),(232,'subject','Thank you for your review','string'),(235,'fileId','20','int'),(235,'fileStage','2','int'),(235,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(235,'sourceSubmissionFileId',NULL,'string'),(235,'submissionFileId','34','int'),(235,'submissionId','14','int'),(235,'username','pdaniel','string'),(236,'fileId','20','int'),(236,'fileStage','2','int'),(236,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(236,'submissionFileId','34','int'),(236,'submissionId','14','int'),(236,'username','pdaniel','string'),(237,'fileId','20','int'),(237,'fileStage','2','int'),(237,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(237,'sourceSubmissionFileId',NULL,'string'),(237,'submissionFileId','34','int'),(237,'submissionId','14','int'),(237,'username','pdaniel','string'),(238,'fileId','20','int'),(238,'fileStage','2','int'),(238,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(238,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(238,'sourceSubmissionFileId',NULL,'string'),(238,'submissionFileId','34','int'),(238,'submissionId','14','int'),(238,'username','pdaniel','string'),(242,'fileId','21','int'),(242,'fileStage','2','int'),(242,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(242,'sourceSubmissionFileId',NULL,'string'),(242,'submissionFileId','35','int'),(242,'submissionId','15','int'),(242,'username','rbaiyewu','string'),(243,'fileId','21','int'),(243,'fileStage','2','int'),(243,'name','Yam diseases and its management in Nigeria.pdf','string'),(243,'submissionFileId','35','int'),(243,'submissionId','15','int'),(243,'username','rbaiyewu','string'),(244,'fileId','21','int'),(244,'fileStage','2','int'),(244,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(244,'sourceSubmissionFileId',NULL,'string'),(244,'submissionFileId','35','int'),(244,'submissionId','15','int'),(244,'username','rbaiyewu','string'),(245,'fileId','21','int'),(245,'fileStage','2','int'),(245,'name','Yam diseases and its management in Nigeria.pdf','string'),(245,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(245,'sourceSubmissionFileId',NULL,'string'),(245,'submissionFileId','35','int'),(245,'submissionId','15','int'),(245,'username','rbaiyewu','string'),(247,'decision','3','int'),(247,'editorId','3','int'),(247,'editorName','Daniel Barnes','string'),(247,'submissionId','15','int'),(248,'fileId','21','int'),(248,'fileStage','4','int'),(248,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(248,'sourceSubmissionFileId','35','int'),(248,'submissionFileId','36','int'),(248,'submissionId','15','int'),(248,'username','dbarnes','string'),(249,'fileId','21','int'),(249,'fileStage','4','int'),(249,'name','Yam diseases and its management in Nigeria.pdf','string'),(249,'submissionFileId','36','int'),(249,'submissionId','15','int'),(249,'username','dbarnes','string'),(250,'reviewAssignmentId','22','int'),(250,'reviewerName','Paul Hudson','string'),(250,'round','1','int'),(250,'stageId','3','int'),(250,'submissionId','15','int'),(251,'reviewAssignmentId','23','int'),(251,'reviewerName','Aisla McCrae','string'),(251,'round','1','int'),(251,'stageId','3','int'),(251,'submissionId','15','int'),(252,'decision','2','int'),(252,'editorId','3','int'),(252,'editorName','Daniel Barnes','string'),(252,'submissionId','15','int'),(253,'name','Sarah Vogt','string'),(253,'userGroupName','Copyeditor','string'),(253,'username','svogt','string'),(254,'decision','7','int'),(254,'editorId','3','int'),(254,'editorName','Daniel Barnes','string'),(254,'submissionId','15','int'),(255,'name','Stephen Hellier','string'),(255,'userGroupName','Layout Editor','string'),(255,'username','shellier','string'),(258,'fileId','22','int'),(258,'fileStage','2','int'),(258,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(258,'sourceSubmissionFileId',NULL,'string'),(258,'submissionFileId','37','int'),(258,'submissionId','16','int'),(258,'username','rrossi','string'),(259,'fileId','22','int'),(259,'fileStage','2','int'),(259,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(259,'submissionFileId','37','int'),(259,'submissionId','16','int'),(259,'username','rrossi','string'),(260,'fileId','22','int'),(260,'fileStage','2','int'),(260,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(260,'sourceSubmissionFileId',NULL,'string'),(260,'submissionFileId','37','int'),(260,'submissionId','16','int'),(260,'username','rrossi','string'),(261,'fileId','22','int'),(261,'fileStage','2','int'),(261,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(261,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(261,'sourceSubmissionFileId',NULL,'string'),(261,'submissionFileId','37','int'),(261,'submissionId','16','int'),(261,'username','rrossi','string'),(265,'fileId','23','int'),(265,'fileStage','2','int'),(265,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(265,'sourceSubmissionFileId',NULL,'string'),(265,'submissionFileId','38','int'),(265,'submissionId','17','int'),(265,'username','vkarbasizaed','string'),(266,'fileId','23','int'),(266,'fileStage','2','int'),(266,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(266,'submissionFileId','38','int'),(266,'submissionId','17','int'),(266,'username','vkarbasizaed','string'),(267,'fileId','23','int'),(267,'fileStage','2','int'),(267,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(267,'sourceSubmissionFileId',NULL,'string'),(267,'submissionFileId','38','int'),(267,'submissionId','17','int'),(267,'username','vkarbasizaed','string'),(268,'fileId','23','int'),(268,'fileStage','2','int'),(268,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(268,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(268,'sourceSubmissionFileId',NULL,'string'),(268,'submissionFileId','38','int'),(268,'submissionId','17','int'),(268,'username','vkarbasizaed','string'),(270,'decision','3','int'),(270,'editorId','3','int'),(270,'editorName','Daniel Barnes','string'),(270,'submissionId','17','int'),(271,'fileId','23','int'),(271,'fileStage','4','int'),(271,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(271,'sourceSubmissionFileId','38','int'),(271,'submissionFileId','39','int'),(271,'submissionId','17','int'),(271,'username','dbarnes','string'),(272,'fileId','23','int'),(272,'fileStage','4','int'),(272,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(272,'submissionFileId','39','int'),(272,'submissionId','17','int'),(272,'username','dbarnes','string'),(273,'reviewAssignmentId','24','int'),(273,'reviewerName','Julie Janssen','string'),(273,'round','1','int'),(273,'stageId','3','int'),(273,'submissionId','17','int'),(274,'reviewAssignmentId','25','int'),(274,'reviewerName','Paul Hudson','string'),(274,'round','1','int'),(274,'stageId','3','int'),(274,'submissionId','17','int'),(275,'decision','2','int'),(275,'editorId','3','int'),(275,'editorName','Daniel Barnes','string'),(275,'submissionId','17','int'),(276,'name','Maria Fritz','string'),(276,'userGroupName','Copyeditor','string'),(276,'username','mfritz','string'),(277,'decision','7','int'),(277,'editorId','3','int'),(277,'editorName','Daniel Barnes','string'),(277,'submissionId','17','int'),(278,'name','Graham Cox','string'),(278,'userGroupName','Layout Editor','string'),(278,'username','gcox','string'),(279,'name','Catherine Turner','string'),(279,'userGroupName','Proofreader','string'),(279,'username','cturner','string'),(280,'fileId','24','int'),(280,'fileStage','10','int'),(280,'originalFileName','article.pdf','string'),(280,'sourceSubmissionFileId',NULL,'string'),(280,'submissionFileId','40','int'),(280,'submissionId','17','int'),(280,'username','dbarnes','string'),(281,'fileId','24','int'),(281,'fileStage','10','int'),(281,'name','article.pdf','string'),(281,'submissionFileId','40','int'),(281,'submissionId','17','int'),(281,'username','dbarnes','string'),(282,'fileId','24','int'),(282,'fileStage','10','int'),(282,'originalFileName','article.pdf','string'),(282,'sourceSubmissionFileId',NULL,'string'),(282,'submissionFileId','40','int'),(282,'submissionId','17','int'),(282,'username','dbarnes','string'),(283,'fileId','24','int'),(283,'fileStage','10','int'),(283,'name','article.pdf','string'),(283,'originalFileName','article.pdf','string'),(283,'sourceSubmissionFileId',NULL,'string'),(283,'submissionFileId','40','int'),(283,'submissionId','17','int'),(283,'username','dbarnes','string'),(296,'fileId','25','int'),(296,'fileStage','2','int'),(296,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(296,'sourceSubmissionFileId',NULL,'string'),(296,'submissionFileId','41','int'),(296,'submissionId','18','int'),(296,'username','vwilliamson','string'),(297,'fileId','25','int'),(297,'fileStage','2','int'),(297,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(297,'submissionFileId','41','int'),(297,'submissionId','18','int'),(297,'username','vwilliamson','string'),(298,'fileId','25','int'),(298,'fileStage','2','int'),(298,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(298,'sourceSubmissionFileId',NULL,'string'),(298,'submissionFileId','41','int'),(298,'submissionId','18','int'),(298,'username','vwilliamson','string'),(299,'fileId','25','int'),(299,'fileStage','2','int'),(299,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(299,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(299,'sourceSubmissionFileId',NULL,'string'),(299,'submissionFileId','41','int'),(299,'submissionId','18','int'),(299,'username','vwilliamson','string'),(301,'decision','8','int'),(301,'editorId','3','int'),(301,'editorName','Daniel Barnes','string'),(301,'submissionId','18','int'),(304,'fileId','26','int'),(304,'fileStage','2','int'),(304,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(304,'sourceSubmissionFileId',NULL,'string'),(304,'submissionFileId','42','int'),(304,'submissionId','19','int'),(304,'username','zwoods','string'),(305,'fileId','26','int'),(305,'fileStage','2','int'),(305,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(305,'submissionFileId','42','int'),(305,'submissionId','19','int'),(305,'username','zwoods','string'),(306,'fileId','26','int'),(306,'fileStage','2','int'),(306,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(306,'sourceSubmissionFileId',NULL,'string'),(306,'submissionFileId','42','int'),(306,'submissionId','19','int'),(306,'username','zwoods','string'),(307,'fileId','26','int'),(307,'fileStage','2','int'),(307,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(307,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(307,'sourceSubmissionFileId',NULL,'string'),(307,'submissionFileId','42','int'),(307,'submissionId','19','int'),(307,'username','zwoods','string'),(309,'decision','3','int'),(309,'editorId','3','int'),(309,'editorName','Daniel Barnes','string'),(309,'submissionId','19','int'),(310,'fileId','26','int'),(310,'fileStage','4','int'),(310,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(310,'sourceSubmissionFileId','42','int'),(310,'submissionFileId','43','int'),(310,'submissionId','19','int'),(310,'username','dbarnes','string'),(311,'fileId','26','int'),(311,'fileStage','4','int'),(311,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(311,'submissionFileId','43','int'),(311,'submissionId','19','int'),(311,'username','dbarnes','string'),(312,'reviewAssignmentId','26','int'),(312,'reviewerName','Paul Hudson','string'),(312,'round','1','int'),(312,'stageId','3','int'),(312,'submissionId','19','int'),(313,'reviewAssignmentId','27','int'),(313,'reviewerName','Aisla McCrae','string'),(313,'round','1','int'),(313,'stageId','3','int'),(313,'submissionId','19','int'),(314,'decision','2','int'),(314,'editorId','3','int'),(314,'editorName','Daniel Barnes','string'),(314,'submissionId','19','int'),(315,'name','Sarah Vogt','string'),(315,'userGroupName','Copyeditor','string'),(315,'username','svogt','string');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A log of all failed jobs.';
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'journals/1/articles/1/641c3780ca989.pdf','application/pdf'),(2,'journals/1/articles/1/641c37823e5cf.odt','application/vnd.oasis.opendocument.text'),(3,'journals/1/articles/1/641c37838017b.ods','application/vnd.oasis.opendocument.spreadsheet'),(4,'journals/1/articles/1/641c3784d7693.pdf','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),(5,'journals/1/articles/1/641c37863afc6.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(7,'journals/1/articles/1/641c3881be679.pdf','application/pdf'),(8,'journals/1/articles/2/641c39042e3ca.pdf','application/pdf'),(9,'journals/1/articles/3/641c393d2f964.pdf','application/pdf'),(10,'journals/1/articles/4/641c3972c13d8.pdf','application/pdf'),(11,'journals/1/articles/5/641c398083893.pdf','application/pdf'),(12,'journals/1/articles/6/641c39c816389.pdf','application/pdf'),(13,'journals/1/articles/7/641c3a0b5a73a.pdf','application/pdf'),(14,'journals/1/articles/8/641c3a478a47a.pdf','application/pdf'),(15,'journals/1/articles/9/641c3a5538de8.pdf','application/pdf'),(16,'journals/1/articles/10/641c3a9d46250.pdf','application/pdf'),(17,'journals/1/articles/11/641c3ade889d5.pdf','application/pdf'),(18,'journals/1/articles/12/641c3aec4f406.pdf','application/pdf'),(19,'journals/1/articles/13/641c3b17da0a2.pdf','application/pdf'),(20,'journals/1/articles/14/641c3b831e256.pdf','application/pdf'),(21,'journals/1/articles/15/641c3b90654d9.pdf','application/pdf'),(22,'journals/1/articles/16/641c3bd4cd5b5.pdf','application/pdf'),(23,'journals/1/articles/17/641c3be2507d6.pdf','application/pdf'),(24,'journals/1/articles/17/641c3c264c052.pdf','application/pdf'),(25,'journals/1/articles/18/641c3c9697699.pdf','application/pdf'),(26,'journals/1/articles/19/641c3cb562573.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(2,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(3,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::lib.pkp.classes.galley.Galley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(4,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),(5,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),(6,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(ARTICLE)'),(7,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(8,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),(9,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(10,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(11,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(12,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(13,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(15,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(16,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(17,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(18,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(19,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(20,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(21,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(22,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(23,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),(24,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),(25,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(26,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(27,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about filters, including localized content.';
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,0,0),(2,2,0,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,0,0),(3,3,0,'DataCite XML export','APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter',0,0,0),(4,4,0,'Crossref XML issue export','APP\\plugins\\generic\\crossref\\filter\\IssueCrossrefXmlFilter',0,0,0),(5,5,0,'Crossref XML article export','APP\\plugins\\generic\\crossref\\filter\\ArticleCrossrefXmlFilter',0,0,0),(6,6,0,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaArticleAdapter',0,0,0),(7,7,0,'DOAJ XML export','APP\\plugins\\importexport\\doaj\\filter\\DOAJXmlFilter',0,0,0),(8,8,0,'DOAJ JSON export','APP\\plugins\\importexport\\doaj\\filter\\DOAJJsonFilter',0,0,0),(9,9,0,'User XML user export','PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter',0,0,0),(10,10,0,'User XML user import','PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter',0,0,0),(11,11,0,'Native XML user group export','PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter',0,0,0),(12,12,0,'Native XML user group import','PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter',0,0,0),(13,13,0,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\ArticleNativeXmlFilter',0,0,0),(14,14,0,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFilter',0,0,0),(15,15,0,'Native XML issue export','APP\\plugins\\importexport\\native\\filter\\IssueNativeXmlFilter',0,0,0),(16,16,0,'Native XML issue import','APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueFilter',0,0,0),(17,17,0,'Native XML issue galley export','APP\\plugins\\importexport\\native\\filter\\IssueGalleyNativeXmlFilter',0,0,0),(18,18,0,'Native XML issue galley import','APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueGalleyFilter',0,0,0),(19,19,0,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,0,0),(20,20,0,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,0,0),(21,22,0,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFileFilter',0,0,0),(22,21,0,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,0,0),(23,23,0,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\ArticleGalleyNativeXmlFilter',0,0,0),(24,24,0,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleGalleyFilter',0,0,0),(25,25,0,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,0,0),(26,26,0,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,0,0),(27,27,0,'APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter','APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter',0,0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'en','name','Article Text','string'),(1,'fr_CA','name','Texte de l\'article','string'),(2,'en','name','Research Instrument','string'),(2,'fr_CA','name','Instruments de recherche','string'),(3,'en','name','Research Materials','string'),(3,'fr_CA','name','Documents de recherche','string'),(4,'en','name','Research Results','string'),(4,'fr_CA','name','Résultats de recherche','string'),(5,'en','name','Transcripts','string'),(5,'fr_CA','name','Transcriptions','string'),(6,'en','name','Data Analysis','string'),(6,'fr_CA','name','Analyse de données','string'),(7,'en','name','Data Set','string'),(7,'fr_CA','name','Ensemble de données','string'),(8,'en','name','Source Texts','string'),(8,'fr_CA','name','Textes source','string'),(9,'en','name','Multimedia','string'),(9,'fr_CA','name','Multimédias','string'),(10,'en','name','Image','string'),(10,'fr_CA','name','Image','string'),(11,'en','name','HTML Stylesheet','string'),(11,'fr_CA','name','Feuille de style HTML','string'),(12,'en','name','Other','string'),(12,'fr_CA','name','Autre','string');
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
  `required` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,0,1,'SUBMISSION'),(2,1,1,1,3,0,1,0,'RESEARCHINSTRUMENT'),(3,1,2,1,3,0,1,0,'RESEARCHMATERIALS'),(4,1,3,1,3,0,1,0,'RESEARCHRESULTS'),(5,1,4,1,3,0,1,0,'TRANSCRIPTS'),(6,1,5,1,3,0,1,0,'DATAANALYSIS'),(7,1,6,1,3,0,1,0,'DATASET'),(8,1,7,1,3,0,1,0,'SOURCETEXTS'),(9,1,8,1,1,1,1,0,'MULTIMEDIA'),(10,1,9,1,2,1,0,0,'IMAGE'),(11,1,10,1,1,1,0,0,'STYLE'),(12,1,11,1,3,0,1,0,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Records IP address ranges and associates them with institutions.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about institutions, including localized properties like names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_settings`
--

LOCK TABLES `institution_settings` WRITE;
/*!40000 ALTER TABLE `institution_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_settings` ENABLE KEYS */;
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
  `institution_id` bigint(20) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_institution_id` (`institution_id`),
  KEY `institutional_subscriptions_domain` (`domain`),
  CONSTRAINT `institutional_subscriptions_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `institutional_subscriptions_subscription_id` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`subscription_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of institutional subscriptions, linking a subscription with an institution.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
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
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
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
  KEY `issue_files_issue_id` (`issue_id`),
  CONSTRAINT `issue_files_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relationships between issues and issue files, such as cover images.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`),
  CONSTRAINT `issue_galleys_settings_galley_id` FOREIGN KEY (`galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about issue galleys, including localized content such as labels.';
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
  KEY `issue_galleys_file_id` (`file_id`),
  KEY `issue_galleys_url_path` (`url_path`),
  CONSTRAINT `issue_galleys_file_id` FOREIGN KEY (`file_id`) REFERENCES `issue_files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `issue_galleys_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Issue galleys are representations of the entire issue in a single file, such as a complete issue PDF.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `issue_settings_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about issues, including localized properties such as issue titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES (1,'en','description','',NULL),(1,'en','title','',NULL),(1,'fr_CA','description','',NULL),(1,'fr_CA','title','',NULL),(2,'en','description','',NULL),(2,'en','title','',NULL),(2,'fr_CA','description','',NULL),(2,'fr_CA','title','',NULL);
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
  KEY `issues_doi_id` (`doi_id`),
  KEY `issues_url_path` (`url_path`),
  CONSTRAINT `issues_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `issues_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='A list of all journal issues, with identifying information like year, number, volume, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'2',2014,1,'2023-03-23 11:26:13',NULL,'2023-03-23 11:48:25',1,NULL,1,1,1,0,NULL,NULL,'',NULL),(2,1,2,'1',2015,0,NULL,NULL,'2023-03-23 11:48:20',1,NULL,1,1,1,0,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('98c18c44-a823-412f-b050-f0b217d7a7f2','',0,0,0,'[]','a:0:{}',NULL,1679570494,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='All pending or in-progress jobs.';
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
  KEY `journal_settings_journal_id` (`journal_id`),
  CONSTRAINT `journal_settings_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about journals, including localized properties like policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copyrightYearBasis','issue',NULL),(1,'','copySubmissionAckAddress','',NULL),(1,'','copySubmissionAckPrimaryContact','0',NULL),(1,'','country','IS',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','doiSuffixType','default',NULL),(1,'','doiVersioning','0',NULL),(1,'','editorialStatsEmail','1',NULL),(1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Journal of Public Knowledge</a>.</p>',NULL),(1,'','enabledDoiTypes','[\"publication\"]',NULL),(1,'','enableDois','1',NULL),(1,'','enableGeoUsageStats','disabled',NULL),(1,'','enableInstitutionUsageStats','0',NULL),(1,'','enableOai','1',NULL),(1,'','isSushiApiPublic','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','membershipFee','0',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','onlineIssn','0378-5955',NULL),(1,'','printIssn','0378-5955',NULL),(1,'','publicationFee','0',NULL),(1,'','publisherInstitution','Public Knowledge Project',NULL),(1,'','purchaseArticleFee','0',NULL),(1,'','registrationAgency','',NULL),(1,'','submissionAcknowledgement','allAuthors',NULL),(1,'','submitWithCategories','0',NULL),(1,'','supportedFormLocales','[\"en\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en','abbreviation','publicknowledgeJ Pub Know',NULL),(1,'en','acronym','JPKJPK',NULL),(1,'en','authorGuidelines','<p>Authors are invited to make a submission to this journal. All submissions will be assessed by an editor to determine whether they meet the aims and scope of this journal. Those considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the study design and research argument are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the paper. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>',NULL),(1,'en','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the five-step process.',NULL),(1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Journal of Public Knowledge. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>',NULL),(1,'en','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://clockss.org\">More...</a>',NULL),(1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>',NULL),(1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en','description','<p>The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.</p>',NULL),(1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>',NULL),(1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>',NULL),(1,'en','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'en','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://www.lockss.org\">More...</a>',NULL),(1,'en','name','Journal of Public Knowledge',NULL),(1,'en','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>',NULL),(1,'en','searchDescription','The Journal of Public Knowledge is a peer-reviewed quarterly publication on the subject of public access to science.',NULL),(1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another journal for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>',NULL),(1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>',NULL),(1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##',NULL),(1,'fr_CA','authorInformation','Intéressé-e à soumettre à cette revue ? Nous vous recommandons de consulter les politiques de rubrique de la revue à la page <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de la revue</a> ainsi que les <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Directives aux auteurs</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la revue avant de présenter une soumission, ou s\'ils et elles sont déjà inscrits-es, simplement <a href=\"http://localhost/index.php/publicknowledge/login\">ouvrir une session</a> et accéder au tableau de bord pour commencer les 5 étapes du processus.',NULL),(1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##',NULL),(1,'fr_CA','clockssLicense','Cette revue utilise le système CLOCKSS pour créer un système d\'archivage distribué parmi les bibliothèques participantes et permet à ces bibliothèques de créer des archives permanentes de la revue à des fins de conservation et de reconstitution. <a href=\"https://clockss.org\">En apprendre davantage... </a>',NULL),(1,'fr_CA','contributorsHelp','##default.submission.step.contributors##',NULL),(1,'fr_CA','description','<p>Le Journal de Public Knowledge est une publication trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>',NULL),(1,'fr_CA','detailsHelp','##default.submission.step.details##',NULL),(1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##',NULL),(1,'fr_CA','librarianInformation','Nous incitons les bibliothécaires à lister cette revue dans leur fonds de revues numériques. Aussi, il peut être pertinent de mentionner que ce système de publication en libre accès est conçu pour être hébergé par les bibliothèques de recherche pour que les membres de leurs facultés l\'utilisent avec les revues dans lesquelles elles ou ils sont impliqués (voir <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'fr_CA','lockssLicense','Cette revue utilise le système LOCKSS pour créer un système de distribution des archives parmi les bibliothèques participantes et afin de permettre à ces bibliothèques de créer des archives permanentes pour fins de préservation et de restauration. <a href=\"https://lockss.org\">En apprendre davantage...</a>',NULL),(1,'fr_CA','name','Journal de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette revue fournit le libre accès immédiat à son contenu se basant sur le principe que rendre la recherche disponible au public gratuitement facilite un plus grand échange du savoir, à l\'échelle de la planète.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et courriels saisis dans le site de cette revue seront utilisés exclusivement aux fins indiquées par cette revue et ne serviront à aucune autre fin, ni à toute autre partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous invitons les lecteurs-trices à s\'inscrire pour recevoir les avis de publication de cette revue. Utiliser le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">S\'inscrire</a> en haut de la page d\'accueil de la revue. Cette inscription permettra au,à la lecteur-trice de recevoir par courriel le sommaire de chaque nouveau numéro de la revue. Cette liste permet aussi à la revue de revendiquer un certain niveau de soutien ou de lectorat. Voir la <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Déclaration de confidentialité</a> de la revue qui certifie aux lecteurs-trices que leur nom et leur courriel ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','reviewHelp','##default.submission.step.review##',NULL),(1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##',NULL),(1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##',NULL);
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
  KEY `journals_issue_id` (`current_issue_id`),
  CONSTRAINT `journals_current_issue_id_foreign` FOREIGN KEY (`current_issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='A list of all journals in the installation of OJS.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'publicknowledge',1.00,'en',1,1);
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about library files, including localized content such as names.';
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
  `submission_id` bigint(20) DEFAULT NULL,
  `public_access` smallint(6) DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
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
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics for views of the homepage.';
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
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
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
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `metrics_counter_submission_institution_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_institution_daily_submission_id` (`submission_id`),
  KEY `metrics_counter_submission_institution_daily_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `metrics_counter_submission_institution_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_institution_monthly_submission_id` (`submission_id`),
  KEY `metrics_counter_submission_institution_monthly_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_monthly`
--

LOCK TABLES `metrics_counter_submission_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_issue`
--

DROP TABLE IF EXISTS `metrics_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_issue` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `issue_galley_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_issue_load_id` (`load_id`),
  KEY `metrics_issue_context_id` (`context_id`),
  KEY `metrics_issue_issue_id` (`issue_id`),
  KEY `metrics_issue_issue_galley_id` (`issue_galley_id`),
  KEY `metrics_issue_context_id_issue_id` (`context_id`,`issue_id`),
  CONSTRAINT `metrics_issue_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_issue_issue_galley_id_foreign` FOREIGN KEY (`issue_galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_issue_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics for views and downloads of published issues.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_issue`
--

LOCK TABLES `metrics_issue` WRITE;
/*!40000 ALTER TABLE `metrics_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_issue` ENABLE KEYS */;
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
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `file_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `ms_load_id` (`load_id`),
  KEY `metrics_submission_context_id` (`context_id`),
  KEY `metrics_submission_submission_id` (`submission_id`),
  KEY `metrics_submission_representation_id` (`representation_id`),
  KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`),
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics for views and downloads of published submissions and galleys.';
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
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and galleys.';
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
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and galleys.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Links navigation menu items to navigation menus.';
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
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about navigation menu items, including localized content such as names.';
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Navigation menu items are single elements within a navigation menu.';
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
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
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2023-03-23 11:33:58','2023-03-23 11:33:58','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins, Stephanie Berardo,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The influence of lactation on the quantity and quality of cashmere production.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about notifications, including localized properties.';
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
  CONSTRAINT `notification_subscription_settings_context_foreign` FOREIGN KEY (`context`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES (1,'blocked_emailed_notification','8',17,1,'int'),(2,'blocked_emailed_notification','268435477',17,1,'int'),(3,'blocked_emailed_notification','50331659',17,1,'int'),(4,'blocked_emailed_notification','8',18,1,'int'),(5,'blocked_emailed_notification','268435477',18,1,'int'),(6,'blocked_emailed_notification','50331659',18,1,'int'),(7,'blocked_emailed_notification','8',19,1,'int'),(8,'blocked_emailed_notification','268435477',19,1,'int'),(9,'blocked_emailed_notification','50331659',19,1,'int'),(10,'blocked_emailed_notification','8',20,1,'int'),(11,'blocked_emailed_notification','268435477',20,1,'int'),(12,'blocked_emailed_notification','50331659',20,1,'int'),(13,'blocked_emailed_notification','8',21,1,'int'),(14,'blocked_emailed_notification','268435477',21,1,'int'),(15,'blocked_emailed_notification','50331659',21,1,'int'),(16,'blocked_emailed_notification','8',22,1,'int'),(17,'blocked_emailed_notification','268435477',22,1,'int'),(18,'blocked_emailed_notification','50331659',22,1,'int'),(19,'blocked_emailed_notification','8',23,1,'int'),(20,'blocked_emailed_notification','268435477',23,1,'int'),(21,'blocked_emailed_notification','50331659',23,1,'int'),(22,'blocked_emailed_notification','8',24,1,'int'),(23,'blocked_emailed_notification','268435477',24,1,'int'),(24,'blocked_emailed_notification','50331659',24,1,'int'),(25,'blocked_emailed_notification','8',25,1,'int'),(26,'blocked_emailed_notification','268435477',25,1,'int'),(27,'blocked_emailed_notification','50331659',25,1,'int'),(28,'blocked_emailed_notification','8',26,1,'int'),(29,'blocked_emailed_notification','268435477',26,1,'int'),(30,'blocked_emailed_notification','50331659',26,1,'int'),(31,'blocked_emailed_notification','8',27,1,'int'),(32,'blocked_emailed_notification','268435477',27,1,'int'),(33,'blocked_emailed_notification','50331659',27,1,'int'),(34,'blocked_emailed_notification','8',28,1,'int'),(35,'blocked_emailed_notification','268435477',28,1,'int'),(36,'blocked_emailed_notification','50331659',28,1,'int'),(37,'blocked_emailed_notification','8',29,1,'int'),(38,'blocked_emailed_notification','268435477',29,1,'int'),(39,'blocked_emailed_notification','50331659',29,1,'int'),(40,'blocked_emailed_notification','8',30,1,'int'),(41,'blocked_emailed_notification','268435477',30,1,'int'),(42,'blocked_emailed_notification','50331659',30,1,'int'),(43,'blocked_emailed_notification','8',31,1,'int'),(44,'blocked_emailed_notification','268435477',31,1,'int'),(45,'blocked_emailed_notification','50331659',31,1,'int'),(46,'blocked_emailed_notification','8',32,1,'int'),(47,'blocked_emailed_notification','268435477',32,1,'int'),(48,'blocked_emailed_notification','50331659',32,1,'int'),(49,'blocked_emailed_notification','8',33,1,'int'),(50,'blocked_emailed_notification','268435477',33,1,'int'),(51,'blocked_emailed_notification','50331659',33,1,'int'),(52,'blocked_emailed_notification','8',34,1,'int'),(53,'blocked_emailed_notification','268435477',34,1,'int'),(54,'blocked_emailed_notification','50331659',34,1,'int'),(55,'blocked_emailed_notification','8',35,1,'int'),(56,'blocked_emailed_notification','268435477',35,1,'int'),(57,'blocked_emailed_notification','50331659',35,1,'int');
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
  `context_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (6,1,3,2,16777217,'2023-03-23 11:27:39',NULL,1048585,1),(7,1,4,2,16777217,'2023-03-23 11:27:39',NULL,1048585,1),(8,1,5,2,16777217,'2023-03-23 11:27:39',NULL,1048585,1),(9,1,NULL,2,16777236,'2023-03-23 11:27:58','2023-03-23 11:28:03',523,1),(11,1,7,3,16777227,'2023-03-23 11:28:08',NULL,517,1),(13,1,9,3,16777227,'2023-03-23 11:28:15',NULL,517,2),(15,1,10,3,16777227,'2023-03-23 11:28:22',NULL,517,3),(22,1,17,2,16777235,'2023-03-23 11:28:41',NULL,1048585,1),(29,1,3,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(30,1,4,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(31,1,5,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(32,1,12,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(33,1,14,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(34,1,16,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(35,1,17,3,16777259,'2023-03-23 11:32:09',NULL,1048585,1),(38,1,3,2,16777217,'2023-03-23 11:33:25',NULL,1048585,2),(39,1,4,2,16777217,'2023-03-23 11:33:25',NULL,1048585,2),(40,1,5,2,16777217,'2023-03-23 11:33:25',NULL,1048585,2),(41,1,NULL,2,16777236,'2023-03-23 11:33:36','2023-03-23 11:33:40',523,2),(42,1,18,2,16777231,'2023-03-23 11:33:36',NULL,1048585,2),(44,1,3,3,16777249,'2023-03-23 11:33:58',NULL,1048586,1),(45,1,4,3,16777249,'2023-03-23 11:33:58',NULL,1048586,1),(46,1,5,3,16777249,'2023-03-23 11:33:58',NULL,1048586,1),(47,1,3,2,16777217,'2023-03-23 11:34:22',NULL,1048585,3),(48,1,4,2,16777217,'2023-03-23 11:34:22',NULL,1048585,3),(49,1,5,2,16777217,'2023-03-23 11:34:22',NULL,1048585,3),(50,1,NULL,2,16777236,'2023-03-23 11:34:33','2023-03-23 11:34:37',523,3),(52,1,9,3,16777227,'2023-03-23 11:34:42',NULL,517,4),(54,1,10,3,16777227,'2023-03-23 11:34:49',NULL,517,5),(56,1,19,2,16777230,'2023-03-23 11:34:54',NULL,1048585,3),(57,1,3,2,16777251,'2023-03-23 11:34:54','2023-03-23 11:34:57',1048585,3),(58,1,4,2,16777251,'2023-03-23 11:34:54',NULL,1048585,3),(59,1,5,2,16777251,'2023-03-23 11:34:54',NULL,1048585,3),(61,1,3,2,16777217,'2023-03-23 11:35:16',NULL,1048585,4),(62,1,4,2,16777217,'2023-03-23 11:35:16',NULL,1048585,4),(63,1,5,2,16777217,'2023-03-23 11:35:16',NULL,1048585,4),(64,1,3,2,16777217,'2023-03-23 11:35:29',NULL,1048585,5),(65,1,4,2,16777217,'2023-03-23 11:35:29',NULL,1048585,5),(66,1,5,2,16777217,'2023-03-23 11:35:29',NULL,1048585,5),(67,1,NULL,2,16777236,'2023-03-23 11:35:41','2023-03-23 11:35:44',523,4),(69,1,8,3,16777227,'2023-03-23 11:35:50',NULL,517,6),(71,1,10,3,16777227,'2023-03-23 11:35:56',NULL,517,7),(78,1,21,2,16777235,'2023-03-23 11:36:14',NULL,1048585,5),(79,1,3,2,16777254,'2023-03-23 11:36:14','2023-03-23 11:36:18',1048585,5),(80,1,4,2,16777254,'2023-03-23 11:36:14',NULL,1048585,5),(81,1,5,2,16777254,'2023-03-23 11:36:14',NULL,1048585,5),(84,1,3,2,16777217,'2023-03-23 11:36:41',NULL,1048585,6),(85,1,4,2,16777217,'2023-03-23 11:36:41',NULL,1048585,6),(86,1,5,2,16777217,'2023-03-23 11:36:41',NULL,1048585,6),(87,1,NULL,2,16777236,'2023-03-23 11:36:53','2023-03-23 11:36:56',523,5),(89,1,7,3,16777227,'2023-03-23 11:37:01',NULL,517,8),(91,1,10,3,16777227,'2023-03-23 11:37:08',NULL,517,9),(98,1,22,2,16777235,'2023-03-23 11:37:25',NULL,1048585,6),(99,1,3,2,16777254,'2023-03-23 11:37:25','2023-03-23 11:37:29',1048585,6),(100,1,4,2,16777254,'2023-03-23 11:37:25',NULL,1048585,6),(101,1,5,2,16777254,'2023-03-23 11:37:25',NULL,1048585,6),(103,1,3,2,16777217,'2023-03-23 11:37:48',NULL,1048585,7),(104,1,4,2,16777217,'2023-03-23 11:37:48',NULL,1048585,7),(105,1,5,2,16777217,'2023-03-23 11:37:48',NULL,1048585,7),(106,1,NULL,2,16777236,'2023-03-23 11:38:00','2023-03-23 11:38:03',523,6),(107,1,23,2,16777231,'2023-03-23 11:38:00',NULL,1048585,7),(110,1,9,3,16777227,'2023-03-23 11:38:16',NULL,517,11),(112,1,10,3,16777227,'2023-03-23 11:38:22',NULL,517,12),(114,1,3,2,16777219,'2023-03-23 11:38:34',NULL,517,10),(115,1,4,2,16777219,'2023-03-23 11:38:34',NULL,517,10),(116,1,5,2,16777219,'2023-03-23 11:38:34',NULL,517,10),(117,1,3,2,16777217,'2023-03-23 11:38:49',NULL,1048585,8),(118,1,4,2,16777217,'2023-03-23 11:38:49',NULL,1048585,8),(119,1,5,2,16777217,'2023-03-23 11:38:49',NULL,1048585,8),(120,1,3,2,16777217,'2023-03-23 11:39:02',NULL,1048585,9),(121,1,6,2,16777217,'2023-03-23 11:39:02',NULL,1048585,9),(122,1,NULL,2,16777236,'2023-03-23 11:39:14','2023-03-23 11:39:17',523,7),(124,1,7,3,16777227,'2023-03-23 11:39:23',NULL,517,13),(126,1,10,3,16777227,'2023-03-23 11:39:29',NULL,517,14),(132,1,25,2,16777235,'2023-03-23 11:39:47',NULL,1048585,9),(133,1,3,2,16777254,'2023-03-23 11:39:47','2023-03-23 11:39:51',1048585,9),(134,1,6,2,16777254,'2023-03-23 11:39:47',NULL,1048585,9),(137,1,3,2,16777217,'2023-03-23 11:40:14',NULL,1048585,10),(138,1,4,2,16777217,'2023-03-23 11:40:14',NULL,1048585,10),(139,1,5,2,16777217,'2023-03-23 11:40:14',NULL,1048585,10),(140,1,NULL,2,16777236,'2023-03-23 11:40:27','2023-03-23 11:40:30',523,8),(141,1,26,2,16777231,'2023-03-23 11:40:27',NULL,1048585,10),(146,1,3,2,16777219,'2023-03-23 11:40:54',NULL,517,15),(147,1,4,2,16777219,'2023-03-23 11:40:54',NULL,517,15),(148,1,5,2,16777219,'2023-03-23 11:40:54',NULL,517,15),(149,1,3,2,16777219,'2023-03-23 11:41:05',NULL,517,16),(150,1,4,2,16777219,'2023-03-23 11:41:05',NULL,517,16),(151,1,5,2,16777219,'2023-03-23 11:41:05',NULL,517,16),(152,1,3,2,16777217,'2023-03-23 11:41:20',NULL,1048585,11),(153,1,4,2,16777217,'2023-03-23 11:41:20',NULL,1048585,11),(154,1,5,2,16777217,'2023-03-23 11:41:20',NULL,1048585,11),(155,1,3,2,16777217,'2023-03-23 11:41:33',NULL,1048585,12),(156,1,4,2,16777217,'2023-03-23 11:41:33',NULL,1048585,12),(157,1,5,2,16777217,'2023-03-23 11:41:33',NULL,1048585,12),(158,1,NULL,2,16777236,'2023-03-23 11:41:46','2023-03-23 11:41:50',523,9),(159,1,28,2,16777231,'2023-03-23 11:41:46',NULL,1048585,12),(160,1,7,3,16777227,'2023-03-23 11:41:56',NULL,517,17),(162,1,8,3,16777227,'2023-03-23 11:42:02',NULL,517,18),(164,1,3,2,16777217,'2023-03-23 11:42:17',NULL,1048585,13),(165,1,4,2,16777217,'2023-03-23 11:42:17',NULL,1048585,13),(166,1,5,2,16777217,'2023-03-23 11:42:17',NULL,1048585,13),(167,1,NULL,2,16777236,'2023-03-23 11:42:30','2023-03-23 11:42:34',523,10),(175,1,3,2,16777219,'2023-03-23 11:43:04',NULL,517,19),(176,1,4,2,16777219,'2023-03-23 11:43:04',NULL,517,19),(177,1,5,2,16777219,'2023-03-23 11:43:04',NULL,517,19),(178,1,3,2,16777219,'2023-03-23 11:43:15',NULL,517,20),(179,1,4,2,16777219,'2023-03-23 11:43:15',NULL,517,20),(180,1,5,2,16777219,'2023-03-23 11:43:15',NULL,517,20),(181,1,3,2,16777219,'2023-03-23 11:43:26',NULL,517,21),(182,1,4,2,16777219,'2023-03-23 11:43:26',NULL,517,21),(183,1,5,2,16777219,'2023-03-23 11:43:26',NULL,517,21),(184,1,29,3,16777232,'2023-03-23 11:43:45',NULL,1048585,13),(185,1,3,2,16777217,'2023-03-23 11:44:04',NULL,1048585,14),(186,1,4,2,16777217,'2023-03-23 11:44:04',NULL,1048585,14),(187,1,5,2,16777217,'2023-03-23 11:44:04',NULL,1048585,14),(188,1,3,2,16777217,'2023-03-23 11:44:17',NULL,1048585,15),(189,1,4,2,16777217,'2023-03-23 11:44:17',NULL,1048585,15),(190,1,5,2,16777217,'2023-03-23 11:44:17',NULL,1048585,15),(191,1,NULL,2,16777236,'2023-03-23 11:44:30','2023-03-23 11:44:34',523,11),(193,1,8,3,16777227,'2023-03-23 11:44:39',NULL,517,22),(195,1,9,3,16777227,'2023-03-23 11:44:46',NULL,517,23),(202,1,31,2,16777235,'2023-03-23 11:45:03',NULL,1048585,15),(203,1,3,2,16777254,'2023-03-23 11:45:03','2023-03-23 11:45:07',1048585,15),(204,1,4,2,16777254,'2023-03-23 11:45:03',NULL,1048585,15),(205,1,5,2,16777254,'2023-03-23 11:45:03',NULL,1048585,15),(207,1,3,2,16777217,'2023-03-23 11:45:26',NULL,1048585,16),(208,1,4,2,16777217,'2023-03-23 11:45:26',NULL,1048585,16),(209,1,5,2,16777217,'2023-03-23 11:45:26',NULL,1048585,16),(210,1,3,2,16777217,'2023-03-23 11:45:39',NULL,1048585,17),(211,1,4,2,16777217,'2023-03-23 11:45:39',NULL,1048585,17),(212,1,5,2,16777217,'2023-03-23 11:45:39',NULL,1048585,17),(213,1,NULL,2,16777236,'2023-03-23 11:45:53','2023-03-23 11:45:56',523,12),(215,1,7,3,16777227,'2023-03-23 11:46:02',NULL,517,24),(217,1,8,3,16777227,'2023-03-23 11:46:09',NULL,517,25),(224,1,33,2,16777235,'2023-03-23 11:46:26',NULL,1048585,17),(230,1,3,2,16777217,'2023-03-23 11:48:39',NULL,1048585,18),(231,1,4,2,16777217,'2023-03-23 11:48:39',NULL,1048585,18),(232,1,5,2,16777217,'2023-03-23 11:48:39',NULL,1048585,18),(233,1,34,2,16777234,'2023-03-23 11:48:53',NULL,1048585,18),(234,1,3,2,16777217,'2023-03-23 11:49:10',NULL,1048585,19),(235,1,6,2,16777217,'2023-03-23 11:49:10',NULL,1048585,19),(236,1,NULL,2,16777236,'2023-03-23 11:49:24','2023-03-23 11:49:27',523,13),(238,1,8,3,16777227,'2023-03-23 11:49:33',NULL,517,26),(240,1,9,3,16777227,'2023-03-23 11:49:39',NULL,517,27),(242,1,35,2,16777230,'2023-03-23 11:49:45',NULL,1048585,19),(243,1,3,2,16777251,'2023-03-23 11:49:45','2023-03-23 11:49:48',1048585,19),(244,1,6,2,16777251,'2023-03-23 11:49:45',NULL,1048585,19);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\DepositDois\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\OpenAccessNotification\",\"frequency\":{\"hour\":24},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'displayStats','none','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInJournalIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('pdfjsviewerplugin',1,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','','string'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool'),('webfeedplugin',1,'includeIdentifiers','0','bool'),('webfeedplugin',1,'recentItems','30','int');
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
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associates publications (and thus submissions) with categories.';
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
  `setting_value` mediumtext,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_galley_settings_galley_id` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about publication galleys, including localized content such as labels.';
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
  KEY `publication_galleys_submission_file_id` (`submission_file_id`),
  KEY `publication_galleys_doi_id` (`doi_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_galleys_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Publication galleys are representations of a publication in a specific format, e.g. a PDF.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en',1,'PDF',12,0.00,'',0,'',NULL),(2,'en',2,'PDF Version 2',12,0.00,'',0,'pdf',NULL),(3,'en',18,'PDF',40,0.00,'',0,'',NULL);
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
  `setting_value` mediumtext,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  KEY `publication_settings_publication_id` (`publication_id`),
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'','copyrightYear','2023'),(1,'','issueId','1'),(1,'','pages','71-98'),(1,'en','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(1,'en','copyrightHolder','Journal of Public Knowledge'),(1,'en','prefix','The'),(1,'en','subtitle','A Review Of The Literature And Empirical Evidence'),(1,'en','title','Signalling Theory Dividends'),(1,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2023'),(2,'','issueId','1'),(2,'','pages','71-98'),(2,'en','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(2,'en','copyrightHolder','Journal of Public Knowledge'),(2,'en','prefix','The'),(2,'en','subtitle','A Review Of The Literature And Empirical Evidence'),(2,'en','title','The Signalling Theory Dividends Version 2'),(2,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),(3,'en','title','The influence of lactation on the quantity and quality of cashmere production'),(4,'','categoryIds','[]'),(4,'en','abstract','Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.'),(4,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(5,'','categoryIds','[]'),(5,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(5,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(6,'','categoryIds','[]'),(6,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),(6,'en','title','Genetic transformation of forest trees'),(7,'','categoryIds','[]'),(7,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),(7,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(8,'','categoryIds','[]'),(8,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),(8,'en','title','Developing efficacy beliefs in the classroom'),(9,'','categoryIds','[]'),(9,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world. '),(9,'en','title','Traditions and Trends in the Study of the Commons'),(10,'','categoryIds','[]'),(10,'en','abstract','None.'),(10,'en','title','Hansen & Pinto: Reason Reclaimed'),(11,'','categoryIds','[]'),(11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),(11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(12,'','categoryIds','[]'),(12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),(12,'en','title','Learning Sustainable Design through Service'),(13,'','categoryIds','[]'),(13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P<0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),(13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(14,'','categoryIds','[]'),(14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),(14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(15,'','categoryIds','[]'),(15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),(15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(16,'','categoryIds','[]'),(16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),(16,'en','title','Yam diseases and its management in Nigeria'),(17,'','categoryIds','[]'),(17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),(17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(18,'','categoryIds','[]'),(18,'','copyrightYear','2023'),(18,'','issueId','1'),(18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),(18,'en','copyrightHolder','Journal of Public Knowledge'),(18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','copyrightHolder','Journal de la connaissance du public'),(19,'','categoryIds','[]'),(19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),(19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(20,'','categoryIds','[]'),(20,'en','abstract','None.'),(20,'en','title','Finocchiaro: Arguments About Arguments');
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
  KEY `publications_user_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  KEY `publications_url_path` (`url_path`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,'2023-03-23','2023-03-23 11:32:02',1,1,0.00,1,3,'mwandenga-signalling-theory',1,NULL),(2,0,'2023-03-23','2023-03-23 11:32:45',5,1,0.00,1,1,'mwandenga',2,NULL),(3,0,NULL,'2023-03-23 11:33:46',8,1,0.00,2,1,NULL,1,NULL),(4,0,NULL,'2023-03-23 11:34:18',9,1,0.00,3,1,NULL,1,NULL),(5,0,NULL,'2023-03-23 11:35:11',10,1,0.00,4,1,NULL,1,NULL),(6,0,NULL,'2023-03-23 11:35:25',12,1,0.00,5,1,NULL,1,NULL),(7,0,NULL,'2023-03-23 11:36:37',13,1,0.00,6,1,NULL,1,NULL),(8,0,NULL,'2023-03-23 11:37:44',14,1,0.00,7,1,NULL,1,NULL),(9,0,NULL,'2023-03-23 11:38:44',15,1,0.00,8,1,NULL,1,NULL),(10,0,NULL,'2023-03-23 11:38:58',17,2,0.00,9,1,NULL,1,NULL),(11,0,NULL,'2023-03-23 11:40:10',18,1,0.00,10,1,NULL,1,NULL),(12,0,NULL,'2023-03-23 11:41:15',19,1,0.00,11,1,NULL,1,NULL),(13,0,NULL,'2023-03-23 11:41:29',21,1,0.00,12,1,NULL,1,NULL),(14,0,NULL,'2023-03-23 11:42:12',22,1,0.00,13,1,NULL,1,NULL),(15,0,NULL,'2023-03-23 11:43:59',23,1,0.00,14,1,NULL,1,NULL),(16,0,NULL,'2023-03-23 11:44:13',24,1,0.00,15,1,NULL,1,NULL),(17,0,NULL,'2023-03-23 11:45:21',25,1,0.00,16,1,NULL,1,NULL),(18,0,'2023-03-23','2023-03-23 11:48:15',26,1,0.00,17,3,NULL,1,NULL),(19,0,NULL,'2023-03-23 11:48:35',27,1,0.00,18,1,NULL,1,NULL),(20,0,NULL,'2023-03-23 11:49:06',28,2,0.00,19,1,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
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
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The users assigned to a discussion.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unfulfilled (queued) payments, i.e. payments that have not yet been completed via an online payment system.';
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
  `considered` smallint(6) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,7,NULL,NULL,'2023-03-23 11:28:08','2023-03-23 11:28:08',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:28:08',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(2,1,9,NULL,NULL,'2023-03-23 11:28:15','2023-03-23 11:28:15',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:28:15',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(3,1,10,NULL,NULL,'2023-03-23 11:28:22','2023-03-23 11:28:22',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:28:22',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(4,3,9,NULL,NULL,'2023-03-23 11:34:42','2023-03-23 11:34:42',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:34:42',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,0,NULL,0,0),(5,3,10,NULL,NULL,'2023-03-23 11:34:49','2023-03-23 11:34:49',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:34:49',0,0,0,NULL,NULL,NULL,NULL,3,3,2,1,0,NULL,0,0),(6,5,8,NULL,NULL,'2023-03-23 11:35:50','2023-03-23 11:35:50',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:35:50',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,0,NULL,0,0),(7,5,10,NULL,NULL,'2023-03-23 11:35:56','2023-03-23 11:35:56',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:35:56',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,0,NULL,0,0),(8,6,7,NULL,NULL,'2023-03-23 11:37:01','2023-03-23 11:37:02',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:37:02',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,0,NULL,0,0),(9,6,10,NULL,NULL,'2023-03-23 11:37:08','2023-03-23 11:37:08',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:37:08',0,0,0,NULL,NULL,NULL,NULL,5,3,2,1,0,NULL,0,0),(10,7,8,NULL,5,'2023-03-23 11:38:09','2023-03-23 11:38:09','2023-03-23 11:38:30','2023-03-23 11:38:34',NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:38:34',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,4,NULL,0,0),(11,7,9,NULL,NULL,'2023-03-23 11:38:16','2023-03-23 11:38:16',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:38:16',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,0,NULL,0,0),(12,7,10,NULL,NULL,'2023-03-23 11:38:22','2023-03-23 11:38:22',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:38:22',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,0,NULL,0,0),(13,9,7,NULL,NULL,'2023-03-23 11:39:23','2023-03-23 11:39:23',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:39:23',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,0,NULL,0,0),(14,9,10,NULL,NULL,'2023-03-23 11:39:29','2023-03-23 11:39:29',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:39:29',0,0,0,NULL,NULL,NULL,NULL,7,3,2,1,0,NULL,0,0),(15,10,9,NULL,2,'2023-03-23 11:40:36','2023-03-23 11:40:36','2023-03-23 11:40:50','2023-03-23 11:40:54',NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:40:54',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,0,0),(16,10,10,NULL,3,'2023-03-23 11:40:42','2023-03-23 11:40:43','2023-03-23 11:41:00','2023-03-23 11:41:05',NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:41:05',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,4,NULL,0,0),(17,12,7,NULL,NULL,'2023-03-23 11:41:56','2023-03-23 11:41:56',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:41:56',0,0,0,NULL,NULL,NULL,NULL,9,3,1,1,0,NULL,0,0),(18,12,8,NULL,NULL,'2023-03-23 11:42:02','2023-03-23 11:42:02',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:42:02',0,0,0,NULL,NULL,NULL,NULL,9,3,2,1,0,NULL,0,0),(19,13,7,NULL,2,'2023-03-23 11:42:39','2023-03-23 11:42:39','2023-03-23 11:43:00','2023-03-23 11:43:04','2023-03-23 11:43:45','2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:43:45',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,0,0),(20,13,9,NULL,2,'2023-03-23 11:42:46','2023-03-23 11:42:46','2023-03-23 11:43:11','2023-03-23 11:43:15','2023-03-23 11:43:45','2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:43:45',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,0,0),(21,13,10,NULL,3,'2023-03-23 11:42:53','2023-03-23 11:42:53','2023-03-23 11:43:22','2023-03-23 11:43:26','2023-03-23 11:43:45','2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:43:45',0,0,0,NULL,NULL,NULL,NULL,10,3,2,1,4,NULL,0,0),(22,15,8,NULL,NULL,'2023-03-23 11:44:39','2023-03-23 11:44:40',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:44:40',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,0,NULL,0,0),(23,15,9,NULL,NULL,'2023-03-23 11:44:46','2023-03-23 11:44:46',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:44:46',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,0,NULL,0,0),(24,17,7,NULL,NULL,'2023-03-23 11:46:02','2023-03-23 11:46:02',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:46:02',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,0,NULL,0,0),(25,17,8,NULL,NULL,'2023-03-23 11:46:09','2023-03-23 11:46:09',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:46:09',0,0,0,NULL,NULL,NULL,NULL,12,3,2,1,0,NULL,0,0),(26,19,8,NULL,NULL,'2023-03-23 11:49:33','2023-03-23 11:49:33',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:49:33',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,0,NULL,0,0),(27,19,9,NULL,NULL,'2023-03-23 11:49:39','2023-03-23 11:49:40',NULL,NULL,NULL,'2023-04-20 00:00:00','2023-04-20 00:00:00','2023-03-23 11:49:40',0,0,0,NULL,NULL,NULL,NULL,13,3,2,1,0,NULL,0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,7),(1,8),(1,9),(1,10),(1,11),(2,7),(2,8),(2,9),(2,10),(2,11),(3,7),(3,8),(3,9),(3,10),(3,11),(4,16),(5,16),(6,19),(7,19),(8,21),(9,21),(10,23),(11,23),(12,23),(13,26),(14,26),(15,28),(16,28),(17,31),(18,31),(19,33),(20,33),(21,33),(22,36),(23,36),(24,39),(25,39),(26,43),(27,43);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about review form elements, including localized content such as question text.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each review form element represents a single question on a review form.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about review forms, including localized content such as names.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
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
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,3,7),(1,1,3,8),(1,1,3,9),(1,1,3,10),(1,1,3,11),(2,2,3,14),(3,3,3,16),(5,4,3,19),(6,5,3,21),(7,6,3,23),(9,7,3,26),(10,8,3,28),(12,9,3,31),(13,10,3,33),(15,11,3,36),(17,12,3,39),(19,13,3,43);
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
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The last time each scheduled task was run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('APP\\tasks\\OpenAccessNotification','2023-03-23 11:21:35'),('APP\\tasks\\SubscriptionExpiryReminder','2023-03-23 11:21:34'),('APP\\tasks\\UsageStatsLoader','2023-03-23 11:21:35'),('PKP\\task\\DepositDois','2023-03-23 11:21:34'),('PKP\\task\\EditorialReminders','2023-03-23 11:21:34'),('PKP\\task\\ProcessQueueJobs','2023-03-23 11:21:35'),('PKP\\task\\RemoveFailedJobs','2023-03-23 11:21:35'),('PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-03-23 11:21:34'),('PKP\\task\\ReviewReminder','2023-03-23 11:21:34'),('PKP\\task\\StatisticsReport','2023-03-23 11:21:34'),('PKP\\task\\UpdateIPGeoDB','2023-03-23 11:21:34');
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
  `setting_value` mediumtext,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`),
  CONSTRAINT `section_settings_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about sections, including localized properties like section titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'en','abbrev','ART'),(1,'en','identifyType',''),(1,'en','policy','<p>Section default policy</p>'),(1,'en','title','Articles'),(1,'fr_CA','abbrev',''),(1,'fr_CA','identifyType',''),(1,'fr_CA','policy',''),(1,'fr_CA','title',''),(2,'en','abbrev','REV'),(2,'en','identifyType','Review Article'),(2,'en','policy',''),(2,'en','title','Reviews'),(2,'fr_CA','abbrev',''),(2,'fr_CA','identifyType',''),(2,'fr_CA','policy',''),(2,'fr_CA','title','');
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
  KEY `sections_journal_id` (`journal_id`),
  KEY `sections_review_form_id` (`review_form_id`),
  CONSTRAINT `sections_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `sections_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='A list of all sections into which submissions can be organized, forming the table of contents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,NULL,0.00,0,1,1,0,0,0,0,500),(2,1,NULL,1.00,0,1,1,1,0,0,0,0);
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
  KEY `sessions_user_id` (`user_id`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0o6uthtrt3u1c8qdufb6fel0ed',29,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571727,1679571736,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571736;s:5:\"token\";s:32:\"55f2251c91713702a12a291d7eb580be\";}username|s:8:\"lkumiega\";userId|i:29;','localhost'),('0ogp53gqs2l6lriegfkpdkbqg2',28,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571683,1679571693,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571693;s:5:\"token\";s:32:\"91f59c3c4abdd367e148a0f7a5042641\";}username|s:12:\"lchristopher\";userId|i:28;','localhost'),('0u5dims6cojeobvgl3i3bv0r42',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570794,1679570867,0,'csrf|a:2:{s:9:\"timestamp\";i:1679570867;s:5:\"token\";s:32:\"5d22f55d9b28e7cf832d20301891e87f\";}username|s:10:\"amwandenga\";userId|i:17;','localhost'),('21t0hb96r9smrocm01i6nekvst',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570868,1679570935,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679570935;s:5:\"token\";s:32:\"248df0df70fe06da5089768ab826911e\";}','localhost'),('2gkl3ahtgul6hgbvr5f0k8bdld',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571319,1679571329,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571329;s:5:\"token\";s:32:\"a7ede3498daf6e5b57c77db860bc52f0\";}username|s:6:\"ddiouf\";userId|i:21;','localhost'),('357136vk62bl6rhk864dr1ekso',20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571305,1679571316,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571316;s:5:\"token\";s:32:\"532b0c87c446bfa1c1c4a5b708c3308a\";}username|s:12:\"cmontgomerie\";userId|i:20;','localhost'),('35u91ngiso31p8hfs62a2m3dka',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571154,1679571159,0,'','localhost'),('459cu5i8ql41mpcqjk3oga7ddc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570720,1679570735,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1679570735;s:5:\"token\";s:32:\"8e382407f32ea419b7ede8ff3e0701e2\";}','localhost'),('58t301katvqv4mfj0oqj1dm67a',26,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571604,1679571614,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571614;s:5:\"token\";s:32:\"0291412e05e40608dadc10a5df8e8d44\";}username|s:6:\"jnovak\";userId|i:26;','localhost'),('5l4tg7daj2l02ntjafnromb48s',23,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571458,1679571468,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571468;s:5:\"token\";s:32:\"a832868fbcaa149a611b54a0b6e1cbfd\";}username|s:9:\"dsokoloff\";userId|i:23;','localhost'),('670dksl2tol02cjv0t8cviinm1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571785,1679571795,0,'username|s:7:\"amccrae\";csrf|a:2:{s:9:\"timestamp\";i:1679571796;s:5:\"token\";s:32:\"354e7c30e9602adecfd02e1ca95903a5\";}','localhost'),('68jd1dp16ku7l115vtqqfvq6tf',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570739,1679570761,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570761;s:5:\"token\";s:32:\"b58311492b68b9bf943363c762c391d1\";}','localhost'),('6egi36oubd7rlm4p1fllva0546',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571228,1679571241,0,'username|s:6:\"minoue\";csrf|a:2:{s:9:\"timestamp\";i:1679571241;s:5:\"token\";s:32:\"88b3f136555d07778b7643807b3c9ada\";}','localhost'),('6enp28n7o34sujnl2bu37r62va',34,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572109,1679572119,0,'csrf|a:2:{s:9:\"timestamp\";i:1679572119;s:5:\"token\";s:32:\"969de72756852631ee3b8afd0ec89000\";}username|s:11:\"vwilliamson\";userId|i:34;','localhost'),('6g4si9ipsk9b9vae3ocdv30h7k',24,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571518,1679571528,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571528;s:5:\"token\";s:32:\"d428064aed415596c2b11eacad62bc38\";}username|s:7:\"eostrom\";userId|i:24;','localhost'),('71aqh4tdkpjoj3pqaolkhnc30k',35,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572140,1679572150,0,'csrf|a:2:{s:9:\"timestamp\";i:1679572150;s:5:\"token\";s:32:\"cc383515e7480696ddb52d62a7577e50\";}username|s:6:\"zwoods\";userId|i:35;','localhost'),('7ft5ucbf0v9oqc7p2sbjm4ksua',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570582,1679570719,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570718;s:5:\"token\";s:32:\"5c72d264830af9bc667ec04dcd93deaa\";}','localhost'),('7mthgvevtcprfas92un7n4ac1h',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571117,1679571123,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571123;s:5:\"token\";s:32:\"bfadc9d03b3352c8947bee2f22068ece\";}','localhost'),('7vrttp0r3hnn6fru2t6aqmq320',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572152,1679572192,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572192;s:5:\"token\";s:32:\"1f0901cdb166db20117d3487534d2181\";}','localhost'),('9ijop5l3ktjtqhif0qjjhmqnjh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571859,1679571912,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571912;s:5:\"token\";s:32:\"71d6344a2d74ccb1d6a42facdaf7c136\";}','localhost'),('ae75gah2m3ggqn9b42t42f1ir0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572040,1679572053,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572053;s:5:\"token\";s:32:\"b45ac4115cf3a9d9382d595198748936\";}','localhost'),('b2m2m3scb24k4327u0v45ncvq1',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571181,1679571192,0,'userId|i:5;username|s:8:\"sberardo\";csrf|a:2:{s:9:\"timestamp\";i:1679571192;s:5:\"token\";s:32:\"eb0c17659435c6c83fa2bd833d88954d\";}signedInAs|i:3;','localhost'),('b9l7da0lt06c37o43ch01ajdld',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572009,1679572024,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572024;s:5:\"token\";s:32:\"00954fec17f0049e7e13c8fd0f1ef52f\";}','localhost'),('bsku9fq8jkv4b1t7hbgic1vlv4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572068,1679572083,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572083;s:5:\"token\";s:32:\"d20eeeaa99970c6b0dcc2cfe29f44f7e\";}','localhost'),('c3uke6k5gha8nj1pg9mekt6lik',25,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571532,1679571542,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571542;s:5:\"token\";s:32:\"04c5e789f938e7de23c5d64c25241739\";}username|s:9:\"fpaglieri\";userId|i:25;','localhost'),('c4366lnclvhsgdev9mtgci3tll',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571543,1679571600,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571600;s:5:\"token\";s:32:\"6359252316d0e82bf1db0010eed6a249\";}','localhost'),('ct3scnopotkkifm67ulfn9pq9p',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571796,1679571807,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1679571807;s:5:\"token\";s:32:\"c91245f339bf92169f5eedaa7dd74c96\";}','localhost'),('cthcl4rimnpdqt1n6mdj37blle',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570572,1679570579,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570579;s:5:\"token\";s:32:\"2d4b427b15c5177999e80a899fae5090\";}','localhost'),('d0de9o3sglmbjoddb204j3c6au',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571402,1679571454,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571455;s:5:\"token\";s:32:\"23bfc526e94cfe0bbc5409a9a851c47b\";}','localhost'),('d3hb8msthdg8ovt2b5u7j65bpr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572083,1679572106,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572106;s:5:\"token\";s:32:\"972f57b079f48f2abb3519d5a65caeea\";}','localhost'),('ddovaadoub28hqtkhdoo7r16n7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571808,1679571831,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571831;s:5:\"token\";s:32:\"4a5b433edb417cac2cfcc92ef792fd41\";}','localhost'),('df91edk1ph4n14110k6b14jg75',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571616,1679571644,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571644;s:5:\"token\";s:32:\"05ff176f4ba30976324aa8ca1e4344ea\";}','localhost'),('dn9cnf3ts8hfrrs90jt56o885m',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571263,1679571302,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571302;s:5:\"token\";s:32:\"f36501a52bf44794c6fe3e3cf284b9e5\";}','localhost'),('dug3f116gkdtvscj2gq8jnur4a',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571470,1679571504,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571504;s:5:\"token\";s:32:\"a96e0bb39849fe5ba6ecb3d9d0497a4a\";}','localhost'),('emkh408bkioqk5om26q235leco',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572121,1679572137,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572137;s:5:\"token\";s:32:\"c99cc8525ec3344dd98e6370e695b84e\";}','localhost'),('epp4h9319u0onrfhs7333bluph',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571695,1679571723,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571722;s:5:\"token\";s:32:\"3ebdb99ce7d65cd5d65e5eb241ffda83\";}','localhost'),('ftpbvh60ipi13iu9deh2hhtgjk',5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571168,1679571180,0,'userId|i:5;username|s:8:\"sberardo\";csrf|a:2:{s:9:\"timestamp\";i:1679571180;s:5:\"token\";s:32:\"909ef01ef5120ce6f5a263bfde0a6ad0\";}signedInAs|i:3;','localhost'),('gap6pod34qvv002vshtl8l1i06',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571084,1679571091,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571091;s:5:\"token\";s:32:\"70ddee79c4539779ca90161795670d20\";}','localhost'),('ie44qcoe23720iaq8uscljnhio',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571111,1679571117,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571117;s:5:\"token\";s:32:\"ffb94aa3b8cfc2d2131183b4a326414f\";}','localhost'),('k7vioppa92n9mkjjm21f6703lr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571242,1679571249,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571249;s:5:\"token\";s:32:\"0c870e06fa71dcaa393db635fb91a010\";}','localhost'),('ka0gfevq17h0odkd04osgaui6m',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570558,1679570570,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570570;s:5:\"token\";s:32:\"1791fe8e5d8411818671805406374910\";}','localhost'),('kppnj1bkg67tooenb6ip8n49ge',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571738,1679571774,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571774;s:5:\"token\";s:32:\"48695a83d5fbe8f5276d0f7a580247fe\";}','localhost'),('l2cpbake1f5j3v91pp2mnhifjc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571644,1679571654,0,'username|s:7:\"amccrae\";csrf|a:2:{s:9:\"timestamp\";i:1679571654;s:5:\"token\";s:32:\"a871c02e72acc4e1e89a34ccdfaf4c67\";}','localhost'),('lbuneu2ncprseokjj4c7thj0eh',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570494,1679570530,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570530;s:5:\"token\";s:32:\"4b66adcdb3e1f5409c17c9cb8a80987c\";}','localhost'),('lfg1reljn1kd9k09cqfq1pejba',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571206,1679571227,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571227;s:5:\"token\";s:32:\"8a245b4eea84d83d7d299fb6bf2a9180\";}','localhost'),('lmmfu0hvkkude6mmggqg7pfbvh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571098,1679571109,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571109;s:5:\"token\";s:32:\"a76f83e4f9dddc9f375a2b8934ca8da5\";}','localhost'),('lnkroa2514mfgtihcrpeorjou1',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572054,1679572067,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572067;s:5:\"token\";s:32:\"ac9c319147fcf3d5f08041353dd1ab34\";}','localhost'),('lu72gqi03g7tm3jdjqg41kebql',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571331,1679571387,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571387;s:5:\"token\";s:32:\"6d58bd476beeba5643f5f0195748c463\";}','localhost'),('mbvk6a57dv15dog3v6quk6kgmn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571655,1679571665,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1679571665;s:5:\"token\";s:32:\"555874a1113c41e7a4a81b8e1344b9d8\";}','localhost'),('mnc3ljudr4decgftv26hj1jnhb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570764,1679570776,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570776;s:5:\"token\";s:32:\"0859bd833cf1785f631364031a6a7b81\";}','localhost'),('nrdi2lso7n2pe87b0unor8im7b',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571076,1679571082,0,'userId|i:17;username|s:10:\"amwandenga\";csrf|a:2:{s:9:\"timestamp\";i:1679571083;s:5:\"token\";s:32:\"d75f8c5ebdfa0e5e20ff0ddff586721a\";}','localhost'),('nt6n2ar97iumj13k88vcvig38g',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570937,1679571075,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571074;s:5:\"token\";s:32:\"cb6a081c712bfcc80853b1b10900f160\";}','localhost'),('o1pk75k3jm3baaod9apdnfgh0l',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570531,1679570556,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570556;s:5:\"token\";s:32:\"8d2191014e6939484fdbf14c19d80621\";}','localhost'),('ocdl2arud3hvs7bbph2q63bohg',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679570779,1679570790,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1679570790;s:5:\"token\";s:32:\"a2d663374141229a10a694e60abdd79b\";}','localhost'),('p69pvh04u61pcihjqga6l74ae0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571161,1679571167,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571167;s:5:\"token\";s:32:\"9558bf1fd385ecf736cceacaf816e70b\";}','localhost'),('pcvgmmqkhfqtea0lmto51a53ne',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571124,1679571153,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679571153;s:5:\"token\";s:32:\"6edbe39a82f01fc6c89b475702f1c8a9\";}','localhost'),('pehhle4mn1co7vpcei9gqic3cc',31,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571847,1679571857,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571857;s:5:\"token\";s:32:\"5842e371f61992f55945747301de1a1c\";}username|s:8:\"rbaiyewu\";userId|i:31;','localhost'),('ps81tbuknucscop53gqp37j88n',19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571252,1679571262,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571262;s:5:\"token\";s:32:\"b966c553a4ad8b11bc3e1a146856a3c4\";}username|s:8:\"ckwantes\";userId|i:19;','localhost'),('pvrd1feevmpjccpnev57ovocqu',33,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571929,1679571939,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571939;s:5:\"token\";s:32:\"6b6fc41314ded84dc8cff23191c59f59\";}username|s:12:\"vkarbasizaed\";userId|i:33;','localhost'),('q2c7e2aqtm8pfn2srkasd88h2a',18,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571195,1679571205,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571205;s:5:\"token\";s:32:\"509da6ca3f6975429ebab80ef2be7d79\";}username|s:7:\"ccorino\";userId|i:18;','localhost'),('qc38022d07k96vgb0jkue5ldhh',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571774,1679571784,0,'username|s:8:\"jjanssen\";csrf|a:2:{s:9:\"timestamp\";i:1679571784;s:5:\"token\";s:32:\"25785aee45175bf8364aafc7e25f8d2e\";}','localhost'),('qdaibsgnqvk4c1902i5tf03s0t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571941,1679572007,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572007;s:5:\"token\";s:32:\"0bdd24fb609b3fcfd60294a7fbd07d52\";}','localhost'),('t3s291rc6gkpahkl3bsm5m9jm8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571504,1679571514,0,'username|s:7:\"phudson\";csrf|a:2:{s:9:\"timestamp\";i:1679571515;s:5:\"token\";s:32:\"2af289d65893873263c16420d28f1746\";}','localhost'),('tlano5fqpfki16oh6st5doo9fp',32,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571915,1679571925,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571925;s:5:\"token\";s:32:\"3a96f7a02e942e8ee9373a0775f8f470\";}username|s:6:\"rrossi\";userId|i:32;','localhost'),('u042rki44qosa6iqch5f40g59m',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679572025,1679572039,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1679572039;s:5:\"token\";s:32:\"a491035a25da729731f66c6362ed1b8b\";}','localhost'),('u6tlu36ug7ub4u3bn88ms1dsbu',30,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571833,1679571844,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571844;s:5:\"token\";s:32:\"2439bb97f1bffdd9f153d5b2a4e825a4\";}username|s:7:\"pdaniel\";userId|i:30;','localhost'),('ur9u0hsqmgsgemhtcgdvm7rli8',22,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571391,1679571401,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571401;s:5:\"token\";s:32:\"96b3c787f180b6fbac2f8dcdb269a9b4\";}username|s:9:\"dphillips\";userId|i:22;','localhost'),('utcgb9mgree0l7ohfgtib1tg4c',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571669,1679571679,0,'csrf|a:2:{s:9:\"timestamp\";i:1679571679;s:5:\"token\";s:32:\"7d8d1ed48dcfbc9357876b52f1ddb29a\";}username|s:10:\"kalkhafaji\";userId|i:27;','localhost'),('uvt5d9gtboinmt2kevluv7kjoi',17,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1679571092,1679571097,0,'userId|i:17;username|s:10:\"amwandenga\";csrf|a:2:{s:9:\"timestamp\";i:1679571097;s:5:\"token\";s:32:\"b00e6e99701f8fbfb97dcb056c4013bc\";}','localhost');
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
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('compressStatsLogs','','0'),('contactEmail','en','pkpadmin@mailinator.com'),('contactName','en','Open Journal Systems'),('contactName','fr_CA','Open Journal Systems'),('enableGeoUsageStats','','disabled'),('enableInstitutionUsageStats','','0'),('isSiteSushiPlatform','','0'),('isSushiApiPublic','','1'),('keepDailyUsageStats','','0'),('themePluginPath','','default');
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
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,14,17,'2023-03-23 11:31:29',0,1),(2,1,3,3,'2023-03-23 11:27:39',0,1),(3,1,5,4,'2023-03-23 11:27:39',0,1),(4,1,5,5,'2023-03-23 11:33:06',1,0),(5,1,7,12,'2023-03-23 11:28:35',0,0),(6,1,11,14,'2023-03-23 11:28:49',0,0),(7,1,13,16,'2023-03-23 11:28:54',0,0),(8,2,14,18,'2023-03-23 11:33:25',0,0),(9,2,3,3,'2023-03-23 11:33:25',0,1),(10,2,5,4,'2023-03-23 11:33:25',0,1),(11,2,5,5,'2023-03-23 11:33:25',0,1),(12,2,5,6,'2023-03-23 11:33:43',1,0),(13,3,14,19,'2023-03-23 11:34:22',0,0),(14,3,3,3,'2023-03-23 11:34:22',0,1),(15,3,5,4,'2023-03-23 11:34:22',0,1),(16,3,5,5,'2023-03-23 11:34:22',0,1),(17,3,7,11,'2023-03-23 11:35:01',0,0),(18,4,14,20,'2023-03-23 11:35:16',0,0),(19,4,3,3,'2023-03-23 11:35:16',0,1),(20,4,5,4,'2023-03-23 11:35:16',0,1),(21,4,5,5,'2023-03-23 11:35:16',0,1),(22,5,14,21,'2023-03-23 11:35:29',0,0),(23,5,3,3,'2023-03-23 11:35:29',0,1),(24,5,5,4,'2023-03-23 11:35:29',0,1),(25,5,5,5,'2023-03-23 11:35:29',0,1),(26,5,7,11,'2023-03-23 11:36:08',0,0),(27,5,11,13,'2023-03-23 11:36:22',0,0),(28,5,13,15,'2023-03-23 11:36:26',0,0),(29,6,14,22,'2023-03-23 11:36:41',0,0),(30,6,3,3,'2023-03-23 11:36:41',0,1),(31,6,5,4,'2023-03-23 11:36:41',0,1),(32,6,5,5,'2023-03-23 11:36:41',0,1),(33,6,7,11,'2023-03-23 11:37:20',0,0),(34,6,11,13,'2023-03-23 11:37:33',0,0),(35,7,14,23,'2023-03-23 11:37:48',0,0),(36,7,3,3,'2023-03-23 11:37:48',0,1),(37,7,5,4,'2023-03-23 11:37:48',0,1),(38,7,5,5,'2023-03-23 11:37:48',0,1),(39,8,14,24,'2023-03-23 11:38:49',0,0),(40,8,3,3,'2023-03-23 11:38:49',0,1),(41,8,5,4,'2023-03-23 11:38:49',0,1),(42,8,5,5,'2023-03-23 11:38:49',0,1),(43,9,14,25,'2023-03-23 11:39:02',0,0),(44,9,3,3,'2023-03-23 11:39:02',0,1),(45,9,5,6,'2023-03-23 11:39:02',0,1),(46,9,7,12,'2023-03-23 11:39:41',0,0),(47,9,11,14,'2023-03-23 11:39:54',0,0),(48,9,13,16,'2023-03-23 11:39:59',0,0),(49,10,14,26,'2023-03-23 11:40:14',0,0),(50,10,3,3,'2023-03-23 11:40:14',0,1),(51,10,5,4,'2023-03-23 11:40:14',0,1),(52,10,5,5,'2023-03-23 11:40:14',0,1),(53,11,14,27,'2023-03-23 11:41:20',0,0),(54,11,3,3,'2023-03-23 11:41:20',0,1),(55,11,5,4,'2023-03-23 11:41:20',0,1),(56,11,5,5,'2023-03-23 11:41:20',0,1),(57,12,14,28,'2023-03-23 11:41:33',0,0),(58,12,3,3,'2023-03-23 11:41:33',0,1),(59,12,5,4,'2023-03-23 11:41:33',0,1),(60,12,5,5,'2023-03-23 11:41:33',0,1),(61,13,14,29,'2023-03-23 11:42:17',0,0),(62,13,3,3,'2023-03-23 11:42:17',0,1),(63,13,5,4,'2023-03-23 11:42:17',0,1),(64,13,5,5,'2023-03-23 11:42:17',0,1),(65,14,14,30,'2023-03-23 11:44:04',0,0),(66,14,3,3,'2023-03-23 11:44:04',0,1),(67,14,5,4,'2023-03-23 11:44:04',0,1),(68,14,5,5,'2023-03-23 11:44:04',0,1),(69,15,14,31,'2023-03-23 11:44:17',0,0),(70,15,3,3,'2023-03-23 11:44:17',0,1),(71,15,5,4,'2023-03-23 11:44:17',0,1),(72,15,5,5,'2023-03-23 11:44:17',0,1),(73,15,7,12,'2023-03-23 11:44:58',0,0),(74,15,11,14,'2023-03-23 11:45:11',0,0),(75,16,14,32,'2023-03-23 11:45:26',0,0),(76,16,3,3,'2023-03-23 11:45:26',0,1),(77,16,5,4,'2023-03-23 11:45:26',0,1),(78,16,5,5,'2023-03-23 11:45:26',0,1),(79,17,14,33,'2023-03-23 11:45:39',0,0),(80,17,3,3,'2023-03-23 11:45:39',0,1),(81,17,5,4,'2023-03-23 11:45:39',0,1),(82,17,5,5,'2023-03-23 11:45:39',0,1),(83,17,7,11,'2023-03-23 11:46:20',0,0),(84,17,11,13,'2023-03-23 11:46:34',0,0),(85,17,13,15,'2023-03-23 11:46:39',0,0),(86,18,14,34,'2023-03-23 11:48:39',0,0),(87,18,3,3,'2023-03-23 11:48:39',0,1),(88,18,5,4,'2023-03-23 11:48:39',0,1),(89,18,5,5,'2023-03-23 11:48:39',0,1),(90,19,14,35,'2023-03-23 11:49:10',0,0),(91,19,3,3,'2023-03-23 11:49:10',0,1),(92,19,5,6,'2023-03-23 11:49:10',0,1),(93,19,7,12,'2023-03-23 11:49:51',0,0);
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
  KEY `static_page_settings_static_page_id` (`static_page_id`),
  CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE
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
  `user_group_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,3,3),(1,2,530,3,3),(1,1,530,4,5),(1,1,530,5,5),(1,2,530,6,5);
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
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,7,10,8,'','<p>Here are my review comments</p>','2023-03-23 11:38:34',NULL,1),(2,1,4096,10,15,9,'','<p>Here are my review comments</p>','2023-03-23 11:40:54',NULL,1),(3,1,4096,10,16,10,'','<p>Here are my review comments</p>','2023-03-23 11:41:05',NULL,1),(4,1,4096,13,19,7,'','<p>Here are my review comments</p>','2023-03-23 11:43:04',NULL,1),(5,1,4096,13,20,9,'','<p>Here are my review comments</p>','2023-03-23 11:43:15',NULL,1),(6,1,4096,13,21,10,'','<p>Here are my review comments</p>','2023-03-23 11:43:26',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(7,7,5),(8,8,3),(9,9,2),(10,10,1),(11,11,4),(12,12,7),(13,13,8),(14,14,8),(15,15,9),(16,16,9),(17,17,10),(18,18,11),(19,19,11),(20,20,12),(21,21,12),(22,22,13),(23,23,13),(24,24,14),(25,25,15),(26,26,15),(27,27,16),(28,28,16),(29,29,17),(30,30,18),(31,31,18),(32,32,19),(33,33,19),(34,34,20),(35,35,21),(36,36,21),(37,37,22),(38,38,23),(39,39,23),(40,40,24),(41,41,25),(42,42,26),(43,43,26);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(2,'en','name','structured-interview-guide.odt','string'),(3,'en','name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(4,'en','name','signalling-theory-dataset.pdf','string'),(5,'en','name','author-disclosure-form.docx','string'),(7,'en','name','author-disclosure-form.docx','string'),(8,'en','name','response-evaluation-all-team-members-draft-after-edits-final-version-final.ods','string'),(9,'en','name','structured-interview-guide.odt','string'),(10,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(11,'en','name','signalling-theory-dataset.pdf','string'),(12,'en','name','article.pdf','string'),(12,'fr_CA','name','','string'),(13,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(14,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(15,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(16,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(17,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(18,'en','name','Genetic transformation of forest trees.pdf','string'),(19,'en','name','Genetic transformation of forest trees.pdf','string'),(20,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(21,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(22,'en','name','Developing efficacy beliefs in the classroom.pdf','string'),(23,'en','name','Developing efficacy beliefs in the classroom.pdf','string'),(24,'en','name','Traditions and Trends in the Study of the Commons.pdf','string'),(25,'en','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(26,'en','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(27,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(28,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(29,'en','name','Learning Sustainable Design through Service.pdf','string'),(30,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(31,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(32,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(33,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(34,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(35,'en','name','Yam diseases and its management in Nigeria.pdf','string'),(36,'en','name','Yam diseases and its management in Nigeria.pdf','string'),(37,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(38,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(39,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(40,'en','name','article.pdf','string'),(40,'fr_CA','name','','string'),(41,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(42,'en','name','Finocchiaro: Arguments About Arguments.pdf','string'),(43,'en','name','Finocchiaro: Arguments About Arguments.pdf','string');
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
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_file_id` (`file_id`),
  KEY `submission_files_genre_id` (`genre_id`),
  KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_source_submission_file_id` (`source_submission_file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:26:56','2023-03-23 11:26:57',17,NULL,NULL),(2,1,2,NULL,12,2,NULL,NULL,NULL,'2023-03-23 11:26:58','2023-03-23 11:26:59',17,NULL,NULL),(3,1,3,NULL,7,2,NULL,NULL,NULL,'2023-03-23 11:26:59','2023-03-23 11:27:00',17,NULL,NULL),(4,1,4,NULL,7,2,NULL,NULL,NULL,'2023-03-23 11:27:00','2023-03-23 11:27:01',17,NULL,NULL),(5,1,5,NULL,12,2,NULL,NULL,NULL,'2023-03-23 11:27:02','2023-03-23 11:27:03',17,NULL,NULL),(7,1,5,5,12,4,NULL,NULL,NULL,'2023-03-23 11:27:59','2023-03-23 11:27:59',17,523,1),(8,1,3,3,7,4,NULL,NULL,NULL,'2023-03-23 11:27:59','2023-03-23 11:27:59',17,523,1),(9,1,2,2,12,4,NULL,NULL,NULL,'2023-03-23 11:27:59','2023-03-23 11:27:59',17,523,1),(10,1,1,1,1,4,NULL,NULL,NULL,'2023-03-23 11:27:59','2023-03-23 11:27:59',17,523,1),(11,1,4,4,7,4,NULL,NULL,NULL,'2023-03-23 11:27:59','2023-03-23 11:27:59',17,523,1),(12,1,7,NULL,1,10,NULL,NULL,NULL,'2023-03-23 11:31:13','2023-03-23 11:31:14',3,521,1),(13,2,8,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:33:24','2023-03-23 11:33:24',18,NULL,NULL),(14,2,8,13,1,4,NULL,NULL,NULL,'2023-03-23 11:33:36','2023-03-23 11:33:36',18,523,2),(15,3,9,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:34:21','2023-03-23 11:34:21',19,NULL,NULL),(16,3,9,15,1,4,NULL,NULL,NULL,'2023-03-23 11:34:33','2023-03-23 11:34:33',19,523,3),(17,4,10,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:35:14','2023-03-23 11:35:15',20,NULL,NULL),(18,5,11,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:35:28','2023-03-23 11:35:28',21,NULL,NULL),(19,5,11,18,1,4,NULL,NULL,NULL,'2023-03-23 11:35:41','2023-03-23 11:35:41',21,523,4),(20,6,12,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:36:40','2023-03-23 11:36:40',22,NULL,NULL),(21,6,12,20,1,4,NULL,NULL,NULL,'2023-03-23 11:36:53','2023-03-23 11:36:53',22,523,5),(22,7,13,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:37:47','2023-03-23 11:37:47',23,NULL,NULL),(23,7,13,22,1,4,NULL,NULL,NULL,'2023-03-23 11:38:00','2023-03-23 11:38:00',23,523,6),(24,8,14,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:38:47','2023-03-23 11:38:47',24,NULL,NULL),(25,9,15,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:39:01','2023-03-23 11:39:01',25,NULL,NULL),(26,9,15,25,1,4,NULL,NULL,NULL,'2023-03-23 11:39:14','2023-03-23 11:39:14',25,523,7),(27,10,16,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:40:13','2023-03-23 11:40:13',26,NULL,NULL),(28,10,16,27,1,4,NULL,NULL,NULL,'2023-03-23 11:40:27','2023-03-23 11:40:27',26,523,8),(29,11,17,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:41:18','2023-03-23 11:41:18',27,NULL,NULL),(30,12,18,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:41:32','2023-03-23 11:41:32',28,NULL,NULL),(31,12,18,30,1,4,NULL,NULL,NULL,'2023-03-23 11:41:47','2023-03-23 11:41:47',28,523,9),(32,13,19,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:42:15','2023-03-23 11:42:16',29,NULL,NULL),(33,13,19,32,1,4,NULL,NULL,NULL,'2023-03-23 11:42:30','2023-03-23 11:42:30',29,523,10),(34,14,20,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:44:03','2023-03-23 11:44:03',30,NULL,NULL),(35,15,21,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:44:16','2023-03-23 11:44:16',31,NULL,NULL),(36,15,21,35,1,4,NULL,NULL,NULL,'2023-03-23 11:44:31','2023-03-23 11:44:31',31,523,11),(37,16,22,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:45:24','2023-03-23 11:45:25',32,NULL,NULL),(38,17,23,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:45:38','2023-03-23 11:45:38',33,NULL,NULL),(39,17,23,38,1,4,NULL,NULL,NULL,'2023-03-23 11:45:53','2023-03-23 11:45:53',33,523,12),(40,17,24,NULL,1,10,NULL,NULL,NULL,'2023-03-23 11:46:46','2023-03-23 11:46:47',3,521,3),(41,18,25,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:48:38','2023-03-23 11:48:38',34,NULL,NULL),(42,19,26,NULL,1,2,NULL,NULL,NULL,'2023-03-23 11:49:09','2023-03-23 11:49:09',35,NULL,NULL),(43,19,26,42,1,4,NULL,NULL,NULL,'2023-03-23 11:49:24','2023-03-23 11:49:24',35,523,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (1,'alan'),(6,'amina'),(91,'antibiotics'),(58,'antimicrobial'),(4,'cape'),(99,'cases'),(98,'clinical'),(82,'coli'),(64,'coliforms'),(77,'compared'),(95,'concentration'),(25,'conclusive'),(27,'conflicting'),(108,'conjugative'),(104,'consistent'),(45,'continuous'),(40,'corporate'),(44,'decisions'),(51,'development'),(92,'difference'),(43,'distribution'),(33,'dividend'),(12,'dividends'),(31,'economists'),(15,'empirical'),(109,'encoding'),(73,'enterobacteriacea'),(81,'escherichia'),(49,'evaluation'),(16,'evidence'),(36,'existing'),(76,'faeces'),(78,'fifteen'),(30,'financial'),(42,'financing'),(22,'firm'),(46,'function'),(20,'future'),(106,'group'),(34,'guidance'),(74,'healthy'),(59,'heavy'),(68,'hospital'),(75,'human'),(80,'identified'),(29,'implications'),(113,'infection'),(67,'infections'),(94,'inhibitory'),(48,'intuitive'),(41,'investment'),(38,'investors'),(70,'iran'),(69,'isfahan'),(65,'isolated'),(79,'isolates'),(26,'issue'),(56,'karbasizaed'),(84,'kelebsiella'),(14,'literature'),(35,'management'),(7,'mansour'),(60,'metal'),(100,'metals'),(96,'mic'),(93,'minimal'),(112,'multidrug-resistance'),(90,'multiple'),(2,'mwandenga'),(8,'nicolas'),(66,'nosocomial'),(24,'offer'),(107,'pattern'),(71,'patterns'),(87,'percent'),(103,'persons'),(62,'plasmid'),(85,'pneumoniae'),(28,'policy'),(89,'possess'),(37,'potential'),(32,'practical'),(50,'professional'),(63,'profile'),(72,'profiles'),(21,'prospects'),(23,'recent'),(110,'recovered'),(114,'region'),(105,'relationship'),(47,'rely'),(83,'remaining'),(61,'resistance'),(111,'results'),(13,'review'),(9,'riouf'),(86,'seventy'),(39,'shareholding'),(19,'signal'),(17,'signaling'),(10,'signalling'),(101,'significant'),(52,'social'),(88,'strains'),(18,'suggests'),(57,'tehran'),(11,'theory'),(102,'tolerant'),(5,'town'),(53,'transformation'),(3,'university'),(55,'vajiheh'),(97,'values'),(54,'version');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (9,1,0),(9,2,1),(9,3,2),(49,3,2),(9,4,3),(9,5,4),(9,6,5),(9,7,6),(9,8,7),(9,9,8),(10,10,0),(10,11,1),(11,11,1),(10,12,2),(11,12,3),(10,13,3),(10,14,4),(10,15,5),(11,15,9),(10,16,6),(11,16,10),(11,16,13),(11,17,0),(11,18,2),(11,19,4),(11,20,5),(11,21,6),(11,22,7),(11,23,8),(11,24,11),(11,25,12),(11,26,14),(11,27,15),(11,28,16),(11,28,22),(11,29,17),(11,30,18),(11,31,19),(11,32,20),(11,33,21),(11,33,37),(11,34,23),(11,35,24),(11,35,36),(11,36,25),(11,37,26),(51,37,85),(11,38,27),(11,39,28),(11,40,29),(11,41,30),(11,42,31),(11,43,32),(11,44,33),(11,44,38),(11,45,34),(11,46,35),(11,47,39),(11,48,40),(11,49,41),(13,50,0),(13,51,1),(13,52,2),(13,53,3),(49,55,0),(49,56,1),(49,57,3),(50,58,0),(51,58,0),(51,58,67),(50,59,1),(51,59,1),(51,59,51),(51,59,58),(51,59,74),(50,60,2),(51,60,2),(51,60,59),(50,61,3),(51,61,3),(51,61,34),(51,61,68),(51,61,73),(50,62,4),(51,62,5),(51,62,64),(51,62,71),(50,63,5),(51,63,65),(50,64,6),(51,64,7),(51,64,84),(50,65,7),(51,65,9),(51,65,29),(51,65,55),(51,65,79),(50,66,8),(51,66,10),(51,66,18),(51,66,30),(51,66,80),(51,66,86),(50,67,9),(51,67,11),(51,67,19),(51,67,31),(51,67,81),(50,68,10),(51,68,56),(50,69,11),(50,70,12),(51,71,4),(51,72,6),(51,73,8),(51,74,12),(51,74,38),(51,74,60),(51,75,13),(51,75,39),(51,76,14),(51,76,40),(51,76,50),(51,77,15),(51,77,36),(51,78,16),(51,79,17),(51,80,20),(51,81,21),(51,82,22),(51,83,23),(51,84,24),(51,85,25),(51,86,26),(51,87,27),(51,88,28),(51,88,37),(51,88,47),(51,88,54),(51,88,78),(51,89,32),(51,90,33),(51,91,35),(51,91,76),(51,92,41),(51,93,42),(51,94,43),(51,95,44),(51,96,45),(51,97,46),(51,98,48),(51,99,49),(51,100,52),(51,100,75),(51,101,53),(51,102,57),(51,103,61),(51,104,62),(51,105,63),(51,106,66),(51,107,69),(51,108,70),(51,109,72),(51,110,77),(51,111,82),(51,112,83),(51,113,87),(51,114,88);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='A list of all search objects indexed in the search index';
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
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Localized data about submissions';
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
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2023-03-23 11:33:06','2023-03-23 11:27:39','2023-03-23 11:27:39',5,'en',3,'',0),(2,1,3,'2023-03-23 11:33:58','2023-03-23 11:33:25','2023-03-23 11:33:25',3,'en',1,'',0),(3,1,4,'2023-03-23 11:35:01','2023-03-23 11:34:22','2023-03-23 11:34:22',4,'en',1,'',0),(4,1,5,'2023-03-23 11:35:16','2023-03-23 11:35:16','2023-03-23 11:35:16',1,'en',1,'',0),(5,1,6,'2023-03-23 11:36:26','2023-03-23 11:35:29','2023-03-23 11:35:29',5,'en',1,'',0),(6,1,7,'2023-03-23 11:37:33','2023-03-23 11:36:41','2023-03-23 11:36:41',5,'en',1,'',0),(7,1,8,'2023-03-23 11:38:34','2023-03-23 11:37:48','2023-03-23 11:37:48',3,'en',1,'',0),(8,1,9,'2023-03-23 11:38:49','2023-03-23 11:38:49','2023-03-23 11:38:49',1,'en',1,'',0),(9,1,10,'2023-03-23 11:39:59','2023-03-23 11:39:02','2023-03-23 11:39:02',5,'en',1,'',0),(10,1,11,'2023-03-23 11:41:05','2023-03-23 11:40:14','2023-03-23 11:40:14',3,'en',1,'',0),(11,1,12,'2023-03-23 11:41:20','2023-03-23 11:41:20','2023-03-23 11:41:20',1,'en',1,'',0),(12,1,13,'2023-03-23 11:42:02','2023-03-23 11:41:33','2023-03-23 11:41:33',3,'en',1,'',0),(13,1,14,'2023-03-23 11:43:45','2023-03-23 11:42:16','2023-03-23 11:42:17',3,'en',1,'',0),(14,1,15,'2023-03-23 11:44:04','2023-03-23 11:44:04','2023-03-23 11:44:04',1,'en',1,'',0),(15,1,16,'2023-03-23 11:45:11','2023-03-23 11:44:17','2023-03-23 11:44:17',5,'en',1,'',0),(16,1,17,'2023-03-23 11:45:25','2023-03-23 11:45:25','2023-03-23 11:45:25',1,'en',1,'',0),(17,1,18,'2023-03-23 11:48:15','2023-03-23 11:45:39','2023-03-23 11:45:39',5,'en',3,'',0),(18,1,19,'2023-03-23 11:48:53','2023-03-23 11:48:39','2023-03-23 11:48:39',1,'en',4,'',0),(19,1,20,'2023-03-23 11:49:51','2023-03-23 11:49:10','2023-03-23 11:49:10',4,'en',1,'',0);
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`),
  CONSTRAINT `subscription_type_settings_type_id` FOREIGN KEY (`type_id`) REFERENCES `subscription_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about subscription types, including localized properties such as names.';
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
  PRIMARY KEY (`type_id`),
  KEY `subscription_types_journal_id` (`journal_id`),
  CONSTRAINT `subscription_types_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Subscription types represent the kinds of subscriptions that a user or institution may have, such as an annual subscription or a discounted subscription.';
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
  PRIMARY KEY (`subscription_id`),
  KEY `subscriptions_journal_id` (`journal_id`),
  KEY `subscriptions_user_id` (`user_id`),
  KEY `subscriptions_type_id` (`type_id`),
  CONSTRAINT `subscriptions_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_type_id` FOREIGN KEY (`type_id`) REFERENCES `subscription_types` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of subscriptions, both institutional and individual, for journals that use subscription-based publishing.';
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
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
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
  UNIQUE KEY `usitr_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  `issue_id` bigint(20) DEFAULT NULL,
  `issue_galley_id` bigint(20) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  KEY `usage_stats_total_temporary_records_issue_id` (`issue_id`),
  KEY `usage_stats_total_temporary_records_issue_galley_id` (`issue_galley_id`),
  KEY `usage_stats_total_temporary_records_context_id` (`context_id`),
  KEY `usage_stats_total_temporary_records_submission_id` (`submission_id`),
  KEY `usage_stats_total_temporary_records_representation_id` (`representation_id`),
  KEY `usage_stats_total_temporary_records_submission_file_id` (`submission_file_id`),
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_issue_galley_id_foreign` FOREIGN KEY (`issue_galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en','name','Site Admin'),(1,'fr_CA','name','Administrateur-trice du site'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(2,'','nameLocaleKey','default.groups.name.manager'),(2,'en','abbrev','JM'),(2,'en','name','Journal manager'),(2,'fr_CA','abbrev','DIR'),(2,'fr_CA','name','Directeur-trice de la revue'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor'),(3,'','nameLocaleKey','default.groups.name.editor'),(3,'en','abbrev','JE'),(3,'en','name','Journal editor'),(3,'fr_CA','abbrev','RÉD'),(3,'fr_CA','name','Rédacteur-trice'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor'),(4,'','nameLocaleKey','default.groups.name.productionEditor'),(4,'en','abbrev','ProdE'),(4,'en','name','Production editor'),(4,'fr_CA','abbrev','DirProd'),(4,'fr_CA','name','Directeur-trice de production'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(5,'','nameLocaleKey','default.groups.name.sectionEditor'),(5,'en','abbrev','SecE'),(5,'en','name','Section editor'),(5,'fr_CA','abbrev','RÉDRUB'),(5,'fr_CA','name','Rédacteur-trice de rubrique'),(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor'),(6,'','nameLocaleKey','default.groups.name.guestEditor'),(6,'en','abbrev','GE'),(6,'en','name','Guest editor'),(6,'fr_CA','abbrev','RÉDINV'),(6,'fr_CA','name','Rédacteur-trice invité-e'),(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor'),(7,'','nameLocaleKey','default.groups.name.copyeditor'),(7,'en','abbrev','CE'),(7,'en','name','Copyeditor'),(7,'fr_CA','abbrev','RÉV'),(7,'fr_CA','name','Réviseur-e'),(8,'','abbrevLocaleKey','default.groups.abbrev.designer'),(8,'','nameLocaleKey','default.groups.name.designer'),(8,'en','abbrev','Design'),(8,'en','name','Designer'),(8,'fr_CA','abbrev','Design'),(8,'fr_CA','name','Designer'),(9,'','abbrevLocaleKey','default.groups.abbrev.funding'),(9,'','nameLocaleKey','default.groups.name.funding'),(9,'en','abbrev','FC'),(9,'en','name','Funding coordinator'),(9,'fr_CA','abbrev','CF'),(9,'fr_CA','name','Coordonnateur-trice du financement'),(10,'','abbrevLocaleKey','default.groups.abbrev.indexer'),(10,'','nameLocaleKey','default.groups.name.indexer'),(10,'en','abbrev','IND'),(10,'en','name','Indexer'),(10,'fr_CA','abbrev','Indx'),(10,'fr_CA','name','Indexeur-e'),(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor'),(11,'','nameLocaleKey','default.groups.name.layoutEditor'),(11,'en','abbrev','LE'),(11,'en','name','Layout Editor'),(11,'fr_CA','abbrev','RespMP'),(11,'fr_CA','name','Responsable de la mise en page'),(12,'','abbrevLocaleKey','default.groups.abbrev.marketing'),(12,'','nameLocaleKey','default.groups.name.marketing'),(12,'en','abbrev','MS'),(12,'en','name','Marketing and sales coordinator'),(12,'fr_CA','abbrev','CVM'),(12,'fr_CA','name','Coordonnateur-trice des ventes et du marketing'),(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader'),(13,'','nameLocaleKey','default.groups.name.proofreader'),(13,'en','abbrev','PR'),(13,'en','name','Proofreader'),(13,'fr_CA','abbrev','CorEp'),(13,'fr_CA','name','Correcteur-trice d\'épreuves'),(14,'','abbrevLocaleKey','default.groups.abbrev.author'),(14,'','nameLocaleKey','default.groups.name.author'),(14,'en','abbrev','AU'),(14,'en','name','Author'),(14,'fr_CA','abbrev','AU'),(14,'fr_CA','name','Auteur-e'),(15,'','abbrevLocaleKey','default.groups.abbrev.translator'),(15,'','nameLocaleKey','default.groups.name.translator'),(15,'en','abbrev','Trans'),(15,'en','name','Translator'),(15,'fr_CA','abbrev','Trad'),(15,'fr_CA','name','Traducteur-trice'),(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer'),(16,'','nameLocaleKey','default.groups.name.externalReviewer'),(16,'en','abbrev','R'),(16,'en','name','Reviewer'),(16,'fr_CA','abbrev','ÉVAL'),(16,'fr_CA','name','Évaluateur-trice'),(17,'','abbrevLocaleKey','default.groups.abbrev.reader'),(17,'','nameLocaleKey','default.groups.name.reader'),(17,'en','abbrev','Read'),(17,'en','name','Reader'),(17,'fr_CA','abbrev','Lect'),(17,'fr_CA','name','Lecteur-trice'),(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager'),(18,'','nameLocaleKey','default.groups.name.subscriptionManager'),(18,'en','abbrev','SubM'),(18,'en','name','Subscription Manager'),(18,'fr_CA','abbrev','RespAB'),(18,'fr_CA','name','Responsable des abonnements');
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
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Which stages of the editorial workflow the user_groups can access.';
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,1,0,0),(2,1,16,1,1,0,1),(3,1,16,1,1,0,1),(4,1,16,1,1,0,1),(5,1,17,1,1,0,1),(6,1,17,1,1,0,0),(7,1,4097,1,1,0,0),(8,1,4097,1,1,0,0),(9,1,4097,1,1,0,0),(10,1,4097,1,1,0,0),(11,1,4097,1,1,0,0),(12,1,4097,1,1,0,0),(13,1,4097,1,1,0,0),(14,1,65536,1,1,1,0),(15,1,65536,1,1,0,0),(16,1,4096,1,1,1,0),(17,1,1048576,1,1,1,0),(18,1,2097152,1,1,0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en','familyName','admin'),(1,'en','givenName','admin'),(2,'','orcid',''),(2,'en','affiliation','Universidad Nacional Autónoma de México'),(2,'en','biography',''),(2,'en','familyName','Vaca'),(2,'en','givenName','Ramiro'),(2,'en','preferredPublicName',''),(2,'en','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','preferredPublicName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en','affiliation','University of Melbourne'),(3,'en','biography',''),(3,'en','familyName','Barnes'),(3,'en','givenName','Daniel'),(3,'en','preferredPublicName',''),(3,'en','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en','affiliation','University of Chicago'),(4,'en','biography',''),(4,'en','familyName','Buskins'),(4,'en','givenName','David'),(4,'en','preferredPublicName',''),(4,'en','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en','affiliation','University of Toronto'),(5,'en','biography',''),(5,'en','familyName','Berardo'),(5,'en','givenName','Stephanie'),(5,'en','preferredPublicName',''),(5,'en','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en','affiliation','Kyoto University'),(6,'en','biography',''),(6,'en','familyName','Inoue'),(6,'en','givenName','Minoti'),(6,'en','preferredPublicName',''),(6,'en','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(6,'fr_CA','signature',''),(7,'','orcid',''),(7,'en','affiliation','Utrecht University'),(7,'en','biography',''),(7,'en','familyName','Janssen'),(7,'en','givenName','Julie'),(7,'en','preferredPublicName',''),(7,'en','signature',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(7,'fr_CA','signature',''),(8,'','orcid',''),(8,'en','affiliation','McGill University'),(8,'en','biography',''),(8,'en','familyName','Hudson'),(8,'en','givenName','Paul'),(8,'en','preferredPublicName',''),(8,'en','signature',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(8,'fr_CA','signature',''),(9,'','orcid',''),(9,'en','affiliation','University of Manitoba'),(9,'en','biography',''),(9,'en','familyName','McCrae'),(9,'en','givenName','Aisla'),(9,'en','preferredPublicName',''),(9,'en','signature',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(9,'fr_CA','signature',''),(10,'','orcid',''),(10,'en','affiliation','State University of New York'),(10,'en','biography',''),(10,'en','familyName','Gallego'),(10,'en','givenName','Adela'),(10,'en','preferredPublicName',''),(10,'en','signature',''),(10,'fr_CA','affiliation',''),(10,'fr_CA','biography',''),(10,'fr_CA','familyName',''),(10,'fr_CA','givenName',''),(10,'fr_CA','preferredPublicName',''),(10,'fr_CA','signature',''),(11,'','orcid',''),(11,'en','affiliation','Ghent University'),(11,'en','biography',''),(11,'en','familyName','Fritz'),(11,'en','givenName','Maria'),(11,'en','preferredPublicName',''),(11,'en','signature',''),(11,'fr_CA','affiliation',''),(11,'fr_CA','biography',''),(11,'fr_CA','familyName',''),(11,'fr_CA','givenName',''),(11,'fr_CA','preferredPublicName',''),(11,'fr_CA','signature',''),(12,'','orcid',''),(12,'en','affiliation','Universidad de Chile'),(12,'en','biography',''),(12,'en','familyName','Vogt'),(12,'en','givenName','Sarah'),(12,'en','preferredPublicName',''),(12,'en','signature',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(12,'fr_CA','signature',''),(13,'','orcid',''),(13,'en','affiliation','Duke University'),(13,'en','biography',''),(13,'en','familyName','Cox'),(13,'en','givenName','Graham'),(13,'en','preferredPublicName',''),(13,'en','signature',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(13,'fr_CA','signature',''),(14,'','orcid',''),(14,'en','affiliation','University of Cape Town'),(14,'en','biography',''),(14,'en','familyName','Hellier'),(14,'en','givenName','Stephen'),(14,'en','preferredPublicName',''),(14,'en','signature',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(14,'fr_CA','signature',''),(15,'','orcid',''),(15,'en','affiliation','Imperial College London'),(15,'en','biography',''),(15,'en','familyName','Turner'),(15,'en','givenName','Catherine'),(15,'en','preferredPublicName',''),(15,'en','signature',''),(15,'fr_CA','affiliation',''),(15,'fr_CA','biography',''),(15,'fr_CA','familyName',''),(15,'fr_CA','givenName',''),(15,'fr_CA','preferredPublicName',''),(15,'fr_CA','signature',''),(16,'','orcid',''),(16,'en','affiliation','National University of Singapore'),(16,'en','biography',''),(16,'en','familyName','Kumar'),(16,'en','givenName','Sabine'),(16,'en','preferredPublicName',''),(16,'en','signature',''),(16,'fr_CA','affiliation',''),(16,'fr_CA','biography',''),(16,'fr_CA','familyName',''),(16,'fr_CA','givenName',''),(16,'fr_CA','preferredPublicName',''),(16,'fr_CA','signature',''),(17,'en','affiliation','University of Cape Town'),(17,'en','familyName','Mwandenga'),(17,'en','givenName','Alan'),(18,'en','affiliation','University of Bologna'),(18,'en','familyName','Corino'),(18,'en','givenName','Carlo'),(19,'en','affiliation','University of Windsor'),(19,'en','familyName','Kwantes'),(19,'en','givenName','Catherine'),(20,'en','affiliation','University of Alberta'),(20,'en','familyName','Montgomerie'),(20,'en','givenName','Craig'),(21,'en','affiliation','Alexandria University'),(21,'en','familyName','Diouf'),(21,'en','givenName','Diaga'),(22,'en','affiliation','University of Toronto'),(22,'en','familyName','Phillips'),(22,'en','givenName','Dana'),(23,'en','affiliation','University College Cork'),(23,'en','familyName','Sokoloff'),(23,'en','givenName','Domatilia'),(24,'en','affiliation','Indiana University'),(24,'en','familyName','Ostrom'),(24,'en','givenName','Elinor'),(25,'en','affiliation','University of Rome'),(25,'en','familyName','Paglieri'),(25,'en','givenName','Fabio'),(26,'en','affiliation','Aalborg University'),(26,'en','familyName','Novak'),(26,'en','givenName','John'),(27,'en','affiliation','Stanford University'),(27,'en','familyName','Al-Khafaji'),(27,'en','givenName','Karim'),(28,'en','affiliation','Australian National University'),(28,'en','familyName','Christopher'),(28,'en','givenName','Leo'),(29,'en','affiliation','University of Cape Town'),(29,'en','familyName','Kumiega'),(29,'en','givenName','Lise'),(30,'en','affiliation','University of Wolverhampton'),(30,'en','familyName','Daniel'),(30,'en','givenName','Patricia'),(31,'en','affiliation','University of Nairobi'),(31,'en','familyName','Baiyewu'),(31,'en','givenName','Rana'),(32,'en','affiliation','Barcelona University'),(32,'en','familyName','Rossi'),(32,'en','givenName','Rosanna'),(33,'en','affiliation','University of Tehran'),(33,'en','familyName','Karbasizaed'),(33,'en','givenName','Vajiheh'),(34,'en','affiliation','University of Windsor'),(34,'en','familyName','Williamson'),(34,'en','givenName','Valerie'),(35,'en','affiliation','CUNY'),(35,'en','familyName','Woods'),(35,'en','givenName','Zita');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to their assigned user_groups.';
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$X/1AfWiV6S4oreNYL0.oV.Cuj2/nh2.sj6Ob7Canyf.JkSMS8.W7q','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-03-23 11:21:27',NULL,'2023-03-23 11:26:20',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$TLaNXbkn84MnnZPGTO7iL.Qlny/BFiYTBDIXeuGbsTmQhfdndVgeq','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-03-23 11:23:13',NULL,'2023-03-23 11:25:32',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$J.Q5HHXQINqR3lPcStJvp.OoyicTFAhn1j6Ivuor5wTp3DPY3eNmG','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-03-23 11:23:19',NULL,'2023-03-23 11:49:12',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$4gZcDEPghWBvs0CNSFcdiuS2lBSp3yaI8KLn0vJdN3QsOgxsZzNMa','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-23 11:23:25',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$Mvj9U8yxiJsIo2jh2TR.4OYbaIoLLYgiFUQIqiSqCoOK7h.ceALaK','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-23 11:23:32',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$7zFaqdfz4r3mnq8.Zs68V.vuXrBziBrIECL8CxP3Kpx.kvvFYiQIW','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-03-23 11:23:39',NULL,'2023-03-23 11:33:48',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$V00UmmsUgU69xshcDfYyMODbstSbbhHNk/IpTMhlrR1I6QbI7TzVS','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2023-03-23 11:23:47',NULL,'2023-03-23 11:42:54',0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$kGhD.OXGoW4J0kTxbtC1eO7UFLqUn.dV4MQhFjGVWtXbpVhSxkNbi','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-23 11:23:55',NULL,'2023-03-23 11:38:24',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$SDMS9jGGua2mcuDoq39r8.GrdxvtjRnuwaXCtKn0Qd6dQH75LqCiS','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-23 11:24:03',NULL,'2023-03-23 11:43:05',0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$ZzBCbftjEj9Tt3XXOOdVOOf2GOAx6Mwf60nTnlj0j8s2jEQdSMI7K','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-23 11:24:12',NULL,'2023-03-23 11:43:16',0,NULL,NULL,0,NULL,1),(11,'mfritz','$2y$10$e/m4CH241GOORwqt5/qol.TV8jAotvJzj3EMXVnbzZB.RhoHabvP6','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2023-03-23 11:24:22',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'svogt','$2y$10$eW29OseRtDJnJ/axb/K1NeUi2o.JYCsUZaaBWSTBjHkkIJAeaMdqO','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2023-03-23 11:24:31',NULL,NULL,0,NULL,NULL,0,NULL,1),(13,'gcox','$2y$10$6RYsh3PHW.Krt8m1SodOW.qyGEoVZDtuqjQGaTxH1Hf9jQlId3Bj6','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-23 11:24:41',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'shellier','$2y$10$0S7pNM9wSY/itBxvedYtQ.jWzxaabhyq4QY90fMqTHN2.ydY.6QvO','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2023-03-23 11:24:52',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'cturner','$2y$10$JE.lI7Bxcw52OkrRG1mnref.Fb.8g7u3U0s3aEFVPAO3J9EoOcxwy','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2023-03-23 11:25:03',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'skumar','$2y$10$lPZjhp5YB.YVntQeo45rV.nwLp/vlgnBr.to5.un8Cj3SJuIA7i/K','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2023-03-23 11:25:15',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'amwandenga','$2y$10$7xvU/ENLCrz/CrIO6Sqmzu7p40HmLU/.KzyD5c5dZ9GFFWOIbkWqG','amwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2023-03-23 11:26:36',NULL,'2023-03-23 11:31:32',NULL,NULL,NULL,0,NULL,1),(18,'ccorino','$2y$10$Ekxuq71QvvwWJ1IqLICVQO866oLvqwcdW/3DF3w29M23kG5jmto0G','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2023-03-23 11:33:17',NULL,'2023-03-23 11:33:17',NULL,NULL,NULL,0,NULL,1),(19,'ckwantes','$2y$10$EM78K6KS5t/P6zc.objUb.5ORVyuKBPudZUKGd1lxp.4TZI555Mn2','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-23 11:34:14',NULL,'2023-03-23 11:34:14',NULL,NULL,NULL,0,NULL,1),(20,'cmontgomerie','$2y$10$ZJxja/sBs2K/je6aV1vFd.3Z3ug8myTC1Ra5ShaOmyvZRT4OuIoJe','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-23 11:35:08',NULL,'2023-03-23 11:35:08',NULL,NULL,NULL,0,NULL,1),(21,'ddiouf','$2y$10$ympO0aGKegTI3TcrT38GyeckUxwKdJH0E7u4Fvi5egx9KJldK7FDK','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2023-03-23 11:35:22',NULL,'2023-03-23 11:35:22',NULL,NULL,NULL,0,NULL,1),(22,'dphillips','$2y$10$IDYuIIH7bVbkAq0DNpYst.593oKPj0CiRnu3hdbrhPLaH5AKlTJD2','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-23 11:36:33',NULL,'2023-03-23 11:36:33',NULL,NULL,NULL,0,NULL,1),(23,'dsokoloff','$2y$10$pIg4YQ/A9MLAqU91NuwfFOqy/8TBEMIb0VLSDCuedXAWxIPjTazY6','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2023-03-23 11:37:40',NULL,'2023-03-23 11:37:41',NULL,NULL,NULL,0,NULL,1),(24,'eostrom','$2y$10$ibzgYdENlXjtPZxU6tqA1./O45K5fHHInwVjkdM0OZuQ6gcdfDoPu','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-03-23 11:38:41',NULL,'2023-03-23 11:38:41',NULL,NULL,NULL,0,NULL,1),(25,'fpaglieri','$2y$10$pj0HieOVEXDOWGAjWUVSX.eybG.FAHydVmq39rRaNIL/16/EzlAuy','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2023-03-23 11:38:54',NULL,'2023-03-23 11:38:55',NULL,NULL,NULL,0,NULL,1),(26,'jnovak','$2y$10$fsWpFodVwegNjOTfMxmwFuAlS155LqhXP63woNp04liAH2lamYYRy','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2023-03-23 11:40:06',NULL,'2023-03-23 11:40:06',NULL,NULL,NULL,0,NULL,1),(27,'kalkhafaji','$2y$10$uO3SFednlMuBxzMY44.DOOMjtol0uaKmV36lqkn1AayVT4evRGMPu','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-03-23 11:41:12',NULL,'2023-03-23 11:41:12',NULL,NULL,NULL,0,NULL,1),(28,'lchristopher','$2y$10$UT9TypIhcSAsSJBZRJ/08.SjcqHLtQVoxPpaFDaoR/4h8WMQA6w06','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2023-03-23 11:41:25',NULL,'2023-03-23 11:41:26',NULL,NULL,NULL,0,NULL,1),(29,'lkumiega','$2y$10$7dIdzEF3T1qnDZyAo9/woekr11pkz/HZ2QbUcGKIjpO2mdH3vzP1S','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2023-03-23 11:42:09',NULL,'2023-03-23 11:42:09',NULL,NULL,NULL,0,NULL,1),(30,'pdaniel','$2y$10$PnlG8/2LAkfTfjbvrdDdi.YBn1ke5xPtFgT/82lEu7fBLbipLf6/a','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2023-03-23 11:43:56',NULL,'2023-03-23 11:43:56',NULL,NULL,NULL,0,NULL,1),(31,'rbaiyewu','$2y$10$BDGBfcFbmV5K/x3otXs8MeyZvVMDLraxwiKvVC.UApEVzfSIj0ZYC','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2023-03-23 11:44:10',NULL,'2023-03-23 11:44:10',NULL,NULL,NULL,0,NULL,1),(32,'rrossi','$2y$10$RcniIZJ1GiMsJ0X686Nt6eAOfjKpC5KXIZlx5/6EDh8KIZezIIceG','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2023-03-23 11:45:18',NULL,'2023-03-23 11:45:18',NULL,NULL,NULL,0,NULL,1),(33,'vkarbasizaed','$2y$10$IdQARcgv9Yy1qVCaPlJZI..vxXI0kTKzPSoAwQu3AmkIcepb/27uu','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2023-03-23 11:45:31',NULL,'2023-03-23 11:45:32',NULL,NULL,NULL,0,NULL,1),(34,'vwilliamson','$2y$10$GgKjUqneNPquJ0AblFIE2eBFT7bwnHrjk8uz5nbZBs8lrlGlpisOa','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-23 11:48:32',NULL,'2023-03-23 11:48:32',NULL,NULL,NULL,0,NULL,1),(35,'zwoods','$2y$10$QBpJosEJjOuQP1WN495C..xSF/mWBYeviDkcznt3xe1do4zIFH2p6','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-03-23 11:49:02',NULL,'2023-03-23 11:49:02',NULL,NULL,NULL,0,NULL,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2023-03-23 11:21:27',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2023-03-23 11:21:27',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,1,0,0,'2023-03-23 11:21:27',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.gateways','resolver','',0,0),(1,3,4,3,'2023-03-23 11:21:27',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(2,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','datacite','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','usageEvent','',0,0),(1,1,0,0,'2023-03-23 11:21:27',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,3,0,0,'2023-03-23 11:21:27',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,1,0,'2023-03-23 11:21:27',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,1,0,'2023-03-23 11:21:27',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(1,2,0,0,'2023-03-23 11:21:27',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,1,'2023-03-23 11:21:27',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),(3,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','crossref','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2023-03-23 11:21:27',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(0,1,0,0,'2023-03-23 11:21:27',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.importexport','pubmed','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,1,0,0,'2023-03-23 11:21:27',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.reports','articles','',0,0),(2,0,1,0,'2023-03-23 11:21:27',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.reports','subscriptions','',0,0),(1,0,0,0,'2023-03-23 11:21:27',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2023-03-23 11:21:19',1,'core','ojs2','',0,1),(1,1,0,0,'2023-03-23 11:22:08',1,'plugins.importexport','doaj','',0,0);
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

-- Dump completed on 2023-03-23 11:49:55
