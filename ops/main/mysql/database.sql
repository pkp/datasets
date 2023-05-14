-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: ops-ci
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
  KEY `access_keys_user_id` (`user_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`),
  CONSTRAINT `access_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';
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
  `announcement_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcements, including localized properties like names and contents.';
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
  `announcement_type_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcement types, including localized properties like their names.';
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
  `context_id` bigint NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcement types allow for announcements to optionally be categorized.';
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
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,1,'en','affiliation','University of Bologna'),(2,1,'','country','IT'),(3,1,'en','familyName','Corino'),(4,1,'en','givenName','Carlo'),(5,2,'en','affiliation','University of Windsor'),(6,2,'','country','CA'),(7,2,'en','familyName','Kwantes'),(8,2,'en','givenName','Catherine'),(13,3,'','country','FI'),(14,3,'fr_CA','familyName',NULL),(15,3,'en','familyName','Kekkonen'),(16,3,'fr_CA','givenName',NULL),(17,3,'en','givenName','Urho'),(31,5,'en','affiliation','University of Alberta'),(32,5,'','country','CA'),(33,5,'en','familyName','Montgomerie'),(34,5,'en','givenName','Craig'),(35,6,'en','affiliation','University of Victoria'),(36,6,'','country','CA'),(37,6,'en','familyName','Irvine'),(38,6,'en','givenName','Mark'),(39,7,'en','affiliation','University of Alberta'),(40,7,'','country','CA'),(41,7,'en','familyName','Montgomerie'),(42,7,'en','givenName','Craig'),(43,8,'en','affiliation','University of Victoria'),(44,8,'','country','CA'),(45,8,'en','familyName','Irvine'),(46,8,'en','givenName','Mark'),(47,9,'en','affiliation','Alexandria University'),(48,9,'','country','EG'),(49,9,'en','familyName','Diouf'),(50,9,'en','givenName','Diaga'),(51,10,'en','affiliation','University of Toronto'),(52,10,'','country','CA'),(53,10,'en','familyName','Phillips'),(54,10,'en','givenName','Dana'),(55,11,'en','affiliation','University College Cork'),(56,11,'','country','IE'),(57,11,'en','familyName','Sokoloff'),(58,11,'en','givenName','Domatilia'),(59,12,'en','affiliation','Indiana University'),(60,12,'','country','US'),(61,12,'en','familyName','Ostrom'),(62,12,'en','givenName','Elinor'),(63,13,'en','affiliation','Indiana University'),(64,13,'','country','US'),(65,13,'en','familyName','van Laerhoven'),(66,13,'en','givenName','Frank'),(67,14,'en','affiliation','University of Rome'),(68,14,'','country','IT'),(69,14,'en','familyName','Paglieri'),(70,14,'en','givenName','Fabio'),(71,15,'en','affiliation','University of Cape Town'),(72,15,'','country','ZA'),(73,15,'en','familyName','Mwandenga'),(74,15,'en','givenName','John'),(75,16,'en','affiliation','Aalborg University'),(76,16,'','country','DK'),(77,16,'en','familyName','Novak'),(78,16,'en','givenName','John'),(79,17,'en','affiliation','Stanford University'),(80,17,'','country','US'),(81,17,'en','familyName','Al-Khafaji'),(82,17,'en','givenName','Karim'),(83,18,'en','affiliation','Stanford University'),(84,18,'','country','US'),(85,18,'en','familyName','Morse'),(86,18,'en','givenName','Margaret'),(87,19,'en','affiliation','Australian National University'),(88,19,'','country','AU'),(89,19,'en','familyName','Christopher'),(90,19,'en','givenName','Leo'),(91,20,'en','affiliation','University of Cape Town'),(92,20,'','country','ZA'),(93,20,'en','familyName','Kumiega'),(94,20,'en','givenName','Lise'),(95,21,'en','affiliation','University of Wolverhampton'),(96,21,'','country','GB'),(97,21,'en','familyName','Daniel'),(98,21,'en','givenName','Patricia'),(99,22,'en','affiliation','University of Nairobi'),(100,22,'','country','KE'),(101,22,'en','familyName','Baiyewu'),(102,22,'en','givenName','Rana'),(103,23,'en','affiliation','Barcelona University'),(104,23,'','country','ES'),(105,23,'en','familyName','Rossi'),(106,23,'en','givenName','Rosanna'),(107,24,'en','affiliation','University of Tehran'),(108,24,'','country','IR'),(109,24,'en','familyName','Karbasizaed'),(110,24,'en','givenName','Vajiheh'),(111,25,'en','affiliation','University of Windsor'),(112,25,'','country','CA'),(113,25,'en','familyName','Williamson'),(114,25,'en','givenName','Valerie'),(115,26,'en','affiliation','CUNY'),(116,26,'','country','US'),(117,26,'en','familyName','Woods'),(118,26,'en','givenName','Zita');
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
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id` (`publication_id`),
  CONSTRAINT `authors_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,0.00,4),(2,'ckwantes@mailinator.com',1,2,0.00,4),(3,'notanemailukk@mailinator.com',1,2,1.00,4),(5,'cmontgomerie@mailinator.com',1,3,0.00,4),(6,'mirvine@mailinator.com',1,3,0.00,4),(7,'cmontgomerie@mailinator.com',1,4,0.00,4),(8,'mirvine@mailinator.com',1,4,0.00,4),(9,'ddiouf@mailinator.com',1,5,0.00,4),(10,'dphillips@mailinator.com',1,6,0.00,4),(11,'dsokoloff@mailinator.com',1,7,0.00,4),(12,'eostrom@mailinator.com',1,8,0.00,4),(13,'fvanlaerhoven@mailinator.com',1,8,0.00,4),(14,'fpaglieri@mailinator.com',1,9,0.00,4),(15,'jmwandenga@mailinator.com',1,10,0.00,4),(16,'jnovak@mailinator.com',1,11,0.00,4),(17,'kalkhafaji@mailinator.com',1,12,0.00,4),(18,'mmorse@mailinator.com',1,12,0.00,4),(19,'lchristopher@mailinator.com',1,13,0.00,4),(20,'lkumiega@mailinator.com',1,14,0.00,4),(21,'pdaniel@mailinator.com',1,15,0.00,4),(22,'rbaiyewu@mailinator.com',1,16,0.00,4),(23,'rrossi@mailinator.com',1,17,0.00,4),(24,'vkarbasizaed@mailinator.com',1,18,0.00,4),(25,'vwilliamson@mailinator.com',1,19,0.00,4),(26,'zwoods@mailinator.com',1,20,0.00,4);
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
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,1,'','sortOption','title-ASC'),(2,1,'en','title','History'),(3,1,'fr_CA','title',''),(4,1,'en','description',''),(5,1,'fr_CA','description',''),(6,2,'','sortOption','title-ASC'),(7,2,'en','title','Biology'),(8,2,'fr_CA','title',''),(9,2,'en','description',''),(10,2,'fr_CA','description',''),(11,3,'','sortOption','title-ASC'),(12,3,'en','title','Social sciences'),(13,3,'fr_CA','title',''),(14,3,'en','description',''),(15,3,'fr_CA','description',''),(16,4,'','sortOption','title-ASC'),(17,4,'en','title','Mathematics'),(18,4,'fr_CA','title',''),(19,4,'en','description',''),(20,4,'fr_CA','description',''),(21,5,'','sortOption','title-ASC'),(22,5,'en','title','Cultural History'),(23,5,'fr_CA','title',''),(24,5,'en','description',''),(25,5,'fr_CA','description','');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Additional data about citations, including localized content.';
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
  `publication_id` bigint NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A citation made by an associated publication.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (3,7,1.00),(4,7,2.00),(34,12,1.00),(35,12,2.00),(36,12,3.00),(37,12,4.00),(38,12,5.00),(39,12,6.00),(40,12,7.00),(41,12,8.00),(66,17,1.00),(67,17,2.00),(68,17,3.00),(69,17,4.00),(70,17,5.00),(71,17,6.00),(72,17,7.00),(73,17,8.00),(76,32,1.00),(77,32,2.00),(81,37,1.00),(82,37,2.00),(83,37,3.00),(85,52,1.00),(90,57,1.00),(91,57,2.00),(92,57,3.00),(93,57,4.00),(96,62,1.00),(97,62,2.00),(99,67,1.00),(110,72,1.00),(111,72,2.00),(112,72,3.00),(113,72,4.00),(114,72,5.00),(115,72,6.00),(116,72,7.00),(117,72,8.00),(118,72,9.00),(119,72,10.00),(122,82,1.00),(123,82,2.00),(127,92,1.00),(128,92,2.00),(129,92,3.00),(132,97,1.00),(133,97,2.00);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (3,3,'en','submissionKeyword','employees','string'),(4,4,'en','submissionKeyword','survey','string'),(34,34,'en','submissionKeyword','Integrating Technology','string'),(35,35,'en','submissionKeyword','Computer Skills','string'),(36,36,'en','submissionKeyword','Survey','string'),(37,37,'en','submissionKeyword','Alberta','string'),(38,38,'en','submissionKeyword','National','string'),(39,39,'en','submissionKeyword','Provincial','string'),(40,40,'en','submissionKeyword','Professional Development','string'),(41,41,'en','submissionKeyword','employees','string'),(66,66,'en','submissionKeyword','Integrating Technology','string'),(67,67,'en','submissionKeyword','Computer Skills','string'),(68,68,'en','submissionKeyword','Survey','string'),(69,69,'en','submissionKeyword','Alberta','string'),(70,70,'en','submissionKeyword','National','string'),(71,71,'en','submissionKeyword','Provincial','string'),(72,72,'en','submissionKeyword','Professional Development','string'),(73,73,'en','submissionKeyword','employees','string'),(76,76,'en','submissionKeyword','education','string'),(77,77,'en','submissionKeyword','citizenship','string'),(81,81,'en','submissionKeyword','Common pool resource','string'),(82,82,'en','submissionKeyword','common property','string'),(83,83,'en','submissionKeyword','intellectual developments','string'),(85,85,'en','submissionKeyword','water','string'),(90,90,'en','submissionKeyword','Development','string'),(91,91,'en','submissionKeyword','engineering education','string'),(92,92,'en','submissionKeyword','service learning','string'),(93,93,'en','submissionKeyword','sustainability','string'),(96,96,'en','submissionKeyword','pigs','string'),(97,97,'en','submissionKeyword','food security','string'),(99,99,'en','submissionKeyword','water','string'),(110,110,'en','submissionKeyword','21st Century','string'),(111,111,'en','submissionKeyword','Diversity','string'),(112,112,'en','submissionKeyword','Multilingual','string'),(113,113,'en','submissionKeyword','Multiethnic','string'),(114,114,'en','submissionKeyword','Participatory Pedagogy','string'),(115,115,'en','submissionKeyword','Language','string'),(116,116,'en','submissionKeyword','Culture','string'),(117,117,'en','submissionKeyword','Gender','string'),(118,118,'en','submissionKeyword','Egalitarianism','string'),(119,119,'en','submissionKeyword','Social Transformation','string'),(122,122,'en','submissionKeyword','cattle','string'),(123,123,'en','submissionKeyword','food security','string'),(127,127,'en','submissionKeyword','Self-Organization','string'),(128,128,'en','submissionKeyword','Multi-Level Institutions','string'),(129,129,'en','submissionKeyword','Goverance','string'),(132,132,'en','submissionKeyword','education','string'),(133,133,'en','submissionKeyword','citizenship','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
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
  `tombstone_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about data object tombstones, including localized content.';
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about DOIs, including the registration agency.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dois` (
  `doi_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores all DOIs used in the system.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint DEFAULT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint DEFAULT NULL,
  `editor_id` bigint NOT NULL,
  `decision` smallint NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,4,NULL,5,NULL,3,8,'2023-05-14 22:15:54'),(2,4,NULL,5,NULL,3,16,'2023-05-14 22:16:02'),(3,4,NULL,5,NULL,3,8,'2023-05-14 22:16:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-05-14 22:12:59',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(2,1048585,1,0,'2023-05-14 22:12:59',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(3,1048585,1,0,'2023-05-14 22:12:59',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(4,1048585,2,0,'2023-05-14 22:14:09',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(5,1048585,2,0,'2023-05-14 22:14:09',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(6,1048585,2,0,'2023-05-14 22:14:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(7,1048585,2,0,'2023-05-14 22:14:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Urho Kekkonen\" <notanemailukk@mailinator.com>','','','Submission Acknowledgement','<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(8,1048585,3,0,'2023-05-14 22:14:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(9,1048585,3,0,'2023-05-14 22:14:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(10,1048585,3,0,'2023-05-14 22:14:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(11,1048585,3,0,'2023-05-14 22:14:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission Acknowledgement','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(12,1048585,4,0,'2023-05-14 22:15:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(13,1048585,4,0,'2023-05-14 22:15:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(14,1048585,4,0,'2023-05-14 22:15:44',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(15,1048585,4,3,'2023-05-14 22:15:54',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(16,1048585,4,3,'2023-05-14 22:16:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>\n'),(17,1048585,4,3,'2023-05-14 22:16:09',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(18,1048585,5,0,'2023-05-14 22:16:36',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(19,1048585,5,0,'2023-05-14 22:16:36',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(20,1048585,5,0,'2023-05-14 22:16:36',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(21,1048585,6,0,'2023-05-14 22:17:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(22,1048585,6,0,'2023-05-14 22:17:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(23,1048585,6,0,'2023-05-14 22:17:20',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(24,1048585,7,0,'2023-05-14 22:17:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(25,1048585,7,0,'2023-05-14 22:17:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(26,1048585,7,0,'2023-05-14 22:17:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(27,1048585,7,0,'2023-05-14 22:17:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission Acknowledgement','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(28,1048585,8,0,'2023-05-14 22:18:24',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(29,1048585,8,0,'2023-05-14 22:18:24',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(30,1048585,8,0,'2023-05-14 22:18:24',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/8\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(31,1048585,9,0,'2023-05-14 22:18:55',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(32,1048585,9,0,'2023-05-14 22:18:55',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(33,1048585,9,0,'2023-05-14 22:18:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(34,1048585,10,0,'2023-05-14 22:19:27',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(35,1048585,10,0,'2023-05-14 22:19:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(36,1048585,10,0,'2023-05-14 22:19:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(37,1048585,11,0,'2023-05-14 22:20:00',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(38,1048585,11,0,'2023-05-14 22:20:00',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(39,1048585,11,0,'2023-05-14 22:20:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(40,1048585,11,0,'2023-05-14 22:20:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission Acknowledgement','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(41,1048585,12,0,'2023-05-14 22:20:33',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(42,1048585,12,0,'2023-05-14 22:20:33',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(43,1048585,12,0,'2023-05-14 22:20:33',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(44,1048585,13,0,'2023-05-14 22:21:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(45,1048585,13,0,'2023-05-14 22:21:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(46,1048585,13,0,'2023-05-14 22:21:06',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(47,1048585,14,0,'2023-05-14 22:21:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(48,1048585,14,0,'2023-05-14 22:21:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(49,1048585,14,0,'2023-05-14 22:21:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(50,1048585,15,0,'2023-05-14 22:22:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(51,1048585,15,0,'2023-05-14 22:22:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(52,1048585,15,0,'2023-05-14 22:22:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(53,1048585,16,0,'2023-05-14 22:22:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(54,1048585,16,0,'2023-05-14 22:22:44',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(55,1048585,16,0,'2023-05-14 22:22:44',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(56,1048585,17,0,'2023-05-14 22:23:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(57,1048585,17,0,'2023-05-14 22:23:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(58,1048585,17,0,'2023-05-14 22:23:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(59,1048585,18,0,'2023-05-14 22:23:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(60,1048585,18,0,'2023-05-14 22:23:49',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(61,1048585,18,0,'2023-05-14 22:23:49',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/18\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(62,1048585,19,0,'2023-05-14 22:24:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(63,1048585,19,0,'2023-05-14 22:24:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(64,1048585,19,0,'2023-05-14 22:24:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,1,4),(2,2,5),(3,3,7),(4,4,4),(5,5,5),(6,6,8),(7,8,4),(8,9,5),(9,10,9),(10,12,4),(11,13,5),(12,14,10),(13,15,10),(14,16,10),(15,17,10),(16,18,4),(17,19,5),(18,20,11),(19,21,4),(20,22,5),(21,23,12),(22,24,4),(23,25,5),(24,26,13),(25,28,4),(26,29,5),(27,30,14),(28,31,4),(29,32,5),(30,33,15),(31,34,4),(32,35,5),(33,36,16),(34,37,4),(35,38,5),(36,39,17),(37,41,4),(38,42,5),(39,43,18),(40,44,4),(41,45,5),(42,46,19),(43,47,4),(44,48,5),(45,49,20),(46,50,4),(47,51,5),(48,52,21),(49,53,4),(50,54,5),(51,55,22),(52,56,4),(53,57,5),(54,58,23),(55,59,4),(56,60,5),(57,61,24),(58,62,4),(59,63,5),(60,64,25);
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
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Server Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$serverSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'SUBMISSION_ACK','en','Submission Acknowledgement (Pending Moderation)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),(11,'POSTED_ACK','en','Posted Acknowledgement','Preprint Posted Acknowledgement','{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}'),(13,'POSTED_NEW_VERSION_ACK','en','New Version Posted','New Version Posted Acknowledgement','<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$serverName}. The new version is now <a href=\"{$submissionPublishedUrl}\">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}'),(15,'SUBMISSION_ACK_CAN_POST','en','Submission Acknowledgement (No Moderation Required)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href=\"{$authorSubmissionUrl}\">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),(17,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission Acknowledgement','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$serverName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$serverSignature}'),(19,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),(21,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has passed moderation at {$serverName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$serverName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$serverName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(23,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(25,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(27,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(29,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Preprint Server activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href=\"{$editorialStatsLink}\">trends</a> and <a href=\"{$publicationStatsLink}\">posted preprint stats</a>. A full copy of this month\'s trends is attached.<br />\n<br />\nSincerely,<br />\n{$serverSignature}'),(31,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(33,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$serverName}','Please enter your message.'),(35,'EDITOR_ASSIGN_PRODUCTION','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),(37,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(39,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(41,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(43,'ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(45,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(47,'PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(48,'USER_REGISTER','fr_CA','','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(49,'USER_VALIDATE_CONTEXT','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}'),(50,'USER_VALIDATE_SITE','fr_CA','','',''),(51,'SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),(52,'POSTED_ACK','fr_CA','','',''),(53,'POSTED_NEW_VERSION_ACK','fr_CA','','',''),(54,'SUBMISSION_ACK_CAN_POST','fr_CA','','Accusé de réception de la soumission',''),(55,'SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),(56,'EDITOR_ASSIGN','fr_CA','','',''),(57,'EDITOR_DECISION_ACCEPT','fr_CA','','',''),(58,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$serverName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(59,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),(60,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),(61,'STATISTICS_REPORT_NOTIFICATION','fr_CA','','',''),(62,'ANNOUNCEMENT','fr_CA','','',''),(63,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$serverName}','Prière de saisir votre message.'),(64,'EDITOR_ASSIGN_PRODUCTION','fr_CA','','',''),(65,'VERSION_CREATED','fr_CA','','',''),(66,'SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),(67,'SUBMISSION_NEEDS_EDITOR','fr_CA','','',''),(68,'ORCID_COLLECT_AUTHOR_ID','fr_CA','','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(69,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
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
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2023-05-14 22:12:44',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,7,'2023-05-14 22:12:45',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,7,'2023-05-14 22:12:55',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,7,'2023-05-14 22:12:55',1342177288,'submission.event.fileRevised',0),(5,515,1,7,'2023-05-14 22:12:58',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2023-05-14 22:12:58',1342177296,'submission.event.fileEdited',0),(7,1048585,1,7,'2023-05-14 22:12:59',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2023-05-14 22:13:10',268435458,'submission.event.general.metadataUpdated',0),(9,1048585,2,8,'2023-05-14 22:13:11',268435458,'submission.event.general.metadataUpdated',0),(10,1048585,2,8,'2023-05-14 22:13:32',268435458,'submission.event.general.metadataUpdated',0),(11,515,2,8,'2023-05-14 22:13:40',1342177281,'submission.event.fileUploaded',0),(12,1048585,2,8,'2023-05-14 22:13:40',1342177288,'submission.event.fileRevised',0),(13,515,2,8,'2023-05-14 22:13:43',1342177296,'submission.event.fileEdited',0),(14,1048585,2,8,'2023-05-14 22:13:43',1342177296,'submission.event.fileEdited',0),(15,1048585,2,8,'2023-05-14 22:14:09',268435457,'submission.event.submissionSubmitted',0),(16,1048585,2,3,'2023-05-14 22:14:23',268435462,'publication.event.published',0),(17,1048585,3,9,'2023-05-14 22:14:32',268435458,'submission.event.general.metadataUpdated',0),(18,1048585,3,9,'2023-05-14 22:14:33',268435458,'submission.event.general.metadataUpdated',0),(19,515,3,9,'2023-05-14 22:14:43',1342177281,'submission.event.fileUploaded',0),(20,1048585,3,9,'2023-05-14 22:14:44',1342177288,'submission.event.fileRevised',0),(21,515,3,9,'2023-05-14 22:14:46',1342177296,'submission.event.fileEdited',0),(22,1048585,3,9,'2023-05-14 22:14:46',1342177296,'submission.event.fileEdited',0),(23,1048585,3,9,'2023-05-14 22:14:48',268435457,'submission.event.submissionSubmitted',0),(24,1048585,3,3,'2023-05-14 22:14:56',268435462,'publication.event.published',0),(25,1048585,3,3,'2023-05-14 22:15:04',268435463,'publication.event.unpublished',0),(26,1048585,3,3,'2023-05-14 22:15:07',268435458,'submission.event.general.metadataUpdated',0),(27,1048585,3,3,'2023-05-14 22:15:10',268435462,'publication.event.published',0),(28,1048585,3,3,'2023-05-14 22:15:13',268435458,'submission.event.general.metadataUpdated',0),(29,1048585,3,3,'2023-05-14 22:15:13',268435464,'publication.event.versionCreated',0),(30,1048585,3,3,'2023-05-14 22:15:17',268435458,'submission.event.general.metadataUpdated',0),(31,1048585,3,3,'2023-05-14 22:15:20',268435462,'publication.event.versionPublished',0),(32,1048585,4,10,'2023-05-14 22:15:29',268435458,'submission.event.general.metadataUpdated',0),(33,1048585,4,10,'2023-05-14 22:15:29',268435458,'submission.event.general.metadataUpdated',0),(34,515,4,10,'2023-05-14 22:15:40',1342177281,'submission.event.fileUploaded',0),(35,1048585,4,10,'2023-05-14 22:15:40',1342177288,'submission.event.fileRevised',0),(36,515,4,10,'2023-05-14 22:15:42',1342177296,'submission.event.fileEdited',0),(37,1048585,4,10,'2023-05-14 22:15:42',1342177296,'submission.event.fileEdited',0),(38,1048585,4,10,'2023-05-14 22:15:43',268435457,'submission.event.submissionSubmitted',0),(39,1048585,4,3,'2023-05-14 22:15:54',805306371,'editor.submission.decision.decline.log',0),(40,1048585,4,3,'2023-05-14 22:16:02',805306371,'editor.submission.decision.revertDecline.log',0),(41,1048585,4,3,'2023-05-14 22:16:09',805306371,'editor.submission.decision.decline.log',0),(42,1048585,5,11,'2023-05-14 22:16:21',268435458,'submission.event.general.metadataUpdated',0),(43,1048585,5,11,'2023-05-14 22:16:21',268435458,'submission.event.general.metadataUpdated',0),(44,515,5,11,'2023-05-14 22:16:32',1342177281,'submission.event.fileUploaded',0),(45,1048585,5,11,'2023-05-14 22:16:32',1342177288,'submission.event.fileRevised',0),(46,515,5,11,'2023-05-14 22:16:34',1342177296,'submission.event.fileEdited',0),(47,1048585,5,11,'2023-05-14 22:16:34',1342177296,'submission.event.fileEdited',0),(48,1048585,5,11,'2023-05-14 22:16:35',268435457,'submission.event.submissionSubmitted',0),(49,1048585,5,3,'2023-05-14 22:16:44',268435462,'publication.event.published',0),(50,1048585,5,3,'2023-05-14 22:16:50',268435463,'publication.event.unpublished',0),(51,1048585,5,3,'2023-05-14 22:16:56',268435462,'publication.event.published',0),(52,1048585,6,12,'2023-05-14 22:17:05',268435458,'submission.event.general.metadataUpdated',0),(53,1048585,6,12,'2023-05-14 22:17:06',268435458,'submission.event.general.metadataUpdated',0),(54,515,6,12,'2023-05-14 22:17:16',1342177281,'submission.event.fileUploaded',0),(55,1048585,6,12,'2023-05-14 22:17:16',1342177288,'submission.event.fileRevised',0),(56,515,6,12,'2023-05-14 22:17:19',1342177296,'submission.event.fileEdited',0),(57,1048585,6,12,'2023-05-14 22:17:19',1342177296,'submission.event.fileEdited',0),(58,1048585,6,12,'2023-05-14 22:17:20',268435457,'submission.event.submissionSubmitted',0),(59,1048585,6,3,'2023-05-14 22:17:28',268435462,'publication.event.published',0),(60,1048585,7,13,'2023-05-14 22:17:37',268435458,'submission.event.general.metadataUpdated',0),(61,1048585,7,13,'2023-05-14 22:17:37',268435458,'submission.event.general.metadataUpdated',0),(62,515,7,13,'2023-05-14 22:17:48',1342177281,'submission.event.fileUploaded',0),(63,1048585,7,13,'2023-05-14 22:17:48',1342177288,'submission.event.fileRevised',0),(64,515,7,13,'2023-05-14 22:17:50',1342177296,'submission.event.fileEdited',0),(65,1048585,7,13,'2023-05-14 22:17:50',1342177296,'submission.event.fileEdited',0),(66,1048585,7,13,'2023-05-14 22:17:52',268435457,'submission.event.submissionSubmitted',0),(67,1048585,7,3,'2023-05-14 22:18:00',268435462,'publication.event.published',0),(68,1048585,8,14,'2023-05-14 22:18:09',268435458,'submission.event.general.metadataUpdated',0),(69,1048585,8,14,'2023-05-14 22:18:10',268435458,'submission.event.general.metadataUpdated',0),(70,515,8,14,'2023-05-14 22:18:20',1342177281,'submission.event.fileUploaded',0),(71,1048585,8,14,'2023-05-14 22:18:20',1342177288,'submission.event.fileRevised',0),(72,515,8,14,'2023-05-14 22:18:23',1342177296,'submission.event.fileEdited',0),(73,1048585,8,14,'2023-05-14 22:18:23',1342177296,'submission.event.fileEdited',0),(74,1048585,8,14,'2023-05-14 22:18:24',268435457,'submission.event.submissionSubmitted',0),(75,1048585,8,3,'2023-05-14 22:18:31',268435462,'publication.event.published',0),(76,1048585,9,15,'2023-05-14 22:18:40',268435458,'submission.event.general.metadataUpdated',0),(77,1048585,9,15,'2023-05-14 22:18:41',268435458,'submission.event.general.metadataUpdated',0),(78,515,9,15,'2023-05-14 22:18:52',1342177281,'submission.event.fileUploaded',0),(79,1048585,9,15,'2023-05-14 22:18:52',1342177288,'submission.event.fileRevised',0),(80,515,9,15,'2023-05-14 22:18:54',1342177296,'submission.event.fileEdited',0),(81,1048585,9,15,'2023-05-14 22:18:54',1342177296,'submission.event.fileEdited',0),(82,1048585,9,15,'2023-05-14 22:18:55',268435457,'submission.event.submissionSubmitted',0),(83,1048585,9,3,'2023-05-14 22:19:03',268435462,'publication.event.published',0),(84,1048585,10,16,'2023-05-14 22:19:13',268435458,'submission.event.general.metadataUpdated',0),(85,1048585,10,16,'2023-05-14 22:19:13',268435458,'submission.event.general.metadataUpdated',0),(86,515,10,16,'2023-05-14 22:19:24',1342177281,'submission.event.fileUploaded',0),(87,1048585,10,16,'2023-05-14 22:19:24',1342177288,'submission.event.fileRevised',0),(88,515,10,16,'2023-05-14 22:19:26',1342177296,'submission.event.fileEdited',0),(89,1048585,10,16,'2023-05-14 22:19:26',1342177296,'submission.event.fileEdited',0),(90,1048585,10,16,'2023-05-14 22:19:27',268435457,'submission.event.submissionSubmitted',0),(91,1048585,10,3,'2023-05-14 22:19:36',268435462,'publication.event.published',0),(92,1048585,11,17,'2023-05-14 22:19:45',268435458,'submission.event.general.metadataUpdated',0),(93,1048585,11,17,'2023-05-14 22:19:45',268435458,'submission.event.general.metadataUpdated',0),(94,515,11,17,'2023-05-14 22:19:56',1342177281,'submission.event.fileUploaded',0),(95,1048585,11,17,'2023-05-14 22:19:56',1342177288,'submission.event.fileRevised',0),(96,515,11,17,'2023-05-14 22:19:59',1342177296,'submission.event.fileEdited',0),(97,1048585,11,17,'2023-05-14 22:19:59',1342177296,'submission.event.fileEdited',0),(98,1048585,11,17,'2023-05-14 22:20:00',268435457,'submission.event.submissionSubmitted',0),(99,1048585,11,3,'2023-05-14 22:20:08',268435462,'publication.event.published',0),(100,1048585,12,18,'2023-05-14 22:20:18',268435458,'submission.event.general.metadataUpdated',0),(101,1048585,12,18,'2023-05-14 22:20:18',268435458,'submission.event.general.metadataUpdated',0),(102,515,12,18,'2023-05-14 22:20:29',1342177281,'submission.event.fileUploaded',0),(103,1048585,12,18,'2023-05-14 22:20:29',1342177288,'submission.event.fileRevised',0),(104,515,12,18,'2023-05-14 22:20:31',1342177296,'submission.event.fileEdited',0),(105,1048585,12,18,'2023-05-14 22:20:31',1342177296,'submission.event.fileEdited',0),(106,1048585,12,18,'2023-05-14 22:20:32',268435457,'submission.event.submissionSubmitted',0),(107,1048585,12,3,'2023-05-14 22:20:41',268435462,'publication.event.published',0),(108,1048585,13,19,'2023-05-14 22:20:51',268435458,'submission.event.general.metadataUpdated',0),(109,1048585,13,19,'2023-05-14 22:20:51',268435458,'submission.event.general.metadataUpdated',0),(110,515,13,19,'2023-05-14 22:21:02',1342177281,'submission.event.fileUploaded',0),(111,1048585,13,19,'2023-05-14 22:21:02',1342177288,'submission.event.fileRevised',0),(112,515,13,19,'2023-05-14 22:21:04',1342177296,'submission.event.fileEdited',0),(113,1048585,13,19,'2023-05-14 22:21:04',1342177296,'submission.event.fileEdited',0),(114,1048585,13,19,'2023-05-14 22:21:06',268435457,'submission.event.submissionSubmitted',0),(115,1048585,13,3,'2023-05-14 22:21:14',268435462,'publication.event.published',0),(116,1048585,14,20,'2023-05-14 22:21:24',268435458,'submission.event.general.metadataUpdated',0),(117,1048585,14,20,'2023-05-14 22:21:24',268435458,'submission.event.general.metadataUpdated',0),(118,515,14,20,'2023-05-14 22:21:35',1342177281,'submission.event.fileUploaded',0),(119,1048585,14,20,'2023-05-14 22:21:35',1342177288,'submission.event.fileRevised',0),(120,515,14,20,'2023-05-14 22:21:37',1342177296,'submission.event.fileEdited',0),(121,1048585,14,20,'2023-05-14 22:21:38',1342177296,'submission.event.fileEdited',0),(122,1048585,14,20,'2023-05-14 22:21:39',268435457,'submission.event.submissionSubmitted',0),(123,1048585,14,3,'2023-05-14 22:21:47',268435462,'publication.event.published',0),(124,1048585,15,21,'2023-05-14 22:21:57',268435458,'submission.event.general.metadataUpdated',0),(125,1048585,15,21,'2023-05-14 22:21:57',268435458,'submission.event.general.metadataUpdated',0),(126,515,15,21,'2023-05-14 22:22:08',1342177281,'submission.event.fileUploaded',0),(127,1048585,15,21,'2023-05-14 22:22:08',1342177288,'submission.event.fileRevised',0),(128,515,15,21,'2023-05-14 22:22:10',1342177296,'submission.event.fileEdited',0),(129,1048585,15,21,'2023-05-14 22:22:10',1342177296,'submission.event.fileEdited',0),(130,1048585,15,21,'2023-05-14 22:22:11',268435457,'submission.event.submissionSubmitted',0),(131,1048585,15,3,'2023-05-14 22:22:20',268435462,'publication.event.published',0),(132,1048585,16,22,'2023-05-14 22:22:29',268435458,'submission.event.general.metadataUpdated',0),(133,1048585,16,22,'2023-05-14 22:22:30',268435458,'submission.event.general.metadataUpdated',0),(134,515,16,22,'2023-05-14 22:22:40',1342177281,'submission.event.fileUploaded',0),(135,1048585,16,22,'2023-05-14 22:22:40',1342177288,'submission.event.fileRevised',0),(136,515,16,22,'2023-05-14 22:22:43',1342177296,'submission.event.fileEdited',0),(137,1048585,16,22,'2023-05-14 22:22:43',1342177296,'submission.event.fileEdited',0),(138,1048585,16,22,'2023-05-14 22:22:44',268435457,'submission.event.submissionSubmitted',0),(139,1048585,16,3,'2023-05-14 22:22:53',268435462,'publication.event.published',0),(140,1048585,17,23,'2023-05-14 22:23:02',268435458,'submission.event.general.metadataUpdated',0),(141,1048585,17,23,'2023-05-14 22:23:02',268435458,'submission.event.general.metadataUpdated',0),(142,515,17,23,'2023-05-14 22:23:13',1342177281,'submission.event.fileUploaded',0),(143,1048585,17,23,'2023-05-14 22:23:13',1342177288,'submission.event.fileRevised',0),(144,515,17,23,'2023-05-14 22:23:15',1342177296,'submission.event.fileEdited',0),(145,1048585,17,23,'2023-05-14 22:23:15',1342177296,'submission.event.fileEdited',0),(146,1048585,17,23,'2023-05-14 22:23:16',268435457,'submission.event.submissionSubmitted',0),(147,1048585,17,3,'2023-05-14 22:23:25',268435462,'publication.event.published',0),(148,1048585,18,24,'2023-05-14 22:23:34',268435458,'submission.event.general.metadataUpdated',0),(149,1048585,18,24,'2023-05-14 22:23:35',268435458,'submission.event.general.metadataUpdated',0),(150,515,18,24,'2023-05-14 22:23:45',1342177281,'submission.event.fileUploaded',0),(151,1048585,18,24,'2023-05-14 22:23:45',1342177288,'submission.event.fileRevised',0),(152,515,18,24,'2023-05-14 22:23:48',1342177296,'submission.event.fileEdited',0),(153,1048585,18,24,'2023-05-14 22:23:48',1342177296,'submission.event.fileEdited',0),(154,1048585,18,24,'2023-05-14 22:23:49',268435457,'submission.event.submissionSubmitted',0),(155,1048585,18,3,'2023-05-14 22:23:57',268435462,'publication.event.published',0),(156,1048585,19,25,'2023-05-14 22:24:07',268435458,'submission.event.general.metadataUpdated',0),(157,1048585,19,25,'2023-05-14 22:24:07',268435458,'submission.event.general.metadataUpdated',0),(158,515,19,25,'2023-05-14 22:24:18',1342177281,'submission.event.fileUploaded',0),(159,1048585,19,25,'2023-05-14 22:24:18',1342177288,'submission.event.fileRevised',0),(160,515,19,25,'2023-05-14 22:24:20',1342177296,'submission.event.fileEdited',0),(161,1048585,19,25,'2023-05-14 22:24:20',1342177296,'submission.event.fileEdited',0),(162,1048585,19,25,'2023-05-14 22:24:21',268435457,'submission.event.submissionSubmitted',0),(163,1048585,19,3,'2023-05-14 22:24:30',268435462,'publication.event.published',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb3 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'fileStage','10','int'),(2,3,'sourceSubmissionFileId',NULL,'string'),(3,3,'submissionFileId','1','int'),(4,3,'fileId','1','int'),(5,3,'submissionId','1','int'),(6,3,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(7,3,'username','ccorino','string'),(8,4,'fileStage','10','int'),(9,4,'submissionFileId','1','int'),(10,4,'fileId','1','int'),(11,4,'submissionId','1','int'),(12,4,'username','ccorino','string'),(13,4,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(14,5,'fileStage','10','int'),(15,5,'sourceSubmissionFileId',NULL,'string'),(16,5,'submissionFileId','1','int'),(17,5,'fileId','1','int'),(18,5,'submissionId','1','int'),(19,5,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(20,5,'username','ccorino','string'),(21,6,'fileStage','10','int'),(22,6,'sourceSubmissionFileId',NULL,'string'),(23,6,'submissionFileId','1','int'),(24,6,'fileId','1','int'),(25,6,'submissionId','1','int'),(26,6,'username','ccorino','string'),(27,6,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(28,6,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(29,11,'fileStage','10','int'),(30,11,'sourceSubmissionFileId',NULL,'string'),(31,11,'submissionFileId','2','int'),(32,11,'fileId','2','int'),(33,11,'submissionId','2','int'),(34,11,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(35,11,'username','ckwantes','string'),(36,12,'fileStage','10','int'),(37,12,'submissionFileId','2','int'),(38,12,'fileId','2','int'),(39,12,'submissionId','2','int'),(40,12,'username','ckwantes','string'),(41,12,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(42,13,'fileStage','10','int'),(43,13,'sourceSubmissionFileId',NULL,'string'),(44,13,'submissionFileId','2','int'),(45,13,'fileId','2','int'),(46,13,'submissionId','2','int'),(47,13,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(48,13,'username','ckwantes','string'),(49,14,'fileStage','10','int'),(50,14,'sourceSubmissionFileId',NULL,'string'),(51,14,'submissionFileId','2','int'),(52,14,'fileId','2','int'),(53,14,'submissionId','2','int'),(54,14,'username','ckwantes','string'),(55,14,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(56,14,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(57,19,'fileStage','10','int'),(58,19,'sourceSubmissionFileId',NULL,'string'),(59,19,'submissionFileId','3','int'),(60,19,'fileId','3','int'),(61,19,'submissionId','3','int'),(62,19,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(63,19,'username','cmontgomerie','string'),(64,20,'fileStage','10','int'),(65,20,'submissionFileId','3','int'),(66,20,'fileId','3','int'),(67,20,'submissionId','3','int'),(68,20,'username','cmontgomerie','string'),(69,20,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(70,21,'fileStage','10','int'),(71,21,'sourceSubmissionFileId',NULL,'string'),(72,21,'submissionFileId','3','int'),(73,21,'fileId','3','int'),(74,21,'submissionId','3','int'),(75,21,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(76,21,'username','cmontgomerie','string'),(77,22,'fileStage','10','int'),(78,22,'sourceSubmissionFileId',NULL,'string'),(79,22,'submissionFileId','3','int'),(80,22,'fileId','3','int'),(81,22,'submissionId','3','int'),(82,22,'username','cmontgomerie','string'),(83,22,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(84,22,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(85,34,'fileStage','10','int'),(86,34,'sourceSubmissionFileId',NULL,'string'),(87,34,'submissionFileId','4','int'),(88,34,'fileId','4','int'),(89,34,'submissionId','4','int'),(90,34,'originalFileName','Genetic transformation of forest trees.pdf','string'),(91,34,'username','ddiouf','string'),(92,35,'fileStage','10','int'),(93,35,'submissionFileId','4','int'),(94,35,'fileId','4','int'),(95,35,'submissionId','4','int'),(96,35,'username','ddiouf','string'),(97,35,'name','Genetic transformation of forest trees.pdf','string'),(98,36,'fileStage','10','int'),(99,36,'sourceSubmissionFileId',NULL,'string'),(100,36,'submissionFileId','4','int'),(101,36,'fileId','4','int'),(102,36,'submissionId','4','int'),(103,36,'originalFileName','Genetic transformation of forest trees.pdf','string'),(104,36,'username','ddiouf','string'),(105,37,'fileStage','10','int'),(106,37,'sourceSubmissionFileId',NULL,'string'),(107,37,'submissionFileId','4','int'),(108,37,'fileId','4','int'),(109,37,'submissionId','4','int'),(110,37,'username','ddiouf','string'),(111,37,'originalFileName','Genetic transformation of forest trees.pdf','string'),(112,37,'name','Genetic transformation of forest trees.pdf','string'),(113,39,'editorId','3','int'),(114,39,'editorName','Daniel Barnes','string'),(115,39,'submissionId','4','int'),(116,39,'decision','8','int'),(117,40,'editorId','3','int'),(118,40,'editorName','Daniel Barnes','string'),(119,40,'submissionId','4','int'),(120,40,'decision','16','int'),(121,41,'editorId','3','int'),(122,41,'editorName','Daniel Barnes','string'),(123,41,'submissionId','4','int'),(124,41,'decision','8','int'),(125,44,'fileStage','10','int'),(126,44,'sourceSubmissionFileId',NULL,'string'),(127,44,'submissionFileId','5','int'),(128,44,'fileId','5','int'),(129,44,'submissionId','5','int'),(130,44,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(131,44,'username','dphillips','string'),(132,45,'fileStage','10','int'),(133,45,'submissionFileId','5','int'),(134,45,'fileId','5','int'),(135,45,'submissionId','5','int'),(136,45,'username','dphillips','string'),(137,45,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(138,46,'fileStage','10','int'),(139,46,'sourceSubmissionFileId',NULL,'string'),(140,46,'submissionFileId','5','int'),(141,46,'fileId','5','int'),(142,46,'submissionId','5','int'),(143,46,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(144,46,'username','dphillips','string'),(145,47,'fileStage','10','int'),(146,47,'sourceSubmissionFileId',NULL,'string'),(147,47,'submissionFileId','5','int'),(148,47,'fileId','5','int'),(149,47,'submissionId','5','int'),(150,47,'username','dphillips','string'),(151,47,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(152,47,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(153,54,'fileStage','10','int'),(154,54,'sourceSubmissionFileId',NULL,'string'),(155,54,'submissionFileId','6','int'),(156,54,'fileId','6','int'),(157,54,'submissionId','6','int'),(158,54,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(159,54,'username','dsokoloff','string'),(160,55,'fileStage','10','int'),(161,55,'submissionFileId','6','int'),(162,55,'fileId','6','int'),(163,55,'submissionId','6','int'),(164,55,'username','dsokoloff','string'),(165,55,'name','Developing efficacy beliefs in the classroom.pdf','string'),(166,56,'fileStage','10','int'),(167,56,'sourceSubmissionFileId',NULL,'string'),(168,56,'submissionFileId','6','int'),(169,56,'fileId','6','int'),(170,56,'submissionId','6','int'),(171,56,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(172,56,'username','dsokoloff','string'),(173,57,'fileStage','10','int'),(174,57,'sourceSubmissionFileId',NULL,'string'),(175,57,'submissionFileId','6','int'),(176,57,'fileId','6','int'),(177,57,'submissionId','6','int'),(178,57,'username','dsokoloff','string'),(179,57,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(180,57,'name','Developing efficacy beliefs in the classroom.pdf','string'),(181,62,'fileStage','10','int'),(182,62,'sourceSubmissionFileId',NULL,'string'),(183,62,'submissionFileId','7','int'),(184,62,'fileId','7','int'),(185,62,'submissionId','7','int'),(186,62,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(187,62,'username','eostrom','string'),(188,63,'fileStage','10','int'),(189,63,'submissionFileId','7','int'),(190,63,'fileId','7','int'),(191,63,'submissionId','7','int'),(192,63,'username','eostrom','string'),(193,63,'name','Developing efficacy beliefs in the classroom.pdf','string'),(194,64,'fileStage','10','int'),(195,64,'sourceSubmissionFileId',NULL,'string'),(196,64,'submissionFileId','7','int'),(197,64,'fileId','7','int'),(198,64,'submissionId','7','int'),(199,64,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(200,64,'username','eostrom','string'),(201,65,'fileStage','10','int'),(202,65,'sourceSubmissionFileId',NULL,'string'),(203,65,'submissionFileId','7','int'),(204,65,'fileId','7','int'),(205,65,'submissionId','7','int'),(206,65,'username','eostrom','string'),(207,65,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(208,65,'name','Developing efficacy beliefs in the classroom.pdf','string'),(209,70,'fileStage','10','int'),(210,70,'sourceSubmissionFileId',NULL,'string'),(211,70,'submissionFileId','8','int'),(212,70,'fileId','8','int'),(213,70,'submissionId','8','int'),(214,70,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(215,70,'username','fpaglieri','string'),(216,71,'fileStage','10','int'),(217,71,'submissionFileId','8','int'),(218,71,'fileId','8','int'),(219,71,'submissionId','8','int'),(220,71,'username','fpaglieri','string'),(221,71,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(222,72,'fileStage','10','int'),(223,72,'sourceSubmissionFileId',NULL,'string'),(224,72,'submissionFileId','8','int'),(225,72,'fileId','8','int'),(226,72,'submissionId','8','int'),(227,72,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(228,72,'username','fpaglieri','string'),(229,73,'fileStage','10','int'),(230,73,'sourceSubmissionFileId',NULL,'string'),(231,73,'submissionFileId','8','int'),(232,73,'fileId','8','int'),(233,73,'submissionId','8','int'),(234,73,'username','fpaglieri','string'),(235,73,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(236,73,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(237,78,'fileStage','10','int'),(238,78,'sourceSubmissionFileId',NULL,'string'),(239,78,'submissionFileId','9','int'),(240,78,'fileId','9','int'),(241,78,'submissionId','9','int'),(242,78,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(243,78,'username','jmwandenga','string'),(244,79,'fileStage','10','int'),(245,79,'submissionFileId','9','int'),(246,79,'fileId','9','int'),(247,79,'submissionId','9','int'),(248,79,'username','jmwandenga','string'),(249,79,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(250,80,'fileStage','10','int'),(251,80,'sourceSubmissionFileId',NULL,'string'),(252,80,'submissionFileId','9','int'),(253,80,'fileId','9','int'),(254,80,'submissionId','9','int'),(255,80,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(256,80,'username','jmwandenga','string'),(257,81,'fileStage','10','int'),(258,81,'sourceSubmissionFileId',NULL,'string'),(259,81,'submissionFileId','9','int'),(260,81,'fileId','9','int'),(261,81,'submissionId','9','int'),(262,81,'username','jmwandenga','string'),(263,81,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(264,81,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(265,86,'fileStage','10','int'),(266,86,'sourceSubmissionFileId',NULL,'string'),(267,86,'submissionFileId','10','int'),(268,86,'fileId','10','int'),(269,86,'submissionId','10','int'),(270,86,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(271,86,'username','jnovak','string'),(272,87,'fileStage','10','int'),(273,87,'submissionFileId','10','int'),(274,87,'fileId','10','int'),(275,87,'submissionId','10','int'),(276,87,'username','jnovak','string'),(277,87,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(278,88,'fileStage','10','int'),(279,88,'sourceSubmissionFileId',NULL,'string'),(280,88,'submissionFileId','10','int'),(281,88,'fileId','10','int'),(282,88,'submissionId','10','int'),(283,88,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(284,88,'username','jnovak','string'),(285,89,'fileStage','10','int'),(286,89,'sourceSubmissionFileId',NULL,'string'),(287,89,'submissionFileId','10','int'),(288,89,'fileId','10','int'),(289,89,'submissionId','10','int'),(290,89,'username','jnovak','string'),(291,89,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(292,89,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(293,94,'fileStage','10','int'),(294,94,'sourceSubmissionFileId',NULL,'string'),(295,94,'submissionFileId','11','int'),(296,94,'fileId','11','int'),(297,94,'submissionId','11','int'),(298,94,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(299,94,'username','kalkhafaji','string'),(300,95,'fileStage','10','int'),(301,95,'submissionFileId','11','int'),(302,95,'fileId','11','int'),(303,95,'submissionId','11','int'),(304,95,'username','kalkhafaji','string'),(305,95,'name','Learning Sustainable Design through Service.pdf','string'),(306,96,'fileStage','10','int'),(307,96,'sourceSubmissionFileId',NULL,'string'),(308,96,'submissionFileId','11','int'),(309,96,'fileId','11','int'),(310,96,'submissionId','11','int'),(311,96,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(312,96,'username','kalkhafaji','string'),(313,97,'fileStage','10','int'),(314,97,'sourceSubmissionFileId',NULL,'string'),(315,97,'submissionFileId','11','int'),(316,97,'fileId','11','int'),(317,97,'submissionId','11','int'),(318,97,'username','kalkhafaji','string'),(319,97,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(320,97,'name','Learning Sustainable Design through Service.pdf','string'),(321,102,'fileStage','10','int'),(322,102,'sourceSubmissionFileId',NULL,'string'),(323,102,'submissionFileId','12','int'),(324,102,'fileId','12','int'),(325,102,'submissionId','12','int'),(326,102,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(327,102,'username','lchristopher','string'),(328,103,'fileStage','10','int'),(329,103,'submissionFileId','12','int'),(330,103,'fileId','12','int'),(331,103,'submissionId','12','int'),(332,103,'username','lchristopher','string'),(333,103,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(334,104,'fileStage','10','int'),(335,104,'sourceSubmissionFileId',NULL,'string'),(336,104,'submissionFileId','12','int'),(337,104,'fileId','12','int'),(338,104,'submissionId','12','int'),(339,104,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(340,104,'username','lchristopher','string'),(341,105,'fileStage','10','int'),(342,105,'sourceSubmissionFileId',NULL,'string'),(343,105,'submissionFileId','12','int'),(344,105,'fileId','12','int'),(345,105,'submissionId','12','int'),(346,105,'username','lchristopher','string'),(347,105,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(348,105,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(349,110,'fileStage','10','int'),(350,110,'sourceSubmissionFileId',NULL,'string'),(351,110,'submissionFileId','13','int'),(352,110,'fileId','13','int'),(353,110,'submissionId','13','int'),(354,110,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(355,110,'username','lkumiega','string'),(356,111,'fileStage','10','int'),(357,111,'submissionFileId','13','int'),(358,111,'fileId','13','int'),(359,111,'submissionId','13','int'),(360,111,'username','lkumiega','string'),(361,111,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(362,112,'fileStage','10','int'),(363,112,'sourceSubmissionFileId',NULL,'string'),(364,112,'submissionFileId','13','int'),(365,112,'fileId','13','int'),(366,112,'submissionId','13','int'),(367,112,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(368,112,'username','lkumiega','string'),(369,113,'fileStage','10','int'),(370,113,'sourceSubmissionFileId',NULL,'string'),(371,113,'submissionFileId','13','int'),(372,113,'fileId','13','int'),(373,113,'submissionId','13','int'),(374,113,'username','lkumiega','string'),(375,113,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(376,113,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(377,118,'fileStage','10','int'),(378,118,'sourceSubmissionFileId',NULL,'string'),(379,118,'submissionFileId','14','int'),(380,118,'fileId','14','int'),(381,118,'submissionId','14','int'),(382,118,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(383,118,'username','pdaniel','string'),(384,119,'fileStage','10','int'),(385,119,'submissionFileId','14','int'),(386,119,'fileId','14','int'),(387,119,'submissionId','14','int'),(388,119,'username','pdaniel','string'),(389,119,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(390,120,'fileStage','10','int'),(391,120,'sourceSubmissionFileId',NULL,'string'),(392,120,'submissionFileId','14','int'),(393,120,'fileId','14','int'),(394,120,'submissionId','14','int'),(395,120,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(396,120,'username','pdaniel','string'),(397,121,'fileStage','10','int'),(398,121,'sourceSubmissionFileId',NULL,'string'),(399,121,'submissionFileId','14','int'),(400,121,'fileId','14','int'),(401,121,'submissionId','14','int'),(402,121,'username','pdaniel','string'),(403,121,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(404,121,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(405,126,'fileStage','10','int'),(406,126,'sourceSubmissionFileId',NULL,'string'),(407,126,'submissionFileId','15','int'),(408,126,'fileId','15','int'),(409,126,'submissionId','15','int'),(410,126,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(411,126,'username','rbaiyewu','string'),(412,127,'fileStage','10','int'),(413,127,'submissionFileId','15','int'),(414,127,'fileId','15','int'),(415,127,'submissionId','15','int'),(416,127,'username','rbaiyewu','string'),(417,127,'name','Yam diseases and its management in Nigeria.pdf','string'),(418,128,'fileStage','10','int'),(419,128,'sourceSubmissionFileId',NULL,'string'),(420,128,'submissionFileId','15','int'),(421,128,'fileId','15','int'),(422,128,'submissionId','15','int'),(423,128,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(424,128,'username','rbaiyewu','string'),(425,129,'fileStage','10','int'),(426,129,'sourceSubmissionFileId',NULL,'string'),(427,129,'submissionFileId','15','int'),(428,129,'fileId','15','int'),(429,129,'submissionId','15','int'),(430,129,'username','rbaiyewu','string'),(431,129,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(432,129,'name','Yam diseases and its management in Nigeria.pdf','string'),(433,134,'fileStage','10','int'),(434,134,'sourceSubmissionFileId',NULL,'string'),(435,134,'submissionFileId','16','int'),(436,134,'fileId','16','int'),(437,134,'submissionId','16','int'),(438,134,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(439,134,'username','rrossi','string'),(440,135,'fileStage','10','int'),(441,135,'submissionFileId','16','int'),(442,135,'fileId','16','int'),(443,135,'submissionId','16','int'),(444,135,'username','rrossi','string'),(445,135,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(446,136,'fileStage','10','int'),(447,136,'sourceSubmissionFileId',NULL,'string'),(448,136,'submissionFileId','16','int'),(449,136,'fileId','16','int'),(450,136,'submissionId','16','int'),(451,136,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(452,136,'username','rrossi','string'),(453,137,'fileStage','10','int'),(454,137,'sourceSubmissionFileId',NULL,'string'),(455,137,'submissionFileId','16','int'),(456,137,'fileId','16','int'),(457,137,'submissionId','16','int'),(458,137,'username','rrossi','string'),(459,137,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(460,137,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(461,142,'fileStage','10','int'),(462,142,'sourceSubmissionFileId',NULL,'string'),(463,142,'submissionFileId','17','int'),(464,142,'fileId','17','int'),(465,142,'submissionId','17','int'),(466,142,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(467,142,'username','vkarbasizaed','string'),(468,143,'fileStage','10','int'),(469,143,'submissionFileId','17','int'),(470,143,'fileId','17','int'),(471,143,'submissionId','17','int'),(472,143,'username','vkarbasizaed','string'),(473,143,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(474,144,'fileStage','10','int'),(475,144,'sourceSubmissionFileId',NULL,'string'),(476,144,'submissionFileId','17','int'),(477,144,'fileId','17','int'),(478,144,'submissionId','17','int'),(479,144,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(480,144,'username','vkarbasizaed','string'),(481,145,'fileStage','10','int'),(482,145,'sourceSubmissionFileId',NULL,'string'),(483,145,'submissionFileId','17','int'),(484,145,'fileId','17','int'),(485,145,'submissionId','17','int'),(486,145,'username','vkarbasizaed','string'),(487,145,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(488,145,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(489,150,'fileStage','10','int'),(490,150,'sourceSubmissionFileId',NULL,'string'),(491,150,'submissionFileId','18','int'),(492,150,'fileId','18','int'),(493,150,'submissionId','18','int'),(494,150,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(495,150,'username','vwilliamson','string'),(496,151,'fileStage','10','int'),(497,151,'submissionFileId','18','int'),(498,151,'fileId','18','int'),(499,151,'submissionId','18','int'),(500,151,'username','vwilliamson','string'),(501,151,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(502,152,'fileStage','10','int'),(503,152,'sourceSubmissionFileId',NULL,'string'),(504,152,'submissionFileId','18','int'),(505,152,'fileId','18','int'),(506,152,'submissionId','18','int'),(507,152,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(508,152,'username','vwilliamson','string'),(509,153,'fileStage','10','int'),(510,153,'sourceSubmissionFileId',NULL,'string'),(511,153,'submissionFileId','18','int'),(512,153,'fileId','18','int'),(513,153,'submissionId','18','int'),(514,153,'username','vwilliamson','string'),(515,153,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(516,153,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(517,158,'fileStage','10','int'),(518,158,'sourceSubmissionFileId',NULL,'string'),(519,158,'submissionFileId','19','int'),(520,158,'fileId','19','int'),(521,158,'submissionId','19','int'),(522,158,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(523,158,'username','zwoods','string'),(524,159,'fileStage','10','int'),(525,159,'submissionFileId','19','int'),(526,159,'fileId','19','int'),(527,159,'submissionId','19','int'),(528,159,'username','zwoods','string'),(529,159,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(530,160,'fileStage','10','int'),(531,160,'sourceSubmissionFileId',NULL,'string'),(532,160,'submissionFileId','19','int'),(533,160,'fileId','19','int'),(534,160,'submissionId','19','int'),(535,160,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(536,160,'username','zwoods','string'),(537,161,'fileStage','10','int'),(538,161,'sourceSubmissionFileId',NULL,'string'),(539,161,'submissionFileId','19','int'),(540,161,'fileId','19','int'),(541,161,'submissionId','19','int'),(542,161,'username','zwoods','string'),(543,161,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(544,161,'name','Finocchiaro: Arguments About Arguments.pdf','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A log of all failed jobs.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/64615ce7cbed9.pdf','application/pdf'),(2,'contexts/1/submissions/2/64615d14a0d5b.pdf','application/pdf'),(3,'contexts/1/submissions/3/64615d53ed7e3.pdf','application/pdf'),(4,'contexts/1/submissions/4/64615d8c713bf.pdf','application/pdf'),(5,'contexts/1/submissions/5/64615dc05018e.pdf','application/pdf'),(6,'contexts/1/submissions/6/64615decbfed2.pdf','application/pdf'),(7,'contexts/1/submissions/7/64615e0c5e8aa.pdf','application/pdf'),(8,'contexts/1/submissions/8/64615e2cb1437.pdf','application/pdf'),(9,'contexts/1/submissions/9/64615e4bef7c5.pdf','application/pdf'),(10,'contexts/1/submissions/10/64615e6c275e0.pdf','application/pdf'),(11,'contexts/1/submissions/11/64615e8c9caee.pdf','application/pdf'),(12,'contexts/1/submissions/12/64615ead16f08.pdf','application/pdf'),(13,'contexts/1/submissions/13/64615ece6acc7.pdf','application/pdf'),(14,'contexts/1/submissions/14/64615eef7dc50.pdf','application/pdf'),(15,'contexts/1/submissions/15/64615f101e512.pdf','application/pdf'),(16,'contexts/1/submissions/16/64615f30ca8cc.pdf','application/pdf'),(17,'contexts/1/submissions/17/64615f514eb9a.pdf','application/pdf'),(18,'contexts/1/submissions/18/64615f719e35b.pdf','application/pdf'),(19,'contexts/1/submissions/19/64615f926f9f6.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PREPRINT)'),(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about filters, including localized content.';
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
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Crossref XML preprint export','APP\\plugins\\generic\\crossref\\filter\\PreprintCrossrefXmlFilter',0,0,0),(2,2,0,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPreprintAdapter',0,0,0),(3,3,0,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\PreprintNativeXmlFilter',0,0,0),(4,4,0,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFilter',0,0,0),(5,5,0,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,0,0),(6,6,0,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,0,0),(7,8,0,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFileFilter',0,0,0),(8,7,0,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,0,0),(9,9,0,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PreprintGalleyNativeXmlFilter',0,0,0),(10,10,0,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintGalleyFilter',0,0,0),(11,11,0,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,0,0),(12,12,0,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,1,'en','name','Preprint Text','string'),(2,1,'fr_CA','name','Texte de la prépublication','string'),(3,2,'en','name','Research Instrument','string'),(4,2,'fr_CA','name','##default.genres.researchInstrument##','string'),(5,3,'en','name','Research Materials','string'),(6,3,'fr_CA','name','##default.genres.researchMaterials##','string'),(7,4,'en','name','Research Results','string'),(8,4,'fr_CA','name','##default.genres.researchResults##','string'),(9,5,'en','name','Transcripts','string'),(10,5,'fr_CA','name','##default.genres.transcripts##','string'),(11,6,'en','name','Data Analysis','string'),(12,6,'fr_CA','name','##default.genres.dataAnalysis##','string'),(13,7,'en','name','Data Set','string'),(14,7,'fr_CA','name','##default.genres.dataSet##','string'),(15,8,'en','name','Source Texts','string'),(16,8,'fr_CA','name','##default.genres.sourceTexts##','string'),(17,9,'en','name','Multimedia','string'),(18,9,'fr_CA','name','Multimédias','string'),(19,10,'en','name','Image','string'),(20,10,'fr_CA','name','Image','string'),(21,11,'en','name','HTML Stylesheet','string'),(22,11,'fr_CA','name','Feuille de style HTML','string'),(23,12,'en','name','Other','string'),(24,12,'fr_CA','name','Autre','string');
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
  `required` smallint NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint NOT NULL,
  `ip_end` bigint DEFAULT NULL,
  PRIMARY KEY (`institution_ip_id`),
  KEY `institution_ip_institution_id` (`institution_id`),
  KEY `institution_ip_start` (`ip_start`),
  KEY `institution_ip_end` (`ip_end`),
  CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records IP address ranges and associates them with institutions.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about institutions, including localized properties like names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_settings`
--

LOCK TABLES `institution_settings` WRITE;
/*!40000 ALTER TABLE `institution_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `institution_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('992b0f3f-c07a-410a-9acd-e3797edebdeb','',0,0,0,'[]','a:0:{}',NULL,1684102184,NULL);
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COMMENT='All pending or in-progress jobs.';
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
  `library_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about library files, including localized content such as names.';
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
  `submission_id` bigint DEFAULT NULL,
  `public_access` smallint DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of the homepage.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_daily_id`),
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_monthly`
--

LOCK TABLES `metrics_counter_submission_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission`
--

DROP TABLE IF EXISTS `metrics_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `file_type` bigint DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_submission_id`),
  KEY `ms_load_id` (`load_id`),
  KEY `metrics_submission_context_id` (`context_id`),
  KEY `metrics_submission_submission_id` (`submission_id`),
  KEY `metrics_submission_representation_id` (`representation_id`),
  KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`),
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views and downloads of published submissions and galleys.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`,`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `msgd_context_id` (`context_id`),
  KEY `msgd_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and galleys.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`,`month`),
  KEY `msgm_context_id` (`context_id`),
  KEY `msgm_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and galleys.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
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
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='Links navigation menu items to navigation menus.';
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
  `navigation_menu_item_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu items, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,1,'','titleLocaleKey','navigation.register','string'),(2,2,'','titleLocaleKey','navigation.login','string'),(3,3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,4,'','titleLocaleKey','navigation.dashboard','string'),(5,5,'','titleLocaleKey','common.viewProfile','string'),(6,6,'','titleLocaleKey','navigation.admin','string'),(7,7,'','titleLocaleKey','user.logOut','string'),(8,8,'','titleLocaleKey','navigation.register','string'),(9,9,'','titleLocaleKey','navigation.login','string'),(10,10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,11,'','titleLocaleKey','navigation.dashboard','string'),(12,12,'','titleLocaleKey','common.viewProfile','string'),(13,13,'','titleLocaleKey','navigation.admin','string'),(14,14,'','titleLocaleKey','user.logOut','string'),(15,15,'','titleLocaleKey','manager.announcements','string'),(16,16,'','titleLocaleKey','navigation.archives','string'),(17,17,'','titleLocaleKey','navigation.about','string'),(18,18,'','titleLocaleKey','about.aboutContext','string'),(19,19,'','titleLocaleKey','about.submissions','string'),(20,20,'','titleLocaleKey','about.editorialTeam','string'),(21,21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,22,'','titleLocaleKey','about.contact','string'),(23,23,'','titleLocaleKey','common.search','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menu items are single elements within a navigation menu.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
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
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='More data about notifications, including localized properties.';
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
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint NOT NULL,
  `context` bigint NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context`),
  CONSTRAINT `notification_subscription_settings_context_foreign` FOREIGN KEY (`context`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` bigint NOT NULL,
  `type` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,NULL,3,16777222,'2023-05-14 22:12:59',NULL,1048585,1),(4,1,NULL,3,16777223,'2023-05-14 22:12:59',NULL,1048585,1),(5,1,4,2,16777217,'2023-05-14 22:12:59',NULL,1048585,1),(6,1,5,2,16777217,'2023-05-14 22:12:59',NULL,1048585,1),(7,1,NULL,3,16777222,'2023-05-14 22:14:09',NULL,1048585,2),(8,1,NULL,3,16777223,'2023-05-14 22:14:09',NULL,1048585,2),(9,1,4,2,16777217,'2023-05-14 22:14:09',NULL,1048585,2),(10,1,5,2,16777217,'2023-05-14 22:14:09',NULL,1048585,2),(11,1,NULL,3,16777222,'2023-05-14 22:14:48',NULL,1048585,3),(12,1,NULL,3,16777223,'2023-05-14 22:14:48',NULL,1048585,3),(13,1,4,2,16777217,'2023-05-14 22:14:48',NULL,1048585,3),(14,1,5,2,16777217,'2023-05-14 22:14:48',NULL,1048585,3),(15,1,4,3,16777259,'2023-05-14 22:15:13',NULL,1048585,3),(16,1,5,3,16777259,'2023-05-14 22:15:13',NULL,1048585,3),(17,1,9,3,16777259,'2023-05-14 22:15:14',NULL,1048585,3),(18,1,NULL,3,16777222,'2023-05-14 22:15:44',NULL,1048585,4),(19,1,NULL,3,16777223,'2023-05-14 22:15:44',NULL,1048585,4),(20,1,4,2,16777217,'2023-05-14 22:15:44',NULL,1048585,4),(21,1,5,2,16777217,'2023-05-14 22:15:44',NULL,1048585,4),(23,1,10,2,16777234,'2023-05-14 22:16:09',NULL,1048585,4),(24,1,NULL,3,16777222,'2023-05-14 22:16:35',NULL,1048585,5),(25,1,NULL,3,16777223,'2023-05-14 22:16:35',NULL,1048585,5),(26,1,4,2,16777217,'2023-05-14 22:16:35',NULL,1048585,5),(27,1,5,2,16777217,'2023-05-14 22:16:36',NULL,1048585,5),(28,1,NULL,3,16777222,'2023-05-14 22:17:20',NULL,1048585,6),(29,1,NULL,3,16777223,'2023-05-14 22:17:20',NULL,1048585,6),(30,1,4,2,16777217,'2023-05-14 22:17:20',NULL,1048585,6),(31,1,5,2,16777217,'2023-05-14 22:17:20',NULL,1048585,6),(32,1,NULL,3,16777222,'2023-05-14 22:17:52',NULL,1048585,7),(33,1,NULL,3,16777223,'2023-05-14 22:17:52',NULL,1048585,7),(34,1,4,2,16777217,'2023-05-14 22:17:52',NULL,1048585,7),(35,1,5,2,16777217,'2023-05-14 22:17:52',NULL,1048585,7),(36,1,NULL,3,16777222,'2023-05-14 22:18:24',NULL,1048585,8),(37,1,NULL,3,16777223,'2023-05-14 22:18:24',NULL,1048585,8),(38,1,4,2,16777217,'2023-05-14 22:18:24',NULL,1048585,8),(39,1,5,2,16777217,'2023-05-14 22:18:24',NULL,1048585,8),(40,1,NULL,3,16777222,'2023-05-14 22:18:55',NULL,1048585,9),(41,1,NULL,3,16777223,'2023-05-14 22:18:55',NULL,1048585,9),(42,1,4,2,16777217,'2023-05-14 22:18:55',NULL,1048585,9),(43,1,5,2,16777217,'2023-05-14 22:18:55',NULL,1048585,9),(44,1,NULL,3,16777222,'2023-05-14 22:19:27',NULL,1048585,10),(45,1,NULL,3,16777223,'2023-05-14 22:19:27',NULL,1048585,10),(46,1,4,2,16777217,'2023-05-14 22:19:27',NULL,1048585,10),(47,1,5,2,16777217,'2023-05-14 22:19:27',NULL,1048585,10),(48,1,NULL,3,16777222,'2023-05-14 22:20:00',NULL,1048585,11),(49,1,NULL,3,16777223,'2023-05-14 22:20:00',NULL,1048585,11),(50,1,4,2,16777217,'2023-05-14 22:20:00',NULL,1048585,11),(51,1,5,2,16777217,'2023-05-14 22:20:00',NULL,1048585,11),(52,1,NULL,3,16777222,'2023-05-14 22:20:33',NULL,1048585,12),(53,1,NULL,3,16777223,'2023-05-14 22:20:33',NULL,1048585,12),(54,1,4,2,16777217,'2023-05-14 22:20:33',NULL,1048585,12),(55,1,5,2,16777217,'2023-05-14 22:20:33',NULL,1048585,12),(56,1,NULL,3,16777222,'2023-05-14 22:21:06',NULL,1048585,13),(57,1,NULL,3,16777223,'2023-05-14 22:21:06',NULL,1048585,13),(58,1,4,2,16777217,'2023-05-14 22:21:06',NULL,1048585,13),(59,1,5,2,16777217,'2023-05-14 22:21:06',NULL,1048585,13),(60,1,NULL,3,16777222,'2023-05-14 22:21:39',NULL,1048585,14),(61,1,NULL,3,16777223,'2023-05-14 22:21:39',NULL,1048585,14),(62,1,4,2,16777217,'2023-05-14 22:21:39',NULL,1048585,14),(63,1,5,2,16777217,'2023-05-14 22:21:39',NULL,1048585,14),(64,1,NULL,3,16777222,'2023-05-14 22:22:11',NULL,1048585,15),(65,1,NULL,3,16777223,'2023-05-14 22:22:11',NULL,1048585,15),(66,1,4,2,16777217,'2023-05-14 22:22:11',NULL,1048585,15),(67,1,5,2,16777217,'2023-05-14 22:22:11',NULL,1048585,15),(68,1,NULL,3,16777222,'2023-05-14 22:22:44',NULL,1048585,16),(69,1,NULL,3,16777223,'2023-05-14 22:22:44',NULL,1048585,16),(70,1,4,2,16777217,'2023-05-14 22:22:44',NULL,1048585,16),(71,1,5,2,16777217,'2023-05-14 22:22:44',NULL,1048585,16),(72,1,NULL,3,16777222,'2023-05-14 22:23:16',NULL,1048585,17),(73,1,NULL,3,16777223,'2023-05-14 22:23:16',NULL,1048585,17),(74,1,4,2,16777217,'2023-05-14 22:23:16',NULL,1048585,17),(75,1,5,2,16777217,'2023-05-14 22:23:16',NULL,1048585,17),(76,1,NULL,3,16777222,'2023-05-14 22:23:49',NULL,1048585,18),(77,1,NULL,3,16777223,'2023-05-14 22:23:49',NULL,1048585,18),(78,1,4,2,16777217,'2023-05-14 22:23:49',NULL,1048585,18),(79,1,5,2,16777217,'2023-05-14 22:23:49',NULL,1048585,18),(80,1,NULL,3,16777222,'2023-05-14 22:24:21',NULL,1048585,19),(81,1,NULL,3,16777223,'2023-05-14 22:24:21',NULL,1048585,19),(82,1,4,2,16777217,'2023-05-14 22:24:21',NULL,1048585,19),(83,1,5,2,16777217,'2023-05-14 22:24:21',NULL,1048585,19);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint NOT NULL,
  `record_offset` int NOT NULL,
  `params` text,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
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
  `plugin_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',0,'enabled','1','bool'),(2,'acronplugin',0,'enabled','1','bool'),(3,'acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),(4,'usageeventplugin',0,'enabled','1','bool'),(5,'usageeventplugin',0,'uniqueSiteId','','string'),(6,'tinymceplugin',0,'enabled','1','bool'),(7,'languagetoggleblockplugin',0,'enabled','1','bool'),(8,'languagetoggleblockplugin',0,'seq','4','int'),(9,'developedbyblockplugin',0,'enabled','0','bool'),(10,'developedbyblockplugin',0,'seq','0','int'),(11,'defaultthemeplugin',1,'enabled','1','bool'),(12,'tinymceplugin',1,'enabled','1','bool'),(13,'languagetoggleblockplugin',1,'enabled','1','bool'),(14,'languagetoggleblockplugin',1,'seq','4','int'),(15,'developedbyblockplugin',1,'enabled','0','bool'),(16,'developedbyblockplugin',1,'seq','0','int'),(17,'webfeedplugin',1,'enabled','1','bool'),(18,'webfeedplugin',1,'displayPage','homepage','string'),(19,'webfeedplugin',1,'displayItems','1','bool'),(20,'webfeedplugin',1,'recentItems','30','int'),(21,'webfeedplugin',1,'includeIdentifiers','0','bool'),(22,'pdfjsviewerplugin',1,'enabled','1','bool'),(23,'googlescholarplugin',1,'enabled','1','bool'),(24,'defaultthemeplugin',1,'typography','notoSans','string'),(25,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(26,'defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),(27,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(28,'defaultthemeplugin',1,'displayStats','none','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates publications (and thus submissions) with categories.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galley_settings` (
  `publication_galley_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `galley_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`publication_galley_setting_id`),
  UNIQUE KEY `publication_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_galley_settings_galley_id_foreign` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about publication galleys, including localized properties such as labels.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_submission_file_id` (`submission_file_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_doi_id` (`doi_id`),
  CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_galleys_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Publication galleys are representations of publications in a particular format, such as a PDF file.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en',1,'PDF',1,0.00,'',0,'',NULL),(2,'en',2,'PDF',2,0.00,'',0,'',NULL),(3,'en',3,'PDF',3,0.00,'',0,'',NULL),(4,'en',4,'PDF',3,0.00,'',0,'',NULL),(5,'en',5,'PDF',4,0.00,'',0,'',NULL),(6,'en',6,'PDF',5,0.00,'',0,'',NULL),(7,'en',7,'PDF',6,0.00,'',0,'',NULL),(8,'en',8,'PDF',7,0.00,'',0,'',NULL),(9,'en',9,'PDF',8,0.00,'',0,'',NULL),(10,'en',10,'PDF',9,0.00,'',0,'',NULL),(11,'en',11,'PDF',10,0.00,'',0,'',NULL),(12,'en',12,'PDF',11,0.00,'',0,'',NULL),(13,'en',13,'PDF',12,0.00,'',0,'',NULL),(14,'en',14,'PDF',13,0.00,'',0,'',NULL),(15,'en',15,'PDF',14,0.00,'',0,'',NULL),(16,'en',16,'PDF',15,0.00,'',0,'',NULL),(17,'en',17,'PDF',16,0.00,'',0,'',NULL),(18,'en',18,'PDF',17,0.00,'',0,'',NULL),(19,'en',19,'PDF',18,0.00,'',0,'',NULL),(20,'en',20,'PDF',19,0.00,'',0,'',NULL);
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,1,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),(2,1,'','categoryIds','[]'),(3,1,'en','title','The influence of lactation on the quantity and quality of cashmere production'),(4,2,'','categoryIds','[]'),(5,2,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(6,2,'en','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(7,2,'fr_CA','title',''),(8,2,'en','copyrightHolder','Public Knowledge Preprint Server'),(9,2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,2,'','copyrightYear','2023'),(11,3,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(12,3,'','categoryIds','[]'),(13,3,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(14,3,'en','copyrightHolder','Public Knowledge Preprint Server'),(15,3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,3,'','copyrightYear','2023'),(17,4,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(18,4,'','categoryIds','[]'),(19,4,'en','copyrightHolder','Craig Montgomerie'),(20,4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(21,4,'','copyrightYear','2023'),(22,4,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(23,5,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),(24,5,'','categoryIds','[]'),(25,5,'en','title','Genetic transformation of forest trees'),(26,6,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),(27,6,'','categoryIds','[]'),(28,6,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(29,6,'en','copyrightHolder','Public Knowledge Preprint Server'),(30,6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(31,6,'','copyrightYear','2023'),(32,7,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),(33,7,'','categoryIds','[]'),(34,7,'en','title','Developing efficacy beliefs in the classroom'),(35,7,'en','copyrightHolder','Public Knowledge Preprint Server'),(36,7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(37,7,'','copyrightYear','2023'),(38,8,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),(39,8,'','categoryIds','[]'),(40,8,'en','title','Developing efficacy beliefs in the classroom'),(41,8,'en','copyrightHolder','Public Knowledge Preprint Server'),(42,8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(43,8,'','copyrightYear','2023'),(44,9,'en','abstract','None.'),(45,9,'','categoryIds','[]'),(46,9,'en','title','Hansen & Pinto: Reason Reclaimed'),(47,9,'en','copyrightHolder','Public Knowledge Preprint Server'),(48,9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(49,9,'','copyrightYear','2023'),(50,10,'en','abstract','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.'),(51,10,'','categoryIds','[]'),(52,10,'en','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(53,10,'en','copyrightHolder','Public Knowledge Preprint Server'),(54,10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(55,10,'','copyrightYear','2023'),(56,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),(57,11,'','categoryIds','[]'),(58,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(59,11,'en','copyrightHolder','Public Knowledge Preprint Server'),(60,11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(61,11,'','copyrightYear','2023'),(62,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),(63,12,'','categoryIds','[]'),(64,12,'en','title','Learning Sustainable Design through Service'),(65,12,'en','copyrightHolder','Public Knowledge Preprint Server'),(66,12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(67,12,'','copyrightYear','2023'),(68,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P<0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),(69,13,'','categoryIds','[]'),(70,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(71,13,'en','copyrightHolder','Public Knowledge Preprint Server'),(72,13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(73,13,'','copyrightYear','2023'),(74,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),(75,14,'','categoryIds','[]'),(76,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(77,14,'en','copyrightHolder','Public Knowledge Preprint Server'),(78,14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(79,14,'','copyrightYear','2023'),(80,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),(81,15,'','categoryIds','[]'),(82,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(83,15,'en','copyrightHolder','Public Knowledge Preprint Server'),(84,15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(85,15,'','copyrightYear','2023'),(86,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),(87,16,'','categoryIds','[]'),(88,16,'en','title','Yam diseases and its management in Nigeria'),(89,16,'en','copyrightHolder','Public Knowledge Preprint Server'),(90,16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(91,16,'','copyrightYear','2023'),(92,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),(93,17,'','categoryIds','[]'),(94,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(95,17,'en','copyrightHolder','Public Knowledge Preprint Server'),(96,17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(97,17,'','copyrightYear','2023'),(98,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),(99,18,'','categoryIds','[]'),(100,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(101,18,'en','copyrightHolder','Public Knowledge Preprint Server'),(102,18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(103,18,'','copyrightYear','2023'),(104,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),(105,19,'','categoryIds','[]'),(106,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(107,19,'en','copyrightHolder','Public Knowledge Preprint Server'),(108,19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(109,19,'','copyrightYear','2023'),(110,20,'en','abstract','None.'),(111,20,'','categoryIds','[]'),(112,20,'en','title','Finocchiaro: Arguments About Arguments'),(113,20,'en','copyrightHolder','Public Knowledge Preprint Server'),(114,20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(115,20,'','copyrightYear','2023');
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
  `access_status` bigint DEFAULT '0',
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint DEFAULT NULL,
  `section_id` bigint DEFAULT NULL,
  `submission_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_author_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_url_path` (`url_path`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2023-05-14 22:12:44',1,1,1,1,NULL,1,NULL),(2,0,'2023-05-14','2023-05-14 22:14:23',2,1,2,3,NULL,1,NULL),(3,0,'2023-05-14','2023-05-14 22:15:10',5,1,3,3,NULL,1,NULL),(4,0,'2023-05-14','2023-05-14 22:15:19',7,1,3,3,NULL,2,NULL),(5,0,NULL,'2023-05-14 22:15:29',9,1,4,1,NULL,1,NULL),(6,0,'2023-05-14','2023-05-14 22:16:56',10,1,5,3,NULL,1,NULL),(7,0,'2023-05-14','2023-05-14 22:17:28',11,1,6,3,NULL,1,NULL),(8,0,'2023-05-14','2023-05-14 22:18:00',12,1,7,3,NULL,1,NULL),(9,0,'2023-05-14','2023-05-14 22:18:31',14,1,8,3,NULL,1,NULL),(10,0,'2023-05-14','2023-05-14 22:19:03',15,1,9,3,NULL,1,NULL),(11,0,'2023-05-14','2023-05-14 22:19:35',16,1,10,3,NULL,1,NULL),(12,0,'2023-05-14','2023-05-14 22:20:08',17,1,11,3,NULL,1,NULL),(13,0,'2023-05-14','2023-05-14 22:20:41',19,1,12,3,NULL,1,NULL),(14,0,'2023-05-14','2023-05-14 22:21:14',20,1,13,3,NULL,1,NULL),(15,0,'2023-05-14','2023-05-14 22:21:47',21,1,14,3,NULL,1,NULL),(16,0,'2023-05-14','2023-05-14 22:22:20',22,1,15,3,NULL,1,NULL),(17,0,'2023-05-14','2023-05-14 22:22:52',23,1,16,3,NULL,1,NULL),(18,0,'2023-05-14','2023-05-14 22:23:25',24,1,17,3,NULL,1,NULL),(19,0,'2023-05-14','2023-05-14 22:23:57',25,1,18,3,NULL,1,NULL),(20,0,'2023-05-14','2023-05-14 22:24:30',26,1,19,3,NULL,1,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_participant_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The users assigned to a discussion.';
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
  `considered` smallint DEFAULT NULL,
  `request_resent` smallint NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Data about peer review assignments for all submissions.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of the submission files made available to each assigned reviewer.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review form elements, including localized content such as question text.';
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
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form element represents a single question on a review form.';
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
  `review_form_response_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
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
  `review_form_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review forms, including localized content such as names.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
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
  `review_round_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
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
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_tasks` (
  `scheduled_task_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduled_task_id`),
  UNIQUE KEY `scheduled_tasks_unique` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='The last time each scheduled task was run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES (1,'PKP\\task\\StatisticsReport','2023-05-14 22:09:44'),(2,'PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-05-14 22:09:44'),(3,'PKP\\task\\UpdateIPGeoDB','2023-05-14 22:09:44'),(4,'APP\\tasks\\UsageStatsLoader','2023-05-14 22:09:45'),(5,'PKP\\task\\ProcessQueueJobs','2023-05-14 22:09:45'),(6,'PKP\\task\\RemoveFailedJobs','2023-05-14 22:09:45');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_settings` (
  `section_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `section_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`section_setting_id`),
  UNIQUE KEY `section_settings_unique` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`),
  CONSTRAINT `section_settings_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='More data about sections, including localized properties such as section titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,1,'en','title','Preprints'),(2,1,'en','abbrev','PRE'),(3,1,'','path','preprints'),(4,1,'en','policy','<p>Section default policy</p>'),(5,1,'fr_CA','title',''),(6,1,'fr_CA','abbrev',''),(7,1,'en','description',''),(8,1,'fr_CA','description',''),(9,1,'en','identifyType',''),(10,1,'fr_CA','identifyType',''),(11,1,'fr_CA','policy','');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` bigint NOT NULL AUTO_INCREMENT,
  `server_id` bigint NOT NULL,
  `review_form_id` bigint DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `editor_restricted` tinyint NOT NULL DEFAULT '0',
  `meta_indexed` tinyint NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint NOT NULL DEFAULT '0',
  `hide_title` tinyint NOT NULL DEFAULT '0',
  `hide_author` tinyint NOT NULL DEFAULT '0',
  `is_inactive` tinyint NOT NULL DEFAULT '0',
  `abstract_word_count` bigint DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_server_id` (`server_id`),
  KEY `sections_review_form_id` (`review_form_id`),
  CONSTRAINT `sections_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL,
  CONSTRAINT `sections_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Submissions can be organized into sections, which determine the front-end presentation and provide options for selective harvesting in the OAI-PMH interface.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,NULL,0.00,0,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_settings`
--

DROP TABLE IF EXISTS `server_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_settings` (
  `server_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `server_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`server_setting_id`),
  UNIQUE KEY `server_settings_unique` (`server_id`,`locale`,`setting_name`),
  KEY `server_settings_server_id` (`server_id`),
  CONSTRAINT `server_settings_server_id` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3 COMMENT='More data about server settings, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES (1,1,'en','acronym','JPKPKP',NULL),(3,1,'en','authorGuidelines','<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p> When you\'re satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>',NULL),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##',NULL),(5,1,'en','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(6,1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(7,1,'en','beginSubmissionHelp','<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>',NULL),(8,1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##',NULL),(9,1,'','contactEmail','rvaca@mailinator.com',NULL),(10,1,'','contactName','Ramiro Vaca',NULL),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>',NULL),(12,1,'fr_CA','contributorsHelp','##default.submission.step.contributors##',NULL),(13,1,'','country','IS',NULL),(14,1,'','defaultReviewMode','2',NULL),(15,1,'en','description','<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>',NULL),(16,1,'fr_CA','description','<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>',NULL),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>',NULL),(18,1,'fr_CA','detailsHelp','##default.submission.step.details##',NULL),(19,1,'','copySubmissionAckPrimaryContact','0',NULL),(20,1,'','copySubmissionAckAddress','',NULL),(21,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>',NULL),(22,1,'','enableDois','1',NULL),(23,1,'','doiSuffixType','default',NULL),(24,1,'','registrationAgency','',NULL),(25,1,'','disableSubmissions','0',NULL),(26,1,'','editorialStatsEmail','1',NULL),(27,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>',NULL),(28,1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##',NULL),(29,1,'','itemsPerPage','25',NULL),(30,1,'','keywords','request',NULL),(31,1,'en','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"https://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(32,1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(33,1,'en','name','Public Knowledge Preprint Server',NULL),(34,1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(35,1,'','notifyAllAuthors','1',NULL),(36,1,'','numPageLinks','10',NULL),(37,1,'','numWeeksPerResponse','4',NULL),(38,1,'','numWeeksPerReview','4',NULL),(39,1,'en','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(40,1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(41,1,'en','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(42,1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(43,1,'en','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(44,1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(45,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>',NULL),(46,1,'fr_CA','reviewHelp','##default.submission.step.review##',NULL),(47,1,'','submissionAcknowledgement','allAuthors',NULL),(48,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>',NULL),(49,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##',NULL),(50,1,'','submitWithCategories','0',NULL),(51,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]',NULL),(52,1,'','supportedLocales','[\"en\",\"fr_CA\"]',NULL),(53,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]',NULL),(54,1,'','themePluginPath','default',NULL),(55,1,'en','uploadFilesHelp','<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>',NULL),(56,1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##',NULL),(57,1,'','enableGeoUsageStats','disabled',NULL),(58,1,'','enableInstitutionUsageStats','0',NULL),(59,1,'','isSushiApiPublic','1',NULL),(62,1,'','enableAuthorScreening','0',NULL),(63,1,'','enabledDoiTypes','[\"publication\"]',NULL),(64,1,'','postedAcknowledgement','1',NULL),(65,1,'','enableOai','1',NULL),(66,1,'','doiVersioning','1',NULL),(67,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(68,1,'en','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(69,1,'en','abbreviation','publicknowledgePub Know Pre',NULL),(70,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(71,1,'','supportEmail','rvaca@mailinator.com',NULL),(72,1,'','supportName','Ramiro Vaca',NULL);
/*!40000 ALTER TABLE `server_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `server_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Used to order lists of servers',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the server is considered "live" and will appear on the website. (Note that disabled servers may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `servers_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A list of preprint servers managed by the installation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,'publicknowledge',1.00,'en',1);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
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
  KEY `sessions_user_id` (`user_id`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0biv65lmbma0sh0p3ip5dem83c',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102932,1684102941,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102941;s:5:\"token\";s:32:\"b244753e76aaf57f0cd0d21fbdb8d08d\";}','localhost'),('0f4alvd7ftomf6lq2hjv4s3tvf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102768,1684102776,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102777;s:5:\"token\";s:32:\"94e3286aac76d923d3fb479d547215c3\";}','localhost'),('0i6acjdll3nk1fdn9teclnuaaq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102943,1684102965,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102965;s:5:\"token\";s:32:\"4e1f6e337f524c64052a5304860e1768\";}username|s:6:\"rrossi\";','localhost'),('1of13ml5d4dumbb2kbvnlmg1c3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102801,1684102809,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102809;s:5:\"token\";s:32:\"8c5282652f1e205e9b863e8b5d0cd0e5\";}','localhost'),('227v4gu2njb1amo9d6mv12d72e',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102997,1684103005,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684103006;s:5:\"token\";s:32:\"3c73ef84182f47d4c588a380b540e21d\";}','localhost'),('2po59u3evq35c4lacsbt4382os',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102545,1684102573,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102573;s:5:\"token\";s:32:\"c48faa1cc079180c37506d9ac9612bb0\";}','localhost'),('58i0glcrt6fbtds1tkar3ael4c',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102867,1684102875,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102875;s:5:\"token\";s:32:\"19e858f45373e70446425527a33dc7b5\";}','localhost'),('5aj1n0d6hij9ommqrvcpamdcip',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102612,1684102617,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102617;s:5:\"token\";s:32:\"9771203081b61db7776eb20f46f1b41c\";}','localhost'),('5nfdq3g6peb09e3schdborq9ke',8,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102383,1684102455,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102455;s:5:\"token\";s:32:\"0082d23b44077c26abbac718daf9bbf8\";}username|s:8:\"ckwantes\";userId|i:8;','localhost'),('7korg4q2cb0j0sdpab935q867j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102911,1684102932,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102932;s:5:\"token\";s:32:\"c763ddcf7ad88f158d0622bb5dd3188a\";}username|s:8:\"rbaiyewu\";','localhost'),('9ks7a6nv7n3gr5ojh41gcavgsl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102605,1684102611,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102611;s:5:\"token\";s:32:\"d70a05571368fa1aae2b5969d00aeac4\";}','localhost'),('9l82517cnk5ol6r36p2oesjdck',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102359,1684102379,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102379;s:5:\"token\";s:32:\"8a045e21dcd0458be4b23fe074df6c0d\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('9ootou6hfhc3ipe8adu1jb8png',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102322,1684102331,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102331;s:5:\"token\";s:32:\"f0737bc2ca23af097632b141121514e1\";}','localhost'),('a9mp5tefgl79mdd2nrgb1knkr1',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102206,1684102240,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102240;s:5:\"token\";s:32:\"db1d5fd6b1bd45ddce7410c62cdd0d5f\";}','localhost'),('acu05fr0ocol08o4hso48d92j6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102596,1684102605,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102605;s:5:\"token\";s:32:\"3d6864c3230adebe1e3e9f2a312fef5b\";}','localhost'),('andq729c3r3fn3crbmit0htbpl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102684,1684102704,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102704;s:5:\"token\";s:32:\"ee087e0d3d346265e9da20ebdcb046fc\";}username|s:9:\"fpaglieri\";','localhost'),('bv8ndj4mocla27du7p0vo3eur0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102651,1684102672,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102672;s:5:\"token\";s:32:\"80fb3fe652430e20f14bdafc4bb3fcef\";}username|s:7:\"eostrom\";','localhost'),('cgscivuio372de3i1ovaaubiku',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102489,1684102497,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102496;s:5:\"token\";s:32:\"1a5b03cd82eee0089b5e27075ff426c1\";}','localhost'),('dd5rop2n9aah03jgj19m09r6gb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102457,1684102464,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102464;s:5:\"token\";s:32:\"a9931f0e85327c550ab4b5c51b5f0849\";}','localhost'),('efoqmfrb9emve39oskiobmkmts',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102332,1684102356,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102356;s:5:\"token\";s:32:\"cb96c5dcbdeaef9052adeeda540717f1\";}','localhost'),('etk0sk174mv9loiqt39spr0ng2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102812,1684102833,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102833;s:5:\"token\";s:32:\"8b2deb4a42617d8467c2cd10d0a32001\";}username|s:12:\"lchristopher\";','localhost'),('fd5874p41rmt3cs01n0np3tk1m',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102747,1684102768,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102768;s:5:\"token\";s:32:\"c574416c355ec4da598ad467d75523bf\";}username|s:6:\"jnovak\";','localhost'),('fftflcrrirjhre2lidfucupc54',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102308,1684102319,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1684102319;s:5:\"token\";s:32:\"e3670e02fad6113d75d7a27aa4227892\";}','localhost'),('he5ctrc8gkenebrfffhveekq45',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102523,1684102543,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102543;s:5:\"token\";s:32:\"a8da38834d87fa464f52f35aac29048b\";}username|s:6:\"ddiouf\";userId|i:10;','localhost'),('i1jh8csipcf1uhtr0n9912svtm',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102243,1684102256,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102257;s:5:\"token\";s:32:\"e6d2bbbfea793a74d4d4ba334bbcabd0\";}','localhost'),('j8grq6f18ussa7o2jnpaafju9p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102965,1684102974,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102974;s:5:\"token\";s:32:\"4bff897496b739f04c1ca3ae046d7caf\";}','localhost'),('jbije9c9hlakpvtv3hn10n90h7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102779,1684102801,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102801;s:5:\"token\";s:32:\"996f71b20fc1aa56cc55751d307361b1\";}username|s:10:\"kalkhafaji\";','localhost'),('l6n4u38tcdn6ntvkcqjc9h1tug',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102620,1684102640,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102640;s:5:\"token\";s:32:\"b6b3430d08ac5dcdf711c3c44edb7950\";}username|s:9:\"dsokoloff\";','localhost'),('l8qdndgcil1hbj6rse5ad92rq8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102736,1684102744,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102744;s:5:\"token\";s:32:\"fffef432854b3cff032b0d37b13935f5\";}','localhost'),('lpcq84ai05nipfrhejraapm14i',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102258,1684102266,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102266;s:5:\"token\";s:32:\"c895f71213ced592ef45118a9687caa3\";}','localhost'),('m1g8mvmd7501m07nb2ujlplkbf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102497,1684102521,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102521;s:5:\"token\";s:32:\"aaa77e8340dd76208d56f5340c58b0d6\";}','localhost'),('mdebfholbn28act0jf6ar8t6q5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102641,1684102649,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102649;s:5:\"token\";s:32:\"b0d772763ab4ccca3cc4a8a204817b74\";}','localhost'),('nhdjiep20suot02cnoiu9nseej',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102467,1684102488,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102488;s:5:\"token\";s:32:\"8c585452de93dceef2f5c5edf966e2f0\";}username|s:12:\"cmontgomerie\";','localhost'),('nkjjab7ujake2e3vifbkctq3u7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102976,1684102997,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102997;s:5:\"token\";s:32:\"5f6ee2ac91086df64a18b611dc0b4fab\";}username|s:12:\"vkarbasizaed\";','localhost'),('o1airj3igj3qk66kr7cej7kpgh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102704,1684102712,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102712;s:5:\"token\";s:32:\"55724d4c2ac01379cffbae58b1139ac8\";}','localhost'),('od4u9m9ajjlpe30aq6266s7aff',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102184,1684102205,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102206;s:5:\"token\";s:32:\"21b6475eff3e40d43680f807e4d6a909\";}','localhost'),('paokeqgjv1duu4l1213vd1ddre',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102900,1684102908,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102908;s:5:\"token\";s:32:\"d3c801fc2dbbd95e2e5d5e387135c842\";}','localhost'),('pll9sn9n6a8v6740jtqh3iq23t',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102878,1684102899,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102899;s:5:\"token\";s:32:\"c4ef4fcf909548e8e93d147df678f344\";}username|s:7:\"pdaniel\";','localhost'),('pm9vrhcv61erq0arha8ngvhcu4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102269,1684102308,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1684102307;s:5:\"token\";s:32:\"bc958ce1f62f6e37eead8cf3f4d709db\";}','localhost'),('pvivaramm6ir01qk919pr0rcnr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102834,1684102842,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102842;s:5:\"token\";s:32:\"6bf8f07e3dee73d21acb5fefdff6fb3a\";}','localhost'),('rp5m46qccgjs1ah8etsvi3k69i',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102715,1684102736,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102735;s:5:\"token\";s:32:\"5b84e9d135c13c6a124412b60b4cb7ac\";}username|s:10:\"jmwandenga\";','localhost'),('sfmleegldo027gacb5pqpsjmpd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684103008,1684103029,0,'csrf|a:2:{s:9:\"timestamp\";i:1684103029;s:5:\"token\";s:32:\"f72435dc3c8ec7f85985584dacaf18d4\";}username|s:11:\"vwilliamson\";','localhost'),('sjg245m7uf8jhjsqjvbjnad2su',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684103041,1684103062,0,'csrf|a:2:{s:9:\"timestamp\";i:1684103062;s:5:\"token\";s:32:\"17fedc23e17520c34ed722a2f689630b\";}username|s:6:\"zwoods\";','localhost'),('smh3a5jrbbt0bt8g716kmvb92a',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102575,1684102596,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102596;s:5:\"token\";s:32:\"6cac3248f282b46f24c29adb3f40625c\";}username|s:9:\"dphillips\";','localhost'),('tdib1d94ro434fomm0r2tmqsnf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102673,1684102681,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684102681;s:5:\"token\";s:32:\"af33fb67111246a4efbf2c6a50dab4d1\";}','localhost'),('tpi729s31t1trpbg8n90u4k984',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684103030,1684103038,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684103038;s:5:\"token\";s:32:\"81f093ed8add12ba8cc113e0e0c4b23c\";}','localhost'),('ua5u3htedgvj877elophdqltmr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684103062,1684103071,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1684103071;s:5:\"token\";s:32:\"3049e9eeecf989d6bcf3418220f0a8a4\";}','localhost'),('vghduqv7hqipe6vbnogsmaourm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1684102845,1684102866,0,'csrf|a:2:{s:9:\"timestamp\";i:1684102866;s:5:\"token\";s:32:\"0d2740edaced153533f5e6a76e3f3eab\";}username|s:8:\"lkumiega\";','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `site_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `redirect` bigint NOT NULL DEFAULT '0' COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,0,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` mediumtext,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','en','pkpadmin@mailinator.com'),(2,'contactName','en','Open Preprint Systems'),(3,'contactName','fr_CA','Open Preprint Systems'),(4,'compressStatsLogs','','0'),(5,'enableGeoUsageStats','','disabled'),(6,'enableInstitutionUsageStats','','0'),(7,'keepDailyUsageStats','','0'),(8,'isSiteSushiPlatform','','0'),(9,'isSushiApiPublic','','1'),(10,'themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
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
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2023-05-14 22:12:59',0,1),(2,1,3,4,'2023-05-14 22:12:59',0,1),(3,1,3,5,'2023-05-14 22:12:59',0,1),(4,2,4,8,'2023-05-14 22:14:09',0,1),(5,2,3,4,'2023-05-14 22:14:09',0,1),(6,2,3,5,'2023-05-14 22:14:09',0,1),(7,3,4,9,'2023-05-14 22:14:48',0,1),(8,3,3,4,'2023-05-14 22:14:48',0,1),(9,3,3,5,'2023-05-14 22:14:48',0,1),(10,4,4,10,'2023-05-14 22:15:43',0,1),(11,4,3,4,'2023-05-14 22:15:44',0,1),(12,4,3,5,'2023-05-14 22:15:44',0,1),(13,5,4,11,'2023-05-14 22:16:35',0,1),(14,5,3,4,'2023-05-14 22:16:35',0,1),(15,5,3,5,'2023-05-14 22:16:35',0,1),(16,6,4,12,'2023-05-14 22:17:20',0,1),(17,6,3,4,'2023-05-14 22:17:20',0,1),(18,6,3,5,'2023-05-14 22:17:20',0,1),(19,7,4,13,'2023-05-14 22:17:52',0,1),(20,7,3,4,'2023-05-14 22:17:52',0,1),(21,7,3,5,'2023-05-14 22:17:52',0,1),(22,8,4,14,'2023-05-14 22:18:24',0,1),(23,8,3,4,'2023-05-14 22:18:24',0,1),(24,8,3,5,'2023-05-14 22:18:24',0,1),(25,9,4,15,'2023-05-14 22:18:55',0,1),(26,9,3,4,'2023-05-14 22:18:55',0,1),(27,9,3,5,'2023-05-14 22:18:55',0,1),(28,10,4,16,'2023-05-14 22:19:27',0,1),(29,10,3,4,'2023-05-14 22:19:27',0,1),(30,10,3,5,'2023-05-14 22:19:27',0,1),(31,11,4,17,'2023-05-14 22:20:00',0,1),(32,11,3,4,'2023-05-14 22:20:00',0,1),(33,11,3,5,'2023-05-14 22:20:00',0,1),(34,12,4,18,'2023-05-14 22:20:32',0,1),(35,12,3,4,'2023-05-14 22:20:32',0,1),(36,12,3,5,'2023-05-14 22:20:32',0,1),(37,13,4,19,'2023-05-14 22:21:06',0,1),(38,13,3,4,'2023-05-14 22:21:06',0,1),(39,13,3,5,'2023-05-14 22:21:06',0,1),(40,14,4,20,'2023-05-14 22:21:39',0,1),(41,14,3,4,'2023-05-14 22:21:39',0,1),(42,14,3,5,'2023-05-14 22:21:39',0,1),(43,15,4,21,'2023-05-14 22:22:11',0,1),(44,15,3,4,'2023-05-14 22:22:11',0,1),(45,15,3,5,'2023-05-14 22:22:11',0,1),(46,16,4,22,'2023-05-14 22:22:44',0,1),(47,16,3,4,'2023-05-14 22:22:44',0,1),(48,16,3,5,'2023-05-14 22:22:44',0,1),(49,17,4,23,'2023-05-14 22:23:16',0,1),(50,17,3,4,'2023-05-14 22:23:16',0,1),(51,17,3,5,'2023-05-14 22:23:16',0,1),(52,18,4,24,'2023-05-14 22:23:49',0,1),(53,18,3,4,'2023-05-14 22:23:49',0,1),(54,18,3,5,'2023-05-14 22:23:49',0,1),(55,19,4,25,'2023-05-14 22:24:21',0,1),(56,19,3,4,'2023-05-14 22:24:21',0,1),(57,19,3,5,'2023-05-14 22:24:21',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,1,530,4,3),(2,1,1,530,5,3);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
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
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Comments on a submission, e.g. peer review comments';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Revisions map submission_file entries to files on the data store.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(2,1,'fr_CA','name','','string'),(3,2,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(4,2,'fr_CA','name','','string'),(5,3,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(6,3,'fr_CA','name','','string'),(7,4,'en','name','Genetic transformation of forest trees.pdf','string'),(8,4,'fr_CA','name','','string'),(9,5,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(10,5,'fr_CA','name','','string'),(11,6,'en','name','Developing efficacy beliefs in the classroom.pdf','string'),(12,6,'fr_CA','name','','string'),(13,7,'en','name','Developing efficacy beliefs in the classroom.pdf','string'),(14,7,'fr_CA','name','','string'),(15,8,'en','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(16,8,'fr_CA','name','','string'),(17,9,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(18,9,'fr_CA','name','','string'),(19,10,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(20,10,'fr_CA','name','','string'),(21,11,'en','name','Learning Sustainable Design through Service.pdf','string'),(22,11,'fr_CA','name','','string'),(23,12,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(24,12,'fr_CA','name','','string'),(25,13,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(26,13,'fr_CA','name','','string'),(27,14,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(28,14,'fr_CA','name','','string'),(29,15,'en','name','Yam diseases and its management in Nigeria.pdf','string'),(30,15,'fr_CA','name','','string'),(31,16,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(32,16,'fr_CA','name','','string'),(33,17,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(34,17,'fr_CA','name','','string'),(35,18,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(36,18,'fr_CA','name','','string'),(37,19,'en','name','Finocchiaro: Arguments About Arguments.pdf','string'),(38,19,'fr_CA','name','','string');
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
  `source_submission_file_id` bigint unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:12:55','2023-05-14 22:12:58',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:13:40','2023-05-14 22:13:43',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:14:43','2023-05-14 22:14:46',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:15:40','2023-05-14 22:15:42',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:16:32','2023-05-14 22:16:34',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:17:16','2023-05-14 22:17:19',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:17:48','2023-05-14 22:17:50',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:18:20','2023-05-14 22:18:23',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:18:51','2023-05-14 22:18:54',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:19:24','2023-05-14 22:19:26',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:19:56','2023-05-14 22:19:59',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:20:29','2023-05-14 22:20:31',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:21:02','2023-05-14 22:21:04',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:21:35','2023-05-14 22:21:37',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:22:08','2023-05-14 22:22:10',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:22:40','2023-05-14 22:22:43',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:23:13','2023-05-14 22:23:15',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:23:45','2023-05-14 22:23:48',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2023-05-14 22:24:18','2023-05-14 22:24:20',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (605,'11-'),(51,'133rd'),(741,'21st'),(442,'aalborg'),(868,'abattoir'),(903,'abnormal'),(524,'academic'),(612,'accepted'),(491,'accompanying'),(791,'achieving'),(85,'acid'),(627,'acids'),(350,'action'),(998,'actor'),(991,'actors'),(478,'added'),(521,'address'),(62,'adg'),(566,'adipose'),(82,'adiposity'),(228,'administered'),(454,'administration'),(822,'adopted'),(823,'advocated'),(893,'affected'),(126,'affects'),(864,'african'),(997,'agree'),(925,'aid'),(561,'aim'),(509,'al-khafaji'),(169,'alberta'),(243,'alexandria'),(34,'allocated'),(730,'analyses'),(137,'analysis'),(590,'analyzed'),(588,'animals'),(804,'anthracnose'),(966,'antibiotics'),(937,'antimicrobial'),(662,'antonio'),(692,'appears'),(252,'applications'),(453,'applied'),(639,'aquifer'),(115,'archival'),(101,'areas'),(268,'argument'),(1016,'arguments'),(841,'ash'),(562,'assess'),(631,'assessed'),(687,'assessments'),(737,'atlantic'),(117,'attitude'),(553,'australian'),(926,'authorities'),(505,'authority'),(445,'availability'),(28,'average'),(570,'averaging'),(584,'backfat'),(267,'background'),(794,'baiyewu'),(855,'barcelona'),(18,'barley'),(747,'barriers'),(31,'barrows'),(643,'barton'),(506,'based'),(499,'basin'),(464,'basins'),(19,'basis'),(686,'bearings'),(867,'beef'),(13,'beet'),(198,'began'),(50,'beginning'),(280,'beliefs'),(770,'belonging'),(132,'benchmark'),(146,'benefit'),(676,'blanco'),(4,'bologna'),(152,'brazil'),(504,'brazos'),(890,'breeds'),(701,'buda'),(880,'bulls'),(555,'butyrate'),(603,'c18'),(607,'c20'),(200,'called'),(861,'cameroon'),(194,'canada'),(475,'capabilities'),(405,'cape'),(892,'carcass'),(875,'carcasses'),(630,'carefully'),(1,'carlo'),(761,'carried'),(736,'case'),(973,'cases'),(9,'cashmere'),(895,'category'),(104,'catherine'),(859,'cattle'),(863,'central'),(742,'century'),(690,'cfs'),(546,'challenges'),(712,'change'),(533,'chapter'),(874,'characteristics'),(313,'children'),(151,'china'),(847,'chips'),(552,'christopher'),(92,'chroma'),(604,'cis'),(318,'citizens'),(353,'citizenship'),(287,'claim'),(276,'claims'),(180,'classroom'),(972,'clinical'),(778,'close'),(591,'close-'),(738,'coast'),(957,'coli'),(941,'coliforms'),(381,'colleagues'),(586,'collected'),(665,'collection'),(1000,'collective'),(996,'collectively'),(157,'collectivistic'),(308,'college'),(90,'colour'),(300,'com-mitments'),(800,'combating'),(281,'commitments'),(291,'common'),(357,'commons'),(141,'communication'),(772,'communities'),(755,'community'),(111,'comparative'),(990,'compare'),(135,'compared'),(147,'comparisons'),(295,'competencies'),(130,'compiled'),(494,'complete'),(921,'completely'),(472,'complex'),(86,'composition'),(170,'computer'),(970,'concentration'),(660,'concept'),(97,'concluded'),(420,'conclusive'),(918,'condemned'),(486,'condensed'),(443,'condensing'),(645,'conditions'),(328,'conducted'),(316,'confident'),(421,'conflicting'),(979,'conjugative'),(721,'connection'),(637,'connectivity'),(1005,'consensus'),(81,'consequence'),(810,'considered'),(153,'consistent'),(290,'consists'),(614,'consortium'),(113,'construct'),(64,'contain-'),(500,'contained'),(380,'contemporary'),(595,'content'),(162,'context'),(727,'continual'),(319,'continue'),(436,'continuous'),(757,'contributing'),(1009,'contributors'),(38,'control'),(543,'coordinated'),(203,'core'),(2,'corino'),(309,'cork'),(431,'corporate'),(768,'council'),(129,'countries'),(784,'country'),(204,'courses'),(373,'coward'),(901,'cows'),(340,'cps'),(167,'craig'),(131,'create'),(337,'creative'),(675,'creek'),(269,'critique'),(825,'crop'),(848,'cubes'),(833,'cultivars'),(161,'cultural'),(125,'culture'),(773,'cultures'),(1014,'cuny'),(197,'curriculum'),(71,'cuts'),(24,'dairy'),(262,'dana'),(732,'daniel'),(116,'data'),(487,'dataset'),(469,'datasets'),(52,'day'),(362,'decades1'),(992,'decide'),(1006,'decision'),(348,'decision-making'),(474,'decision-support'),(435,'decisions'),(272,'deep'),(764,'defining'),(83,'degree'),(765,'delivering'),(725,'demands'),(189,'demonstrate'),(759,'describes'),(512,'design'),(734,'designing'),(831,'destruction'),(814,'devastating'),(503,'develop'),(476,'developed'),(310,'developing'),(216,'development'),(392,'developments'),(241,'diaga'),(43,'diet'),(623,'dietary'),(26,'diets'),(620,'differed'),(967,'difference'),(58,'differences'),(301,'difficult'),(1003,'difficulty'),(42,'diluted'),(242,'diouf'),(548,'directions'),(273,'disagreement'),(365,'disciplines'),(711,'discontinuity'),(251,'discussed'),(766,'discussions'),(809,'disease'),(797,'diseases'),(679,'dissipated'),(363,'distinguished'),(915,'distress'),(434,'distribution'),(304,'diverge'),(745,'diversity'),(661,'divide'),(425,'dividend'),(409,'dividends'),(306,'domatilia'),(656,'downstream'),(673,'drainage'),(710,'dramatic'),(927,'draw'),(644,'drought'),(685,'droughts'),(46,'dry'),(615,'dry-cured'),(922,'due'),(714,'dynamic'),(94,'economical'),(423,'economists'),(606,'ecosenoic'),(905,'ectoparasites'),(817,'edible'),(183,'education'),(638,'edwards'),(164,'effect'),(143,'effectiveness'),(11,'effects'),(311,'efficacy'),(142,'efficiency'),(786,'egalitarianism'),(354,'elinor'),(744,'embracing'),(526,'emerging'),(769,'emphasises'),(411,'empirical'),(236,'employed'),(119,'employees'),(980,'encoding'),(904,'encountered'),(653,'endangered'),(462,'endeavors'),(253,'engineering'),(530,'engineers'),(335,'enhance'),(481,'enhanced'),(351,'enhancing'),(911,'enlarged'),(950,'enterobacteriacea'),(514,'environmental'),(989,'environments'),(312,'equip'),(114,'equivalence'),(956,'escherichia'),(659,'established'),(780,'ethnic'),(781,'ethno-linguistic'),(440,'evaluation'),(412,'evidence'),(123,'examine'),(232,'examined'),(754,'examines'),(163,'exerts'),(149,'exhibited'),(547,'exist'),(173,'existing'),(670,'exists'),(460,'expanding'),(358,'expe-'),(35,'exper-'),(532,'experiences'),(54,'experimental'),(259,'expression'),(696,'extended'),(698,'extensive'),(396,'fabio'),(107,'facets'),(136,'factor'),(139,'factors'),(952,'faeces'),(520,'failed'),(827,'fallowing'),(73,'fat'),(906,'fatigue'),(580,'fats'),(84,'fatty'),(63,'fcr'),(477,'features'),(23,'fed'),(55,'feed'),(802,'field'),(953,'fifteen'),(568,'fifty-four'),(845,'finally'),(422,'financial'),(433,'financing'),(289,'find'),(155,'findings'),(1015,'finocchiaro'),(418,'firm'),(684,'flow'),(691,'flowing'),(498,'flows'),(920,'flukes'),(447,'focus'),(275,'fogelin'),(270,'fogelins'),(286,'fogelin’s'),(632,'food'),(246,'forest'),(842,'found'),(279,'framework'),(393,'frank'),(283,'fruitfully'),(887,'fulani'),(437,'function'),(843,'fungal'),(908,'fungal-like'),(416,'future'),(750,'gender'),(857,'general'),(258,'genes'),(244,'genetic'),(743,'genuinely'),(32,'gilts'),(839,'gins'),(223,'goal'),(1011,'goverance'),(257,'governing'),(192,'government'),(190,'grade'),(704,'gradient'),(713,'gradients'),(321,'graduation'),(669,'groundwater'),(668,'groundwater-level'),(56,'group'),(37,'groups'),(480,'growing'),(60,'growth'),(886,'gudali'),(426,'guidance'),(882,'guinea'),(74,'ham'),(293,'hand'),(399,'hansen'),(829,'healthy'),(21,'heavy'),(883,'high'),(68,'higher'),(593,'highest'),(787,'highlights'),(235,'hired'),(218,'hiring'),(33,'homogeneously'),(945,'hospital'),(951,'human'),(718,'hydraulic'),(667,'hydrogeologic'),(636,'hydrologic'),(681,'hydrologically'),(27,'hypor'),(535,'identification'),(955,'identified'),(36,'imental'),(655,'immediately'),(490,'impacts'),(211,'implement'),(196,'implementation'),(995,'implemented'),(175,'implications'),(788,'importance'),(930,'improve'),(556,'improves'),(254,'improving'),(776,'include'),(502,'included'),(824,'includes'),(724,'increased'),(624,'increases'),(617,'index'),(356,'indiana'),(771,'individual'),(134,'individually'),(156,'individuals'),(832,'infected'),(844,'infection'),(944,'infections'),(5,'influence'),(693,'influenced'),(717,'influences'),(201,'information'),(317,'informed'),(202,'infused'),(65,'ing'),(720,'inherent'),(969,'inhibitory'),(29,'initial'),(186,'initiatives'),(484,'input'),(987,'institutions'),(334,'instruction'),(523,'integrates'),(237,'integrating'),(178,'integration'),(391,'intellectual'),(763,'intention'),(735,'intercultural'),(758,'interculturality'),(100,'interest'),(277,'interlocutors'),(542,'internships'),(439,'intuitive'),(265,'investigating'),(432,'investment'),(429,'investors'),(347,'involve'),(779,'involvement'),(534,'involves'),(610,'iodine'),(947,'iran'),(239,'irvine'),(946,'isfahan'),(574,'isoenergetic'),(942,'isolated'),(954,'isolates'),(182,'issue'),(871,'january'),(108,'job'),(403,'john'),(213,'jurisdictions'),(935,'karbasizaed'),(508,'karim'),(166,'kekkonen'),(959,'kelebsiella'),(322,'key'),(314,'knowledge'),(635,'kumiega'),(105,'kwantes'),(700,'kyle'),(6,'lactation'),(395,'laerhoven'),(907,'lameness'),(749,'language'),(471,'large'),(519,'largely'),(870,'largest'),(792,'lasting'),(618,'layers'),(349,'leads'),(70,'lean'),(325,'learn'),(320,'learners'),(209,'learning'),(540,'led'),(551,'leo'),(910,'lesions'),(191,'level'),(609,'levels'),(528,'leveraged'),(545,'limitations'),(608,'linoleic'),(602,'linolenic'),(634,'lise'),(410,'literature'),(850,'live'),(919,'liver'),(837,'locally'),(366,'long'),(563,'long-term'),(680,'longer'),(877,'longissimus'),(374,'los'),(75,'losses'),(703,'low'),(72,'lower'),(599,'lowest'),(924,'lungs'),(912,'lymph'),(376,'mackenzie'),(838,'made'),(577,'maize'),(181,'major'),(369,'managed'),(427,'management'),(195,'mandated'),(872,'march'),(641,'marcos'),(549,'margaret'),(238,'mark'),(78,'marked'),(896,'markedly'),(816,'marketable'),(572,'matched'),(830,'material'),(47,'matter'),(889,'mbororo'),(342,'means'),(898,'meat'),(256,'mechanisms'),(222,'meet'),(801,'menace'),(740,'met'),(938,'metal'),(974,'metals'),(485,'methodology'),(971,'mic'),(379,'mid-1980s'),(785,'militate'),(968,'minimal'),(370,'mismanaged'),(297,'mistakenly'),(501,'model'),(450,'modeling'),(446,'models'),(77,'moderate'),(507,'modifying'),(728,'monitoring'),(600,'monounsaturated'),(168,'montgomerie'),(851,'months'),(550,'morse'),(807,'mosaic'),(343,'motivate'),(352,'motivation'),(601,'mufa'),(986,'multi-level'),(982,'multidrug-resistance'),(753,'multiethnic'),(752,'multilingual'),(121,'multinational'),(965,'multiple'),(404,'mwandenga'),(795,'nairobi'),(124,'national'),(133,'nations'),(127,'nature'),(470,'necessarily'),(726,'necessitates'),(988,'networked'),(234,'newly'),(739,'nicaragua'),(798,'nigeria'),(110,'nine-nation'),(913,'nodes'),(916,'nodular'),(707,'non-drought'),(678,'normal'),(709,'north'),(943,'nosocomial'),(441,'novak'),(689,'numerical'),(324,'nurturing'),(856,'nutrition'),(628,'nutritional'),(59,'observed'),(419,'offer'),(578,'oil'),(674,'onion'),(282,'order'),(122,'organization'),(140,'organizational'),(538,'organizations'),(917,'organs'),(881,'origin'),(493,'original'),(355,'ostrom'),(746,'overcome'),(397,'paglieri'),(224,'paper'),(61,'parameters'),(613,'parma'),(298,'part'),(98,'partially'),(326,'participate'),(760,'participatory'),(537,'partner'),(361,'past'),(731,'patricia'),(978,'pattern'),(948,'patterns'),(16,'pbps'),(79,'pbps-fed'),(789,'pedagogy'),(748,'people'),(303,'people’s'),(962,'percent'),(69,'percentages'),(557,'performance'),(49,'period'),(697,'periods'),(456,'permit'),(467,'permits'),(145,'personal'),(976,'persons'),(1007,'perverse'),(263,'phillips'),(99,'pig'),(559,'piglets'),(22,'pigs'),(400,'pinto'),(372,'places'),(651,'plan'),(459,'planning'),(828,'planting'),(261,'plants'),(940,'plasmid'),(960,'pneumoniae'),(95,'point'),(176,'policy'),(597,'polyunsaturated'),(388,'pool'),(723,'population'),(818,'portions'),(345,'positive'),(964,'possess'),(428,'potential'),(705,'potentiometric'),(782,'power'),(424,'practical'),(177,'practice'),(873,'pre-slaughter'),(891,'predominant'),(902,'pregnant'),(531,'present'),(331,'presented'),(799,'presents'),(12,'pressed'),(931,'prevent'),(154,'previous'),(647,'primary'),(516,'principles'),(294,'pro-cedural'),(80,'prob-'),(338,'problem'),(1002,'problematic'),(299,'procedural'),(846,'processing'),(10,'production'),(288,'productive'),(102,'products'),(215,'professional'),(565,'profile'),(949,'profiles'),(666,'program'),(928,'programmes'),(250,'progress'),(541,'project-based'),(536,'projects'),(932,'promote'),(790,'promoting'),(719,'properties'),(390,'property'),(625,'proportion'),(417,'prospects'),(652,'protect'),(473,'provide'),(193,'province'),(185,'provincial'),(229,'public'),(598,'pufa'),(14,'pulp'),(699,'pumping'),(1008,'punishing'),(284,'pursue'),(8,'quality'),(7,'quantity'),(657,'questions'),(658,'raised'),(793,'rana'),(571,'randomized'),(579,'rapeseed'),(722,'rapid'),(231,'rate'),(44,'ratio'),(1004,'reaching'),(103,'readily'),(894,'rearing'),(401,'reason'),(91,'receiving'),(249,'recent'),(694,'recharge'),(402,'reclaimed'),(876,'recorded'),(981,'recovered'),(888,'red'),(815,'reduction'),(820,'reductions'),(592,'reflected'),(466,'reflects'),(285,'refute'),(88,'regard'),(805,'regarded'),(385,'region'),(457,'regional'),(386,'regions'),(783,'relations'),(977,'relationship'),(438,'rely'),(958,'remaining'),(492,'removed'),(48,'replaced'),(17,'replacing'),(158,'report'),(879,'represent'),(862,'representative'),(497,'represents'),(233,'require'),(210,'required'),(172,'requirements'),(159,'research'),(378,'researchers'),(489,'reservoir'),(468,'reservoirs'),(939,'resistance'),(834,'resistant'),(389,'resource'),(368,'resources'),(207,'respect'),(914,'respiratory'),(230,'response'),(128,'responses'),(683,'result'),(611,'result-'),(226,'results'),(138,'revealed'),(248,'review'),(375,'reyes'),(359,'rienced'),(455,'rights'),(463,'river'),(274,'robert'),(323,'role'),(398,'rome'),(853,'rosanna'),(854,'rossi'),(813,'rot'),(826,'rotation'),(452,'routinely'),(1010,'ruled'),(866,'safety'),(585,'samples'),(640,'san'),(993,'sanction'),(999,'sanctioned'),(1001,'sanctioning'),(994,'sanctions'),(109,'satisfaction'),(150,'satisfied'),(594,'saturated'),(884,'savannah'),(364,'scholars'),(212,'school'),(76,'seasoning'),(383,'sec-'),(633,'security'),(663,'segments'),(488,'selected'),(315,'self-belief'),(336,'self-efficacy'),(985,'self-organization'),(89,'semimembranosus'),(682,'separated'),(199,'september'),(646,'serves'),(513,'service'),(522,'service-learning'),(495,'set'),(525,'setting'),(961,'seventy'),(811,'severe'),(596,'sfa'),(278,'share'),(266,'shared'),(430,'shareholding'),(849,'shelf'),(622,'show'),(66,'showed'),(332,'showing'),(344,'shown'),(702,'shows'),(415,'signal'),(413,'signaling'),(407,'signalling'),(57,'significant'),(67,'significantly'),(15,'silage'),(899,'similar'),(482,'simplifying'),(483,'simulation'),(688,'simulations'),(120,'single'),(858,'situation'),(171,'skill'),(187,'skills'),(909,'skin'),(583,'slaughter'),(860,'slaughtered'),(582,'slaughtering'),(708,'slopes'),(329,'social'),(327,'society'),(554,'sodium'),(307,'sokoloff'),(339,'solving'),(650,'source'),(649,'south-central'),(654,'species'),(367,'specific'),(205,'specifies'),(806,'spread'),(642,'springs'),(762,'staff'),(219,'standards'),(510,'stanford'),(465,'state'),(458,'statewide'),(803,'storage'),(821,'stored'),(963,'strains'),(217,'strategies'),(333,'strategy'),(496,'streamflows'),(929,'strengthen'),(716,'structural'),(148,'structures'),(539,'student'),(188,'students'),(20,'studied'),(330,'studies'),(112,'study'),(865,'sub-region'),(619,'subcutaneous'),(360,'substantial'),(544,'successful'),(160,'suggest'),(414,'suggests'),(225,'summarizes'),(581,'supplement-'),(564,'supplementation'),(575,'supplemented'),(648,'supply'),(144,'support'),(296,'supporters'),(775,'supporting'),(672,'surface'),(118,'survey'),(515,'sustainability'),(511,'sustainable'),(40,'sweet'),(451,'system'),(448,'systems'),(751,'takes'),(576,'tallow'),(341,'taught'),(529,'teach'),(174,'teachers'),(221,'teachers’'),(629,'technological'),(179,'technology'),(208,'technology”'),(835,'tecto'),(936,'tehran'),(227,'telephone'),(587,'ten'),(449,'texas'),(408,'theory'),(271,'thesis'),(836,'thiabendazole'),(878,'thoracis'),(774,'time'),(371,'times'),(567,'tissue'),(184,'today'),(975,'tolerant'),(527,'tool'),(292,'topic'),(518,'topics'),(264,'toronto'),(384,'tors'),(900,'toughest'),(406,'town'),(933,'trade'),(39,'traditional'),(245,'transformation'),(885,'transhumance'),(589,'treatment'),(621,'treatments'),(247,'trees'),(729,'trend'),(53,'trial'),(923,'tuberculosis'),(819,'tubers'),(214,'turning'),(479,'types'),(87,'unaffected'),(255,'understanding'),(3,'university'),(777,'university’s'),(715,'unknown'),(616,'unsaturation'),(220,'upgrade'),(302,'uphold'),(756,'uraccan'),(165,'urho'),(934,'vajiheh'),(983,'valerie'),(346,'valuable'),(93,'values'),(394,'van'),(706,'variation'),(897,'varied'),(461,'variety'),(671,'vicinity'),(240,'victoria'),(96,'view'),(808,'virus'),(517,'vital'),(695,'vulnerable'),(767,'wales'),(444,'water'),(664,'water-level'),(558,'weaned'),(560,'weaning'),(30,'weight'),(573,'weights'),(677,'wet'),(45,'whey'),(41,'whey-'),(25,'whey-diluted'),(569,'white'),(305,'widely'),(984,'williamson'),(106,'windsor'),(377,'wittfogel'),(733,'wolverhampton'),(840,'wood'),(1013,'woods'),(260,'woody'),(382,'work'),(387,'world'),(796,'yam'),(812,'yams'),(869,'yaoundé'),(852,'year'),(1012,'zita'),(206,'“expected'),(626,'“healthy”');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  `pos` int NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3663 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,1,0),(2,1,2,1),(3,1,3,2),(4,1,4,3),(5,2,5,0),(6,2,6,1),(7,2,7,2),(8,2,8,3),(9,2,9,4),(10,2,10,5),(11,3,11,0),(12,3,12,1),(13,3,13,2),(14,3,14,3),(15,3,15,4),(16,3,16,5),(17,3,17,6),(18,3,18,7),(19,3,19,8),(20,3,20,9),(21,3,21,10),(22,3,22,11),(23,3,23,12),(24,3,24,13),(25,3,25,14),(26,3,26,15),(27,3,27,16),(28,3,22,17),(29,3,28,18),(30,3,29,19),(31,3,30,20),(32,3,31,21),(33,3,32,22),(34,3,33,23),(35,3,34,24),(36,3,35,25),(37,3,36,26),(38,3,37,27),(39,3,38,28),(40,3,22,29),(41,3,23,30),(42,3,39,31),(43,3,40,32),(44,3,41,33),(45,3,42,34),(46,3,43,35),(47,3,44,36),(48,3,45,37),(49,3,46,38),(50,3,47,39),(51,3,16,40),(52,3,48,41),(53,3,18,42),(54,3,19,43),(55,3,49,44),(56,3,50,45),(57,3,51,46),(58,3,52,47),(59,3,53,48),(60,3,19,49),(61,3,16,50),(62,3,48,51),(63,3,18,52),(64,3,19,53),(65,3,54,54),(66,3,49,55),(67,3,26,56),(68,3,55,57),(69,3,24,58),(70,3,25,59),(71,3,56,60),(72,3,57,61),(73,3,58,62),(74,3,59,63),(75,3,60,64),(76,3,61,65),(77,3,62,66),(78,3,63,67),(79,3,22,68),(80,3,26,69),(81,3,64,70),(82,3,65,71),(83,3,16,72),(84,3,66,73),(85,3,67,74),(86,3,68,75),(87,3,69,76),(88,3,70,77),(89,3,71,78),(90,3,72,79),(91,3,69,80),(92,3,73,81),(93,3,71,82),(94,3,74,83),(95,3,30,84),(96,3,75,85),(97,3,76,86),(98,3,77,87),(99,3,67,88),(100,3,78,89),(101,3,79,90),(102,3,22,91),(103,3,80,92),(104,3,81,93),(105,3,72,94),(106,3,82,95),(107,3,83,96),(108,3,84,97),(109,3,85,98),(110,3,86,99),(111,3,74,100),(112,3,73,101),(113,3,87,102),(114,3,26,103),(115,3,88,104),(116,3,89,105),(117,3,90,106),(118,3,22,107),(119,3,91,108),(120,3,16,109),(121,3,66,110),(122,3,72,111),(123,3,92,112),(124,3,93,113),(125,3,94,114),(126,3,95,115),(127,3,96,116),(128,3,97,117),(129,3,16,118),(130,3,98,119),(131,3,17,120),(132,3,18,121),(133,3,24,122),(134,3,45,123),(135,3,21,124),(136,3,99,125),(137,3,10,126),(138,3,100,127),(139,3,101,128),(140,3,102,129),(141,3,103,130),(228,9,104,0),(229,9,105,1),(230,9,3,2),(231,9,106,3),(232,9,165,4),(233,9,166,5),(234,10,107,0),(235,10,108,1),(236,10,109,2),(237,10,110,3),(238,10,111,4),(239,10,112,5),(240,10,113,6),(241,10,114,7),(242,11,115,0),(243,11,116,1),(244,11,117,2),(245,11,118,3),(246,11,119,4),(247,11,120,5),(248,11,121,6),(249,11,122,7),(250,11,123,8),(251,11,83,9),(252,11,124,10),(253,11,125,11),(254,11,126,12),(255,11,127,13),(256,11,108,14),(257,11,109,15),(258,11,128,16),(259,11,129,17),(260,11,130,18),(261,11,131,19),(262,11,132,20),(263,11,133,21),(264,11,134,22),(265,11,135,23),(266,11,136,24),(267,11,137,25),(268,11,138,26),(269,11,139,27),(270,11,140,28),(271,11,141,29),(272,11,140,30),(273,11,142,31),(274,11,143,32),(275,11,140,33),(276,11,144,34),(277,11,145,35),(278,11,146,36),(279,11,147,37),(280,11,136,38),(281,11,148,39),(282,11,140,40),(283,11,141,41),(284,11,149,42),(285,11,113,43),(286,11,114,44),(287,11,145,45),(288,11,146,46),(289,11,150,47),(290,11,119,48),(291,11,151,49),(292,11,150,50),(293,11,152,51),(294,11,153,52),(295,11,154,53),(296,11,155,54),(297,11,156,55),(298,11,157,56),(299,11,133,57),(300,11,158,58),(301,11,68,59),(302,11,109,60),(303,11,159,61),(304,11,155,62),(305,11,160,63),(306,11,124,64),(307,11,161,65),(308,11,162,66),(309,11,163,67),(310,11,164,68),(311,11,127,69),(312,11,108,70),(313,11,109,71),(314,13,119,0),(315,13,118,1),(646,25,167,0),(647,25,168,1),(648,25,3,2),(649,25,169,3),(650,25,238,4),(651,25,239,5),(652,25,3,6),(653,25,240,7),(654,26,170,0),(655,26,171,1),(656,26,172,2),(657,26,173,3),(658,26,174,4),(659,26,175,5),(660,26,176,6),(661,26,177,7),(662,27,178,0),(663,27,179,1),(664,27,180,2),(665,27,181,3),(666,27,182,4),(667,27,183,5),(668,27,184,6),(669,27,124,7),(670,27,185,8),(671,27,186,9),(672,27,179,10),(673,27,187,11),(674,27,188,12),(675,27,189,13),(676,27,190,14),(677,27,191,15),(678,27,192,16),(679,27,193,17),(680,27,169,18),(681,27,194,19),(682,27,195,20),(683,27,196,21),(684,27,197,22),(685,27,198,23),(686,27,199,24),(687,27,200,25),(688,27,201,26),(689,27,141,27),(690,27,179,28),(691,27,197,29),(692,27,202,30),(693,27,203,31),(694,27,204,32),(695,27,205,33),(696,27,188,34),(697,27,206,35),(698,27,207,36),(699,27,208,37),(700,27,169,38),(701,27,209,39),(702,27,174,40),(703,27,210,41),(704,27,211,42),(705,27,197,43),(706,27,212,44),(707,27,213,45),(708,27,214,46),(709,27,215,47),(710,27,216,48),(711,27,217,49),(712,27,218,50),(713,27,219,51),(714,27,220,52),(715,27,221,53),(716,27,170,54),(717,27,187,55),(718,27,222,56),(719,27,223,57),(720,27,224,58),(721,27,225,59),(722,27,226,60),(723,27,227,61),(724,27,118,62),(725,27,228,63),(726,27,229,64),(727,27,212,65),(728,27,213,66),(729,27,193,67),(730,27,169,68),(731,27,230,69),(732,27,231,70),(733,27,232,71),(734,27,170,72),(735,27,187,73),(736,27,212,74),(737,27,213,75),(738,27,233,76),(739,27,234,77),(740,27,235,78),(741,27,174,79),(742,27,144,80),(743,27,217,81),(744,27,236,82),(745,27,236,83),(746,27,174,84),(747,29,237,0),(748,29,179,1),(749,29,170,2),(750,29,187,3),(751,29,118,4),(752,29,169,5),(753,29,124,6),(754,29,185,7),(755,29,215,8),(756,29,216,9),(757,29,119,10),(758,33,241,0),(759,33,242,1),(760,33,243,2),(761,33,3,3),(762,34,244,0),(763,34,245,1),(764,34,246,2),(765,34,247,3),(766,35,248,0),(767,35,249,1),(768,35,250,2),(769,35,244,3),(770,35,245,4),(771,35,246,5),(772,35,247,6),(773,35,251,7),(774,35,252,8),(775,35,244,9),(776,35,253,10),(777,35,254,11),(778,35,246,12),(779,35,247,13),(780,35,255,14),(781,35,256,15),(782,35,257,16),(783,35,258,17),(784,35,259,18),(785,35,260,19),(786,35,261,20),(925,49,262,0),(926,49,263,1),(927,49,3,2),(928,49,264,3),(929,50,265,0),(930,50,266,1),(931,50,267,2),(932,50,210,3),(933,50,268,4),(934,50,269,5),(935,50,270,6),(936,50,271,7),(937,50,272,8),(938,50,273,9),(939,51,274,0),(940,51,275,1),(941,51,276,2),(942,51,277,3),(943,51,278,4),(944,51,279,5),(945,51,267,6),(946,51,280,7),(947,51,281,8),(948,51,282,9),(949,51,283,10),(950,51,284,11),(951,51,268,12),(952,51,285,13),(953,51,286,14),(954,51,287,15),(955,51,265,16),(956,51,266,17),(957,51,267,18),(958,51,210,19),(959,51,288,20),(960,51,268,21),(961,51,289,22),(962,51,267,23),(963,51,290,24),(964,51,291,25),(965,51,280,26),(966,51,292,27),(967,51,293,28),(968,51,266,29),(969,51,294,30),(970,51,281,31),(971,51,295,32),(972,51,160,33),(973,51,275,34),(974,51,296,35),(975,51,297,36),(976,51,96,37),(977,51,266,38),(978,51,280,39),(979,51,298,40),(980,51,210,41),(981,51,267,42),(982,51,288,43),(983,51,268,44),(984,51,299,45),(985,51,300,46),(986,51,301,47),(987,51,302,48),(988,51,303,49),(989,51,280,50),(990,51,304,51),(991,51,305,52),(992,51,292,53),(993,51,293,54),(1077,57,306,0),(1078,57,307,1),(1079,57,3,2),(1080,57,308,3),(1081,57,309,4),(1082,58,310,0),(1083,58,311,1),(1084,58,280,2),(1085,58,180,3),(1086,59,181,0),(1087,59,223,1),(1088,59,183,2),(1089,59,312,3),(1090,59,313,4),(1091,59,314,5),(1092,59,187,6),(1093,59,315,7),(1094,59,316,8),(1095,59,317,9),(1096,59,318,10),(1097,59,318,11),(1098,59,319,12),(1099,59,320,13),(1100,59,321,14),(1101,59,224,15),(1102,59,322,16),(1103,59,323,17),(1104,59,324,18),(1105,59,311,19),(1106,59,280,20),(1107,59,282,21),(1108,59,325,22),(1109,59,326,23),(1110,59,212,24),(1111,59,327,25),(1112,59,159,26),(1113,59,155,27),(1114,59,328,28),(1115,59,329,29),(1116,59,330,30),(1117,59,162,31),(1118,59,331,32),(1119,59,332,33),(1120,59,333,34),(1121,59,334,35),(1122,59,335,36),(1123,59,336,37),(1124,59,209,38),(1125,59,298,39),(1126,59,159,40),(1127,59,337,41),(1128,59,338,42),(1129,59,339,43),(1130,59,340,44),(1131,59,341,45),(1132,59,313,46),(1133,59,342,47),(1134,59,343,48),(1135,59,144,49),(1136,59,209,50),(1137,59,344,51),(1138,59,340,52),(1139,59,345,53),(1140,59,11,54),(1141,59,336,55),(1142,59,209,56),(1143,59,346,57),(1144,59,279,58),(1145,59,347,59),(1146,59,313,60),(1147,59,348,61),(1148,59,349,62),(1149,59,329,63),(1150,59,350,64),(1151,59,175,65),(1152,59,351,66),(1153,59,336,67),(1154,59,352,68),(1155,59,325,69),(1156,59,180,70),(1157,59,251,71),(1158,61,183,0),(1159,61,353,1),(1217,65,354,0),(1218,65,355,1),(1219,65,356,2),(1220,65,3,3),(1221,65,393,4),(1222,65,394,5),(1223,65,395,6),(1224,65,356,7),(1225,65,3,8),(1226,66,310,0),(1227,66,311,1),(1228,66,280,2),(1229,66,180,3),(1230,67,112,0),(1231,67,357,1),(1232,67,358,2),(1233,67,359,3),(1234,67,360,4),(1235,67,60,5),(1236,67,216,6),(1237,67,361,7),(1238,67,362,8),(1239,67,363,9),(1240,67,364,10),(1241,67,365,11),(1242,67,366,12),(1243,67,20,13),(1244,67,367,14),(1245,67,368,15),(1246,67,369,16),(1247,67,370,17),(1248,67,371,18),(1249,67,372,19),(1250,67,373,20),(1251,67,374,21),(1252,67,375,22),(1253,67,376,23),(1254,67,377,24),(1255,67,378,25),(1256,67,20,26),(1257,67,367,27),(1258,67,357,28),(1259,67,379,29),(1260,67,380,30),(1261,67,381,31),(1262,67,317,32),(1263,67,382,33),(1264,67,364,34),(1265,67,365,35),(1266,67,383,36),(1267,67,384,37),(1268,67,385,38),(1269,67,100,39),(1270,67,386,40),(1271,67,387,41),(1272,69,291,0),(1273,69,388,1),(1274,69,389,2),(1275,69,291,3),(1276,69,390,4),(1277,69,391,5),(1278,69,392,6),(1287,73,396,0),(1288,73,397,1),(1289,73,3,2),(1290,73,398,3),(1291,74,399,0),(1292,74,400,1),(1293,74,401,2),(1294,74,402,3),(1349,81,403,0),(1350,81,404,1),(1351,81,3,2),(1352,81,405,3),(1353,81,406,4),(1354,82,407,0),(1355,82,408,1),(1356,82,409,2),(1357,82,248,3),(1358,82,410,4),(1359,82,411,5),(1360,82,412,6),(1361,83,413,0),(1362,83,408,1),(1363,83,414,2),(1364,83,409,3),(1365,83,415,4),(1366,83,416,5),(1367,83,417,6),(1368,83,418,7),(1369,83,249,8),(1370,83,411,9),(1371,83,412,10),(1372,83,419,11),(1373,83,420,12),(1374,83,412,13),(1375,83,182,14),(1376,83,421,15),(1377,83,176,16),(1378,83,175,17),(1379,83,422,18),(1380,83,423,19),(1381,83,424,20),(1382,83,425,21),(1383,83,176,22),(1384,83,426,23),(1385,83,427,24),(1386,83,173,25),(1387,83,428,26),(1388,83,429,27),(1389,83,430,28),(1390,83,431,29),(1391,83,432,30),(1392,83,433,31),(1393,83,434,32),(1394,83,435,33),(1395,83,436,34),(1396,83,437,35),(1397,83,427,36),(1398,83,425,37),(1399,83,435,38),(1400,83,438,39),(1401,83,439,40),(1402,83,440,41),(1531,89,403,0),(1532,89,441,1),(1533,89,442,2),(1534,89,3,3),(1535,90,443,0),(1536,90,444,1),(1537,90,445,2),(1538,90,446,3),(1539,90,447,4),(1540,90,367,5),(1541,90,444,6),(1542,90,427,7),(1543,90,448,8),(1544,91,449,0),(1545,91,444,1),(1546,91,445,2),(1547,91,450,3),(1548,91,451,4),(1549,91,452,5),(1550,91,453,6),(1551,91,454,7),(1552,91,444,8),(1553,91,455,9),(1554,91,456,10),(1555,91,451,11),(1556,91,457,12),(1557,91,458,13),(1558,91,459,14),(1559,91,460,15),(1560,91,461,16),(1561,91,462,17),(1562,91,450,18),(1563,91,444,19),(1564,91,427,20),(1565,91,463,21),(1566,91,464,22),(1567,91,465,23),(1568,91,466,24),(1569,91,444,25),(1570,91,467,26),(1571,91,468,27),(1572,91,469,28),(1573,91,470,29),(1574,91,471,30),(1575,91,472,31),(1576,91,473,32),(1577,91,474,33),(1578,91,475,34),(1579,91,450,35),(1580,91,451,36),(1581,91,476,37),(1582,91,450,38),(1583,91,477,39),(1584,91,478,40),(1585,91,479,41),(1586,91,252,42),(1587,91,480,43),(1588,91,252,44),(1589,91,481,45),(1590,91,482,46),(1591,91,483,47),(1592,91,484,48),(1593,91,469,49),(1594,91,447,50),(1595,91,444,51),(1596,91,427,52),(1597,91,448,53),(1598,91,485,54),(1599,91,331,55),(1600,91,310,56),(1601,91,486,57),(1602,91,487,58),(1603,91,488,59),(1604,91,489,60),(1605,91,451,61),(1606,91,466,62),(1607,91,490,63),(1608,91,444,64),(1609,91,455,65),(1610,91,491,66),(1611,91,468,67),(1612,91,492,68),(1613,91,493,69),(1614,91,494,70),(1615,91,487,71),(1616,91,495,72),(1617,91,496,73),(1618,91,476,74),(1619,91,497,75),(1620,91,498,76),(1621,91,488,77),(1622,91,451,78),(1623,91,11,79),(1624,91,444,80),(1625,91,455,81),(1626,91,463,82),(1627,91,499,83),(1628,91,500,84),(1629,91,493,85),(1630,91,494,86),(1631,91,501,87),(1632,91,484,88),(1633,91,487,89),(1634,91,502,90),(1635,91,486,91),(1636,91,487,92),(1637,91,485,93),(1638,91,453,94),(1639,91,503,95),(1640,91,486,96),(1641,91,501,97),(1642,91,504,98),(1643,91,463,99),(1644,91,505,100),(1645,91,489,101),(1646,91,451,102),(1647,91,506,103),(1648,91,507,104),(1649,91,449,105),(1650,91,444,106),(1651,91,445,107),(1652,91,450,108),(1653,91,451,109),(1654,91,487,110),(1655,91,504,111),(1656,91,463,112),(1657,91,499,113),(1658,93,444,0),(1736,97,508,0),(1737,97,509,1),(1738,97,510,2),(1739,97,3,3),(1740,97,549,4),(1741,97,550,5),(1742,97,510,6),(1743,97,3,7),(1744,98,209,0),(1745,98,511,1),(1746,98,512,2),(1747,98,513,3),(1748,99,514,0),(1749,99,515,1),(1750,99,511,2),(1751,99,216,3),(1752,99,516,4),(1753,99,517,5),(1754,99,518,6),(1755,99,253,7),(1756,99,183,8),(1757,99,519,9),(1758,99,520,10),(1759,99,521,11),(1760,99,522,12),(1761,99,523,13),(1762,99,329,14),(1763,99,513,15),(1764,99,524,16),(1765,99,525,17),(1766,99,526,18),(1767,99,527,19),(1768,99,528,20),(1769,99,529,21),(1770,99,511,22),(1771,99,512,23),(1772,99,416,24),(1773,99,530,25),(1774,99,531,26),(1775,99,501,27),(1776,99,522,28),(1777,99,529,29),(1778,99,511,30),(1779,99,512,31),(1780,99,506,32),(1781,99,532,33),(1782,99,510,34),(1783,99,533,35),(1784,99,530,36),(1785,99,511,37),(1786,99,387,38),(1787,99,501,39),(1788,99,534,40),(1789,99,535,41),(1790,99,536,42),(1791,99,537,43),(1792,99,538,44),(1793,99,539,45),(1794,99,540,46),(1795,99,541,47),(1796,99,512,48),(1797,99,542,49),(1798,99,543,50),(1799,99,537,51),(1800,99,538,52),(1801,99,501,53),(1802,99,544,54),(1803,99,545,55),(1804,99,546,56),(1805,99,547,57),(1806,99,251,58),(1807,99,416,59),(1808,99,548,60),(1809,99,460,61),(1810,99,501,62),(1811,101,216,0),(1812,101,253,1),(1813,101,183,2),(1814,101,513,3),(1815,101,209,4),(1816,101,515,5),(1978,105,551,0),(1979,105,552,1),(1980,105,553,2),(1981,105,124,3),(1982,105,3,4),(1983,106,554,0),(1984,106,555,1),(1985,106,556,2),(1986,106,60,3),(1987,106,557,4),(1988,106,558,5),(1989,106,559,6),(1990,106,49,7),(1991,106,560,8),(1992,107,561,0),(1993,107,112,1),(1994,107,562,2),(1995,107,5,3),(1996,107,563,4),(1997,107,73,5),(1998,107,564,6),(1999,107,84,7),(2000,107,85,8),(2001,107,565,9),(2002,107,21,10),(2003,107,99,11),(2004,107,566,12),(2005,107,567,13),(2006,107,568,14),(2007,107,471,15),(2008,107,569,16),(2009,107,31,17),(2010,107,570,18),(2011,107,571,19),(2012,107,572,20),(2013,107,573,21),(2014,107,574,22),(2015,107,26,23),(2016,107,575,24),(2017,107,576,25),(2018,107,577,26),(2019,107,578,27),(2020,107,579,28),(2021,107,578,29),(2022,107,580,30),(2023,107,581,31),(2024,107,23,32),(2025,107,582,33),(2026,107,583,34),(2027,107,584,35),(2028,107,585,36),(2029,107,586,37),(2030,107,587,38),(2031,107,588,39),(2032,107,589,40),(2033,107,590,41),(2034,107,84,42),(2035,107,85,43),(2036,107,86,44),(2037,107,584,45),(2038,107,591,46),(2039,107,592,47),(2040,107,84,48),(2041,107,85,49),(2042,107,86,50),(2043,107,575,51),(2044,107,580,52),(2045,107,584,53),(2046,107,22,54),(2047,107,23,55),(2048,107,593,56),(2049,107,594,57),(2050,107,84,58),(2051,107,85,59),(2052,107,595,60),(2053,107,596,61),(2054,107,23,62),(2055,107,593,63),(2056,107,595,64),(2057,107,597,65),(2058,107,84,66),(2059,107,85,67),(2060,107,598,68),(2061,107,599,69),(2062,107,600,70),(2063,107,84,71),(2064,107,85,72),(2065,107,601,73),(2066,107,595,74),(2067,107,23,75),(2068,107,593,76),(2069,107,595,77),(2070,107,602,78),(2071,107,85,79),(2072,107,603,80),(2073,107,604,81),(2074,107,605,82),(2075,107,606,83),(2076,107,85,84),(2077,107,607,85),(2078,107,589,86),(2079,107,164,87),(2080,107,608,88),(2081,107,85,89),(2082,107,609,90),(2083,107,610,91),(2084,107,584,92),(2085,107,611,93),(2086,107,65,94),(2087,107,609,95),(2088,107,68,96),(2089,107,603,97),(2090,107,612,98),(2091,107,613,99),(2092,107,614,100),(2093,107,615,101),(2094,107,74,102),(2095,107,616,103),(2096,107,617,104),(2097,107,618,105),(2098,107,619,106),(2099,107,584,107),(2100,107,567,108),(2101,107,620,109),(2102,107,67,110),(2103,107,621,111),(2104,107,226,112),(2105,107,622,113),(2106,107,563,114),(2107,107,623,115),(2108,107,564,116),(2109,107,580,117),(2110,107,84,118),(2111,107,85,119),(2112,107,565,120),(2113,107,21,121),(2114,107,99,122),(2115,107,566,123),(2116,107,567,124),(2117,107,564,125),(2118,107,579,126),(2119,107,578,127),(2120,107,624,128),(2121,107,625,129),(2122,107,626,130),(2123,107,84,131),(2124,107,627,132),(2125,107,99,133),(2126,107,73,134),(2127,107,254,135),(2128,107,628,136),(2129,107,8,137),(2130,107,11,138),(2131,107,629,139),(2132,107,8,140),(2133,107,73,141),(2134,107,630,142),(2135,107,631,143),(2136,109,22,0),(2137,109,632,1),(2138,109,633,2),(2364,113,634,0),(2365,113,635,1),(2366,113,3,2),(2367,113,405,3),(2368,113,406,4),(2369,114,636,0),(2370,114,637,1),(2371,114,638,2),(2372,114,639,3),(2373,114,640,4),(2374,114,641,5),(2375,114,642,6),(2376,114,643,7),(2377,114,642,8),(2378,114,644,9),(2379,114,645,10),(2380,115,638,0),(2381,115,639,1),(2382,115,646,2),(2383,115,647,3),(2384,115,444,4),(2385,115,648,5),(2386,115,649,6),(2387,115,449,7),(2388,115,650,8),(2389,115,181,9),(2390,115,642,10),(2391,115,310,11),(2392,115,651,12),(2393,115,652,13),(2394,115,653,14),(2395,115,654,15),(2396,115,655,16),(2397,115,656,17),(2398,115,640,18),(2399,115,641,19),(2400,115,642,20),(2401,115,657,21),(2402,115,658,22),(2403,115,659,23),(2404,115,660,24),(2405,115,636,25),(2406,115,661,26),(2407,115,640,27),(2408,115,662,28),(2409,115,643,29),(2410,115,642,30),(2411,115,663,31),(2412,115,638,32),(2413,115,639,33),(2414,115,644,34),(2415,115,645,35),(2416,115,521,36),(2417,115,657,37),(2418,115,664,38),(2419,115,116,39),(2420,115,665,40),(2421,115,666,41),(2422,115,667,42),(2423,115,112,43),(2424,115,328,44),(2425,115,137,45),(2426,115,668,46),(2427,115,116,47),(2428,115,669,48),(2429,115,661,49),(2430,115,670,50),(2431,115,671,51),(2432,115,672,52),(2433,115,673,53),(2434,115,661,54),(2435,115,674,55),(2436,115,675,56),(2437,115,676,57),(2438,115,463,58),(2439,115,677,59),(2440,115,678,60),(2441,115,636,61),(2442,115,645,62),(2443,115,137,63),(2444,115,116,64),(2445,115,586,65),(2446,115,644,66),(2447,115,414,67),(2448,115,669,68),(2449,115,661,69),(2450,115,679,70),(2451,115,680,71),(2452,115,681,72),(2453,115,682,73),(2454,115,663,74),(2455,115,683,75),(2456,115,428,76),(2457,115,669,77),(2458,115,684,78),(2459,115,361,79),(2460,115,640,80),(2461,115,641,81),(2462,115,642,82),(2463,115,643,83),(2464,115,642,84),(2465,115,181,85),(2466,115,685,86),(2467,115,175,87),(2468,115,686,88),(2469,115,427,89),(2470,115,445,90),(2471,115,669,91),(2472,115,638,92),(2473,115,639,93),(2474,115,687,94),(2475,115,688,95),(2476,115,689,96),(2477,115,501,97),(2478,115,160,98),(2479,115,690,99),(2480,115,691,100),(2481,115,361,101),(2482,115,640,102),(2483,115,641,103),(2484,115,643,104),(2485,115,642,105),(2486,115,644,106),(2487,115,645,107),(2488,115,669,108),(2489,115,661,109),(2490,115,692,110),(2491,115,693,111),(2492,115,694,112),(2493,115,674,113),(2494,115,675,114),(2495,115,676,115),(2496,115,463,116),(2497,115,692,117),(2498,115,695,118),(2499,115,696,119),(2500,115,697,120),(2501,115,694,121),(2502,115,698,122),(2503,115,699,123),(2504,115,671,124),(2505,115,700,125),(2506,115,701,126),(2507,115,116,127),(2508,115,495,128),(2509,115,702,129),(2510,115,703,130),(2511,115,704,131),(2512,115,705,132),(2513,115,672,133),(2514,115,640,134),(2515,115,641,135),(2516,115,642,136),(2517,115,700,137),(2518,115,706,138),(2519,115,609,139),(2520,115,644,140),(2521,115,707,141),(2522,115,697,142),(2523,115,700,143),(2524,115,643,144),(2525,115,642,145),(2526,115,705,146),(2527,115,672,147),(2528,115,708,148),(2529,115,67,149),(2530,115,709,150),(2531,115,710,151),(2532,115,609,152),(2533,115,644,153),(2534,115,707,154),(2535,115,697,155),(2536,115,650,156),(2537,115,127,157),(2538,115,711,158),(2539,115,712,159),(2540,115,705,160),(2541,115,713,161),(2542,115,714,162),(2543,115,444,163),(2544,115,191,164),(2545,115,230,165),(2546,115,700,166),(2547,115,715,167),(2548,115,716,168),(2549,115,717,169),(2550,115,718,170),(2551,115,719,171),(2552,115,720,172),(2553,115,639,173),(2554,115,711,174),(2555,115,5,175),(2556,115,83,176),(2557,115,636,177),(2558,115,721,178),(2559,115,640,179),(2560,115,641,180),(2561,115,643,181),(2562,115,642,182),(2563,115,722,183),(2564,115,723,184),(2565,115,60,185),(2566,115,724,186),(2567,115,444,187),(2568,115,725,188),(2569,115,700,189),(2570,115,701,190),(2571,115,101,191),(2572,115,726,192),(2573,115,727,193),(2574,115,669,194),(2575,115,191,195),(2576,115,728,196),(2577,115,666,197),(2578,115,640,198),(2579,115,641,199),(2580,115,642,200),(2581,115,701,201),(2582,115,473,202),(2583,115,116,203),(2584,115,416,204),(2585,115,667,205),(2586,115,729,206),(2587,115,730,207),(2588,117,444,0),(2707,121,731,0),(2708,121,732,1),(2709,121,3,2),(2710,121,733,3),(2711,122,734,0),(2712,122,735,1),(2713,122,197,2),(2714,122,736,3),(2715,122,112,4),(2716,122,737,5),(2717,122,738,6),(2718,122,739,7),(2719,123,546,0),(2720,123,740,1),(2721,123,741,2),(2722,123,742,3),(2723,123,743,4),(2724,123,744,5),(2725,123,745,6),(2726,123,183,7),(2727,123,746,8),(2728,123,747,9),(2729,123,319,10),(2730,123,547,11),(2731,123,748,12),(2732,123,19,13),(2733,123,749,14),(2734,123,125,15),(2735,123,750,16),(2736,123,736,17),(2737,123,112,18),(2738,123,751,19),(2739,123,737,20),(2740,123,738,21),(2741,123,739,22),(2742,123,752,23),(2743,123,753,24),(2744,123,385,25),(2745,123,754,26),(2746,123,755,27),(2747,123,3,28),(2748,123,756,29),(2749,123,757,30),(2750,123,216,31),(2751,123,758,32),(2752,123,759,33),(2753,123,760,34),(2754,123,159,35),(2755,123,761,36),(2756,123,3,37),(2757,123,762,38),(2758,123,188,39),(2759,123,763,40),(2760,123,764,41),(2761,123,735,42),(2762,123,197,43),(2763,123,217,44),(2764,123,765,45),(2765,123,501,46),(2766,123,19,47),(2767,123,766,48),(2768,123,501,49),(2769,123,755,50),(2770,123,255,51),(2771,123,767,52),(2772,123,197,53),(2773,123,768,54),(2774,123,769,55),(2775,123,770,56),(2776,123,771,57),(2777,123,772,58),(2778,123,773,59),(2779,123,774,60),(2780,123,139,61),(2781,123,775,62),(2782,123,216,63),(2783,123,735,64),(2784,123,197,65),(2785,123,776,66),(2786,123,777,67),(2787,123,778,68),(2788,123,779,69),(2789,123,780,70),(2790,123,772,71),(2791,123,646,72),(2792,123,781,73),(2793,123,782,74),(2794,123,783,75),(2795,123,385,76),(2796,123,784,77),(2797,123,785,78),(2798,123,786,79),(2799,123,3,80),(2800,123,159,81),(2801,123,787,82),(2802,123,788,83),(2803,123,760,84),(2804,123,789,85),(2805,123,19,86),(2806,123,790,87),(2807,123,758,88),(2808,123,791,89),(2809,123,792,90),(2810,123,329,91),(2811,123,245,92),(2812,125,741,0),(2813,125,742,1),(2814,125,745,2),(2815,125,752,3),(2816,125,753,4),(2817,125,760,5),(2818,125,789,6),(2819,125,749,7),(2820,125,125,8),(2821,125,750,9),(2822,125,786,10),(2823,125,329,11),(2824,125,245,12),(2932,129,793,0),(2933,129,794,1),(2934,129,3,2),(2935,129,795,3),(2936,130,796,0),(2937,130,797,1),(2938,130,427,2),(2939,130,798,3),(2940,131,248,0),(2941,131,799,1),(2942,131,797,2),(2943,131,796,3),(2944,131,427,4),(2945,131,217,5),(2946,131,236,6),(2947,131,800,7),(2948,131,801,8),(2949,131,798,9),(2950,131,802,10),(2951,131,803,11),(2952,131,797,12),(2953,131,331,13),(2954,131,804,14),(2955,131,805,15),(2956,131,305,16),(2957,131,806,17),(2958,131,802,18),(2959,131,797,19),(2960,131,796,20),(2961,131,807,21),(2962,131,808,22),(2963,131,809,23),(2964,131,810,24),(2965,131,811,25),(2966,131,75,26),(2967,131,812,27),(2968,131,46,28),(2969,131,813,29),(2970,131,810,30),(2971,131,814,31),(2972,131,803,32),(2973,131,797,33),(2974,131,796,34),(2975,131,46,35),(2976,131,813,36),(2977,131,812,37),(2978,131,78,38),(2979,131,815,39),(2980,131,7,40),(2981,131,816,41),(2982,131,817,42),(2983,131,818,43),(2984,131,819,44),(2985,131,820,45),(2986,131,811,46),(2987,131,821,47),(2988,131,812,48),(2989,131,427,49),(2990,131,217,50),(2991,131,822,51),(2992,131,823,52),(2993,131,800,53),(2994,131,802,54),(2995,131,797,55),(2996,131,824,56),(2997,131,825,57),(2998,131,826,58),(2999,131,827,59),(3000,131,828,60),(3001,131,829,61),(3002,131,830,62),(3003,131,831,63),(3004,131,832,64),(3005,131,825,65),(3006,131,833,66),(3007,131,834,67),(3008,131,833,68),(3009,131,803,69),(3010,131,797,70),(3011,131,835,71),(3012,131,836,72),(3013,131,837,73),(3014,131,838,74),(3015,131,46,75),(3016,131,839,76),(3017,131,840,77),(3018,131,841,78),(3019,131,803,79),(3020,131,842,80),(3021,131,652,81),(3022,131,796,82),(3023,131,819,83),(3024,131,843,84),(3025,131,844,85),(3026,131,803,86),(3027,131,845,87),(3028,131,846,88),(3029,131,796,89),(3030,131,819,90),(3031,131,847,91),(3032,131,848,92),(3033,131,624,93),(3034,131,849,94),(3035,131,850,95),(3036,131,49,96),(3037,131,851,97),(3038,131,852,98),(3186,137,853,0),(3187,137,854,1),(3188,137,855,2),(3189,137,3,3),(3190,138,5,0),(3191,138,563,1),(3192,138,856,2),(3193,138,623,3),(3194,138,580,4),(3195,138,84,5),(3196,138,85,6),(3197,138,86,7),(3198,138,21,8),(3199,138,22,9),(3200,138,584,10),(3201,139,561,0),(3202,139,159,1),(3203,139,473,2),(3204,139,857,3),(3205,139,858,4),(3206,139,859,5),(3207,139,860,6),(3208,139,861,7),(3209,139,862,8),(3210,139,863,9),(3211,139,864,10),(3212,139,865,11),(3213,139,8,12),(3214,139,866,13),(3215,139,867,14),(3216,139,868,15),(3217,139,869,16),(3218,139,870,17),(3219,139,861,18),(3220,139,810,19),(3221,139,871,20),(3222,139,872,21),(3223,139,873,22),(3224,139,645,23),(3225,139,874,24),(3226,139,859,25),(3227,139,875,26),(3228,139,876,27),(3229,139,877,28),(3230,139,878,29),(3231,139,583,30),(3232,139,875,31),(3233,139,488,32),(3234,139,879,33),(3235,139,880,34),(3236,139,860,35),(3237,139,8,36),(3238,139,61,37),(3239,139,86,38),(3240,139,877,39),(3241,139,878,40),(3242,139,761,41),(3243,139,881,42),(3244,139,859,43),(3245,139,882,44),(3246,139,883,45),(3247,139,884,46),(3248,139,885,47),(3249,139,291,48),(3250,139,10,49),(3251,139,451,50),(3252,139,886,51),(3253,139,569,52),(3254,139,887,53),(3255,139,888,54),(3256,139,889,55),(3257,139,890,56),(3258,139,891,57),(3259,139,892,58),(3260,139,30,59),(3261,139,893,60),(3262,139,894,61),(3263,139,451,62),(3264,139,859,63),(3265,139,895,64),(3266,139,896,65),(3267,139,897,66),(3268,139,852,67),(3269,139,898,68),(3270,139,8,69),(3271,139,73,70),(3272,139,595,71),(3273,139,703,72),(3274,139,899,73),(3275,139,890,74),(3276,139,886,75),(3277,139,66,76),(3278,139,900,77),(3279,139,898,78),(3280,139,901,79),(3281,139,860,80),(3282,139,902,81),(3283,139,291,82),(3284,139,903,83),(3285,139,645,84),(3286,139,904,85),(3287,139,905,86),(3288,139,906,87),(3289,139,907,88),(3290,139,908,89),(3291,139,909,90),(3292,139,910,91),(3293,139,911,92),(3294,139,912,93),(3295,139,913,94),(3296,139,914,95),(3297,139,915,96),(3298,139,916,97),(3299,139,910,98),(3300,139,875,99),(3301,139,917,100),(3302,139,918,101),(3303,139,919,102),(3304,139,920,103),(3305,139,921,104),(3306,139,918,105),(3307,139,922,106),(3308,139,923,107),(3309,139,893,108),(3310,139,924,109),(3311,139,116,110),(3312,139,925,111),(3313,139,926,112),(3314,139,927,113),(3315,139,928,114),(3316,139,561,115),(3317,139,929,116),(3318,139,859,117),(3319,139,10,118),(3320,139,930,119),(3321,139,867,120),(3322,139,648,121),(3323,139,38,122),(3324,139,931,123),(3325,139,59,124),(3326,139,797,125),(3327,139,932,126),(3328,139,457,127),(3329,139,933,128),(3330,141,859,0),(3331,141,632,1),(3332,141,633,2),(3439,145,934,0),(3440,145,935,1),(3441,145,3,2),(3442,145,936,3),(3443,146,937,0),(3444,146,21,1),(3445,146,938,2),(3446,146,939,3),(3447,146,940,4),(3448,146,565,5),(3449,146,941,6),(3450,146,942,7),(3451,146,943,8),(3452,146,944,9),(3453,146,945,10),(3454,146,946,11),(3455,146,947,12),(3456,147,937,0),(3457,147,21,1),(3458,147,938,2),(3459,147,939,3),(3460,147,948,4),(3461,147,940,5),(3462,147,949,6),(3463,147,941,7),(3464,147,950,8),(3465,147,942,9),(3466,147,943,10),(3467,147,944,11),(3468,147,829,12),(3469,147,951,13),(3470,147,952,14),(3471,147,135,15),(3472,147,953,16),(3473,147,954,17),(3474,147,943,18),(3475,147,944,19),(3476,147,955,20),(3477,147,956,21),(3478,147,957,22),(3479,147,958,23),(3480,147,959,24),(3481,147,960,25),(3482,147,961,26),(3483,147,962,27),(3484,147,963,28),(3485,147,942,29),(3486,147,943,30),(3487,147,944,31),(3488,147,964,32),(3489,147,965,33),(3490,147,939,34),(3491,147,966,35),(3492,147,135,36),(3493,147,963,37),(3494,147,829,38),(3495,147,951,39),(3496,147,952,40),(3497,147,967,41),(3498,147,968,42),(3499,147,969,43),(3500,147,970,44),(3501,147,971,45),(3502,147,93,46),(3503,147,963,47),(3504,147,972,48),(3505,147,973,49),(3506,147,952,50),(3507,147,21,51),(3508,147,974,52),(3509,147,57,53),(3510,147,963,54),(3511,147,942,55),(3512,147,945,56),(3513,147,975,57),(3514,147,21,58),(3515,147,938,59),(3516,147,829,60),(3517,147,976,61),(3518,147,153,62),(3519,147,977,63),(3520,147,940,64),(3521,147,565,65),(3522,147,56,66),(3523,147,937,67),(3524,147,939,68),(3525,147,978,69),(3526,147,979,70),(3527,147,940,71),(3528,147,980,72),(3529,147,939,73),(3530,147,21,74),(3531,147,974,75),(3532,147,966,76),(3533,147,981,77),(3534,147,963,78),(3535,147,942,79),(3536,147,943,80),(3537,147,944,81),(3538,147,226,82),(3539,147,982,83),(3540,147,941,84),(3541,147,428,85),(3542,147,943,86),(3543,147,844,87),(3544,147,385,88),(3596,153,983,0),(3597,153,984,1),(3598,153,3,2),(3599,153,106,3),(3600,154,985,0),(3601,154,986,1),(3602,154,987,2),(3603,154,988,3),(3604,154,989,4),(3605,155,990,0),(3606,155,525,1),(3607,155,991,2),(3608,155,134,3),(3609,155,992,4),(3610,155,993,5),(3611,155,525,6),(3612,155,994,7),(3613,155,995,8),(3614,155,991,9),(3615,155,996,10),(3616,155,997,11),(3617,155,998,12),(3618,155,999,13),(3619,155,1000,14),(3620,155,1001,15),(3621,155,435,16),(3622,155,1002,17),(3623,155,922,18),(3624,155,1003,19),(3625,155,1004,20),(3626,155,1005,21),(3627,155,1006,22),(3628,155,838,23),(3629,155,996,24),(3630,155,1007,25),(3631,155,1001,26),(3632,155,1008,27),(3633,155,883,28),(3634,155,1009,29),(3635,155,771,30),(3636,155,991,31),(3637,155,1010,32),(3638,155,1000,33),(3639,155,1001,34),(3640,155,435,35),(3641,155,100,36),(3642,155,56,37),(3643,157,985,0),(3644,157,986,1),(3645,157,987,2),(3646,157,1011,3),(3655,161,1012,0),(3656,161,1013,1),(3657,161,1014,2),(3658,162,1015,0),(3659,162,1016,1),(3660,162,1016,2),(3661,165,183,0),(3662,165,353,1);
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
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,1,1,0),(2,1,2,0),(3,1,4,0),(4,1,16,0),(5,1,17,0),(6,1,8,0),(7,1,32,0),(8,1,64,0),(9,2,1,0),(10,2,2,0),(11,2,4,0),(12,2,16,0),(13,2,17,0),(14,2,8,0),(15,2,32,0),(16,2,64,0),(25,3,1,0),(26,3,2,0),(27,3,4,0),(28,3,16,0),(29,3,17,0),(30,3,8,0),(31,3,32,0),(32,3,64,0),(33,4,1,0),(34,4,2,0),(35,4,4,0),(36,4,16,0),(37,4,17,0),(38,4,8,0),(39,4,32,0),(40,4,64,0),(49,5,1,0),(50,5,2,0),(51,5,4,0),(52,5,16,0),(53,5,17,0),(54,5,8,0),(55,5,32,0),(56,5,64,0),(57,6,1,0),(58,6,2,0),(59,6,4,0),(60,6,16,0),(61,6,17,0),(62,6,8,0),(63,6,32,0),(64,6,64,0),(65,7,1,0),(66,7,2,0),(67,7,4,0),(68,7,16,0),(69,7,17,0),(70,7,8,0),(71,7,32,0),(72,7,64,0),(73,8,1,0),(74,8,2,0),(75,8,4,0),(76,8,16,0),(77,8,17,0),(78,8,8,0),(79,8,32,0),(80,8,64,0),(81,9,1,0),(82,9,2,0),(83,9,4,0),(84,9,16,0),(85,9,17,0),(86,9,8,0),(87,9,32,0),(88,9,64,0),(89,10,1,0),(90,10,2,0),(91,10,4,0),(92,10,16,0),(93,10,17,0),(94,10,8,0),(95,10,32,0),(96,10,64,0),(97,11,1,0),(98,11,2,0),(99,11,4,0),(100,11,16,0),(101,11,17,0),(102,11,8,0),(103,11,32,0),(104,11,64,0),(105,12,1,0),(106,12,2,0),(107,12,4,0),(108,12,16,0),(109,12,17,0),(110,12,8,0),(111,12,32,0),(112,12,64,0),(113,13,1,0),(114,13,2,0),(115,13,4,0),(116,13,16,0),(117,13,17,0),(118,13,8,0),(119,13,32,0),(120,13,64,0),(121,14,1,0),(122,14,2,0),(123,14,4,0),(124,14,16,0),(125,14,17,0),(126,14,8,0),(127,14,32,0),(128,14,64,0),(129,15,1,0),(130,15,2,0),(131,15,4,0),(132,15,16,0),(133,15,17,0),(134,15,8,0),(135,15,32,0),(136,15,64,0),(137,16,1,0),(138,16,2,0),(139,16,4,0),(140,16,16,0),(141,16,17,0),(142,16,8,0),(143,16,32,0),(144,16,64,0),(145,17,1,0),(146,17,2,0),(147,17,4,0),(148,17,16,0),(149,17,17,0),(150,17,8,0),(151,17,32,0),(152,17,64,0),(153,18,1,0),(154,18,2,0),(155,18,4,0),(156,18,16,0),(157,18,17,0),(158,18,8,0),(159,18,32,0),(160,18,64,0),(161,19,1,0),(162,19,2,0),(163,19,4,0),(164,19,16,0),(165,19,17,0),(166,19,8,0),(167,19,32,0),(168,19,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submissions';
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
  `stage_id` bigint NOT NULL DEFAULT '5',
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_current_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_current_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2023-05-14 22:12:59','2023-05-14 22:12:59','2023-05-14 22:12:59',5,'en',1,'',0),(2,1,2,'2023-05-14 22:14:23','2023-05-14 22:14:09','2023-05-14 22:14:09',5,'en',3,'',0),(3,1,4,'2023-05-14 22:15:20','2023-05-14 22:14:48','2023-05-14 22:14:48',5,'en',3,'',0),(4,1,5,'2023-05-14 22:16:09','2023-05-14 22:15:43','2023-05-14 22:15:43',5,'en',4,'',0),(5,1,6,'2023-05-14 22:16:56','2023-05-14 22:16:35','2023-05-14 22:16:35',5,'en',3,'',0),(6,1,7,'2023-05-14 22:17:28','2023-05-14 22:17:20','2023-05-14 22:17:20',5,'en',3,'',0),(7,1,8,'2023-05-14 22:18:00','2023-05-14 22:17:52','2023-05-14 22:17:52',5,'en',3,'',0),(8,1,9,'2023-05-14 22:18:31','2023-05-14 22:18:24','2023-05-14 22:18:24',5,'en',3,'',0),(9,1,10,'2023-05-14 22:19:03','2023-05-14 22:18:55','2023-05-14 22:18:55',5,'en',3,'',0),(10,1,11,'2023-05-14 22:19:36','2023-05-14 22:19:27','2023-05-14 22:19:27',5,'en',3,'',0),(11,1,12,'2023-05-14 22:20:08','2023-05-14 22:20:00','2023-05-14 22:20:00',5,'en',3,'',0),(12,1,13,'2023-05-14 22:20:41','2023-05-14 22:20:32','2023-05-14 22:20:32',5,'en',3,'',0),(13,1,14,'2023-05-14 22:21:14','2023-05-14 22:21:06','2023-05-14 22:21:06',5,'en',3,'',0),(14,1,15,'2023-05-14 22:21:47','2023-05-14 22:21:39','2023-05-14 22:21:39',5,'en',3,'',0),(15,1,16,'2023-05-14 22:22:20','2023-05-14 22:22:11','2023-05-14 22:22:11',5,'en',3,'',0),(16,1,17,'2023-05-14 22:22:53','2023-05-14 22:22:44','2023-05-14 22:22:44',5,'en',3,'',0),(17,1,18,'2023-05-14 22:23:25','2023-05-14 22:23:16','2023-05-14 22:23:16',5,'en',3,'',0),(18,1,19,'2023-05-14 22:23:57','2023-05-14 22:23:49','2023-05-14 22:23:49',5,'en',3,'',0),(19,1,20,'2023-05-14 22:24:30','2023-05-14 22:24:21','2023-05-14 22:24:21',5,'en',3,'',0);
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
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usitr_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,1,'en','name','Site Admin'),(2,1,'fr_CA','name','Administrateur-trice du site'),(3,2,'','nameLocaleKey','default.groups.name.manager'),(4,2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(5,2,'en','abbrev','PSM'),(6,2,'en','name','Preprint Server manager'),(7,2,'fr_CA','abbrev','##default.groups.abbrev.manager##'),(8,2,'fr_CA','name','##default.groups.name.manager##'),(9,3,'','nameLocaleKey','default.groups.name.sectionEditor'),(10,3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(11,3,'en','abbrev','MOD'),(12,3,'en','name','Moderator'),(13,3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##'),(14,3,'fr_CA','name','##default.groups.name.sectionEditor##'),(15,4,'','nameLocaleKey','default.groups.name.author'),(16,4,'','abbrevLocaleKey','default.groups.abbrev.author'),(17,4,'en','abbrev','AU'),(18,4,'en','name','Author'),(19,4,'fr_CA','abbrev','AU'),(20,4,'fr_CA','name','Auteur-e'),(21,5,'','nameLocaleKey','default.groups.name.reader'),(22,5,'','abbrevLocaleKey','default.groups.abbrev.reader'),(23,5,'en','abbrev','Read'),(24,5,'en','name','Reader'),(25,5,'fr_CA','abbrev','Lect'),(26,5,'fr_CA','name','Lecteur-trice');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,1,2,1),(2,1,2,5),(3,1,3,1),(4,1,3,5),(5,1,4,1),(6,1,4,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,1,0,0),(2,1,16,1,1,0,1),(3,1,17,1,1,0,1),(4,1,65536,1,1,1,1),(5,1,1048576,1,1,1,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `controlled_vocab_entry_id` bigint NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
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
  `user_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3 COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,1,'en','familyName','admin'),(2,1,'en','givenName','admin'),(3,2,'en','affiliation','Universidad Nacional Autónoma de México'),(4,2,'fr_CA','affiliation',''),(5,2,'en','biography',''),(6,2,'fr_CA','biography',''),(7,2,'en','familyName','Vaca'),(8,2,'fr_CA','familyName',''),(9,2,'en','givenName','Ramiro'),(10,2,'fr_CA','givenName',''),(11,2,'','orcid',''),(12,2,'en','preferredPublicName',''),(13,2,'fr_CA','preferredPublicName',''),(14,2,'en','signature',''),(15,2,'fr_CA','signature',''),(16,3,'en','affiliation','University of Melbourne'),(17,3,'fr_CA','affiliation',''),(18,3,'en','biography',''),(19,3,'fr_CA','biography',''),(20,3,'en','familyName','Barnes'),(21,3,'fr_CA','familyName',''),(22,3,'en','givenName','Daniel'),(23,3,'fr_CA','givenName',''),(24,3,'','orcid',''),(25,3,'en','preferredPublicName',''),(26,3,'fr_CA','preferredPublicName',''),(27,3,'en','signature',''),(28,3,'fr_CA','signature',''),(29,4,'en','affiliation','University of Chicago'),(30,4,'fr_CA','affiliation',''),(31,4,'en','biography',''),(32,4,'fr_CA','biography',''),(33,4,'en','familyName','Buskins'),(34,4,'fr_CA','familyName',''),(35,4,'en','givenName','David'),(36,4,'fr_CA','givenName',''),(37,4,'','orcid',''),(38,4,'en','preferredPublicName',''),(39,4,'fr_CA','preferredPublicName',''),(40,4,'en','signature',''),(41,4,'fr_CA','signature',''),(42,5,'en','affiliation','University of Toronto'),(43,5,'fr_CA','affiliation',''),(44,5,'en','biography',''),(45,5,'fr_CA','biography',''),(46,5,'en','familyName','Berardo'),(47,5,'fr_CA','familyName',''),(48,5,'en','givenName','Stephanie'),(49,5,'fr_CA','givenName',''),(50,5,'','orcid',''),(51,5,'en','preferredPublicName',''),(52,5,'fr_CA','preferredPublicName',''),(53,5,'en','signature',''),(54,5,'fr_CA','signature',''),(55,6,'en','affiliation','Kyoto University'),(56,6,'fr_CA','affiliation',''),(57,6,'en','biography',''),(58,6,'fr_CA','biography',''),(59,6,'en','familyName','Inoue'),(60,6,'fr_CA','familyName',''),(61,6,'en','givenName','Minoti'),(62,6,'fr_CA','givenName',''),(63,6,'','orcid',''),(64,6,'en','preferredPublicName',''),(65,6,'fr_CA','preferredPublicName',''),(66,6,'en','signature',''),(67,6,'fr_CA','signature',''),(68,7,'en','affiliation','University of Bologna'),(69,7,'en','familyName','Corino'),(70,7,'en','givenName','Carlo'),(71,8,'en','affiliation','University of Windsor'),(72,8,'en','familyName','Kwantes'),(73,8,'en','givenName','Catherine'),(74,9,'en','affiliation','University of Alberta'),(75,9,'en','familyName','Montgomerie'),(76,9,'en','givenName','Craig'),(77,10,'en','affiliation','Alexandria University'),(78,10,'en','familyName','Diouf'),(79,10,'en','givenName','Diaga'),(80,11,'en','affiliation','University of Toronto'),(81,11,'en','familyName','Phillips'),(82,11,'en','givenName','Dana'),(83,12,'en','affiliation','University College Cork'),(84,12,'en','familyName','Sokoloff'),(85,12,'en','givenName','Domatilia'),(86,13,'en','affiliation','Indiana University'),(87,13,'en','familyName','Ostrom'),(88,13,'en','givenName','Elinor'),(89,14,'en','affiliation','University of Rome'),(90,14,'en','familyName','Paglieri'),(91,14,'en','givenName','Fabio'),(92,15,'en','affiliation','University of Cape Town'),(93,15,'en','familyName','Mwandenga'),(94,15,'en','givenName','John'),(95,16,'en','affiliation','Aalborg University'),(96,16,'en','familyName','Novak'),(97,16,'en','givenName','John'),(98,17,'en','affiliation','Stanford University'),(99,17,'en','familyName','Al-Khafaji'),(100,17,'en','givenName','Karim'),(101,18,'en','affiliation','Australian National University'),(102,18,'en','familyName','Christopher'),(103,18,'en','givenName','Leo'),(104,19,'en','affiliation','University of Cape Town'),(105,19,'en','familyName','Kumiega'),(106,19,'en','givenName','Lise'),(107,20,'en','affiliation','University of Wolverhampton'),(108,20,'en','familyName','Daniel'),(109,20,'en','givenName','Patricia'),(110,21,'en','affiliation','University of Nairobi'),(111,21,'en','familyName','Baiyewu'),(112,21,'en','givenName','Rana'),(113,22,'en','affiliation','Barcelona University'),(114,22,'en','familyName','Rossi'),(115,22,'en','givenName','Rosanna'),(116,23,'en','affiliation','University of Tehran'),(117,23,'en','familyName','Karbasizaed'),(118,23,'en','givenName','Vajiheh'),(119,24,'en','affiliation','University of Windsor'),(120,24,'en','familyName','Williamson'),(121,24,'en','givenName','Valerie'),(122,25,'en','affiliation','CUNY'),(123,25,'en','familyName','Woods'),(124,25,'en','givenName','Zita');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_user_group_id`),
  UNIQUE KEY `user_user_groups_unique` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1,1),(2,2,1),(3,2,2),(4,2,3),(5,3,4),(6,3,5),(7,3,6),(9,4,7),(11,4,8),(13,4,9),(15,4,10),(17,4,11),(19,4,12),(21,4,13),(23,4,14),(25,4,15),(27,4,16),(29,4,17),(31,4,18),(33,4,19),(35,4,20),(37,4,21),(39,4,22),(41,4,23),(43,4,24),(45,4,25),(8,5,7),(10,5,8),(12,5,9),(14,5,10),(16,5,11),(18,5,12),(20,5,13),(22,5,14),(24,5,15),(26,5,16),(28,5,17),(30,5,18),(32,5,19),(34,5,20),(36,5,21),(38,5,22),(40,5,23),(42,5,24),(44,5,25);
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
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint DEFAULT NULL,
  `auth_id` bigint DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$Juqo6pXHOqp7yK0HrTsv4edCFTuK4liFr.Ym8IEOGtsLqHyfVfc4u','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-05-14 22:09:36',NULL,'2023-05-14 22:12:12',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$gHbXUvMyjSEo62yZs4mSbO/dIqR2QnGcd.EuT9hYvqSnq27haTely','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-05-14 22:11:19',NULL,'2023-05-14 22:11:56',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$RQUyp1S7uBv7BMgYCKuBDOb4yeLndWXFlHKyi369BdpwSHPYzNYFS','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-05-14 22:11:25',NULL,'2023-05-14 22:24:23',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$/s6.B22HVQQRM1ZxQzibiOFWpYKuQhsL1RbfIfIlf7gMHBHO.mjPq','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-05-14 22:11:32',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$LGka6UjP.BN.ssGiCRSJI.n2/bTUzofOdah0/ymkV/oqjE3V8xAF6','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-05-14 22:11:38',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$lcWsecLRyF1BOVUCTv2E8.E3./pvItmWCTlSlJm3v.htYPyHho2oW','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-05-14 22:11:45',NULL,NULL,0,NULL,NULL,0,NULL,1),(7,'ccorino','$2y$10$UNHpmrKzvCrwUaSGc/whiOiVMVlKqN/WL7RZwoM83fTnWmFrLAmcq','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2023-05-14 22:12:41',NULL,'2023-05-14 22:12:41',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$Pg45uT9pVHPZPh5JHVkEKOEskiZC5QHYOM7SF8wi7JhH1CUtzh4Z.','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-05-14 22:13:05',NULL,'2023-05-14 22:13:05',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$sG61hoWpeCW84ZHmLHRTZOZ4db.VIm.bjoOFVpnlq.CYlDX38.sjm','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-05-14 22:14:29',NULL,'2023-05-14 22:14:29',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$ytBPTj.DHYtF5ftodkM.zeldOxUMo8GIuABHGChD8uwNFjkvqdMqe','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2023-05-14 22:15:26',NULL,'2023-05-14 22:15:26',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$EV/Ex9PmMRF/OYorxQwtXuNKrF.xpAiiQNwwR6Fjzy8W1oy/QcKke','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-05-14 22:16:18',NULL,'2023-05-14 22:16:18',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$LhY8.Rc6nhuGGFCVGNJWxe5vcYW3qLiAbd.Hj1T8YRUtCZ9ggLGnG','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2023-05-14 22:17:02',NULL,'2023-05-14 22:17:02',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$uB/rCiF7T0GBsUjNwAvD1u3wOpQSs8dm1iN4mcsgiWwAsS13NGo..','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-05-14 22:17:34',NULL,'2023-05-14 22:17:34',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$zdkuRWDtfhs3Bx9WBy.puuOc1uYiS2bVV81ueSH1bDX1LQLeg1Zym','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2023-05-14 22:18:06',NULL,'2023-05-14 22:18:06',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$uD6fgbC8tcJrIpTbCb46Q.wRj4JyMbR0pxu06hnCqNQacdy5p9F2y','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2023-05-14 22:18:38',NULL,'2023-05-14 22:18:38',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$Uy.LcBQM9piGe15oxGbK8OlEpwayNlletzDjSRfyDN7Ov.ny4HKme','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2023-05-14 22:19:10',NULL,'2023-05-14 22:19:10',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$Ovp.stZ7B./4dVZzLQ83iunNgqAwu88K2Vl0xGLTA5.415Q4PVcoS','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-05-14 22:19:42',NULL,'2023-05-14 22:19:42',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$7DgHLKL7fJPKm7lLRc0Zo.bVxN/JKQkE6ZDCxbx/4XVjE1WHMOu9C','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2023-05-14 22:20:15',NULL,'2023-05-14 22:20:15',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$NnSg0uDShSRbsVQPxllZb.G1cZTuFmWiHfM5gPvbuNHI1bnggJTX2','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2023-05-14 22:20:48',NULL,'2023-05-14 22:20:48',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$wS5AMhounc0Q4QZTqwfj.uGmFCUsHMt/1UXr5jIRHfxKSt1JiJgw.','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2023-05-14 22:21:21',NULL,'2023-05-14 22:21:21',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$K.0ftmetN.quun./0BNrGObPJanVpMtMz/sEt5DelHsBCyww6nUx6','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2023-05-14 22:21:54',NULL,'2023-05-14 22:21:54',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$wF97FC8Fnq5V/eGE0q6eXuacnbOX6nJF.WejrqdgJnm/96R70cYnO','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2023-05-14 22:22:26',NULL,'2023-05-14 22:22:26',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$4dsp9aDgXHPD/JaP87Qp3OLoeE6tOWWgPbOS5IA32LCfrgsxZhxke','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2023-05-14 22:22:59',NULL,'2023-05-14 22:22:59',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$jha657/OCCUXOJchQD8GTeyN1z8V3FSw6MSVaAVCr.CJS8AVblDFO','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-05-14 22:23:31',NULL,'2023-05-14 22:23:31',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$Z.lvzRUae9h.F3U2jeAgk.RlpA4K1jzBNlaS0KqmkdTDtx83Q2BAO','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-05-14 22:24:04',NULL,'2023-05-14 22:24:04',NULL,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `version_id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.metadata','dc11','',0,0),(2,1,0,1,0,'2023-05-14 22:09:37',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(3,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(4,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(5,2,2,0,0,'2023-05-14 22:09:37',1,'plugins.generic','crossref','',0,0),(6,1,2,0,0,'2023-05-14 22:09:37',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(7,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(8,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(9,1,3,0,0,'2023-05-14 22:09:37',1,'plugins.generic','acron','AcronPlugin',1,1),(10,0,1,0,0,'2023-05-14 22:09:37',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(11,1,0,1,0,'2023-05-14 22:09:37',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(12,1,3,4,3,'2023-05-14 22:09:37',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(13,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.generic','usageEvent','',0,0),(14,1,1,0,0,'2023-05-14 22:09:37',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(15,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(16,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.importexport','native','',0,0),(17,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.oaiMetadataFormats','dc','',0,0),(18,1,0,0,0,'2023-05-14 22:09:37',1,'plugins.themes','default','DefaultThemePlugin',1,0),(19,3,4,0,0,'2023-05-14 22:09:18',1,'core','ops','',0,1);
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

-- Dump completed on 2023-05-14 22:24:33
