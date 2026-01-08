-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: ops-ci
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
  `decision` smallint NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
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
INSERT INTO `edit_decisions` VALUES (1,4,NULL,5,NULL,3,8,'2026-01-08 05:40:17'),(2,4,NULL,5,NULL,3,16,'2026-01-08 05:40:20'),(3,4,NULL,5,NULL,3,8,'2026-01-08 05:40:23');
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
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2026-01-08 05:38:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(2,1048585,1,0,'2026-01-08 05:38:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(3,1048585,1,0,'2026-01-08 05:38:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(4,1048585,2,0,'2026-01-08 05:39:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(5,1048585,2,0,'2026-01-08 05:39:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(6,1048585,2,0,'2026-01-08 05:39:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(7,1048585,2,0,'2026-01-08 05:39:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Urho Kekkonen\" <notanemailukk@mailinator.com>','','','Submission Acknowledgement','<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br>Catherine Kwantes, University of Windsor<br>Urho Kekkonen, </p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(8,1048585,3,0,'2026-01-08 05:39:36',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(9,1048585,3,0,'2026-01-08 05:39:36',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(10,1048585,3,0,'2026-01-08 05:39:37',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(11,1048585,3,0,'2026-01-08 05:39:37',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission Acknowledgement','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br>Craig Montgomerie, University of Alberta<br>Mark Irvine, University of Victoria</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(12,1048585,4,0,'2026-01-08 05:40:12',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(13,1048585,4,0,'2026-01-08 05:40:12',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(14,1048585,4,0,'2026-01-08 05:40:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(15,1048585,4,3,'2026-01-08 05:40:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(16,1048585,4,3,'2026-01-08 05:40:20',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>\n'),(17,1048585,4,3,'2026-01-08 05:40:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(18,1048585,5,0,'2026-01-08 05:40:40',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(19,1048585,5,0,'2026-01-08 05:40:40',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(20,1048585,5,0,'2026-01-08 05:40:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(21,1048585,6,0,'2026-01-08 05:41:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(22,1048585,6,0,'2026-01-08 05:41:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(23,1048585,6,0,'2026-01-08 05:41:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(24,1048585,7,0,'2026-01-08 05:41:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(25,1048585,7,0,'2026-01-08 05:41:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(26,1048585,7,0,'2026-01-08 05:41:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(27,1048585,7,0,'2026-01-08 05:41:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission Acknowledgement','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br>Elinor Ostrom, Indiana University<br>Frank van Laerhoven, Indiana University</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(28,1048585,8,0,'2026-01-08 05:41:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(29,1048585,8,0,'2026-01-08 05:41:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(30,1048585,8,0,'2026-01-08 05:41:49',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/8\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(31,1048585,9,0,'2026-01-08 05:42:09',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(32,1048585,9,0,'2026-01-08 05:42:09',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(33,1048585,9,0,'2026-01-08 05:42:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(34,1048585,10,0,'2026-01-08 05:42:30',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(35,1048585,10,0,'2026-01-08 05:42:30',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(36,1048585,10,0,'2026-01-08 05:42:30',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(37,1048585,11,0,'2026-01-08 05:42:50',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(38,1048585,11,0,'2026-01-08 05:42:51',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(39,1048585,11,0,'2026-01-08 05:42:51',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(40,1048585,11,0,'2026-01-08 05:42:51',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission Acknowledgement','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br>Karim Al-Khafaji, Stanford University<br>Margaret Morse, Stanford University</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(41,1048585,12,0,'2026-01-08 05:43:12',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(42,1048585,12,0,'2026-01-08 05:43:12',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(43,1048585,12,0,'2026-01-08 05:43:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(44,1048585,13,0,'2026-01-08 05:43:32',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(45,1048585,13,0,'2026-01-08 05:43:32',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(46,1048585,13,0,'2026-01-08 05:43:32',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(47,1048585,14,0,'2026-01-08 05:43:53',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(48,1048585,14,0,'2026-01-08 05:43:53',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(49,1048585,14,0,'2026-01-08 05:43:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(50,1048585,15,0,'2026-01-08 05:44:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(51,1048585,15,0,'2026-01-08 05:44:14',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(52,1048585,15,0,'2026-01-08 05:44:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(53,1048585,16,0,'2026-01-08 05:44:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(54,1048585,16,0,'2026-01-08 05:44:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(55,1048585,16,0,'2026-01-08 05:44:35',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(56,1048585,17,0,'2026-01-08 05:44:56',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(57,1048585,17,0,'2026-01-08 05:44:56',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(58,1048585,17,0,'2026-01-08 05:44:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(59,1048585,18,0,'2026-01-08 05:45:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(60,1048585,18,0,'2026-01-08 05:45:17',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(61,1048585,18,0,'2026-01-08 05:45:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/18\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(62,1048585,19,0,'2026-01-08 05:45:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(63,1048585,19,0,'2026-01-08 05:45:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(64,1048585,19,0,'2026-01-08 05:45:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>');
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
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Server Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$serverSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'SUBMISSION_ACK','en','Submission Acknowledgement (Pending Moderation)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),(11,'POSTED_ACK','en','Posted Acknowledgement','Preprint Posted Acknowledgement','{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}'),(13,'POSTED_NEW_VERSION_ACK','en','New Version Posted','New Version Posted Acknowledgement','<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$serverName}. The new version is now <a href=\"{$submissionPublishedUrl}\">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}'),(15,'SUBMISSION_ACK_CAN_POST','en','Submission Acknowledgement (No Moderation Required)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href=\"{$authorSubmissionUrl}\">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),(17,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission Acknowledgement','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$serverName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$serverSignature}'),(19,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),(21,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has passed moderation at {$serverName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$serverName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$serverName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(23,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(25,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(27,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(29,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Preprint Server activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href=\"{$editorialStatsLink}\">trends</a> and <a href=\"{$publicationStatsLink}\">posted preprint stats</a>. A full copy of this month\'s trends is attached.<br />\n<br />\nSincerely,<br />\n{$serverSignature}'),(31,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(33,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$serverName}','Please enter your message.'),(35,'EDITOR_ASSIGN_PRODUCTION','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),(37,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(39,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(41,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(43,'ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(45,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(47,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(48,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(49,'USER_VALIDATE_CONTEXT','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}'),(50,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','',''),(51,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission à {$serverName}','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Nous l\'avons bien reçu et un membre de notre équipe éditorial le prendre en charge sous peu. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :</p>\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),(52,'POSTED_ACK','fr_CA','','',''),(53,'POSTED_NEW_VERSION_ACK','fr_CA','','',''),(54,'SUBMISSION_ACK_CAN_POST','fr_CA','','Accusé de réception de la soumission à {$serverName}',''),(55,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),(56,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','',''),(57,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','',''),(58,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','<p>{$recipientName},</p><p>Nous avons le regret de vous informer qu\'après avoir évaluer votre manuscrit, {$submissionTitle}, le-la rédacteur-trice en a conclue qu\'il ne rencontre pas les exigences nécessaires pour être publier dans {$serverName}.</p><p>Cordialement,</p>{$signature}'),(59,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e modérateur-trice évaluera votre soumission dans les détails afin de décider si votre soumission sera rejetée ou pourra être envoyée en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(60,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$serverName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),(61,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','',''),(62,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','',''),(63,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$serverName}','Prière de saisir votre message.'),(64,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Rédacteur-trice assigné','',''),(65,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$serverUrl}\">{$serverName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),(66,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','Reprendre votre soumission à {$serverName}','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(67,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(68,'ORCID_COLLECT_AUTHOR_ID','fr_CA','orcidCollectAuthorId','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(69,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','orcidRequestAuthorAuthorization','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n');
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
  `user_id` bigint DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2026-01-08 05:38:17',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,7,'2026-01-08 05:38:17',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,7,'2026-01-08 05:38:25',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,7,'2026-01-08 05:38:25',1342177288,'submission.event.fileRevised',0),(5,515,1,7,'2026-01-08 05:38:28',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2026-01-08 05:38:28',268435457,'submission.event.submissionSubmitted',0),(7,1048585,2,8,'2026-01-08 05:38:35',268435458,'submission.event.general.metadataUpdated',0),(8,1048585,2,8,'2026-01-08 05:38:35',268435458,'submission.event.general.metadataUpdated',0),(9,1048585,2,8,'2026-01-08 05:38:51',268435458,'submission.event.general.metadataUpdated',0),(10,515,2,8,'2026-01-08 05:38:58',1342177281,'submission.event.fileUploaded',0),(11,1048585,2,8,'2026-01-08 05:38:58',1342177288,'submission.event.fileRevised',0),(12,515,2,8,'2026-01-08 05:39:01',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2026-01-08 05:39:14',268435457,'submission.event.submissionSubmitted',0),(14,1048585,2,3,'2026-01-08 05:39:20',268435462,'publication.event.published',0),(15,1048585,3,9,'2026-01-08 05:39:25',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,3,9,'2026-01-08 05:39:25',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,9,'2026-01-08 05:39:33',1342177281,'submission.event.fileUploaded',0),(18,1048585,3,9,'2026-01-08 05:39:33',1342177288,'submission.event.fileRevised',0),(19,515,3,9,'2026-01-08 05:39:36',1342177296,'submission.event.fileEdited',0),(20,1048585,3,9,'2026-01-08 05:39:36',268435457,'submission.event.submissionSubmitted',0),(21,1048585,3,3,'2026-01-08 05:39:41',268435462,'publication.event.published',0),(22,1048585,3,3,'2026-01-08 05:39:45',268435463,'publication.event.unpublished',0),(23,1048585,3,3,'2026-01-08 05:39:46',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,3,3,'2026-01-08 05:39:49',268435462,'publication.event.published',0),(25,1048585,3,3,'2026-01-08 05:39:51',268435458,'submission.event.general.metadataUpdated',0),(26,1048585,3,3,'2026-01-08 05:39:51',268435464,'publication.event.versionCreated',0),(27,1048585,3,3,'2026-01-08 05:39:53',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,3,3,'2026-01-08 05:39:56',268435462,'publication.event.versionPublished',0),(29,1048585,4,10,'2026-01-08 05:40:00',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,4,10,'2026-01-08 05:40:01',268435458,'submission.event.general.metadataUpdated',0),(31,515,4,10,'2026-01-08 05:40:09',1342177281,'submission.event.fileUploaded',0),(32,1048585,4,10,'2026-01-08 05:40:09',1342177288,'submission.event.fileRevised',0),(33,515,4,10,'2026-01-08 05:40:11',1342177296,'submission.event.fileEdited',0),(34,1048585,4,10,'2026-01-08 05:40:12',268435457,'submission.event.submissionSubmitted',0),(35,1048585,4,3,'2026-01-08 05:40:17',805306371,'editor.submission.decision.decline.log',0),(36,1048585,4,3,'2026-01-08 05:40:20',805306371,'editor.submission.decision.revertDecline.log',0),(37,1048585,4,3,'2026-01-08 05:40:23',805306371,'editor.submission.decision.decline.log',0),(38,1048585,5,11,'2026-01-08 05:40:28',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,5,11,'2026-01-08 05:40:29',268435458,'submission.event.general.metadataUpdated',0),(40,515,5,11,'2026-01-08 05:40:37',1342177281,'submission.event.fileUploaded',0),(41,1048585,5,11,'2026-01-08 05:40:37',1342177288,'submission.event.fileRevised',0),(42,515,5,11,'2026-01-08 05:40:39',1342177296,'submission.event.fileEdited',0),(43,1048585,5,11,'2026-01-08 05:40:40',268435457,'submission.event.submissionSubmitted',0),(44,1048585,5,3,'2026-01-08 05:40:44',268435462,'publication.event.published',0),(45,1048585,5,3,'2026-01-08 05:40:47',268435463,'publication.event.unpublished',0),(46,1048585,5,3,'2026-01-08 05:40:51',268435462,'publication.event.published',0),(47,1048585,6,12,'2026-01-08 05:40:55',268435458,'submission.event.general.metadataUpdated',0),(48,1048585,6,12,'2026-01-08 05:40:56',268435458,'submission.event.general.metadataUpdated',0),(49,515,6,12,'2026-01-08 05:41:04',1342177281,'submission.event.fileUploaded',0),(50,1048585,6,12,'2026-01-08 05:41:04',1342177288,'submission.event.fileRevised',0),(51,515,6,12,'2026-01-08 05:41:06',1342177296,'submission.event.fileEdited',0),(52,1048585,6,12,'2026-01-08 05:41:07',268435457,'submission.event.submissionSubmitted',0),(53,1048585,6,3,'2026-01-08 05:41:11',268435462,'publication.event.published',0),(54,1048585,7,13,'2026-01-08 05:41:16',268435458,'submission.event.general.metadataUpdated',0),(55,1048585,7,13,'2026-01-08 05:41:16',268435458,'submission.event.general.metadataUpdated',0),(56,515,7,13,'2026-01-08 05:41:25',1342177281,'submission.event.fileUploaded',0),(57,1048585,7,13,'2026-01-08 05:41:25',1342177288,'submission.event.fileRevised',0),(58,515,7,13,'2026-01-08 05:41:27',1342177296,'submission.event.fileEdited',0),(59,1048585,7,13,'2026-01-08 05:41:28',268435457,'submission.event.submissionSubmitted',0),(60,1048585,7,3,'2026-01-08 05:41:32',268435462,'publication.event.published',0),(61,1048585,8,14,'2026-01-08 05:41:37',268435458,'submission.event.general.metadataUpdated',0),(62,1048585,8,14,'2026-01-08 05:41:37',268435458,'submission.event.general.metadataUpdated',0),(63,515,8,14,'2026-01-08 05:41:46',1342177281,'submission.event.fileUploaded',0),(64,1048585,8,14,'2026-01-08 05:41:46',1342177288,'submission.event.fileRevised',0),(65,515,8,14,'2026-01-08 05:41:48',1342177296,'submission.event.fileEdited',0),(66,1048585,8,14,'2026-01-08 05:41:48',268435457,'submission.event.submissionSubmitted',0),(67,1048585,8,3,'2026-01-08 05:41:52',268435462,'publication.event.published',0),(68,1048585,9,15,'2026-01-08 05:41:57',268435458,'submission.event.general.metadataUpdated',0),(69,1048585,9,15,'2026-01-08 05:41:58',268435458,'submission.event.general.metadataUpdated',0),(70,515,9,15,'2026-01-08 05:42:06',1342177281,'submission.event.fileUploaded',0),(71,1048585,9,15,'2026-01-08 05:42:06',1342177288,'submission.event.fileRevised',0),(72,515,9,15,'2026-01-08 05:42:08',1342177296,'submission.event.fileEdited',0),(73,1048585,9,15,'2026-01-08 05:42:09',268435457,'submission.event.submissionSubmitted',0),(74,1048585,9,3,'2026-01-08 05:42:13',268435462,'publication.event.published',0),(75,1048585,10,16,'2026-01-08 05:42:18',268435458,'submission.event.general.metadataUpdated',0),(76,1048585,10,16,'2026-01-08 05:42:18',268435458,'submission.event.general.metadataUpdated',0),(77,515,10,16,'2026-01-08 05:42:27',1342177281,'submission.event.fileUploaded',0),(78,1048585,10,16,'2026-01-08 05:42:27',1342177288,'submission.event.fileRevised',0),(79,515,10,16,'2026-01-08 05:42:29',1342177296,'submission.event.fileEdited',0),(80,1048585,10,16,'2026-01-08 05:42:30',268435457,'submission.event.submissionSubmitted',0),(81,1048585,10,3,'2026-01-08 05:42:34',268435462,'publication.event.published',0),(82,1048585,11,17,'2026-01-08 05:42:39',268435458,'submission.event.general.metadataUpdated',0),(83,1048585,11,17,'2026-01-08 05:42:39',268435458,'submission.event.general.metadataUpdated',0),(84,515,11,17,'2026-01-08 05:42:47',1342177281,'submission.event.fileUploaded',0),(85,1048585,11,17,'2026-01-08 05:42:47',1342177288,'submission.event.fileRevised',0),(86,515,11,17,'2026-01-08 05:42:50',1342177296,'submission.event.fileEdited',0),(87,1048585,11,17,'2026-01-08 05:42:50',268435457,'submission.event.submissionSubmitted',0),(88,1048585,11,3,'2026-01-08 05:42:55',268435462,'publication.event.published',0),(89,1048585,12,18,'2026-01-08 05:43:00',268435458,'submission.event.general.metadataUpdated',0),(90,1048585,12,18,'2026-01-08 05:43:00',268435458,'submission.event.general.metadataUpdated',0),(91,515,12,18,'2026-01-08 05:43:09',1342177281,'submission.event.fileUploaded',0),(92,1048585,12,18,'2026-01-08 05:43:09',1342177288,'submission.event.fileRevised',0),(93,515,12,18,'2026-01-08 05:43:11',1342177296,'submission.event.fileEdited',0),(94,1048585,12,18,'2026-01-08 05:43:11',268435457,'submission.event.submissionSubmitted',0),(95,1048585,12,3,'2026-01-08 05:43:16',268435462,'publication.event.published',0),(96,1048585,13,19,'2026-01-08 05:43:21',268435458,'submission.event.general.metadataUpdated',0),(97,1048585,13,19,'2026-01-08 05:43:21',268435458,'submission.event.general.metadataUpdated',0),(98,515,13,19,'2026-01-08 05:43:30',1342177281,'submission.event.fileUploaded',0),(99,1048585,13,19,'2026-01-08 05:43:30',1342177288,'submission.event.fileRevised',0),(100,515,13,19,'2026-01-08 05:43:32',1342177296,'submission.event.fileEdited',0),(101,1048585,13,19,'2026-01-08 05:43:32',268435457,'submission.event.submissionSubmitted',0),(102,1048585,13,3,'2026-01-08 05:43:37',268435462,'publication.event.published',0),(103,1048585,14,20,'2026-01-08 05:43:42',268435458,'submission.event.general.metadataUpdated',0),(104,1048585,14,20,'2026-01-08 05:43:42',268435458,'submission.event.general.metadataUpdated',0),(105,515,14,20,'2026-01-08 05:43:51',1342177281,'submission.event.fileUploaded',0),(106,1048585,14,20,'2026-01-08 05:43:51',1342177288,'submission.event.fileRevised',0),(107,515,14,20,'2026-01-08 05:43:53',1342177296,'submission.event.fileEdited',0),(108,1048585,14,20,'2026-01-08 05:43:53',268435457,'submission.event.submissionSubmitted',0),(109,1048585,14,3,'2026-01-08 05:43:58',268435462,'publication.event.published',0),(110,1048585,15,21,'2026-01-08 05:44:03',268435458,'submission.event.general.metadataUpdated',0),(111,1048585,15,21,'2026-01-08 05:44:03',268435458,'submission.event.general.metadataUpdated',0),(112,515,15,21,'2026-01-08 05:44:11',1342177281,'submission.event.fileUploaded',0),(113,1048585,15,21,'2026-01-08 05:44:11',1342177288,'submission.event.fileRevised',0),(114,515,15,21,'2026-01-08 05:44:14',1342177296,'submission.event.fileEdited',0),(115,1048585,15,21,'2026-01-08 05:44:14',268435457,'submission.event.submissionSubmitted',0),(116,1048585,15,3,'2026-01-08 05:44:18',268435462,'publication.event.published',0),(117,1048585,16,22,'2026-01-08 05:44:24',268435458,'submission.event.general.metadataUpdated',0),(118,1048585,16,22,'2026-01-08 05:44:24',268435458,'submission.event.general.metadataUpdated',0),(119,515,16,22,'2026-01-08 05:44:32',1342177281,'submission.event.fileUploaded',0),(120,1048585,16,22,'2026-01-08 05:44:32',1342177288,'submission.event.fileRevised',0),(121,515,16,22,'2026-01-08 05:44:35',1342177296,'submission.event.fileEdited',0),(122,1048585,16,22,'2026-01-08 05:44:35',268435457,'submission.event.submissionSubmitted',0),(123,1048585,16,3,'2026-01-08 05:44:39',268435462,'publication.event.published',0),(124,1048585,17,23,'2026-01-08 05:44:44',268435458,'submission.event.general.metadataUpdated',0),(125,1048585,17,23,'2026-01-08 05:44:45',268435458,'submission.event.general.metadataUpdated',0),(126,515,17,23,'2026-01-08 05:44:53',1342177281,'submission.event.fileUploaded',0),(127,1048585,17,23,'2026-01-08 05:44:53',1342177288,'submission.event.fileRevised',0),(128,515,17,23,'2026-01-08 05:44:55',1342177296,'submission.event.fileEdited',0),(129,1048585,17,23,'2026-01-08 05:44:56',268435457,'submission.event.submissionSubmitted',0),(130,1048585,17,3,'2026-01-08 05:45:00',268435462,'publication.event.published',0),(131,1048585,18,24,'2026-01-08 05:45:05',268435458,'submission.event.general.metadataUpdated',0),(132,1048585,18,24,'2026-01-08 05:45:06',268435458,'submission.event.general.metadataUpdated',0),(133,515,18,24,'2026-01-08 05:45:14',1342177281,'submission.event.fileUploaded',0),(134,1048585,18,24,'2026-01-08 05:45:14',1342177288,'submission.event.fileRevised',0),(135,515,18,24,'2026-01-08 05:45:16',1342177296,'submission.event.fileEdited',0),(136,1048585,18,24,'2026-01-08 05:45:17',268435457,'submission.event.submissionSubmitted',0),(137,1048585,18,3,'2026-01-08 05:45:21',268435462,'publication.event.published',0),(138,1048585,19,25,'2026-01-08 05:45:26',268435458,'submission.event.general.metadataUpdated',0),(139,1048585,19,25,'2026-01-08 05:45:27',268435458,'submission.event.general.metadataUpdated',0),(140,515,19,25,'2026-01-08 05:45:35',1342177281,'submission.event.fileUploaded',0),(141,1048585,19,25,'2026-01-08 05:45:35',1342177288,'submission.event.fileRevised',0),(142,515,19,25,'2026-01-08 05:45:37',1342177296,'submission.event.fileEdited',0),(143,1048585,19,25,'2026-01-08 05:45:38',268435457,'submission.event.submissionSubmitted',0),(144,1048585,19,3,'2026-01-08 05:45:42',268435462,'publication.event.published',0);
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
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb3 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'','fileId','1'),(2,3,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),(3,3,'','fileStage','10'),(4,3,'','submissionFileId','1'),(5,3,'','submissionId','1'),(6,3,'','username','ccorino'),(7,4,'','fileId','1'),(8,4,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),(9,4,'','fileStage','10'),(10,4,'','submissionFileId','1'),(11,4,'','submissionId','1'),(12,4,'','username','ccorino'),(13,5,'','fileId','1'),(14,5,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),(15,5,'','fileStage','10'),(16,5,'','submissionFileId','1'),(17,5,'','submissionId','1'),(18,5,'','username','ccorino'),(19,10,'','fileId','2'),(20,10,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(21,10,'','fileStage','10'),(22,10,'','submissionFileId','2'),(23,10,'','submissionId','2'),(24,10,'','username','ckwantes'),(25,11,'','fileId','2'),(26,11,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(27,11,'','fileStage','10'),(28,11,'','submissionFileId','2'),(29,11,'','submissionId','2'),(30,11,'','username','ckwantes'),(31,12,'','fileId','2'),(32,12,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(33,12,'','fileStage','10'),(34,12,'','submissionFileId','2'),(35,12,'','submissionId','2'),(36,12,'','username','ckwantes'),(37,17,'','fileId','3'),(38,17,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(39,17,'','fileStage','10'),(40,17,'','submissionFileId','3'),(41,17,'','submissionId','3'),(42,17,'','username','cmontgomerie'),(43,18,'','fileId','3'),(44,18,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(45,18,'','fileStage','10'),(46,18,'','submissionFileId','3'),(47,18,'','submissionId','3'),(48,18,'','username','cmontgomerie'),(49,19,'','fileId','3'),(50,19,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(51,19,'','fileStage','10'),(52,19,'','submissionFileId','3'),(53,19,'','submissionId','3'),(54,19,'','username','cmontgomerie'),(55,31,'','fileId','4'),(56,31,'en','filename','Genetic transformation of forest trees.pdf'),(57,31,'','fileStage','10'),(58,31,'','submissionFileId','4'),(59,31,'','submissionId','4'),(60,31,'','username','ddiouf'),(61,32,'','fileId','4'),(62,32,'en','filename','Genetic transformation of forest trees.pdf'),(63,32,'','fileStage','10'),(64,32,'','submissionFileId','4'),(65,32,'','submissionId','4'),(66,32,'','username','ddiouf'),(67,33,'','fileId','4'),(68,33,'en','filename','Genetic transformation of forest trees.pdf'),(69,33,'','fileStage','10'),(70,33,'','submissionFileId','4'),(71,33,'','submissionId','4'),(72,33,'','username','ddiouf'),(73,35,'','editorName','Daniel Barnes'),(74,36,'','editorName','Daniel Barnes'),(75,37,'','editorName','Daniel Barnes'),(76,40,'','fileId','5'),(77,40,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(78,40,'','fileStage','10'),(79,40,'','submissionFileId','5'),(80,40,'','submissionId','5'),(81,40,'','username','dphillips'),(82,41,'','fileId','5'),(83,41,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(84,41,'','fileStage','10'),(85,41,'','submissionFileId','5'),(86,41,'','submissionId','5'),(87,41,'','username','dphillips'),(88,42,'','fileId','5'),(89,42,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(90,42,'','fileStage','10'),(91,42,'','submissionFileId','5'),(92,42,'','submissionId','5'),(93,42,'','username','dphillips'),(94,49,'','fileId','6'),(95,49,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(96,49,'','fileStage','10'),(97,49,'','submissionFileId','6'),(98,49,'','submissionId','6'),(99,49,'','username','dsokoloff'),(100,50,'','fileId','6'),(101,50,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(102,50,'','fileStage','10'),(103,50,'','submissionFileId','6'),(104,50,'','submissionId','6'),(105,50,'','username','dsokoloff'),(106,51,'','fileId','6'),(107,51,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(108,51,'','fileStage','10'),(109,51,'','submissionFileId','6'),(110,51,'','submissionId','6'),(111,51,'','username','dsokoloff'),(112,56,'','fileId','7'),(113,56,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(114,56,'','fileStage','10'),(115,56,'','submissionFileId','7'),(116,56,'','submissionId','7'),(117,56,'','username','eostrom'),(118,57,'','fileId','7'),(119,57,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(120,57,'','fileStage','10'),(121,57,'','submissionFileId','7'),(122,57,'','submissionId','7'),(123,57,'','username','eostrom'),(124,58,'','fileId','7'),(125,58,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(126,58,'','fileStage','10'),(127,58,'','submissionFileId','7'),(128,58,'','submissionId','7'),(129,58,'','username','eostrom'),(130,63,'','fileId','8'),(131,63,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),(132,63,'','fileStage','10'),(133,63,'','submissionFileId','8'),(134,63,'','submissionId','8'),(135,63,'','username','fpaglieri'),(136,64,'','fileId','8'),(137,64,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),(138,64,'','fileStage','10'),(139,64,'','submissionFileId','8'),(140,64,'','submissionId','8'),(141,64,'','username','fpaglieri'),(142,65,'','fileId','8'),(143,65,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),(144,65,'','fileStage','10'),(145,65,'','submissionFileId','8'),(146,65,'','submissionId','8'),(147,65,'','username','fpaglieri'),(148,70,'','fileId','9'),(149,70,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(150,70,'','fileStage','10'),(151,70,'','submissionFileId','9'),(152,70,'','submissionId','9'),(153,70,'','username','jmwandenga'),(154,71,'','fileId','9'),(155,71,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(156,71,'','fileStage','10'),(157,71,'','submissionFileId','9'),(158,71,'','submissionId','9'),(159,71,'','username','jmwandenga'),(160,72,'','fileId','9'),(161,72,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(162,72,'','fileStage','10'),(163,72,'','submissionFileId','9'),(164,72,'','submissionId','9'),(165,72,'','username','jmwandenga'),(166,77,'','fileId','10'),(167,77,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(168,77,'','fileStage','10'),(169,77,'','submissionFileId','10'),(170,77,'','submissionId','10'),(171,77,'','username','jnovak'),(172,78,'','fileId','10'),(173,78,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(174,78,'','fileStage','10'),(175,78,'','submissionFileId','10'),(176,78,'','submissionId','10'),(177,78,'','username','jnovak'),(178,79,'','fileId','10'),(179,79,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(180,79,'','fileStage','10'),(181,79,'','submissionFileId','10'),(182,79,'','submissionId','10'),(183,79,'','username','jnovak'),(184,84,'','fileId','11'),(185,84,'en','filename','Learning Sustainable Design through Service.pdf'),(186,84,'','fileStage','10'),(187,84,'','submissionFileId','11'),(188,84,'','submissionId','11'),(189,84,'','username','kalkhafaji'),(190,85,'','fileId','11'),(191,85,'en','filename','Learning Sustainable Design through Service.pdf'),(192,85,'','fileStage','10'),(193,85,'','submissionFileId','11'),(194,85,'','submissionId','11'),(195,85,'','username','kalkhafaji'),(196,86,'','fileId','11'),(197,86,'en','filename','Learning Sustainable Design through Service.pdf'),(198,86,'','fileStage','10'),(199,86,'','submissionFileId','11'),(200,86,'','submissionId','11'),(201,86,'','username','kalkhafaji'),(202,91,'','fileId','12'),(203,91,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(204,91,'','fileStage','10'),(205,91,'','submissionFileId','12'),(206,91,'','submissionId','12'),(207,91,'','username','lchristopher'),(208,92,'','fileId','12'),(209,92,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(210,92,'','fileStage','10'),(211,92,'','submissionFileId','12'),(212,92,'','submissionId','12'),(213,92,'','username','lchristopher'),(214,93,'','fileId','12'),(215,93,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(216,93,'','fileStage','10'),(217,93,'','submissionFileId','12'),(218,93,'','submissionId','12'),(219,93,'','username','lchristopher'),(220,98,'','fileId','13'),(221,98,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(222,98,'','fileStage','10'),(223,98,'','submissionFileId','13'),(224,98,'','submissionId','13'),(225,98,'','username','lkumiega'),(226,99,'','fileId','13'),(227,99,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(228,99,'','fileStage','10'),(229,99,'','submissionFileId','13'),(230,99,'','submissionId','13'),(231,99,'','username','lkumiega'),(232,100,'','fileId','13'),(233,100,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(234,100,'','fileStage','10'),(235,100,'','submissionFileId','13'),(236,100,'','submissionId','13'),(237,100,'','username','lkumiega'),(238,105,'','fileId','14'),(239,105,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(240,105,'','fileStage','10'),(241,105,'','submissionFileId','14'),(242,105,'','submissionId','14'),(243,105,'','username','pdaniel'),(244,106,'','fileId','14'),(245,106,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(246,106,'','fileStage','10'),(247,106,'','submissionFileId','14'),(248,106,'','submissionId','14'),(249,106,'','username','pdaniel'),(250,107,'','fileId','14'),(251,107,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(252,107,'','fileStage','10'),(253,107,'','submissionFileId','14'),(254,107,'','submissionId','14'),(255,107,'','username','pdaniel'),(256,112,'','fileId','15'),(257,112,'en','filename','Yam diseases and its management in Nigeria.pdf'),(258,112,'','fileStage','10'),(259,112,'','submissionFileId','15'),(260,112,'','submissionId','15'),(261,112,'','username','rbaiyewu'),(262,113,'','fileId','15'),(263,113,'en','filename','Yam diseases and its management in Nigeria.pdf'),(264,113,'','fileStage','10'),(265,113,'','submissionFileId','15'),(266,113,'','submissionId','15'),(267,113,'','username','rbaiyewu'),(268,114,'','fileId','15'),(269,114,'en','filename','Yam diseases and its management in Nigeria.pdf'),(270,114,'','fileStage','10'),(271,114,'','submissionFileId','15'),(272,114,'','submissionId','15'),(273,114,'','username','rbaiyewu'),(274,119,'','fileId','16'),(275,119,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(276,119,'','fileStage','10'),(277,119,'','submissionFileId','16'),(278,119,'','submissionId','16'),(279,119,'','username','rrossi'),(280,120,'','fileId','16'),(281,120,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(282,120,'','fileStage','10'),(283,120,'','submissionFileId','16'),(284,120,'','submissionId','16'),(285,120,'','username','rrossi'),(286,121,'','fileId','16'),(287,121,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(288,121,'','fileStage','10'),(289,121,'','submissionFileId','16'),(290,121,'','submissionId','16'),(291,121,'','username','rrossi'),(292,126,'','fileId','17'),(293,126,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(294,126,'','fileStage','10'),(295,126,'','submissionFileId','17'),(296,126,'','submissionId','17'),(297,126,'','username','vkarbasizaed'),(298,127,'','fileId','17'),(299,127,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(300,127,'','fileStage','10'),(301,127,'','submissionFileId','17'),(302,127,'','submissionId','17'),(303,127,'','username','vkarbasizaed'),(304,128,'','fileId','17'),(305,128,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(306,128,'','fileStage','10'),(307,128,'','submissionFileId','17'),(308,128,'','submissionId','17'),(309,128,'','username','vkarbasizaed'),(310,133,'','fileId','18'),(311,133,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(312,133,'','fileStage','10'),(313,133,'','submissionFileId','18'),(314,133,'','submissionId','18'),(315,133,'','username','vwilliamson'),(316,134,'','fileId','18'),(317,134,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(318,134,'','fileStage','10'),(319,134,'','submissionFileId','18'),(320,134,'','submissionId','18'),(321,134,'','username','vwilliamson'),(322,135,'','fileId','18'),(323,135,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(324,135,'','fileStage','10'),(325,135,'','submissionFileId','18'),(326,135,'','submissionId','18'),(327,135,'','username','vwilliamson'),(328,140,'','fileId','19'),(329,140,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),(330,140,'','fileStage','10'),(331,140,'','submissionFileId','19'),(332,140,'','submissionId','19'),(333,140,'','username','zwoods'),(334,141,'','fileId','19'),(335,141,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),(336,141,'','fileStage','10'),(337,141,'','submissionFileId','19'),(338,141,'','submissionId','19'),(339,141,'','username','zwoods'),(340,142,'','fileId','19'),(341,142,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),(342,142,'','fileStage','10'),(343,142,'','submissionFileId','19'),(344,142,'','submissionId','19'),(345,142,'','username','zwoods');
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
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/695f42d1d4038.pdf','application/pdf'),(2,'contexts/1/submissions/2/695f42f2c8eb3.pdf','application/pdf'),(3,'contexts/1/submissions/3/695f4315df130.pdf','application/pdf'),(4,'contexts/1/submissions/4/695f43399a583.pdf','application/pdf'),(5,'contexts/1/submissions/5/695f43558f8fa.pdf','application/pdf'),(6,'contexts/1/submissions/6/695f4370b76ea.pdf','application/pdf'),(7,'contexts/1/submissions/7/695f43854e2ca.pdf','application/pdf'),(8,'contexts/1/submissions/8/695f439a1412f.pdf','application/pdf'),(9,'contexts/1/submissions/9/695f43aea106e.pdf','application/pdf'),(10,'contexts/1/submissions/10/695f43c34b47b.pdf','application/pdf'),(11,'contexts/1/submissions/11/695f43d7e2ea5.pdf','application/pdf'),(12,'contexts/1/submissions/12/695f43ed3949c.pdf','application/pdf'),(13,'contexts/1/submissions/13/695f440204a74.pdf','application/pdf'),(14,'contexts/1/submissions/14/695f44170feb7.pdf','application/pdf'),(15,'contexts/1/submissions/15/695f442bdfe12.pdf','application/pdf'),(16,'contexts/1/submissions/16/695f4440c8d83.pdf','application/pdf'),(17,'contexts/1/submissions/17/695f4455adabc.pdf','application/pdf'),(18,'contexts/1/submissions/18/695f446a99955.pdf','application/pdf'),(19,'contexts/1/submissions/19/695f447f8b54b.pdf','application/pdf');
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
INSERT INTO `job_batches` VALUES ('a0c8faad-5844-4c20-936f-ff39d29f2a6c','',0,0,0,'[]','a:0:{}',NULL,1767850595,NULL);
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
  `load_id` varchar(50) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
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
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
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
  `context` bigint DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,NULL,3,16777222,'2026-01-08 05:38:28',NULL,1048585,1),(4,1,NULL,3,16777223,'2026-01-08 05:38:28',NULL,1048585,1),(5,1,4,2,16777217,'2026-01-08 05:38:28',NULL,1048585,1),(6,1,5,2,16777217,'2026-01-08 05:38:28',NULL,1048585,1),(7,1,NULL,2,16777243,'2026-01-08 05:38:28',NULL,1048585,1),(8,1,NULL,2,16777245,'2026-01-08 05:38:28',NULL,1048585,1),(9,1,NULL,3,16777222,'2026-01-08 05:39:14',NULL,1048585,2),(10,1,NULL,3,16777223,'2026-01-08 05:39:14',NULL,1048585,2),(11,1,4,2,16777217,'2026-01-08 05:39:14',NULL,1048585,2),(12,1,5,2,16777217,'2026-01-08 05:39:14',NULL,1048585,2),(13,1,NULL,2,16777243,'2026-01-08 05:39:14',NULL,1048585,2),(14,1,NULL,2,16777245,'2026-01-08 05:39:14',NULL,1048585,2),(15,1,NULL,3,16777222,'2026-01-08 05:39:36',NULL,1048585,3),(16,1,NULL,3,16777223,'2026-01-08 05:39:36',NULL,1048585,3),(17,1,4,2,16777217,'2026-01-08 05:39:36',NULL,1048585,3),(18,1,5,2,16777217,'2026-01-08 05:39:36',NULL,1048585,3),(19,1,NULL,2,16777243,'2026-01-08 05:39:37',NULL,1048585,3),(20,1,NULL,2,16777245,'2026-01-08 05:39:37',NULL,1048585,3),(21,1,4,3,16777259,'2026-01-08 05:39:51',NULL,1048585,3),(22,1,5,3,16777259,'2026-01-08 05:39:51',NULL,1048585,3),(23,1,9,3,16777259,'2026-01-08 05:39:51',NULL,1048585,3),(24,1,NULL,3,16777222,'2026-01-08 05:40:12',NULL,1048585,4),(25,1,NULL,3,16777223,'2026-01-08 05:40:12',NULL,1048585,4),(26,1,4,2,16777217,'2026-01-08 05:40:12',NULL,1048585,4),(27,1,5,2,16777217,'2026-01-08 05:40:12',NULL,1048585,4),(28,1,NULL,2,16777243,'2026-01-08 05:40:12',NULL,1048585,4),(29,1,NULL,2,16777245,'2026-01-08 05:40:12',NULL,1048585,4),(31,1,10,2,16777234,'2026-01-08 05:40:23',NULL,1048585,4),(32,1,NULL,3,16777222,'2026-01-08 05:40:40',NULL,1048585,5),(33,1,NULL,3,16777223,'2026-01-08 05:40:40',NULL,1048585,5),(34,1,4,2,16777217,'2026-01-08 05:40:40',NULL,1048585,5),(35,1,5,2,16777217,'2026-01-08 05:40:40',NULL,1048585,5),(36,1,NULL,2,16777243,'2026-01-08 05:40:40',NULL,1048585,5),(37,1,NULL,2,16777245,'2026-01-08 05:40:40',NULL,1048585,5),(38,1,NULL,3,16777222,'2026-01-08 05:41:07',NULL,1048585,6),(39,1,NULL,3,16777223,'2026-01-08 05:41:07',NULL,1048585,6),(40,1,4,2,16777217,'2026-01-08 05:41:07',NULL,1048585,6),(41,1,5,2,16777217,'2026-01-08 05:41:07',NULL,1048585,6),(42,1,NULL,2,16777243,'2026-01-08 05:41:07',NULL,1048585,6),(43,1,NULL,2,16777245,'2026-01-08 05:41:07',NULL,1048585,6),(44,1,NULL,3,16777222,'2026-01-08 05:41:28',NULL,1048585,7),(45,1,NULL,3,16777223,'2026-01-08 05:41:28',NULL,1048585,7),(46,1,4,2,16777217,'2026-01-08 05:41:28',NULL,1048585,7),(47,1,5,2,16777217,'2026-01-08 05:41:28',NULL,1048585,7),(48,1,NULL,2,16777243,'2026-01-08 05:41:28',NULL,1048585,7),(49,1,NULL,2,16777245,'2026-01-08 05:41:28',NULL,1048585,7),(50,1,NULL,3,16777222,'2026-01-08 05:41:48',NULL,1048585,8),(51,1,NULL,3,16777223,'2026-01-08 05:41:48',NULL,1048585,8),(52,1,4,2,16777217,'2026-01-08 05:41:48',NULL,1048585,8),(53,1,5,2,16777217,'2026-01-08 05:41:48',NULL,1048585,8),(54,1,NULL,2,16777243,'2026-01-08 05:41:49',NULL,1048585,8),(55,1,NULL,2,16777245,'2026-01-08 05:41:49',NULL,1048585,8),(56,1,NULL,3,16777222,'2026-01-08 05:42:09',NULL,1048585,9),(57,1,NULL,3,16777223,'2026-01-08 05:42:09',NULL,1048585,9),(58,1,4,2,16777217,'2026-01-08 05:42:09',NULL,1048585,9),(59,1,5,2,16777217,'2026-01-08 05:42:09',NULL,1048585,9),(60,1,NULL,2,16777243,'2026-01-08 05:42:09',NULL,1048585,9),(61,1,NULL,2,16777245,'2026-01-08 05:42:09',NULL,1048585,9),(62,1,NULL,3,16777222,'2026-01-08 05:42:30',NULL,1048585,10),(63,1,NULL,3,16777223,'2026-01-08 05:42:30',NULL,1048585,10),(64,1,4,2,16777217,'2026-01-08 05:42:30',NULL,1048585,10),(65,1,5,2,16777217,'2026-01-08 05:42:30',NULL,1048585,10),(66,1,NULL,2,16777243,'2026-01-08 05:42:30',NULL,1048585,10),(67,1,NULL,2,16777245,'2026-01-08 05:42:30',NULL,1048585,10),(68,1,NULL,3,16777222,'2026-01-08 05:42:50',NULL,1048585,11),(69,1,NULL,3,16777223,'2026-01-08 05:42:50',NULL,1048585,11),(70,1,4,2,16777217,'2026-01-08 05:42:50',NULL,1048585,11),(71,1,5,2,16777217,'2026-01-08 05:42:50',NULL,1048585,11),(72,1,NULL,2,16777243,'2026-01-08 05:42:51',NULL,1048585,11),(73,1,NULL,2,16777245,'2026-01-08 05:42:51',NULL,1048585,11),(74,1,NULL,3,16777222,'2026-01-08 05:43:12',NULL,1048585,12),(75,1,NULL,3,16777223,'2026-01-08 05:43:12',NULL,1048585,12),(76,1,4,2,16777217,'2026-01-08 05:43:12',NULL,1048585,12),(77,1,5,2,16777217,'2026-01-08 05:43:12',NULL,1048585,12),(78,1,NULL,2,16777243,'2026-01-08 05:43:12',NULL,1048585,12),(79,1,NULL,2,16777245,'2026-01-08 05:43:12',NULL,1048585,12),(80,1,NULL,3,16777222,'2026-01-08 05:43:32',NULL,1048585,13),(81,1,NULL,3,16777223,'2026-01-08 05:43:32',NULL,1048585,13),(82,1,4,2,16777217,'2026-01-08 05:43:32',NULL,1048585,13),(83,1,5,2,16777217,'2026-01-08 05:43:32',NULL,1048585,13),(84,1,NULL,2,16777243,'2026-01-08 05:43:32',NULL,1048585,13),(85,1,NULL,2,16777245,'2026-01-08 05:43:33',NULL,1048585,13),(86,1,NULL,3,16777222,'2026-01-08 05:43:53',NULL,1048585,14),(87,1,NULL,3,16777223,'2026-01-08 05:43:53',NULL,1048585,14),(88,1,4,2,16777217,'2026-01-08 05:43:53',NULL,1048585,14),(89,1,5,2,16777217,'2026-01-08 05:43:53',NULL,1048585,14),(90,1,NULL,2,16777243,'2026-01-08 05:43:54',NULL,1048585,14),(91,1,NULL,2,16777245,'2026-01-08 05:43:54',NULL,1048585,14),(92,1,NULL,3,16777222,'2026-01-08 05:44:14',NULL,1048585,15),(93,1,NULL,3,16777223,'2026-01-08 05:44:14',NULL,1048585,15),(94,1,4,2,16777217,'2026-01-08 05:44:14',NULL,1048585,15),(95,1,5,2,16777217,'2026-01-08 05:44:14',NULL,1048585,15),(96,1,NULL,2,16777243,'2026-01-08 05:44:14',NULL,1048585,15),(97,1,NULL,2,16777245,'2026-01-08 05:44:14',NULL,1048585,15),(98,1,NULL,3,16777222,'2026-01-08 05:44:35',NULL,1048585,16),(99,1,NULL,3,16777223,'2026-01-08 05:44:35',NULL,1048585,16),(100,1,4,2,16777217,'2026-01-08 05:44:35',NULL,1048585,16),(101,1,5,2,16777217,'2026-01-08 05:44:35',NULL,1048585,16),(102,1,NULL,2,16777243,'2026-01-08 05:44:35',NULL,1048585,16),(103,1,NULL,2,16777245,'2026-01-08 05:44:35',NULL,1048585,16),(104,1,NULL,3,16777222,'2026-01-08 05:44:56',NULL,1048585,17),(105,1,NULL,3,16777223,'2026-01-08 05:44:56',NULL,1048585,17),(106,1,4,2,16777217,'2026-01-08 05:44:56',NULL,1048585,17),(107,1,5,2,16777217,'2026-01-08 05:44:56',NULL,1048585,17),(108,1,NULL,2,16777243,'2026-01-08 05:44:56',NULL,1048585,17),(109,1,NULL,2,16777245,'2026-01-08 05:44:56',NULL,1048585,17),(110,1,NULL,3,16777222,'2026-01-08 05:45:17',NULL,1048585,18),(111,1,NULL,3,16777223,'2026-01-08 05:45:17',NULL,1048585,18),(112,1,4,2,16777217,'2026-01-08 05:45:17',NULL,1048585,18),(113,1,5,2,16777217,'2026-01-08 05:45:17',NULL,1048585,18),(114,1,NULL,2,16777243,'2026-01-08 05:45:17',NULL,1048585,18),(115,1,NULL,2,16777245,'2026-01-08 05:45:17',NULL,1048585,18),(116,1,NULL,3,16777222,'2026-01-08 05:45:38',NULL,1048585,19),(117,1,NULL,3,16777223,'2026-01-08 05:45:38',NULL,1048585,19),(118,1,4,2,16777217,'2026-01-08 05:45:38',NULL,1048585,19),(119,1,5,2,16777217,'2026-01-08 05:45:38',NULL,1048585,19),(120,1,NULL,2,16777243,'2026-01-08 05:45:38',NULL,1048585,19),(121,1,NULL,2,16777245,'2026-01-08 05:45:38',NULL,1048585,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',0,'enabled','1','bool'),(2,'acronplugin',0,'enabled','1','bool'),(3,'acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),(4,'tinymceplugin',0,'enabled','1','bool'),(5,'usageeventplugin',0,'enabled','1','bool'),(6,'developedbyblockplugin',0,'enabled','0','bool'),(7,'developedbyblockplugin',0,'seq','0','int'),(8,'languagetoggleblockplugin',0,'enabled','1','bool'),(9,'languagetoggleblockplugin',0,'seq','4','int'),(10,'tinymceplugin',1,'enabled','1','bool'),(11,'defaultthemeplugin',1,'enabled','1','bool'),(12,'developedbyblockplugin',1,'enabled','0','bool'),(13,'developedbyblockplugin',1,'seq','0','int'),(14,'languagetoggleblockplugin',1,'enabled','1','bool'),(15,'languagetoggleblockplugin',1,'seq','4','int'),(16,'pdfjsviewerplugin',1,'enabled','1','bool'),(17,'webfeedplugin',1,'enabled','1','bool'),(18,'webfeedplugin',1,'displayPage','homepage','string'),(19,'webfeedplugin',1,'displayItems','1','bool'),(20,'webfeedplugin',1,'recentItems','30','int'),(21,'webfeedplugin',1,'includeIdentifiers','0','bool'),(22,'googlescholarplugin',1,'enabled','1','bool'),(23,'defaultthemeplugin',1,'typography','notoSans','string'),(24,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(25,'defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),(26,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(27,'defaultthemeplugin',1,'displayStats','none','string');
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
INSERT INTO `publication_galleys` VALUES (1,'en',1,'PDF',1,0.00,NULL,0,NULL,NULL),(2,'en',2,'PDF',2,0.00,NULL,0,NULL,NULL),(3,'en',3,'PDF',3,0.00,NULL,0,NULL,NULL),(4,'en',4,'PDF',3,0.00,NULL,0,NULL,NULL),(5,'en',5,'PDF',4,0.00,NULL,0,NULL,NULL),(6,'en',6,'PDF',5,0.00,NULL,0,NULL,NULL),(7,'en',7,'PDF',6,0.00,NULL,0,NULL,NULL),(8,'en',8,'PDF',7,0.00,NULL,0,NULL,NULL),(9,'en',9,'PDF',8,0.00,NULL,0,NULL,NULL),(10,'en',10,'PDF',9,0.00,NULL,0,NULL,NULL),(11,'en',11,'PDF',10,0.00,NULL,0,NULL,NULL),(12,'en',12,'PDF',11,0.00,NULL,0,NULL,NULL),(13,'en',13,'PDF',12,0.00,NULL,0,NULL,NULL),(14,'en',14,'PDF',13,0.00,NULL,0,NULL,NULL),(15,'en',15,'PDF',14,0.00,NULL,0,NULL,NULL),(16,'en',16,'PDF',15,0.00,NULL,0,NULL,NULL),(17,'en',17,'PDF',16,0.00,NULL,0,NULL,NULL),(18,'en',18,'PDF',17,0.00,NULL,0,NULL,NULL),(19,'en',19,'PDF',18,0.00,NULL,0,NULL,NULL),(20,'en',20,'PDF',19,0.00,NULL,0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,1,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),(2,1,'','categoryIds','[]'),(3,1,'en','title','The influence of lactation on the quantity and quality of cashmere production'),(4,2,'','categoryIds','[]'),(5,2,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(6,2,'en','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(7,2,'en','copyrightHolder','Public Knowledge Preprint Server'),(8,2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,2,'','copyrightYear','2026'),(10,3,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(11,3,'','categoryIds','[]'),(12,3,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(13,3,'en','copyrightHolder','Public Knowledge Preprint Server'),(14,3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,3,'','copyrightYear','2026'),(16,4,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(17,4,'','categoryIds','[]'),(18,4,'en','copyrightHolder','Craig Montgomerie'),(19,4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(20,4,'','copyrightYear','2026'),(21,4,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(22,5,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),(23,5,'','categoryIds','[]'),(24,5,'en','title','Genetic transformation of forest trees'),(25,6,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),(26,6,'','categoryIds','[]'),(27,6,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(28,6,'en','copyrightHolder','Public Knowledge Preprint Server'),(29,6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(30,6,'','copyrightYear','2026'),(31,7,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),(32,7,'','categoryIds','[]'),(33,7,'en','title','Developing efficacy beliefs in the classroom'),(34,7,'en','copyrightHolder','Public Knowledge Preprint Server'),(35,7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(36,7,'','copyrightYear','2026'),(37,8,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),(38,8,'','categoryIds','[]'),(39,8,'en','title','Developing efficacy beliefs in the classroom'),(40,8,'en','copyrightHolder','Public Knowledge Preprint Server'),(41,8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(42,8,'','copyrightYear','2026'),(43,9,'en','abstract','None.'),(44,9,'','categoryIds','[]'),(45,9,'en','title','Hansen & Pinto: Reason Reclaimed'),(46,9,'en','copyrightHolder','Public Knowledge Preprint Server'),(47,9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(48,9,'','copyrightYear','2026'),(49,10,'en','abstract','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.'),(50,10,'','categoryIds','[]'),(51,10,'en','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(52,10,'en','copyrightHolder','Public Knowledge Preprint Server'),(53,10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(54,10,'','copyrightYear','2026'),(55,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),(56,11,'','categoryIds','[]'),(57,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(58,11,'en','copyrightHolder','Public Knowledge Preprint Server'),(59,11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(60,11,'','copyrightYear','2026'),(61,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),(62,12,'','categoryIds','[]'),(63,12,'en','title','Learning Sustainable Design through Service'),(64,12,'en','copyrightHolder','Public Knowledge Preprint Server'),(65,12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(66,12,'','copyrightYear','2026'),(67,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),(68,13,'','categoryIds','[]'),(69,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(70,13,'en','copyrightHolder','Public Knowledge Preprint Server'),(71,13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(72,13,'','copyrightYear','2026'),(73,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),(74,14,'','categoryIds','[]'),(75,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(76,14,'en','copyrightHolder','Public Knowledge Preprint Server'),(77,14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(78,14,'','copyrightYear','2026'),(79,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),(80,15,'','categoryIds','[]'),(81,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(82,15,'en','copyrightHolder','Public Knowledge Preprint Server'),(83,15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(84,15,'','copyrightYear','2026'),(85,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),(86,16,'','categoryIds','[]'),(87,16,'en','title','Yam diseases and its management in Nigeria'),(88,16,'en','copyrightHolder','Public Knowledge Preprint Server'),(89,16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(90,16,'','copyrightYear','2026'),(91,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),(92,17,'','categoryIds','[]'),(93,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(94,17,'en','copyrightHolder','Public Knowledge Preprint Server'),(95,17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(96,17,'','copyrightYear','2026'),(97,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),(98,18,'','categoryIds','[]'),(99,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(100,18,'en','copyrightHolder','Public Knowledge Preprint Server'),(101,18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(102,18,'','copyrightYear','2026'),(103,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),(104,19,'','categoryIds','[]'),(105,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(106,19,'en','copyrightHolder','Public Knowledge Preprint Server'),(107,19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(108,19,'','copyrightYear','2026'),(109,20,'en','abstract','None.'),(110,20,'','categoryIds','[]'),(111,20,'en','title','Finocchiaro: Arguments About Arguments'),(112,20,'en','copyrightHolder','Public Knowledge Preprint Server'),(113,20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(114,20,'','copyrightYear','2026');
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
INSERT INTO `publications` VALUES (1,0,NULL,'2026-01-08 05:38:17',1,1,1,1,NULL,1,NULL),(2,0,'2026-01-08','2026-01-08 05:39:20',2,1,2,3,NULL,1,NULL),(3,0,'2026-01-08','2026-01-08 05:39:49',5,1,3,3,NULL,1,NULL),(4,0,'2026-01-08','2026-01-08 05:39:55',7,1,3,3,NULL,2,NULL),(5,0,NULL,'2026-01-08 05:40:01',9,1,4,1,NULL,1,NULL),(6,0,'2026-01-08','2026-01-08 05:40:50',10,1,5,3,NULL,1,NULL),(7,0,'2026-01-08','2026-01-08 05:41:11',11,1,6,3,NULL,1,NULL),(8,0,'2026-01-08','2026-01-08 05:41:32',12,1,7,3,NULL,1,NULL),(9,0,'2026-01-08','2026-01-08 05:41:52',14,1,8,3,NULL,1,NULL),(10,0,'2026-01-08','2026-01-08 05:42:13',15,1,9,3,NULL,1,NULL),(11,0,'2026-01-08','2026-01-08 05:42:34',16,1,10,3,NULL,1,NULL),(12,0,'2026-01-08','2026-01-08 05:42:55',17,1,11,3,NULL,1,NULL),(13,0,'2026-01-08','2026-01-08 05:43:16',19,1,12,3,NULL,1,NULL),(14,0,'2026-01-08','2026-01-08 05:43:36',20,1,13,3,NULL,1,NULL),(15,0,'2026-01-08','2026-01-08 05:43:57',21,1,14,3,NULL,1,NULL),(16,0,'2026-01-08','2026-01-08 05:44:18',22,1,15,3,NULL,1,NULL),(17,0,'2026-01-08','2026-01-08 05:44:39',23,1,16,3,NULL,1,NULL),(18,0,'2026-01-08','2026-01-08 05:45:00',24,1,17,3,NULL,1,NULL),(19,0,'2026-01-08','2026-01-08 05:45:21',25,1,18,3,NULL,1,NULL),(20,0,'2026-01-08','2026-01-08 05:45:42',26,1,19,3,NULL,1,NULL);
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
INSERT INTO `scheduled_tasks` VALUES (1,'PKP\\task\\StatisticsReport','2026-01-08 05:36:35'),(2,'PKP\\task\\RemoveUnvalidatedExpiredUsers','2026-01-08 05:36:35'),(3,'PKP\\task\\UpdateIPGeoDB','2026-01-08 05:36:35'),(4,'APP\\tasks\\UsageStatsLoader','2026-01-08 05:36:36'),(5,'PKP\\task\\ProcessQueueJobs','2026-01-08 05:36:36'),(6,'PKP\\task\\RemoveFailedJobs','2026-01-08 05:36:36');
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
  PRIMARY KEY (`server_setting_id`),
  UNIQUE KEY `server_settings_unique` (`server_id`,`locale`,`setting_name`),
  KEY `server_settings_server_id` (`server_id`),
  CONSTRAINT `server_settings_server_id` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COMMENT='More data about server settings, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES (1,1,'en','acronym','JPKPKP'),(3,1,'en','authorGuidelines','<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p> When you\'re satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>'),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##'),(5,1,'en','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.'),(6,1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##'),(7,1,'en','beginSubmissionHelp','<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Public Knowledge Preprint Server. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),(9,1,'','contactEmail','rvaca@mailinator.com'),(10,1,'','contactName','Ramiro Vaca'),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>'),(12,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),(13,1,'','country','IS'),(14,1,'','defaultReviewMode','2'),(15,1,'en','description','<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>'),(16,1,'fr_CA','description','<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>'),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),(18,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),(19,1,'','copySubmissionAckPrimaryContact','0'),(20,1,'','copySubmissionAckAddress',''),(21,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(22,1,'','enableDois','1'),(23,1,'','doiSuffixType','default'),(24,1,'','registrationAgency',''),(25,1,'','disableSubmissions','0'),(26,1,'','editorialStatsEmail','1'),(27,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>'),(28,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),(29,1,'','itemsPerPage','25'),(30,1,'','keywords','request'),(31,1,'en','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"https://pkp.sfu.ca\">Public Knowledge Project</a>).'),(32,1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##'),(33,1,'en','name','Public Knowledge Preprint Server'),(34,1,'fr_CA','name','Serveur de prépublication de la connaissance du public'),(35,1,'','notifyAllAuthors','1'),(36,1,'','numPageLinks','10'),(37,1,'','numWeeksPerResponse','4'),(38,1,'','numWeeksPerReview','4'),(39,1,'en','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),(40,1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##'),(41,1,'en','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>'),(42,1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##'),(43,1,'en','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.'),(44,1,'fr_CA','readerInformation','##default.contextSettings.forReaders##'),(45,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>'),(46,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),(47,1,'','submissionAcknowledgement','allAuthors'),(48,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>'),(49,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),(50,1,'','submitWithCategories','0'),(51,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),(52,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),(53,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),(54,1,'','themePluginPath','default'),(55,1,'en','uploadFilesHelp','<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>'),(56,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),(57,1,'','enableGeoUsageStats','disabled'),(58,1,'','enableInstitutionUsageStats','0'),(59,1,'','isSushiApiPublic','1'),(62,1,'','enableAuthorScreening','0'),(63,1,'','enabledDoiTypes','[\"publication\"]'),(64,1,'','postedAcknowledgement','1'),(65,1,'','enableOai','1'),(66,1,'','doiVersioning','1'),(67,1,'','doiCreationTime','copyEditCreationTime'),(68,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),(69,1,'en','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.'),(70,1,'en','abbreviation','publicknowledgePub Know Pre'),(71,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),(72,1,'','supportEmail','rvaca@mailinator.com'),(73,1,'','supportName','Ramiro Vaca');
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
INSERT INTO `sessions` VALUES ('0b66b02bq5k4eqffebl58ipatf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850844,1767850848,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850848;s:5:\"token\";s:32:\"7e650abcd1ee46bfd1ca8282ce15243e\";}username|s:7:\"dbarnes\";','localhost'),('1h0aamod3ktrkqdtjohrmgcp4p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850992,1767850996,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850996;s:5:\"token\";s:32:\"cdfde32c34103cd8dbba0825686a4f65\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('2sepcr6hh8ikc9hql4jdmg9itu',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850781,1767850797,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850797;s:5:\"token\";s:32:\"a00fc2c883855cc0da2750b49933a146\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('313v2e6d1934t3irr0r44eperq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850633,1767850661,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850661;s:5:\"token\";s:32:\"ad0a6e16ba4c7e566604b6b90464cf24\";}username|s:5:\"admin\";','localhost'),('3berpk5u93s5e1pgsr5a5d50vl',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850595,1767850611,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850611;s:5:\"token\";s:32:\"08fc2f8a4eeb03412291871c82dc9e9d\";}userId|i:1;username|s:5:\"admin\";','localhost'),('3t8nf77st4ck8pbjsiv7ubd30o',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850998,1767851013,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851013;s:5:\"token\";s:32:\"6f66ade94731e092ffa5ea8866574786\";}username|s:8:\"lkumiega\";','localhost'),('4r756luuf4t5gdrp7kqu3t4rbm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851013,1767851017,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851017;s:5:\"token\";s:32:\"457a643603b0b88419b1e2cb1cbcb5f2\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('6rfjv7ol6atnsdhei4m8j481pt',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850621,1767850626,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850626;s:5:\"token\";s:32:\"0aa1257fd61f11554e7f08e4833de5af\";}userId|i:1;username|s:5:\"admin\";','localhost'),('7b5nagkqb1jjbuennrm618rcs2',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850693,1767850708,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850708;s:5:\"token\";s:32:\"76d440adafa45e565c78f67b4c8ba14f\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('8dga09f05io2oitnra2gor131p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850756,1767850760,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850760;s:5:\"token\";s:32:\"62299c097186283b6aaa576a1420da33\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('93sfjce9gfpbvfduku6d5vv60h',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850873,1767850888,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850888;s:5:\"token\";s:32:\"920dbc3b78e497bcb4829bf3fbafce33\";}username|s:7:\"eostrom\";','localhost'),('99p1c6e5mvf3upaq1dsvpfijuv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851060,1767851075,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851075;s:5:\"token\";s:32:\"8d9f7f1c5793f7bfd164b68ac4cf1a30\";}username|s:6:\"rrossi\";','localhost'),('9fhqo4q0kfjuob59ljctmn7k5f',8,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850710,1767850756,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850756;s:5:\"token\";s:32:\"6530280f95dd13a8242b4d8c7e2f96a1\";}username|s:8:\"ckwantes\";userId|i:8;','localhost'),('b7ba0oh7lob5choi8hgvs11tk7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851055,1767851059,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851059;s:5:\"token\";s:32:\"08f9dd24b0739d279dd30257768cc218\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('bacbplfc561kg9bq0jaand2s03',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850914,1767850929,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850929;s:5:\"token\";s:32:\"20931c8e32de5fd448a5a2bfc4e9c794\";}username|s:10:\"jmwandenga\";','localhost'),('bv006p0jcq8hg0rppo0et0bii2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850909,1767850913,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850913;s:5:\"token\";s:32:\"09722f1312b4ba54df913b247021438a\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('d3jsg7v0vmu7bqfe2ghlo4i8qc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850935,1767850950,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850950;s:5:\"token\";s:32:\"05624c61d55a7797514a1af79fe1aed0\";}username|s:6:\"jnovak\";','localhost'),('d870egvnrgv53mvunt20hj6ns3',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850673,1767850692,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850692;s:5:\"token\";s:32:\"c03f7ed3ba7fc676ae2fd459ab9fecd3\";}userId|i:1;username|s:5:\"admin\";','localhost'),('e2uruhngvntlcrm94kvbh67ukm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851018,1767851034,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851034;s:5:\"token\";s:32:\"49903d9f5419b35ba800fbf70025aa4b\";}username|s:7:\"pdaniel\";','localhost'),('eu54t9p22i6tme0epl8mmsrojf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851076,1767851080,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851080;s:5:\"token\";s:32:\"f6e9196a9eb2a7a84409b8fcc2d95627\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('fvqsiboci4nhkidmnljih6o5f9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850762,1767850777,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850777;s:5:\"token\";s:32:\"73cff32e67626b298574db4278068f64\";}username|s:12:\"cmontgomerie\";','localhost'),('hecls8kt817rm51ndcjepa6ikk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850868,1767850872,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850872;s:5:\"token\";s:32:\"3f0ecfddf3ba3d7eed70f240136706de\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('i2f142oh5jplfh2bi0ccoaag37',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850777,1767850781,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850781;s:5:\"token\";s:32:\"fd4c4e9d00ff7c9c78750006444beebd\";}username|s:7:\"dbarnes\";','localhost'),('imnc2itv7la3ll4chuobvb6v81',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850627,1767850631,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850631;s:5:\"token\";s:32:\"3bed33b3998b2a38bb3d52734573064f\";}userId|i:1;username|s:5:\"admin\";','localhost'),('iu6m6nn00m3h4kmigc9goaif0b',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850930,1767850933,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850933;s:5:\"token\";s:32:\"6aa5c1ca4525233f23ff58f62fe88214\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('jj24k91kp581sqsuikghbh4lpt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850852,1767850867,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850867;s:5:\"token\";s:32:\"3e796d673e2ed1ce455e21cd71396268\";}username|s:9:\"dsokoloff\";','localhost'),('khfl39qems9t543k171hkldcc0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851123,1767851138,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851138;s:5:\"token\";s:32:\"608ff3a0fbbbf875018d0204a0061936\";}username|s:6:\"zwoods\";','localhost'),('l7ij499q9psfcdikovoak94cc4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851097,1767851101,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851101;s:5:\"token\";s:32:\"316b30259835c37ede577ba0bf50de23\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('lkucqmvq4o05o022o4826h01k7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850661,1767850666,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850665;s:5:\"token\";s:32:\"b79b6eb2d4d4b81672c943e68da158a0\";}username|s:5:\"rvaca\";','localhost'),('mga4v2oh5tmakaoi1sdm99rkrl',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850848,1767850851,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850851;s:5:\"token\";s:32:\"1c9e7ce30e2453610f4b7dcb56af30e8\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('mi592a0on6ggd868jblvt574m7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850971,1767850975,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850975;s:5:\"token\";s:32:\"d2969c0c30ce992432ba7c5225d9b9da\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('mjcrij9sjtagivoq535mt904fl',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850611,1767850620,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850620;s:5:\"token\";s:32:\"90950e07f7ed2778906be2ea02edb800\";}userId|i:1;username|s:5:\"admin\";','localhost'),('nub7g9ak4tla4i1evq8c963sda',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850668,1767850672,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850672;s:5:\"token\";s:32:\"ab7eed6afefb32093b74c727c76b702a\";}userId|i:1;username|s:5:\"admin\";','localhost'),('oqt1r97p6ugcgo5kpb9mkt6b3r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851081,1767851096,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851096;s:5:\"token\";s:32:\"e28e0512c00724fa54588b912fdc445e\";}username|s:12:\"vkarbasizaed\";','localhost'),('pen26l8v2ahg7nns7vhbdgej3m',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850956,1767850971,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850971;s:5:\"token\";s:32:\"e55735d2f1b3541e0d37f3f71b9bf094\";}username|s:10:\"kalkhafaji\";','localhost'),('q3u7vqmorhahm3unc85ar8d80v',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850840,1767850844,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850844;s:5:\"token\";s:32:\"8de8a37e080cabffe8c991cc7bf7ad94\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('qlbdpv75an8jc1ug7m37n31rq6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851118,1767851122,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851122;s:5:\"token\";s:32:\"580b2f3e4a467d211aa59662b4b98140\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('qmhimsnrv3vts37u2l27i3fll1',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850797,1767850812,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850812;s:5:\"token\";s:32:\"e826a4e6cca33746d6efb10a12620b7a\";}username|s:6:\"ddiouf\";userId|i:10;','localhost'),('qn13m5g0ru66e0coj6o4rohgod',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851034,1767851037,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851037;s:5:\"token\";s:32:\"dd878eeebcc86e3780b1e8cb1c8cd56d\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('qu8u4q3nrpdf87pst47n9psr68',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850813,1767850824,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850824;s:5:\"token\";s:32:\"6735ebcc6eee47564d3592fd3063b423\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('r4a8fn5ptoj6tvoq3n48b7kvf6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851039,1767851055,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851055;s:5:\"token\";s:32:\"59b5c710a54be38d87c122b912a03203\";}username|s:8:\"rbaiyewu\";','localhost'),('r71i4f70ar3ur3lmuj0oinli5l',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850950,1767850954,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850954;s:5:\"token\";s:32:\"1a9c138670ea722cbe1431a19c1546f1\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('t0tdmbdqs3ecplig4uvi6dk4ii',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851102,1767851117,0,'csrf|a:2:{s:9:\"timestamp\";i:1767851117;s:5:\"token\";s:32:\"ce9b73612465046abbcd71b8a588e3a5\";}username|s:11:\"vwilliamson\";','localhost'),('t9r5c74la5u8bkfctk3kmk9or7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850894,1767850909,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850909;s:5:\"token\";s:32:\"531e9dd93b2044a49acc2bb0c0e36d77\";}username|s:9:\"fpaglieri\";','localhost'),('tithgea39857pha2162ri6l72b',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850825,1767850840,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850840;s:5:\"token\";s:32:\"481b83ad7e54716876313849449f0643\";}username|s:9:\"dphillips\";','localhost'),('u57hcic565bjmvjuhsuj6f14b0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767851138,1767851142,1,'csrf|a:2:{s:9:\"timestamp\";i:1767851143;s:5:\"token\";s:32:\"d95ccd9a0d6aa3ff8ab368c65d479996\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('var805mkt63nagoju4br32056p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850888,1767850892,1,'csrf|a:2:{s:9:\"timestamp\";i:1767850892;s:5:\"token\";s:32:\"2773678a80341f9669eb601c44a9d830\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('vcddm3538g7697jad1imoq9fmd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767850977,1767850992,0,'csrf|a:2:{s:9:\"timestamp\";i:1767850992;s:5:\"token\";s:32:\"fd949f7f86ec6b5c0beecad4e092f52d\";}username|s:12:\"lchristopher\";','localhost');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','en','pkpadmin@mailinator.com'),(2,'contactName','en','Open Preprint Systems'),(3,'contactName','fr_CA','Open Preprint Systems'),(4,'compressStatsLogs','','0'),(5,'enableGeoUsageStats','','disabled'),(6,'enableInstitutionUsageStats','','0'),(7,'keepDailyUsageStats','','0'),(8,'isSiteSushiPlatform','','0'),(9,'isSushiApiPublic','','1'),(10,'disableSharedReviewerStatistics','','0'),(11,'themePluginPath','','default'),(12,'uniqueSiteId','','9C8614B2-5C9A-4971-AC38-935FDF54250A');
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
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2026-01-08 05:38:28',0,1),(2,1,3,4,'2026-01-08 05:38:28',0,1),(3,1,3,5,'2026-01-08 05:38:28',0,1),(4,2,4,8,'2026-01-08 05:39:14',0,1),(5,2,3,4,'2026-01-08 05:39:14',0,1),(6,2,3,5,'2026-01-08 05:39:14',0,1),(7,3,4,9,'2026-01-08 05:39:36',0,1),(8,3,3,4,'2026-01-08 05:39:36',0,1),(9,3,3,5,'2026-01-08 05:39:36',0,1),(10,4,4,10,'2026-01-08 05:40:12',0,1),(11,4,3,4,'2026-01-08 05:40:12',0,1),(12,4,3,5,'2026-01-08 05:40:12',0,1),(13,5,4,11,'2026-01-08 05:40:40',0,1),(14,5,3,4,'2026-01-08 05:40:40',0,1),(15,5,3,5,'2026-01-08 05:40:40',0,1),(16,6,4,12,'2026-01-08 05:41:07',0,1),(17,6,3,4,'2026-01-08 05:41:07',0,1),(18,6,3,5,'2026-01-08 05:41:07',0,1),(19,7,4,13,'2026-01-08 05:41:28',0,1),(20,7,3,4,'2026-01-08 05:41:28',0,1),(21,7,3,5,'2026-01-08 05:41:28',0,1),(22,8,4,14,'2026-01-08 05:41:48',0,1),(23,8,3,4,'2026-01-08 05:41:48',0,1),(24,8,3,5,'2026-01-08 05:41:48',0,1),(25,9,4,15,'2026-01-08 05:42:09',0,1),(26,9,3,4,'2026-01-08 05:42:09',0,1),(27,9,3,5,'2026-01-08 05:42:09',0,1),(28,10,4,16,'2026-01-08 05:42:30',0,1),(29,10,3,4,'2026-01-08 05:42:30',0,1),(30,10,3,5,'2026-01-08 05:42:30',0,1),(31,11,4,17,'2026-01-08 05:42:50',0,1),(32,11,3,4,'2026-01-08 05:42:50',0,1),(33,11,3,5,'2026-01-08 05:42:50',0,1),(34,12,4,18,'2026-01-08 05:43:11',0,1),(35,12,3,4,'2026-01-08 05:43:11',0,1),(36,12,3,5,'2026-01-08 05:43:11',0,1),(37,13,4,19,'2026-01-08 05:43:32',0,1),(38,13,3,4,'2026-01-08 05:43:32',0,1),(39,13,3,5,'2026-01-08 05:43:32',0,1),(40,14,4,20,'2026-01-08 05:43:53',0,1),(41,14,3,4,'2026-01-08 05:43:53',0,1),(42,14,3,5,'2026-01-08 05:43:53',0,1),(43,15,4,21,'2026-01-08 05:44:14',0,1),(44,15,3,4,'2026-01-08 05:44:14',0,1),(45,15,3,5,'2026-01-08 05:44:14',0,1),(46,16,4,22,'2026-01-08 05:44:35',0,1),(47,16,3,4,'2026-01-08 05:44:35',0,1),(48,16,3,5,'2026-01-08 05:44:35',0,1),(49,17,4,23,'2026-01-08 05:44:56',0,1),(50,17,3,4,'2026-01-08 05:44:56',0,1),(51,17,3,5,'2026-01-08 05:44:56',0,1),(52,18,4,24,'2026-01-08 05:45:17',0,1),(53,18,3,4,'2026-01-08 05:45:17',0,1),(54,18,3,5,'2026-01-08 05:45:17',0,1),(55,19,4,25,'2026-01-08 05:45:38',0,1),(56,19,3,4,'2026-01-08 05:45:38',0,1),(57,19,3,5,'2026-01-08 05:45:38',0,1);
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
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf'),(2,1,'fr_CA','name',''),(3,2,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(4,2,'fr_CA','name',''),(5,3,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(6,3,'fr_CA','name',''),(7,4,'en','name','Genetic transformation of forest trees.pdf'),(8,4,'fr_CA','name',''),(9,5,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(10,5,'fr_CA','name',''),(11,6,'en','name','Developing efficacy beliefs in the classroom.pdf'),(12,6,'fr_CA','name',''),(13,7,'en','name','Developing efficacy beliefs in the classroom.pdf'),(14,7,'fr_CA','name',''),(15,8,'en','name','Hansen & Pinto: Reason Reclaimed.pdf'),(16,8,'fr_CA','name',''),(17,9,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(18,9,'fr_CA','name',''),(19,10,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(20,10,'fr_CA','name',''),(21,11,'en','name','Learning Sustainable Design through Service.pdf'),(22,11,'fr_CA','name',''),(23,12,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(24,12,'fr_CA','name',''),(25,13,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(26,13,'fr_CA','name',''),(27,14,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(28,14,'fr_CA','name',''),(29,15,'en','name','Yam diseases and its management in Nigeria.pdf'),(30,15,'fr_CA','name',''),(31,16,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(32,16,'fr_CA','name',''),(33,17,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(34,17,'fr_CA','name',''),(35,18,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(36,18,'fr_CA','name',''),(37,19,'en','name','Finocchiaro: Arguments About Arguments.pdf'),(38,19,'fr_CA','name','');
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
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:38:25','2026-01-08 05:38:28',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:38:58','2026-01-08 05:39:01',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:39:33','2026-01-08 05:39:36',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:40:09','2026-01-08 05:40:11',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:40:37','2026-01-08 05:40:39',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:41:04','2026-01-08 05:41:06',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:41:25','2026-01-08 05:41:27',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:41:46','2026-01-08 05:41:48',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:42:06','2026-01-08 05:42:08',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:42:27','2026-01-08 05:42:29',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:42:47','2026-01-08 05:42:50',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:43:09','2026-01-08 05:43:11',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:43:30','2026-01-08 05:43:32',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:43:51','2026-01-08 05:43:53',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:44:11','2026-01-08 05:44:14',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:44:32','2026-01-08 05:44:35',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:44:53','2026-01-08 05:44:55',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:45:14','2026-01-08 05:45:16',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2026-01-08 05:45:35','2026-01-08 05:45:37',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (49,'133rd'),(373,'1980s'),(729,'21st'),(436,'aalborg'),(851,'abattoir'),(886,'abnormal'),(516,'academic'),(603,'accepted'),(484,'accompanying'),(777,'achieving'),(81,'acid'),(618,'acids'),(343,'action'),(979,'actor'),(972,'actors'),(471,'added'),(514,'address'),(60,'adg'),(558,'adipose'),(78,'adiposity'),(222,'administered'),(448,'administration'),(808,'adopted'),(809,'advocated'),(876,'affected'),(122,'affects'),(848,'african'),(978,'agree'),(907,'aid'),(553,'aim'),(165,'alberta'),(237,'alexandria'),(35,'allocated'),(718,'analyses'),(133,'analysis'),(582,'analyzed'),(580,'animals'),(790,'anthracnose'),(948,'antibiotics'),(919,'antimicrobial'),(654,'antonio'),(681,'appears'),(246,'applications'),(447,'applied'),(630,'aquifer'),(111,'archival'),(97,'areas'),(262,'argument'),(996,'arguments'),(826,'ash'),(554,'assess'),(622,'assessed'),(676,'assessments'),(725,'atlantic'),(113,'attitude'),(545,'australian'),(908,'authorities'),(498,'authority'),(439,'availability'),(29,'average'),(562,'averaging'),(576,'backfat'),(261,'background'),(780,'baiyewu'),(840,'barcelona'),(18,'barley'),(735,'barriers'),(32,'barrows'),(634,'barton'),(499,'based'),(492,'basin'),(458,'basins'),(19,'basis'),(675,'bearings'),(850,'beef'),(13,'beet'),(194,'began'),(48,'beginning'),(308,'belief'),(273,'beliefs'),(757,'belonging'),(128,'benchmark'),(142,'benefit'),(666,'blanco'),(4,'bologna'),(148,'brazil'),(497,'brazos'),(873,'breeds'),(690,'buda'),(863,'bulls'),(547,'butyrate'),(595,'c18'),(598,'c20'),(196,'called'),(846,'cameroon'),(190,'canada'),(468,'capabilities'),(399,'cape'),(875,'carcass'),(858,'carcasses'),(621,'carefully'),(1,'carlo'),(748,'carried'),(724,'case'),(955,'cases'),(9,'cashmere'),(878,'category'),(100,'catherine'),(844,'cattle'),(287,'cedural'),(641,'central'),(730,'century'),(679,'cfs'),(538,'challenges'),(700,'change'),(525,'chapter'),(857,'characteristics'),(306,'children'),(147,'china'),(832,'chips'),(544,'christopher'),(88,'chroma'),(596,'cis'),(311,'citizens'),(346,'citizenship'),(279,'claim'),(269,'claims'),(176,'classroom'),(954,'clinical'),(583,'close'),(726,'coast'),(939,'coli'),(923,'coliforms'),(375,'colleagues'),(578,'collected'),(656,'collection'),(981,'collective'),(977,'collectively'),(153,'collectivistic'),(301,'college'),(86,'colour'),(786,'combating'),(274,'commitments'),(283,'common'),(350,'commons'),(137,'communication'),(759,'communities'),(742,'community'),(107,'comparative'),(971,'compare'),(131,'compared'),(143,'comparisons'),(288,'competencies'),(126,'compiled'),(487,'complete'),(903,'completely'),(466,'complex'),(82,'composition'),(166,'computer'),(952,'concentration'),(652,'concept'),(93,'concluded'),(414,'conclusive'),(900,'condemned'),(479,'condensed'),(437,'condensing'),(636,'conditions'),(321,'conducted'),(309,'confident'),(415,'conflicting'),(961,'conjugative'),(709,'connection'),(628,'connectivity'),(986,'consensus'),(77,'consequence'),(796,'considered'),(149,'consistent'),(282,'consists'),(605,'consortium'),(109,'construct'),(493,'contained'),(374,'contemporary'),(587,'content'),(158,'context'),(715,'continual'),(312,'continue'),(430,'continuous'),(744,'contributing'),(989,'contributors'),(39,'control'),(535,'coordinated'),(199,'core'),(2,'corino'),(302,'cork'),(425,'corporate'),(755,'council'),(125,'countries'),(770,'country'),(200,'courses'),(366,'coward'),(884,'cows'),(332,'cps'),(163,'craig'),(127,'create'),(329,'creative'),(665,'creek'),(263,'critique'),(811,'crop'),(833,'cubes'),(818,'cultivars'),(157,'cultural'),(121,'culture'),(760,'cultures'),(994,'cuny'),(606,'cured'),(193,'curriculum'),(68,'cuts'),(24,'dairy'),(256,'dana'),(720,'daniel'),(112,'data'),(480,'dataset'),(463,'datasets'),(50,'day'),(355,'decades'),(973,'decide'),(340,'decision'),(429,'decisions'),(266,'deep'),(751,'defining'),(79,'degree'),(752,'delivering'),(713,'demands'),(185,'demonstrate'),(746,'describes'),(505,'design'),(722,'designing'),(816,'destruction'),(800,'devastating'),(496,'develop'),(469,'developed'),(303,'developing'),(211,'development'),(386,'developments'),(235,'diaga'),(42,'diet'),(614,'dietary'),(27,'diets'),(611,'differed'),(949,'difference'),(56,'differences'),(294,'difficult'),(984,'difficulty'),(26,'diluted'),(236,'diouf'),(540,'directions'),(267,'disagreement'),(358,'disciplines'),(699,'discontinuity'),(245,'discussed'),(753,'discussions'),(795,'disease'),(783,'diseases'),(669,'dissipated'),(356,'distinguished'),(897,'distress'),(428,'distribution'),(297,'diverge'),(733,'diversity'),(653,'divide'),(419,'dividend'),(403,'dividends'),(299,'domatilia'),(648,'downstream'),(663,'drainage'),(698,'dramatic'),(909,'draw'),(635,'drought'),(674,'droughts'),(44,'dry'),(904,'due'),(702,'dynamic'),(90,'economical'),(417,'economists'),(597,'ecosenoic'),(888,'ectoparasites'),(803,'edible'),(179,'education'),(629,'edwards'),(160,'effect'),(139,'effectiveness'),(11,'effects'),(304,'efficacy'),(138,'efficiency'),(772,'egalitarianism'),(347,'elinor'),(732,'embracing'),(518,'emerging'),(756,'emphasises'),(405,'empirical'),(230,'employed'),(115,'employees'),(962,'encoding'),(887,'encountered'),(645,'endangered'),(456,'endeavors'),(247,'engineering'),(522,'engineers'),(328,'enhance'),(474,'enhanced'),(344,'enhancing'),(893,'enlarged'),(932,'enterobacteriacea'),(507,'environmental'),(970,'environments'),(305,'equip'),(110,'equivalence'),(938,'escherichia'),(651,'established'),(765,'ethnic'),(766,'ethno'),(434,'evaluation'),(406,'evidence'),(119,'examine'),(226,'examined'),(741,'examines'),(159,'exerts'),(145,'exhibited'),(539,'exist'),(169,'existing'),(660,'exists'),(454,'expanding'),(351,'expe'),(202,'expected'),(36,'exper'),(524,'experiences'),(52,'experimental'),(253,'expression'),(685,'extended'),(687,'extensive'),(390,'fabio'),(103,'facets'),(132,'factor'),(135,'factors'),(934,'faeces'),(513,'failed'),(813,'fallowing'),(70,'fat'),(889,'fatigue'),(572,'fats'),(80,'fatty'),(61,'fcr'),(470,'features'),(23,'fed'),(53,'feed'),(788,'field'),(935,'fifteen'),(560,'fifty'),(830,'finally'),(416,'financial'),(427,'financing'),(281,'find'),(151,'findings'),(995,'finocchiaro'),(412,'firm'),(673,'flow'),(680,'flowing'),(491,'flows'),(902,'flukes'),(441,'focus'),(264,'fogelin'),(623,'food'),(240,'forest'),(827,'found'),(272,'framework'),(387,'frank'),(276,'fruitfully'),(870,'fulani'),(431,'function'),(828,'fungal'),(410,'future'),(737,'gender'),(842,'general'),(252,'genes'),(238,'genetic'),(731,'genuinely'),(33,'gilts'),(824,'gins'),(217,'goal'),(991,'goverance'),(251,'governing'),(188,'government'),(186,'grade'),(693,'gradient'),(701,'gradients'),(314,'graduation'),(659,'groundwater'),(54,'group'),(38,'groups'),(473,'growing'),(58,'growth'),(869,'gudali'),(420,'guidance'),(865,'guinea'),(71,'ham'),(285,'hand'),(393,'hansen'),(617,'healthy'),(21,'heavy'),(866,'high'),(65,'higher'),(585,'highest'),(773,'highlights'),(229,'hired'),(213,'hiring'),(34,'homogeneously'),(927,'hospital'),(933,'human'),(706,'hydraulic'),(658,'hydrogeologic'),(627,'hydrologic'),(671,'hydrologically'),(28,'hypor'),(527,'identification'),(937,'identified'),(37,'imental'),(647,'immediately'),(483,'impacts'),(206,'implement'),(192,'implementation'),(976,'implemented'),(171,'implications'),(774,'importance'),(912,'improve'),(548,'improves'),(248,'improving'),(763,'include'),(495,'included'),(810,'includes'),(712,'increased'),(615,'increases'),(608,'index'),(349,'indiana'),(758,'individual'),(130,'individually'),(152,'individuals'),(817,'infected'),(829,'infection'),(926,'infections'),(5,'influence'),(682,'influenced'),(705,'influences'),(197,'information'),(310,'informed'),(198,'infused'),(62,'ing'),(708,'inherent'),(951,'inhibitory'),(30,'initial'),(182,'initiatives'),(477,'input'),(968,'institutions'),(327,'instruction'),(515,'integrates'),(231,'integrating'),(174,'integration'),(385,'intellectual'),(750,'intention'),(723,'intercultural'),(745,'interculturality'),(96,'interest'),(270,'interlocutors'),(534,'internships'),(433,'intuitive'),(259,'investigating'),(426,'investment'),(423,'investors'),(339,'involve'),(764,'involvement'),(526,'involves'),(601,'iodine'),(929,'iran'),(233,'irvine'),(928,'isfahan'),(566,'isoenergetic'),(924,'isolated'),(936,'isolates'),(178,'issue'),(854,'january'),(104,'job'),(397,'john'),(208,'jurisdictions'),(917,'karbasizaed'),(501,'karim'),(162,'kekkonen'),(941,'kelebsiella'),(315,'key'),(502,'khafaji'),(307,'knowledge'),(626,'kumiega'),(101,'kwantes'),(689,'kyle'),(6,'lactation'),(389,'laerhoven'),(890,'lameness'),(736,'language'),(465,'large'),(512,'largely'),(853,'largest'),(778,'lasting'),(609,'layers'),(342,'leads'),(67,'lean'),(318,'learn'),(313,'learners'),(204,'learning'),(532,'led'),(543,'leo'),(892,'lesions'),(187,'level'),(600,'levels'),(520,'leveraged'),(537,'limitations'),(767,'linguistic'),(599,'linoleic'),(594,'linolenic'),(625,'lise'),(404,'literature'),(835,'live'),(901,'liver'),(822,'locally'),(359,'long'),(670,'longer'),(860,'longissimus'),(367,'los'),(72,'losses'),(692,'low'),(69,'lower'),(591,'lowest'),(906,'lungs'),(894,'lymph'),(369,'mackenzie'),(823,'made'),(569,'maize'),(177,'major'),(341,'making'),(362,'managed'),(421,'management'),(191,'mandated'),(855,'march'),(632,'marcos'),(541,'margaret'),(232,'mark'),(75,'marked'),(879,'markedly'),(802,'marketable'),(564,'matched'),(815,'material'),(45,'matter'),(872,'mbororo'),(334,'means'),(881,'meat'),(250,'mechanisms'),(216,'meet'),(787,'menace'),(728,'met'),(920,'metal'),(956,'metals'),(478,'methodology'),(953,'mic'),(372,'mid'),(771,'militate'),(950,'minimal'),(363,'mismanaged'),(290,'mistakenly'),(293,'mitments'),(494,'model'),(444,'modeling'),(440,'models'),(74,'moderate'),(500,'modifying'),(716,'monitoring'),(592,'monounsaturated'),(164,'montgomerie'),(836,'months'),(542,'morse'),(793,'mosaic'),(335,'motivate'),(345,'motivation'),(593,'mufa'),(967,'multi'),(964,'multidrug'),(740,'multiethnic'),(739,'multilingual'),(117,'multinational'),(947,'multiple'),(398,'mwandenga'),(781,'nairobi'),(106,'nation'),(120,'national'),(129,'nations'),(123,'nature'),(464,'necessarily'),(714,'necessitates'),(969,'networked'),(228,'newly'),(727,'nicaragua'),(784,'nigeria'),(895,'nodes'),(898,'nodular'),(668,'normal'),(697,'north'),(925,'nosocomial'),(435,'novak'),(678,'numerical'),(317,'nurturing'),(841,'nutrition'),(619,'nutritional'),(57,'observed'),(413,'offer'),(570,'oil'),(664,'onion'),(275,'order'),(118,'organization'),(136,'organizational'),(530,'organizations'),(899,'organs'),(864,'origin'),(486,'original'),(348,'ostrom'),(734,'overcome'),(391,'paglieri'),(218,'paper'),(59,'parameters'),(604,'parma'),(291,'part'),(94,'partially'),(319,'participate'),(747,'participatory'),(529,'partner'),(354,'past'),(719,'patricia'),(960,'pattern'),(930,'patterns'),(16,'pbps'),(775,'pedagogy'),(296,'people'),(944,'percent'),(66,'percentages'),(549,'performance'),(47,'period'),(686,'periods'),(450,'permit'),(461,'permits'),(141,'personal'),(958,'persons'),(987,'perverse'),(257,'phillips'),(95,'pig'),(551,'piglets'),(22,'pigs'),(394,'pinto'),(365,'places'),(643,'plan'),(453,'planning'),(814,'planting'),(255,'plants'),(922,'plasmid'),(942,'pneumoniae'),(91,'point'),(172,'policy'),(589,'polyunsaturated'),(382,'pool'),(711,'population'),(804,'portions'),(337,'positive'),(946,'possess'),(422,'potential'),(694,'potentiometric'),(768,'power'),(418,'practical'),(173,'practice'),(856,'pre'),(874,'predominant'),(885,'pregnant'),(523,'present'),(324,'presented'),(785,'presents'),(12,'pressed'),(913,'prevent'),(150,'previous'),(638,'primary'),(509,'principles'),(286,'pro'),(76,'prob'),(330,'problem'),(983,'problematic'),(292,'procedural'),(831,'processing'),(10,'production'),(280,'productive'),(98,'products'),(210,'professional'),(557,'profile'),(931,'profiles'),(657,'program'),(910,'programmes'),(244,'progress'),(533,'project'),(528,'projects'),(914,'promote'),(776,'promoting'),(707,'properties'),(384,'property'),(616,'proportion'),(411,'prospects'),(644,'protect'),(467,'provide'),(189,'province'),(181,'provincial'),(223,'public'),(590,'pufa'),(14,'pulp'),(688,'pumping'),(988,'punishing'),(277,'pursue'),(8,'quality'),(7,'quantity'),(649,'questions'),(650,'raised'),(779,'rana'),(563,'randomized'),(571,'rapeseed'),(710,'rapid'),(225,'rate'),(43,'ratio'),(985,'reaching'),(99,'readily'),(877,'rearing'),(395,'reason'),(87,'receiving'),(243,'recent'),(683,'recharge'),(396,'reclaimed'),(859,'recorded'),(963,'recovered'),(871,'red'),(801,'reduction'),(806,'reductions'),(584,'reflected'),(460,'reflects'),(278,'refute'),(84,'regard'),(791,'regarded'),(379,'region'),(451,'regional'),(380,'regions'),(769,'relations'),(959,'relationship'),(432,'rely'),(940,'remaining'),(485,'removed'),(46,'replaced'),(17,'replacing'),(154,'report'),(862,'represent'),(847,'representative'),(490,'represents'),(227,'require'),(205,'required'),(168,'requirements'),(155,'research'),(371,'researchers'),(482,'reservoir'),(462,'reservoirs'),(921,'resistance'),(819,'resistant'),(383,'resource'),(361,'resources'),(203,'respect'),(896,'respiratory'),(224,'response'),(124,'responses'),(602,'result'),(220,'results'),(134,'revealed'),(242,'review'),(368,'reyes'),(352,'rienced'),(449,'rights'),(457,'river'),(268,'robert'),(316,'role'),(392,'rome'),(838,'rosanna'),(839,'rossi'),(799,'rot'),(812,'rotation'),(446,'routinely'),(990,'ruled'),(849,'safety'),(577,'samples'),(631,'san'),(974,'sanction'),(980,'sanctioned'),(982,'sanctioning'),(975,'sanctions'),(105,'satisfaction'),(146,'satisfied'),(586,'saturated'),(867,'savannah'),(357,'scholars'),(207,'school'),(73,'seasoning'),(377,'sec'),(624,'security'),(655,'segments'),(481,'selected'),(85,'semimembranosus'),(672,'separated'),(195,'september'),(637,'serves'),(506,'service'),(488,'set'),(517,'setting'),(943,'seventy'),(797,'severe'),(588,'sfa'),(271,'share'),(260,'shared'),(424,'shareholding'),(834,'shelf'),(613,'show'),(63,'showed'),(325,'showing'),(336,'shown'),(691,'shows'),(409,'signal'),(407,'signaling'),(401,'signalling'),(55,'significant'),(64,'significantly'),(15,'silage'),(882,'similar'),(475,'simplifying'),(476,'simulation'),(677,'simulations'),(116,'single'),(843,'situation'),(167,'skill'),(183,'skills'),(891,'skin'),(575,'slaughter'),(845,'slaughtered'),(574,'slaughtering'),(696,'slopes'),(322,'social'),(320,'society'),(546,'sodium'),(300,'sokoloff'),(331,'solving'),(642,'source'),(640,'south'),(646,'species'),(360,'specific'),(201,'specifies'),(792,'spread'),(633,'springs'),(749,'staff'),(214,'standards'),(503,'stanford'),(459,'state'),(452,'statewide'),(789,'storage'),(807,'stored'),(945,'strains'),(212,'strategies'),(326,'strategy'),(489,'streamflows'),(911,'strengthen'),(704,'structural'),(144,'structures'),(531,'student'),(184,'students'),(20,'studied'),(323,'studies'),(108,'study'),(610,'subcutaneous'),(353,'substantial'),(536,'successful'),(156,'suggest'),(408,'suggests'),(219,'summarizes'),(573,'supplement'),(556,'supplementation'),(567,'supplemented'),(639,'supply'),(140,'support'),(289,'supporters'),(762,'supporting'),(662,'surface'),(114,'survey'),(508,'sustainability'),(504,'sustainable'),(41,'sweet'),(445,'system'),(442,'systems'),(738,'takes'),(568,'tallow'),(333,'taught'),(521,'teach'),(170,'teachers'),(620,'technological'),(175,'technology'),(820,'tecto'),(918,'tehran'),(221,'telephone'),(579,'ten'),(555,'term'),(443,'texas'),(402,'theory'),(265,'thesis'),(821,'thiabendazole'),(861,'thoracis'),(761,'time'),(364,'times'),(559,'tissue'),(180,'today'),(957,'tolerant'),(519,'tool'),(284,'topic'),(511,'topics'),(258,'toronto'),(378,'tors'),(883,'toughest'),(400,'town'),(915,'trade'),(40,'traditional'),(239,'transformation'),(868,'transhumance'),(581,'treatment'),(612,'treatments'),(241,'trees'),(717,'trend'),(51,'trial'),(905,'tuberculosis'),(805,'tubers'),(209,'turning'),(472,'types'),(83,'unaffected'),(249,'understanding'),(3,'university'),(703,'unknown'),(607,'unsaturation'),(215,'upgrade'),(295,'uphold'),(743,'uraccan'),(161,'urho'),(916,'vajiheh'),(965,'valerie'),(338,'valuable'),(89,'values'),(388,'van'),(695,'variation'),(880,'varied'),(455,'variety'),(661,'vicinity'),(234,'victoria'),(92,'view'),(794,'virus'),(510,'vital'),(684,'vulnerable'),(754,'wales'),(438,'water'),(550,'weaned'),(552,'weaning'),(31,'weight'),(565,'weights'),(667,'wet'),(25,'whey'),(561,'white'),(298,'widely'),(966,'williamson'),(102,'windsor'),(370,'wittfogel'),(721,'wolverhampton'),(825,'wood'),(993,'woods'),(254,'woody'),(376,'work'),(381,'world'),(782,'yam'),(798,'yams'),(852,'yaoundé'),(837,'year'),(992,'zita');
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
) ENGINE=InnoDB AUTO_INCREMENT=3702 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,1,0),(2,1,2,1),(3,1,3,2),(4,1,4,3),(5,2,5,0),(6,2,6,1),(7,2,7,2),(8,2,8,3),(9,2,9,4),(10,2,10,5),(11,3,11,0),(12,3,12,1),(13,3,13,2),(14,3,14,3),(15,3,15,4),(16,3,16,5),(17,3,17,6),(18,3,18,7),(19,3,19,8),(20,3,20,9),(21,3,21,10),(22,3,22,11),(23,3,23,12),(24,3,24,13),(25,3,25,14),(26,3,26,15),(27,3,27,16),(28,3,28,17),(29,3,22,18),(30,3,29,19),(31,3,30,20),(32,3,31,21),(33,3,32,22),(34,3,33,23),(35,3,34,24),(36,3,35,25),(37,3,36,26),(38,3,37,27),(39,3,38,28),(40,3,39,29),(41,3,22,30),(42,3,23,31),(43,3,40,32),(44,3,41,33),(45,3,25,34),(46,3,26,35),(47,3,42,36),(48,3,43,37),(49,3,25,38),(50,3,44,39),(51,3,45,40),(52,3,16,41),(53,3,46,42),(54,3,18,43),(55,3,19,44),(56,3,47,45),(57,3,48,46),(58,3,49,47),(59,3,50,48),(60,3,51,49),(61,3,19,50),(62,3,16,51),(63,3,46,52),(64,3,18,53),(65,3,19,54),(66,3,52,55),(67,3,47,56),(68,3,27,57),(69,3,53,58),(70,3,24,59),(71,3,25,60),(72,3,26,61),(73,3,54,62),(74,3,55,63),(75,3,56,64),(76,3,57,65),(77,3,58,66),(78,3,59,67),(79,3,60,68),(80,3,61,69),(81,3,22,70),(82,3,27,71),(83,3,62,72),(84,3,16,73),(85,3,63,74),(86,3,64,75),(87,3,65,76),(88,3,66,77),(89,3,67,78),(90,3,68,79),(91,3,69,80),(92,3,66,81),(93,3,70,82),(94,3,68,83),(95,3,71,84),(96,3,31,85),(97,3,72,86),(98,3,73,87),(99,3,74,88),(100,3,64,89),(101,3,75,90),(102,3,16,91),(103,3,23,92),(104,3,22,93),(105,3,76,94),(106,3,77,95),(107,3,69,96),(108,3,78,97),(109,3,79,98),(110,3,80,99),(111,3,81,100),(112,3,82,101),(113,3,71,102),(114,3,70,103),(115,3,83,104),(116,3,27,105),(117,3,84,106),(118,3,85,107),(119,3,86,108),(120,3,22,109),(121,3,87,110),(122,3,16,111),(123,3,63,112),(124,3,69,113),(125,3,88,114),(126,3,89,115),(127,3,90,116),(128,3,91,117),(129,3,92,118),(130,3,93,119),(131,3,16,120),(132,3,94,121),(133,3,17,122),(134,3,18,123),(135,3,24,124),(136,3,25,125),(137,3,21,126),(138,3,95,127),(139,3,10,128),(140,3,96,129),(141,3,97,130),(142,3,98,131),(143,3,99,132),(230,9,100,0),(231,9,101,1),(232,9,3,2),(233,9,102,3),(234,9,161,4),(235,9,162,5),(236,10,103,0),(237,10,104,1),(238,10,105,2),(239,10,106,3),(240,10,107,4),(241,10,108,5),(242,10,109,6),(243,10,110,7),(244,11,111,0),(245,11,112,1),(246,11,113,2),(247,11,114,3),(248,11,115,4),(249,11,116,5),(250,11,117,6),(251,11,118,7),(252,11,119,8),(253,11,79,9),(254,11,120,10),(255,11,121,11),(256,11,122,12),(257,11,123,13),(258,11,104,14),(259,11,105,15),(260,11,124,16),(261,11,125,17),(262,11,126,18),(263,11,127,19),(264,11,128,20),(265,11,129,21),(266,11,130,22),(267,11,131,23),(268,11,132,24),(269,11,133,25),(270,11,134,26),(271,11,135,27),(272,11,136,28),(273,11,137,29),(274,11,136,30),(275,11,138,31),(276,11,139,32),(277,11,136,33),(278,11,140,34),(279,11,141,35),(280,11,142,36),(281,11,143,37),(282,11,132,38),(283,11,144,39),(284,11,136,40),(285,11,137,41),(286,11,145,42),(287,11,109,43),(288,11,110,44),(289,11,141,45),(290,11,142,46),(291,11,146,47),(292,11,115,48),(293,11,147,49),(294,11,146,50),(295,11,148,51),(296,11,149,52),(297,11,150,53),(298,11,151,54),(299,11,152,55),(300,11,153,56),(301,11,129,57),(302,11,154,58),(303,11,65,59),(304,11,105,60),(305,11,155,61),(306,11,151,62),(307,11,156,63),(308,11,120,64),(309,11,157,65),(310,11,158,66),(311,11,159,67),(312,11,160,68),(313,11,123,69),(314,11,104,70),(315,11,105,71),(316,13,115,0),(317,13,114,1),(648,25,163,0),(649,25,164,1),(650,25,3,2),(651,25,165,3),(652,25,232,4),(653,25,233,5),(654,25,3,6),(655,25,234,7),(656,26,166,0),(657,26,167,1),(658,26,168,2),(659,26,169,3),(660,26,170,4),(661,26,171,5),(662,26,172,6),(663,26,173,7),(664,27,174,0),(665,27,175,1),(666,27,176,2),(667,27,177,3),(668,27,178,4),(669,27,179,5),(670,27,180,6),(671,27,120,7),(672,27,181,8),(673,27,182,9),(674,27,175,10),(675,27,183,11),(676,27,184,12),(677,27,185,13),(678,27,186,14),(679,27,187,15),(680,27,188,16),(681,27,189,17),(682,27,165,18),(683,27,190,19),(684,27,191,20),(685,27,192,21),(686,27,193,22),(687,27,194,23),(688,27,195,24),(689,27,196,25),(690,27,197,26),(691,27,137,27),(692,27,175,28),(693,27,193,29),(694,27,198,30),(695,27,199,31),(696,27,200,32),(697,27,201,33),(698,27,184,34),(699,27,202,35),(700,27,203,36),(701,27,175,37),(702,27,165,38),(703,27,204,39),(704,27,170,40),(705,27,205,41),(706,27,206,42),(707,27,193,43),(708,27,207,44),(709,27,208,45),(710,27,209,46),(711,27,210,47),(712,27,211,48),(713,27,212,49),(714,27,213,50),(715,27,214,51),(716,27,215,52),(717,27,170,53),(718,27,166,54),(719,27,183,55),(720,27,216,56),(721,27,217,57),(722,27,218,58),(723,27,219,59),(724,27,220,60),(725,27,221,61),(726,27,114,62),(727,27,222,63),(728,27,223,64),(729,27,207,65),(730,27,208,66),(731,27,189,67),(732,27,165,68),(733,27,224,69),(734,27,225,70),(735,27,226,71),(736,27,166,72),(737,27,183,73),(738,27,207,74),(739,27,208,75),(740,27,227,76),(741,27,228,77),(742,27,229,78),(743,27,170,79),(744,27,140,80),(745,27,212,81),(746,27,230,82),(747,27,230,83),(748,27,170,84),(749,29,231,0),(750,29,175,1),(751,29,166,2),(752,29,183,3),(753,29,114,4),(754,29,165,5),(755,29,120,6),(756,29,181,7),(757,29,210,8),(758,29,211,9),(759,29,115,10),(760,33,235,0),(761,33,236,1),(762,33,237,2),(763,33,3,3),(764,34,238,0),(765,34,239,1),(766,34,240,2),(767,34,241,3),(768,35,242,0),(769,35,243,1),(770,35,244,2),(771,35,238,3),(772,35,239,4),(773,35,240,5),(774,35,241,6),(775,35,245,7),(776,35,246,8),(777,35,238,9),(778,35,247,10),(779,35,248,11),(780,35,240,12),(781,35,241,13),(782,35,249,14),(783,35,250,15),(784,35,251,16),(785,35,252,17),(786,35,253,18),(787,35,254,19),(788,35,255,20),(929,49,256,0),(930,49,257,1),(931,49,3,2),(932,49,258,3),(933,50,259,0),(934,50,260,1),(935,50,261,2),(936,50,205,3),(937,50,262,4),(938,50,263,5),(939,50,264,6),(940,50,265,7),(941,50,266,8),(942,50,267,9),(943,51,268,0),(944,51,264,1),(945,51,269,2),(946,51,270,3),(947,51,271,4),(948,51,272,5),(949,51,261,6),(950,51,273,7),(951,51,274,8),(952,51,275,9),(953,51,276,10),(954,51,277,11),(955,51,262,12),(956,51,278,13),(957,51,264,14),(958,51,279,15),(959,51,259,16),(960,51,260,17),(961,51,261,18),(962,51,205,19),(963,51,280,20),(964,51,262,21),(965,51,281,22),(966,51,261,23),(967,51,282,24),(968,51,283,25),(969,51,273,26),(970,51,284,27),(971,51,285,28),(972,51,260,29),(973,51,286,30),(974,51,287,31),(975,51,274,32),(976,51,288,33),(977,51,156,34),(978,51,264,35),(979,51,289,36),(980,51,290,37),(981,51,92,38),(982,51,260,39),(983,51,273,40),(984,51,291,41),(985,51,205,42),(986,51,261,43),(987,51,280,44),(988,51,262,45),(989,51,292,46),(990,51,293,47),(991,51,294,48),(992,51,295,49),(993,51,296,50),(994,51,273,51),(995,51,297,52),(996,51,298,53),(997,51,284,54),(998,51,285,55),(1083,57,299,0),(1084,57,300,1),(1085,57,3,2),(1086,57,301,3),(1087,57,302,4),(1088,58,303,0),(1089,58,304,1),(1090,58,273,2),(1091,58,176,3),(1092,59,177,0),(1093,59,217,1),(1094,59,179,2),(1095,59,305,3),(1096,59,306,4),(1097,59,307,5),(1098,59,183,6),(1099,59,308,7),(1100,59,309,8),(1101,59,310,9),(1102,59,311,10),(1103,59,311,11),(1104,59,312,12),(1105,59,313,13),(1106,59,314,14),(1107,59,218,15),(1108,59,315,16),(1109,59,316,17),(1110,59,317,18),(1111,59,304,19),(1112,59,273,20),(1113,59,275,21),(1114,59,318,22),(1115,59,319,23),(1116,59,207,24),(1117,59,320,25),(1118,59,155,26),(1119,59,151,27),(1120,59,321,28),(1121,59,322,29),(1122,59,323,30),(1123,59,158,31),(1124,59,324,32),(1125,59,325,33),(1126,59,326,34),(1127,59,327,35),(1128,59,328,36),(1129,59,304,37),(1130,59,204,38),(1131,59,291,39),(1132,59,155,40),(1133,59,329,41),(1134,59,330,42),(1135,59,331,43),(1136,59,332,44),(1137,59,333,45),(1138,59,306,46),(1139,59,334,47),(1140,59,335,48),(1141,59,140,49),(1142,59,204,50),(1143,59,336,51),(1144,59,332,52),(1145,59,337,53),(1146,59,11,54),(1147,59,304,55),(1148,59,204,56),(1149,59,338,57),(1150,59,272,58),(1151,59,339,59),(1152,59,306,60),(1153,59,340,61),(1154,59,341,62),(1155,59,342,63),(1156,59,322,64),(1157,59,343,65),(1158,59,171,66),(1159,59,344,67),(1160,59,304,68),(1161,59,345,69),(1162,59,318,70),(1163,59,176,71),(1164,59,245,72),(1165,61,179,0),(1166,61,346,1),(1225,65,347,0),(1226,65,348,1),(1227,65,349,2),(1228,65,3,3),(1229,65,387,4),(1230,65,388,5),(1231,65,389,6),(1232,65,349,7),(1233,65,3,8),(1234,66,303,0),(1235,66,304,1),(1236,66,273,2),(1237,66,176,3),(1238,67,108,0),(1239,67,350,1),(1240,67,351,2),(1241,67,352,3),(1242,67,353,4),(1243,67,58,5),(1244,67,211,6),(1245,67,354,7),(1246,67,355,8),(1247,67,356,9),(1248,67,357,10),(1249,67,358,11),(1250,67,359,12),(1251,67,20,13),(1252,67,360,14),(1253,67,361,15),(1254,67,362,16),(1255,67,363,17),(1256,67,364,18),(1257,67,365,19),(1258,67,366,20),(1259,67,367,21),(1260,67,368,22),(1261,67,369,23),(1262,67,370,24),(1263,67,371,25),(1264,67,20,26),(1265,67,360,27),(1266,67,350,28),(1267,67,372,29),(1268,67,373,30),(1269,67,374,31),(1270,67,375,32),(1271,67,310,33),(1272,67,376,34),(1273,67,357,35),(1274,67,358,36),(1275,67,377,37),(1276,67,378,38),(1277,67,379,39),(1278,67,96,40),(1279,67,380,41),(1280,67,381,42),(1281,69,283,0),(1282,69,382,1),(1283,69,383,2),(1284,69,283,3),(1285,69,384,4),(1286,69,385,5),(1287,69,386,6),(1296,73,390,0),(1297,73,391,1),(1298,73,3,2),(1299,73,392,3),(1300,74,393,0),(1301,74,394,1),(1302,74,395,2),(1303,74,396,3),(1358,81,397,0),(1359,81,398,1),(1360,81,3,2),(1361,81,399,3),(1362,81,400,4),(1363,82,401,0),(1364,82,402,1),(1365,82,403,2),(1366,82,242,3),(1367,82,404,4),(1368,82,405,5),(1369,82,406,6),(1370,83,407,0),(1371,83,402,1),(1372,83,408,2),(1373,83,403,3),(1374,83,409,4),(1375,83,410,5),(1376,83,411,6),(1377,83,412,7),(1378,83,243,8),(1379,83,405,9),(1380,83,406,10),(1381,83,413,11),(1382,83,414,12),(1383,83,406,13),(1384,83,178,14),(1385,83,415,15),(1386,83,172,16),(1387,83,171,17),(1388,83,416,18),(1389,83,417,19),(1390,83,418,20),(1391,83,419,21),(1392,83,172,22),(1393,83,420,23),(1394,83,421,24),(1395,83,169,25),(1396,83,422,26),(1397,83,423,27),(1398,83,424,28),(1399,83,425,29),(1400,83,426,30),(1401,83,427,31),(1402,83,428,32),(1403,83,429,33),(1404,83,430,34),(1405,83,431,35),(1406,83,421,36),(1407,83,419,37),(1408,83,429,38),(1409,83,432,39),(1410,83,433,40),(1411,83,434,41),(1541,89,397,0),(1542,89,435,1),(1543,89,436,2),(1544,89,3,3),(1545,90,437,0),(1546,90,438,1),(1547,90,439,2),(1548,90,440,3),(1549,90,441,4),(1550,90,360,5),(1551,90,438,6),(1552,90,421,7),(1553,90,442,8),(1554,91,443,0),(1555,91,438,1),(1556,91,439,2),(1557,91,444,3),(1558,91,445,4),(1559,91,446,5),(1560,91,447,6),(1561,91,448,7),(1562,91,438,8),(1563,91,449,9),(1564,91,450,10),(1565,91,445,11),(1566,91,451,12),(1567,91,452,13),(1568,91,453,14),(1569,91,454,15),(1570,91,455,16),(1571,91,456,17),(1572,91,444,18),(1573,91,438,19),(1574,91,421,20),(1575,91,457,21),(1576,91,458,22),(1577,91,459,23),(1578,91,460,24),(1579,91,438,25),(1580,91,461,26),(1581,91,462,27),(1582,91,463,28),(1583,91,464,29),(1584,91,465,30),(1585,91,466,31),(1586,91,467,32),(1587,91,340,33),(1588,91,140,34),(1589,91,468,35),(1590,91,444,36),(1591,91,445,37),(1592,91,469,38),(1593,91,444,39),(1594,91,470,40),(1595,91,471,41),(1596,91,472,42),(1597,91,246,43),(1598,91,473,44),(1599,91,246,45),(1600,91,474,46),(1601,91,475,47),(1602,91,476,48),(1603,91,477,49),(1604,91,463,50),(1605,91,441,51),(1606,91,438,52),(1607,91,421,53),(1608,91,442,54),(1609,91,478,55),(1610,91,324,56),(1611,91,303,57),(1612,91,479,58),(1613,91,480,59),(1614,91,481,60),(1615,91,482,61),(1616,91,445,62),(1617,91,460,63),(1618,91,483,64),(1619,91,438,65),(1620,91,449,66),(1621,91,484,67),(1622,91,462,68),(1623,91,485,69),(1624,91,486,70),(1625,91,487,71),(1626,91,480,72),(1627,91,488,73),(1628,91,489,74),(1629,91,469,75),(1630,91,490,76),(1631,91,491,77),(1632,91,481,78),(1633,91,445,79),(1634,91,11,80),(1635,91,438,81),(1636,91,449,82),(1637,91,457,83),(1638,91,492,84),(1639,91,493,85),(1640,91,486,86),(1641,91,487,87),(1642,91,494,88),(1643,91,477,89),(1644,91,480,90),(1645,91,495,91),(1646,91,479,92),(1647,91,480,93),(1648,91,478,94),(1649,91,447,95),(1650,91,496,96),(1651,91,479,97),(1652,91,494,98),(1653,91,497,99),(1654,91,457,100),(1655,91,498,101),(1656,91,482,102),(1657,91,445,103),(1658,91,499,104),(1659,91,500,105),(1660,91,443,106),(1661,91,438,107),(1662,91,439,108),(1663,91,444,109),(1664,91,445,110),(1665,91,480,111),(1666,91,497,112),(1667,91,457,113),(1668,91,492,114),(1669,93,438,0),(1750,97,501,0),(1751,97,502,1),(1752,97,503,2),(1753,97,3,3),(1754,97,541,4),(1755,97,542,5),(1756,97,503,6),(1757,97,3,7),(1758,98,204,0),(1759,98,504,1),(1760,98,505,2),(1761,98,506,3),(1762,99,507,0),(1763,99,508,1),(1764,99,504,2),(1765,99,211,3),(1766,99,509,4),(1767,99,510,5),(1768,99,511,6),(1769,99,247,7),(1770,99,179,8),(1771,99,512,9),(1772,99,513,10),(1773,99,514,11),(1774,99,506,12),(1775,99,204,13),(1776,99,515,14),(1777,99,322,15),(1778,99,506,16),(1779,99,516,17),(1780,99,517,18),(1781,99,518,19),(1782,99,519,20),(1783,99,520,21),(1784,99,521,22),(1785,99,504,23),(1786,99,505,24),(1787,99,410,25),(1788,99,522,26),(1789,99,523,27),(1790,99,494,28),(1791,99,506,29),(1792,99,204,30),(1793,99,521,31),(1794,99,504,32),(1795,99,505,33),(1796,99,499,34),(1797,99,524,35),(1798,99,503,36),(1799,99,525,37),(1800,99,522,38),(1801,99,504,39),(1802,99,381,40),(1803,99,494,41),(1804,99,526,42),(1805,99,527,43),(1806,99,528,44),(1807,99,529,45),(1808,99,530,46),(1809,99,531,47),(1810,99,532,48),(1811,99,533,49),(1812,99,499,50),(1813,99,505,51),(1814,99,534,52),(1815,99,535,53),(1816,99,529,54),(1817,99,530,55),(1818,99,494,56),(1819,99,536,57),(1820,99,537,58),(1821,99,538,59),(1822,99,539,60),(1823,99,245,61),(1824,99,410,62),(1825,99,540,63),(1826,99,454,64),(1827,99,494,65),(1828,101,211,0),(1829,101,247,1),(1830,101,179,2),(1831,101,506,3),(1832,101,204,4),(1833,101,508,5),(1997,105,543,0),(1998,105,544,1),(1999,105,545,2),(2000,105,120,3),(2001,105,3,4),(2002,106,546,0),(2003,106,547,1),(2004,106,548,2),(2005,106,58,3),(2006,106,549,4),(2007,106,550,5),(2008,106,551,6),(2009,106,47,7),(2010,106,552,8),(2011,107,553,0),(2012,107,108,1),(2013,107,554,2),(2014,107,5,3),(2015,107,359,4),(2016,107,555,5),(2017,107,70,6),(2018,107,556,7),(2019,107,80,8),(2020,107,81,9),(2021,107,557,10),(2022,107,21,11),(2023,107,95,12),(2024,107,558,13),(2025,107,559,14),(2026,107,560,15),(2027,107,465,16),(2028,107,561,17),(2029,107,32,18),(2030,107,562,19),(2031,107,563,20),(2032,107,564,21),(2033,107,565,22),(2034,107,566,23),(2035,107,27,24),(2036,107,567,25),(2037,107,568,26),(2038,107,569,27),(2039,107,570,28),(2040,107,571,29),(2041,107,570,30),(2042,107,572,31),(2043,107,573,32),(2044,107,23,33),(2045,107,574,34),(2046,107,575,35),(2047,107,576,36),(2048,107,577,37),(2049,107,578,38),(2050,107,579,39),(2051,107,580,40),(2052,107,581,41),(2053,107,582,42),(2054,107,80,43),(2055,107,81,44),(2056,107,82,45),(2057,107,576,46),(2058,107,583,47),(2059,107,584,48),(2060,107,80,49),(2061,107,81,50),(2062,107,82,51),(2063,107,567,52),(2064,107,572,53),(2065,107,576,54),(2066,107,22,55),(2067,107,23,56),(2068,107,585,57),(2069,107,586,58),(2070,107,80,59),(2071,107,81,60),(2072,107,587,61),(2073,107,588,62),(2074,107,23,63),(2075,107,585,64),(2076,107,587,65),(2077,107,589,66),(2078,107,80,67),(2079,107,81,68),(2080,107,590,69),(2081,107,591,70),(2082,107,592,71),(2083,107,80,72),(2084,107,81,73),(2085,107,593,74),(2086,107,587,75),(2087,107,23,76),(2088,107,585,77),(2089,107,587,78),(2090,107,594,79),(2091,107,81,80),(2092,107,595,81),(2093,107,596,82),(2094,107,597,83),(2095,107,81,84),(2096,107,598,85),(2097,107,581,86),(2098,107,160,87),(2099,107,599,88),(2100,107,81,89),(2101,107,600,90),(2102,107,601,91),(2103,107,576,92),(2104,107,602,93),(2105,107,62,94),(2106,107,600,95),(2107,107,65,96),(2108,107,595,97),(2109,107,603,98),(2110,107,604,99),(2111,107,605,100),(2112,107,44,101),(2113,107,606,102),(2114,107,71,103),(2115,107,607,104),(2116,107,608,105),(2117,107,609,106),(2118,107,610,107),(2119,107,576,108),(2120,107,559,109),(2121,107,611,110),(2122,107,64,111),(2123,107,612,112),(2124,107,220,113),(2125,107,613,114),(2126,107,359,115),(2127,107,555,116),(2128,107,614,117),(2129,107,556,118),(2130,107,572,119),(2131,107,80,120),(2132,107,81,121),(2133,107,557,122),(2134,107,21,123),(2135,107,95,124),(2136,107,558,125),(2137,107,559,126),(2138,107,556,127),(2139,107,571,128),(2140,107,570,129),(2141,107,615,130),(2142,107,616,131),(2143,107,617,132),(2144,107,80,133),(2145,107,618,134),(2146,107,95,135),(2147,107,70,136),(2148,107,248,137),(2149,107,619,138),(2150,107,8,139),(2151,107,11,140),(2152,107,620,141),(2153,107,8,142),(2154,107,70,143),(2155,107,621,144),(2156,107,622,145),(2157,109,22,0),(2158,109,623,1),(2159,109,624,2),(2388,113,625,0),(2389,113,626,1),(2390,113,3,2),(2391,113,399,3),(2392,113,400,4),(2393,114,627,0),(2394,114,628,1),(2395,114,629,2),(2396,114,630,3),(2397,114,631,4),(2398,114,632,5),(2399,114,633,6),(2400,114,634,7),(2401,114,633,8),(2402,114,635,9),(2403,114,636,10),(2404,115,629,0),(2405,115,630,1),(2406,115,637,2),(2407,115,638,3),(2408,115,438,4),(2409,115,639,5),(2410,115,640,6),(2411,115,641,7),(2412,115,443,8),(2413,115,642,9),(2414,115,177,10),(2415,115,633,11),(2416,115,303,12),(2417,115,643,13),(2418,115,644,14),(2419,115,645,15),(2420,115,646,16),(2421,115,647,17),(2422,115,648,18),(2423,115,631,19),(2424,115,632,20),(2425,115,633,21),(2426,115,649,22),(2427,115,650,23),(2428,115,651,24),(2429,115,652,25),(2430,115,627,26),(2431,115,653,27),(2432,115,631,28),(2433,115,654,29),(2434,115,634,30),(2435,115,633,31),(2436,115,655,32),(2437,115,629,33),(2438,115,630,34),(2439,115,635,35),(2440,115,636,36),(2441,115,514,37),(2442,115,649,38),(2443,115,438,39),(2444,115,187,40),(2445,115,112,41),(2446,115,656,42),(2447,115,657,43),(2448,115,658,44),(2449,115,108,45),(2450,115,321,46),(2451,115,133,47),(2452,115,659,48),(2453,115,187,49),(2454,115,112,50),(2455,115,659,51),(2456,115,653,52),(2457,115,660,53),(2458,115,661,54),(2459,115,662,55),(2460,115,663,56),(2461,115,653,57),(2462,115,664,58),(2463,115,665,59),(2464,115,666,60),(2465,115,457,61),(2466,115,667,62),(2467,115,668,63),(2468,115,627,64),(2469,115,636,65),(2470,115,133,66),(2471,115,112,67),(2472,115,578,68),(2473,115,635,69),(2474,115,408,70),(2475,115,659,71),(2476,115,653,72),(2477,115,669,73),(2478,115,670,74),(2479,115,671,75),(2480,115,672,76),(2481,115,655,77),(2482,115,602,78),(2483,115,422,79),(2484,115,659,80),(2485,115,673,81),(2486,115,354,82),(2487,115,631,83),(2488,115,632,84),(2489,115,633,85),(2490,115,634,86),(2491,115,633,87),(2492,115,177,88),(2493,115,674,89),(2494,115,171,90),(2495,115,675,91),(2496,115,421,92),(2497,115,439,93),(2498,115,659,94),(2499,115,629,95),(2500,115,630,96),(2501,115,676,97),(2502,115,677,98),(2503,115,678,99),(2504,115,494,100),(2505,115,156,101),(2506,115,679,102),(2507,115,680,103),(2508,115,354,104),(2509,115,631,105),(2510,115,632,106),(2511,115,634,107),(2512,115,633,108),(2513,115,635,109),(2514,115,636,110),(2515,115,659,111),(2516,115,653,112),(2517,115,681,113),(2518,115,682,114),(2519,115,683,115),(2520,115,664,116),(2521,115,665,117),(2522,115,666,118),(2523,115,457,119),(2524,115,681,120),(2525,115,684,121),(2526,115,685,122),(2527,115,686,123),(2528,115,683,124),(2529,115,687,125),(2530,115,688,126),(2531,115,661,127),(2532,115,689,128),(2533,115,690,129),(2534,115,112,130),(2535,115,488,131),(2536,115,691,132),(2537,115,692,133),(2538,115,693,134),(2539,115,694,135),(2540,115,662,136),(2541,115,631,137),(2542,115,632,138),(2543,115,633,139),(2544,115,689,140),(2545,115,695,141),(2546,115,600,142),(2547,115,635,143),(2548,115,635,144),(2549,115,686,145),(2550,115,689,146),(2551,115,634,147),(2552,115,633,148),(2553,115,694,149),(2554,115,662,150),(2555,115,696,151),(2556,115,64,152),(2557,115,697,153),(2558,115,698,154),(2559,115,600,155),(2560,115,635,156),(2561,115,635,157),(2562,115,686,158),(2563,115,642,159),(2564,115,123,160),(2565,115,699,161),(2566,115,700,162),(2567,115,694,163),(2568,115,701,164),(2569,115,702,165),(2570,115,438,166),(2571,115,187,167),(2572,115,224,168),(2573,115,689,169),(2574,115,703,170),(2575,115,704,171),(2576,115,705,172),(2577,115,706,173),(2578,115,707,174),(2579,115,708,175),(2580,115,630,176),(2581,115,699,177),(2582,115,5,178),(2583,115,79,179),(2584,115,627,180),(2585,115,709,181),(2586,115,631,182),(2587,115,632,183),(2588,115,634,184),(2589,115,633,185),(2590,115,710,186),(2591,115,711,187),(2592,115,58,188),(2593,115,712,189),(2594,115,438,190),(2595,115,713,191),(2596,115,689,192),(2597,115,690,193),(2598,115,97,194),(2599,115,714,195),(2600,115,715,196),(2601,115,659,197),(2602,115,187,198),(2603,115,716,199),(2604,115,657,200),(2605,115,631,201),(2606,115,632,202),(2607,115,633,203),(2608,115,690,204),(2609,115,467,205),(2610,115,112,206),(2611,115,410,207),(2612,115,658,208),(2613,115,717,209),(2614,115,718,210),(2615,117,438,0),(2735,121,719,0),(2736,121,720,1),(2737,121,3,2),(2738,121,721,3),(2739,122,722,0),(2740,122,723,1),(2741,122,193,2),(2742,122,724,3),(2743,122,108,4),(2744,122,725,5),(2745,122,726,6),(2746,122,727,7),(2747,123,538,0),(2748,123,728,1),(2749,123,729,2),(2750,123,730,3),(2751,123,731,4),(2752,123,732,5),(2753,123,733,6),(2754,123,179,7),(2755,123,734,8),(2756,123,735,9),(2757,123,312,10),(2758,123,539,11),(2759,123,296,12),(2760,123,19,13),(2761,123,736,14),(2762,123,121,15),(2763,123,737,16),(2764,123,724,17),(2765,123,108,18),(2766,123,738,19),(2767,123,725,20),(2768,123,726,21),(2769,123,727,22),(2770,123,739,23),(2771,123,740,24),(2772,123,379,25),(2773,123,741,26),(2774,123,742,27),(2775,123,3,28),(2776,123,743,29),(2777,123,744,30),(2778,123,211,31),(2779,123,745,32),(2780,123,746,33),(2781,123,747,34),(2782,123,155,35),(2783,123,748,36),(2784,123,3,37),(2785,123,749,38),(2786,123,184,39),(2787,123,750,40),(2788,123,751,41),(2789,123,723,42),(2790,123,193,43),(2791,123,212,44),(2792,123,752,45),(2793,123,494,46),(2794,123,19,47),(2795,123,753,48),(2796,123,494,49),(2797,123,742,50),(2798,123,249,51),(2799,123,754,52),(2800,123,193,53),(2801,123,755,54),(2802,123,756,55),(2803,123,757,56),(2804,123,758,57),(2805,123,759,58),(2806,123,760,59),(2807,123,761,60),(2808,123,135,61),(2809,123,762,62),(2810,123,211,63),(2811,123,723,64),(2812,123,193,65),(2813,123,763,66),(2814,123,3,67),(2815,123,583,68),(2816,123,764,69),(2817,123,765,70),(2818,123,759,71),(2819,123,637,72),(2820,123,766,73),(2821,123,767,74),(2822,123,768,75),(2823,123,769,76),(2824,123,379,77),(2825,123,770,78),(2826,123,771,79),(2827,123,772,80),(2828,123,3,81),(2829,123,155,82),(2830,123,773,83),(2831,123,774,84),(2832,123,747,85),(2833,123,775,86),(2834,123,19,87),(2835,123,776,88),(2836,123,745,89),(2837,123,777,90),(2838,123,778,91),(2839,123,322,92),(2840,123,239,93),(2841,125,729,0),(2842,125,730,1),(2843,125,733,2),(2844,125,739,3),(2845,125,740,4),(2846,125,747,5),(2847,125,775,6),(2848,125,736,7),(2849,125,121,8),(2850,125,737,9),(2851,125,772,10),(2852,125,322,11),(2853,125,239,12),(2961,129,779,0),(2962,129,780,1),(2963,129,3,2),(2964,129,781,3),(2965,130,782,0),(2966,130,783,1),(2967,130,421,2),(2968,130,784,3),(2969,131,242,0),(2970,131,785,1),(2971,131,783,2),(2972,131,782,3),(2973,131,421,4),(2974,131,212,5),(2975,131,230,6),(2976,131,786,7),(2977,131,787,8),(2978,131,784,9),(2979,131,788,10),(2980,131,789,11),(2981,131,783,12),(2982,131,324,13),(2983,131,790,14),(2984,131,791,15),(2985,131,298,16),(2986,131,792,17),(2987,131,788,18),(2988,131,783,19),(2989,131,782,20),(2990,131,793,21),(2991,131,794,22),(2992,131,795,23),(2993,131,796,24),(2994,131,797,25),(2995,131,72,26),(2996,131,798,27),(2997,131,44,28),(2998,131,799,29),(2999,131,796,30),(3000,131,800,31),(3001,131,789,32),(3002,131,783,33),(3003,131,782,34),(3004,131,44,35),(3005,131,799,36),(3006,131,798,37),(3007,131,75,38),(3008,131,801,39),(3009,131,7,40),(3010,131,802,41),(3011,131,803,42),(3012,131,804,43),(3013,131,805,44),(3014,131,806,45),(3015,131,797,46),(3016,131,807,47),(3017,131,798,48),(3018,131,421,49),(3019,131,212,50),(3020,131,808,51),(3021,131,809,52),(3022,131,786,53),(3023,131,788,54),(3024,131,783,55),(3025,131,810,56),(3026,131,811,57),(3027,131,812,58),(3028,131,813,59),(3029,131,814,60),(3030,131,617,61),(3031,131,815,62),(3032,131,816,63),(3033,131,817,64),(3034,131,811,65),(3035,131,818,66),(3036,131,819,67),(3037,131,818,68),(3038,131,789,69),(3039,131,783,70),(3040,131,820,71),(3041,131,821,72),(3042,131,822,73),(3043,131,823,74),(3044,131,44,75),(3045,131,824,76),(3046,131,825,77),(3047,131,826,78),(3048,131,789,79),(3049,131,827,80),(3050,131,644,81),(3051,131,782,82),(3052,131,805,83),(3053,131,828,84),(3054,131,829,85),(3055,131,789,86),(3056,131,830,87),(3057,131,831,88),(3058,131,782,89),(3059,131,805,90),(3060,131,832,91),(3061,131,833,92),(3062,131,615,93),(3063,131,834,94),(3064,131,835,95),(3065,131,47,96),(3066,131,836,97),(3067,131,837,98),(3217,137,838,0),(3218,137,839,1),(3219,137,840,2),(3220,137,3,3),(3221,138,5,0),(3222,138,359,1),(3223,138,555,2),(3224,138,841,3),(3225,138,614,4),(3226,138,572,5),(3227,138,80,6),(3228,138,81,7),(3229,138,82,8),(3230,138,21,9),(3231,138,22,10),(3232,138,576,11),(3233,139,553,0),(3234,139,155,1),(3235,139,467,2),(3236,139,842,3),(3237,139,843,4),(3238,139,844,5),(3239,139,845,6),(3240,139,846,7),(3241,139,847,8),(3242,139,641,9),(3243,139,848,10),(3244,139,379,11),(3245,139,8,12),(3246,139,849,13),(3247,139,850,14),(3248,139,851,15),(3249,139,852,16),(3250,139,853,17),(3251,139,846,18),(3252,139,796,19),(3253,139,854,20),(3254,139,855,21),(3255,139,856,22),(3256,139,575,23),(3257,139,636,24),(3258,139,857,25),(3259,139,844,26),(3260,139,858,27),(3261,139,859,28),(3262,139,860,29),(3263,139,861,30),(3264,139,575,31),(3265,139,858,32),(3266,139,481,33),(3267,139,862,34),(3268,139,863,35),(3269,139,845,36),(3270,139,8,37),(3271,139,59,38),(3272,139,82,39),(3273,139,860,40),(3274,139,861,41),(3275,139,748,42),(3276,139,864,43),(3277,139,844,44),(3278,139,865,45),(3279,139,866,46),(3280,139,867,47),(3281,139,868,48),(3282,139,283,49),(3283,139,10,50),(3284,139,445,51),(3285,139,869,52),(3286,139,561,53),(3287,139,870,54),(3288,139,871,55),(3289,139,872,56),(3290,139,873,57),(3291,139,874,58),(3292,139,875,59),(3293,139,31,60),(3294,139,876,61),(3295,139,877,62),(3296,139,445,63),(3297,139,844,64),(3298,139,878,65),(3299,139,879,66),(3300,139,880,67),(3301,139,837,68),(3302,139,881,69),(3303,139,8,70),(3304,139,70,71),(3305,139,587,72),(3306,139,692,73),(3307,139,882,74),(3308,139,873,75),(3309,139,869,76),(3310,139,63,77),(3311,139,883,78),(3312,139,881,79),(3313,139,884,80),(3314,139,845,81),(3315,139,885,82),(3316,139,283,83),(3317,139,886,84),(3318,139,636,85),(3319,139,887,86),(3320,139,888,87),(3321,139,889,88),(3322,139,890,89),(3323,139,828,90),(3324,139,891,91),(3325,139,892,92),(3326,139,893,93),(3327,139,894,94),(3328,139,895,95),(3329,139,896,96),(3330,139,897,97),(3331,139,898,98),(3332,139,892,99),(3333,139,858,100),(3334,139,899,101),(3335,139,900,102),(3336,139,901,103),(3337,139,902,104),(3338,139,903,105),(3339,139,900,106),(3340,139,904,107),(3341,139,905,108),(3342,139,876,109),(3343,139,906,110),(3344,139,112,111),(3345,139,907,112),(3346,139,908,113),(3347,139,909,114),(3348,139,910,115),(3349,139,553,116),(3350,139,911,117),(3351,139,844,118),(3352,139,10,119),(3353,139,912,120),(3354,139,850,121),(3355,139,639,122),(3356,139,39,123),(3357,139,913,124),(3358,139,57,125),(3359,139,783,126),(3360,139,914,127),(3361,139,451,128),(3362,139,915,129),(3363,141,844,0),(3364,141,623,1),(3365,141,624,2),(3473,145,916,0),(3474,145,917,1),(3475,145,3,2),(3476,145,918,3),(3477,146,919,0),(3478,146,21,1),(3479,146,920,2),(3480,146,921,3),(3481,146,922,4),(3482,146,557,5),(3483,146,923,6),(3484,146,924,7),(3485,146,925,8),(3486,146,926,9),(3487,146,927,10),(3488,146,928,11),(3489,146,929,12),(3490,147,919,0),(3491,147,21,1),(3492,147,920,2),(3493,147,921,3),(3494,147,930,4),(3495,147,922,5),(3496,147,931,6),(3497,147,923,7),(3498,147,932,8),(3499,147,924,9),(3500,147,925,10),(3501,147,926,11),(3502,147,617,12),(3503,147,933,13),(3504,147,934,14),(3505,147,131,15),(3506,147,935,16),(3507,147,936,17),(3508,147,925,18),(3509,147,926,19),(3510,147,937,20),(3511,147,938,21),(3512,147,939,22),(3513,147,940,23),(3514,147,941,24),(3515,147,942,25),(3516,147,943,26),(3517,147,944,27),(3518,147,945,28),(3519,147,924,29),(3520,147,925,30),(3521,147,926,31),(3522,147,946,32),(3523,147,947,33),(3524,147,921,34),(3525,147,948,35),(3526,147,131,36),(3527,147,945,37),(3528,147,617,38),(3529,147,933,39),(3530,147,934,40),(3531,147,949,41),(3532,147,950,42),(3533,147,951,43),(3534,147,952,44),(3535,147,953,45),(3536,147,89,46),(3537,147,945,47),(3538,147,954,48),(3539,147,955,49),(3540,147,934,50),(3541,147,21,51),(3542,147,956,52),(3543,147,55,53),(3544,147,945,54),(3545,147,924,55),(3546,147,927,56),(3547,147,957,57),(3548,147,21,58),(3549,147,920,59),(3550,147,617,60),(3551,147,958,61),(3552,147,149,62),(3553,147,959,63),(3554,147,922,64),(3555,147,557,65),(3556,147,54,66),(3557,147,919,67),(3558,147,921,68),(3559,147,960,69),(3560,147,961,70),(3561,147,922,71),(3562,147,962,72),(3563,147,921,73),(3564,147,21,74),(3565,147,956,75),(3566,147,948,76),(3567,147,963,77),(3568,147,945,78),(3569,147,924,79),(3570,147,925,80),(3571,147,926,81),(3572,147,220,82),(3573,147,964,83),(3574,147,921,84),(3575,147,923,85),(3576,147,422,86),(3577,147,925,87),(3578,147,829,88),(3579,147,379,89),(3633,153,965,0),(3634,153,966,1),(3635,153,3,2),(3636,153,102,3),(3637,154,118,0),(3638,154,967,1),(3639,154,187,2),(3640,154,968,3),(3641,154,969,4),(3642,154,970,5),(3643,155,971,0),(3644,155,517,1),(3645,155,972,2),(3646,155,130,3),(3647,155,973,4),(3648,155,974,5),(3649,155,517,6),(3650,155,975,7),(3651,155,976,8),(3652,155,972,9),(3653,155,977,10),(3654,155,978,11),(3655,155,979,12),(3656,155,980,13),(3657,155,981,14),(3658,155,982,15),(3659,155,429,16),(3660,155,983,17),(3661,155,904,18),(3662,155,984,19),(3663,155,985,20),(3664,155,986,21),(3665,155,340,22),(3666,155,823,23),(3667,155,977,24),(3668,155,987,25),(3669,155,982,26),(3670,155,988,27),(3671,155,866,28),(3672,155,989,29),(3673,155,758,30),(3674,155,972,31),(3675,155,990,32),(3676,155,981,33),(3677,155,982,34),(3678,155,429,35),(3679,155,96,36),(3680,155,54,37),(3681,157,118,0),(3682,157,967,1),(3683,157,187,2),(3684,157,968,3),(3685,157,991,4),(3694,161,992,0),(3695,161,993,1),(3696,161,994,2),(3697,162,995,0),(3698,162,996,1),(3699,162,996,2),(3700,165,179,0),(3701,165,346,1);
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
INSERT INTO `submission_search_objects` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,4,NULL),(4,1,16,NULL),(5,1,17,NULL),(6,1,8,NULL),(7,1,32,NULL),(8,1,64,NULL),(9,2,1,NULL),(10,2,2,NULL),(11,2,4,NULL),(12,2,16,NULL),(13,2,17,NULL),(14,2,8,NULL),(15,2,32,NULL),(16,2,64,NULL),(25,3,1,NULL),(26,3,2,NULL),(27,3,4,NULL),(28,3,16,NULL),(29,3,17,NULL),(30,3,8,NULL),(31,3,32,NULL),(32,3,64,NULL),(33,4,1,NULL),(34,4,2,NULL),(35,4,4,NULL),(36,4,16,NULL),(37,4,17,NULL),(38,4,8,NULL),(39,4,32,NULL),(40,4,64,NULL),(49,5,1,NULL),(50,5,2,NULL),(51,5,4,NULL),(52,5,16,NULL),(53,5,17,NULL),(54,5,8,NULL),(55,5,32,NULL),(56,5,64,NULL),(57,6,1,NULL),(58,6,2,NULL),(59,6,4,NULL),(60,6,16,NULL),(61,6,17,NULL),(62,6,8,NULL),(63,6,32,NULL),(64,6,64,NULL),(65,7,1,NULL),(66,7,2,NULL),(67,7,4,NULL),(68,7,16,NULL),(69,7,17,NULL),(70,7,8,NULL),(71,7,32,NULL),(72,7,64,NULL),(73,8,1,NULL),(74,8,2,NULL),(75,8,4,NULL),(76,8,16,NULL),(77,8,17,NULL),(78,8,8,NULL),(79,8,32,NULL),(80,8,64,NULL),(81,9,1,NULL),(82,9,2,NULL),(83,9,4,NULL),(84,9,16,NULL),(85,9,17,NULL),(86,9,8,NULL),(87,9,32,NULL),(88,9,64,NULL),(89,10,1,NULL),(90,10,2,NULL),(91,10,4,NULL),(92,10,16,NULL),(93,10,17,NULL),(94,10,8,NULL),(95,10,32,NULL),(96,10,64,NULL),(97,11,1,NULL),(98,11,2,NULL),(99,11,4,NULL),(100,11,16,NULL),(101,11,17,NULL),(102,11,8,NULL),(103,11,32,NULL),(104,11,64,NULL),(105,12,1,NULL),(106,12,2,NULL),(107,12,4,NULL),(108,12,16,NULL),(109,12,17,NULL),(110,12,8,NULL),(111,12,32,NULL),(112,12,64,NULL),(113,13,1,NULL),(114,13,2,NULL),(115,13,4,NULL),(116,13,16,NULL),(117,13,17,NULL),(118,13,8,NULL),(119,13,32,NULL),(120,13,64,NULL),(121,14,1,NULL),(122,14,2,NULL),(123,14,4,NULL),(124,14,16,NULL),(125,14,17,NULL),(126,14,8,NULL),(127,14,32,NULL),(128,14,64,NULL),(129,15,1,NULL),(130,15,2,NULL),(131,15,4,NULL),(132,15,16,NULL),(133,15,17,NULL),(134,15,8,NULL),(135,15,32,NULL),(136,15,64,NULL),(137,16,1,NULL),(138,16,2,NULL),(139,16,4,NULL),(140,16,16,NULL),(141,16,17,NULL),(142,16,8,NULL),(143,16,32,NULL),(144,16,64,NULL),(145,17,1,NULL),(146,17,2,NULL),(147,17,4,NULL),(148,17,16,NULL),(149,17,17,NULL),(150,17,8,NULL),(151,17,32,NULL),(152,17,64,NULL),(153,18,1,NULL),(154,18,2,NULL),(155,18,4,NULL),(156,18,16,NULL),(157,18,17,NULL),(158,18,8,NULL),(159,18,32,NULL),(160,18,64,NULL),(161,19,1,NULL),(162,19,2,NULL),(163,19,4,NULL),(164,19,16,NULL),(165,19,17,NULL),(166,19,8,NULL),(167,19,32,NULL),(168,19,64,NULL);
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
INSERT INTO `submissions` VALUES (1,1,1,'2026-01-08 05:38:28','2026-01-08 05:38:28','2026-01-08 05:38:28',5,'en',1,'',0),(2,1,2,'2026-01-08 05:39:20','2026-01-08 05:39:14','2026-01-08 05:39:14',5,'en',3,'',0),(3,1,4,'2026-01-08 05:39:56','2026-01-08 05:39:36','2026-01-08 05:39:36',5,'en',3,'',0),(4,1,5,'2026-01-08 05:40:12','2026-01-08 05:40:12','2026-01-08 05:40:12',5,'en',4,'',0),(5,1,6,'2026-01-08 05:40:51','2026-01-08 05:40:40','2026-01-08 05:40:40',5,'en',3,'',0),(6,1,7,'2026-01-08 05:41:11','2026-01-08 05:41:07','2026-01-08 05:41:07',5,'en',3,'',0),(7,1,8,'2026-01-08 05:41:32','2026-01-08 05:41:28','2026-01-08 05:41:28',5,'en',3,'',0),(8,1,9,'2026-01-08 05:41:52','2026-01-08 05:41:48','2026-01-08 05:41:48',5,'en',3,'',0),(9,1,10,'2026-01-08 05:42:13','2026-01-08 05:42:09','2026-01-08 05:42:09',5,'en',3,'',0),(10,1,11,'2026-01-08 05:42:34','2026-01-08 05:42:30','2026-01-08 05:42:30',5,'en',3,'',0),(11,1,12,'2026-01-08 05:42:55','2026-01-08 05:42:50','2026-01-08 05:42:50',5,'en',3,'',0),(12,1,13,'2026-01-08 05:43:16','2026-01-08 05:43:11','2026-01-08 05:43:11',5,'en',3,'',0),(13,1,14,'2026-01-08 05:43:37','2026-01-08 05:43:32','2026-01-08 05:43:32',5,'en',3,'',0),(14,1,15,'2026-01-08 05:43:58','2026-01-08 05:43:53','2026-01-08 05:43:53',5,'en',3,'',0),(15,1,16,'2026-01-08 05:44:18','2026-01-08 05:44:14','2026-01-08 05:44:14',5,'en',3,'',0),(16,1,17,'2026-01-08 05:44:39','2026-01-08 05:44:35','2026-01-08 05:44:35',5,'en',3,'',0),(17,1,18,'2026-01-08 05:45:00','2026-01-08 05:44:56','2026-01-08 05:44:56',5,'en',3,'',0),(18,1,19,'2026-01-08 05:45:21','2026-01-08 05:45:17','2026-01-08 05:45:17',5,'en',3,'',0),(19,1,20,'2026-01-08 05:45:42','2026-01-08 05:45:38','2026-01-08 05:45:38',5,'en',3,'',0);
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
  `load_id` varchar(50) NOT NULL,
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
  `ip` varchar(64) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip_ua_url` (`load_id`,`context_id`,`ip`,`user_agent`,`canonical_url`),
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
  `ip` varchar(64) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  KEY `usii_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
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
  `ip` varchar(64) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  KEY `usir_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$pUKzzIqYTgoWfnHtl7Lc3u7wlioIbc40w3U6YueRixMEUSdxIkQLa','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2026-01-08 05:36:32',NULL,'2026-01-08 05:37:53',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$CwmvSnzn8SYVPAam5vSdfOUtvV.SITKsCnoqdVGoHaoMylNFlEmCi','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2026-01-08 05:37:19',NULL,'2026-01-08 05:37:45',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$6nhso2o5r.vsuy9T/bLhpOxB0/2.wJv8wZCI.A9CBPM/d0Z4t0B82','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2026-01-08 05:37:25',NULL,'2026-01-08 05:45:39',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$30R2RFuB0XiDfrhFys1g0OFJ14oa1tiR9uPTjjBDj37k.UsDX5Pry','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2026-01-08 05:37:30',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$4cW1na3EW5wAWeCLXdy5uuvVP4RrT50QmzGHOar7nHWyJka2IjNNe','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2026-01-08 05:37:35',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$i4clQct1HrOsl8420IkxrOOi42FbSzZLnaXp7ttsj8neeE4PKk8jK','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2026-01-08 05:37:40',NULL,NULL,0,NULL,NULL,0,NULL,1),(7,'ccorino','$2y$10$gJbzSlQbiijmaMuneKsmW.KX2tGD4yCHtDQ38dvtyJayLDhepSw9q','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2026-01-08 05:38:15',NULL,'2026-01-08 05:38:15',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$fYlvbpAMdoxWqrh/NIY4XOb5L4vD3I2l2y.6EX5ZaMppK0JCEWHlm','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-01-08 05:38:32',NULL,'2026-01-08 05:38:32',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$MGlq5nZ1KfAxXjTx2H4sKOi...SDuq5vuVhfXRrfhdXqLHnmXzC0q','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-01-08 05:39:23',NULL,'2026-01-08 05:39:24',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$LxyQbTinsvY/UStFATo1UeZqGkid4z9sBMeLtbPirX25E4EKhvC.O','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2026-01-08 05:39:59',NULL,'2026-01-08 05:39:59',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$t1pLG4lSExwLyH7yK6nUV.11CkwpAtZqh1Ma83gUpm5.WKVj2hpJS','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-01-08 05:40:27',NULL,'2026-01-08 05:40:27',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$K9TAok8aopNFf5kW8nLS7O61xz5WDfONZIjaGKKjG6z9LHe13Ndhu','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2026-01-08 05:40:54',NULL,'2026-01-08 05:40:54',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$B.1fk4HXowLSWWN6GtTnnum3BppwBpDvnMOWFUYw5Bq3LY5i8IZHm','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-01-08 05:41:15',NULL,'2026-01-08 05:41:15',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$LnBVai4bSerZgMMKl9N/jOBJQ2jdWuAMsI1SkTMDAWvtZVtLuxN4m','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2026-01-08 05:41:36',NULL,'2026-01-08 05:41:36',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$hD0jWYJgsupQ1D1qlxBGFON5bIi/8GVWzDWV7Pr29uFgwtfVDEDWC','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2026-01-08 05:41:56',NULL,'2026-01-08 05:41:56',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$aRtn0T6JcyuUy245ge/iWu9yUbRBGstBX6xdYvT9NZpyJdmSl3oaS','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2026-01-08 05:42:17',NULL,'2026-01-08 05:42:17',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$8/U.YLS6QZluu/2pU2t4tu7KIyqpJG5htkoHzzJbbt8IVJQJ.eI3u','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-01-08 05:42:37',NULL,'2026-01-08 05:42:38',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$T1SrhYmjYbUIVKQQVeABmu//G4GcjL9SkuWfOrFcoDsIO19Rvoedi','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2026-01-08 05:42:59',NULL,'2026-01-08 05:42:59',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$wq8DKCiV9h6M6K8/76jsr.29ttS19LlSJRRtSjKl1.y6V7SuTWYJe','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2026-01-08 05:43:20',NULL,'2026-01-08 05:43:20',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$rZLO0fJdFVl8.GQdrEZFwuPE.XGfcR3oVOVadfcwnBr8jVvONIs5u','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2026-01-08 05:43:40',NULL,'2026-01-08 05:43:41',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$HjZbCALcECZ77UPJ/k8DK.xH7wkPl.1QaHIB9gRsOwrid7UPSZEx6','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2026-01-08 05:44:01',NULL,'2026-01-08 05:44:02',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$Yf8RjuIWzgOFqDkx4TCcUOZCiPReOKIejuKrgXAGCbJqXk6eU3pE.','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2026-01-08 05:44:22',NULL,'2026-01-08 05:44:23',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$423QFN6I9XLa7od8aWXVkeoTjGpAWgFrfHnIsjBC3ZFFIRoqjEqZW','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2026-01-08 05:44:43',NULL,'2026-01-08 05:44:43',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$qSQSstaIYgDWBUZlSragL.LvR9gsi.mM4n9Lnp8etmdDwM7orb2O2','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2026-01-08 05:45:04',NULL,'2026-01-08 05:45:04',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$vgtRhLAgwbwlFIm4g1NJUOSetURDldBu2C/vgj4GTJdfo.E.Ze2Ly','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2026-01-08 05:45:25',NULL,'2026-01-08 05:45:25',NULL,NULL,NULL,0,NULL,1);
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
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
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
INSERT INTO `versions` VALUES (1,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(3,1,0,1,0,'2026-01-08 05:36:32',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(4,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(5,1,0,1,0,'2026-01-08 05:36:32',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(6,1,3,0,0,'2026-01-08 05:36:32',1,'plugins.generic','acron','AcronPlugin',1,1),(7,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(8,1,3,4,9,'2026-01-08 05:36:32',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(9,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(10,2,2,0,0,'2026-01-08 05:36:32',1,'plugins.generic','crossref','',0,0),(11,0,1,0,0,'2026-01-08 05:36:32',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(12,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.generic','usageEvent','',0,0),(13,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(14,1,1,0,0,'2026-01-08 05:36:32',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(15,1,2,0,0,'2026-01-08 05:36:32',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(16,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.importexport','native','',0,0),(17,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.oaiMetadataFormats','dc','',0,0),(18,1,0,0,0,'2026-01-08 05:36:32',1,'plugins.themes','default','DefaultThemePlugin',1,0),(19,3,4,0,10,'2026-01-08 05:36:23',1,'core','ops','',0,1);
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

-- Dump completed on 2026-01-08  5:45:43
