-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ops-ci
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0ubuntu0.18.04.1

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
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
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
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
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
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','IT'),(1,'en_US','affiliation','University of Bologna'),(1,'en_US','familyName','Corino'),(1,'en_US','givenName','Carlo'),(2,'','country','CA'),(2,'en_US','affiliation','University of Windsor'),(2,'en_US','familyName','Kwantes'),(2,'en_US','givenName','Catherine'),(3,'','country','FI'),(3,'en_US','familyName','Kekkonen'),(3,'en_US','givenName','Urho'),(3,'fr_CA','familyName',NULL),(3,'fr_CA','givenName',NULL),(5,'','country','CA'),(5,'en_US','affiliation','University of Alberta'),(5,'en_US','familyName','Montgomerie'),(5,'en_US','givenName','Craig'),(6,'','country','CA'),(6,'en_US','affiliation','University of Victoria'),(6,'en_US','familyName','Irvine'),(6,'en_US','givenName','Mark'),(7,'','country','CA'),(7,'en_US','affiliation','University of Alberta'),(7,'en_US','familyName','Montgomerie'),(7,'en_US','givenName','Craig'),(8,'','country','CA'),(8,'en_US','affiliation','University of Victoria'),(8,'en_US','familyName','Irvine'),(8,'en_US','givenName','Mark'),(9,'','country','EG'),(9,'en_US','affiliation','Alexandria University'),(9,'en_US','familyName','Diouf'),(9,'en_US','givenName','Diaga'),(10,'','country','CA'),(10,'en_US','affiliation','University of Toronto'),(10,'en_US','familyName','Phillips'),(10,'en_US','givenName','Dana'),(11,'','country','IE'),(11,'en_US','affiliation','University College Cork'),(11,'en_US','familyName','Sokoloff'),(11,'en_US','givenName','Domatilia'),(12,'','country','US'),(12,'en_US','affiliation','Indiana University'),(12,'en_US','familyName','Ostrom'),(12,'en_US','givenName','Elinor'),(13,'','country','US'),(13,'en_US','affiliation','Indiana University'),(13,'en_US','familyName','van Laerhoven'),(13,'en_US','givenName','Frank'),(14,'','country','IT'),(14,'en_US','affiliation','University of Rome'),(14,'en_US','familyName','Paglieri'),(14,'en_US','givenName','Fabio'),(15,'','country','ZA'),(15,'en_US','affiliation','University of Cape Town'),(15,'en_US','familyName','Mwandenga'),(15,'en_US','givenName','John'),(16,'','country','DK'),(16,'en_US','affiliation','Aalborg University'),(16,'en_US','familyName','Novak'),(16,'en_US','givenName','John'),(17,'','country','US'),(17,'en_US','affiliation','Stanford University'),(17,'en_US','familyName','Al-Khafaji'),(17,'en_US','givenName','Karim'),(18,'','country','US'),(18,'en_US','affiliation','Stanford University'),(18,'en_US','familyName','Morse'),(18,'en_US','givenName','Margaret'),(19,'','country','AU'),(19,'en_US','affiliation','Australian National University'),(19,'en_US','familyName','Christopher'),(19,'en_US','givenName','Leo'),(20,'','country','ZA'),(20,'en_US','affiliation','University of Cape Town'),(20,'en_US','familyName','Kumiega'),(20,'en_US','givenName','Lise'),(21,'','country','GB'),(21,'en_US','affiliation','University of Wolverhampton'),(21,'en_US','familyName','Daniel'),(21,'en_US','givenName','Patricia'),(22,'','country','KE'),(22,'en_US','affiliation','University of Nairobi'),(22,'en_US','familyName','Baiyewu'),(22,'en_US','givenName','Rana'),(23,'','country','ES'),(23,'en_US','affiliation','Barcelona University'),(23,'en_US','familyName','Rossi'),(23,'en_US','givenName','Rosanna'),(24,'','country','IR'),(24,'en_US','affiliation','University of Tehran'),(24,'en_US','familyName','Karbasizaed'),(24,'en_US','givenName','Vajiheh'),(25,'','country','CA'),(25,'en_US','affiliation','University of Windsor'),(25,'en_US','familyName','Williamson'),(25,'en_US','givenName','Valerie'),(26,'','country','US'),(26,'en_US','affiliation','CUNY'),(26,'en_US','familyName','Woods'),(26,'en_US','givenName','Zita');
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
  CONSTRAINT `authors_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
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
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
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
  `setting_value` mediumtext,
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
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
  `publication_id` bigint(20) NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
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
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (3,'en_US','submissionKeyword','employees','string'),(4,'en_US','submissionKeyword','survey','string'),(34,'en_US','submissionKeyword','Integrating Technology','string'),(35,'en_US','submissionKeyword','Computer Skills','string'),(36,'en_US','submissionKeyword','Survey','string'),(37,'en_US','submissionKeyword','Alberta','string'),(38,'en_US','submissionKeyword','National','string'),(39,'en_US','submissionKeyword','Provincial','string'),(40,'en_US','submissionKeyword','Professional Development','string'),(41,'en_US','submissionKeyword','employees','string'),(66,'en_US','submissionKeyword','Integrating Technology','string'),(67,'en_US','submissionKeyword','Computer Skills','string'),(68,'en_US','submissionKeyword','Survey','string'),(69,'en_US','submissionKeyword','Alberta','string'),(70,'en_US','submissionKeyword','National','string'),(71,'en_US','submissionKeyword','Provincial','string'),(72,'en_US','submissionKeyword','Professional Development','string'),(73,'en_US','submissionKeyword','employees','string'),(76,'en_US','submissionKeyword','education','string'),(77,'en_US','submissionKeyword','citizenship','string'),(81,'en_US','submissionKeyword','Common pool resource','string'),(82,'en_US','submissionKeyword','common property','string'),(83,'en_US','submissionKeyword','intellectual developments','string'),(85,'en_US','submissionKeyword','water','string'),(90,'en_US','submissionKeyword','Development','string'),(91,'en_US','submissionKeyword','engineering education','string'),(92,'en_US','submissionKeyword','service learning','string'),(93,'en_US','submissionKeyword','sustainability','string'),(96,'en_US','submissionKeyword','pigs','string'),(97,'en_US','submissionKeyword','food security','string'),(99,'en_US','submissionKeyword','water','string'),(110,'en_US','submissionKeyword','21st Century','string'),(111,'en_US','submissionKeyword','Diversity','string'),(112,'en_US','submissionKeyword','Multilingual','string'),(113,'en_US','submissionKeyword','Multiethnic','string'),(114,'en_US','submissionKeyword','Participatory Pedagogy','string'),(115,'en_US','submissionKeyword','Language','string'),(116,'en_US','submissionKeyword','Culture','string'),(117,'en_US','submissionKeyword','Gender','string'),(118,'en_US','submissionKeyword','Egalitarianism','string'),(119,'en_US','submissionKeyword','Social Transformation','string'),(122,'en_US','submissionKeyword','cattle','string'),(123,'en_US','submissionKeyword','food security','string'),(127,'en_US','submissionKeyword','Self-Organization','string'),(128,'en_US','submissionKeyword','Multi-Level Institutions','string'),(129,'en_US','submissionKeyword','Goverance','string'),(132,'en_US','submissionKeyword','education','string'),(133,'en_US','submissionKeyword','citizenship','string');
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
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
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
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
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
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,4,NULL,5,NULL,3,8,'2023-02-15 04:30:46'),(2,4,NULL,5,NULL,3,16,'2023-02-15 04:30:53'),(3,4,NULL,5,NULL,3,8,'2023-02-15 04:31:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-02-15 04:27:51',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(2,1048585,1,0,'2023-02-15 04:27:51',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(3,1048585,1,0,'2023-02-15 04:27:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(4,1048585,2,0,'2023-02-15 04:29:01',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(5,1048585,2,0,'2023-02-15 04:29:01',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(6,1048585,2,0,'2023-02-15 04:29:01',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(7,1048585,2,0,'2023-02-15 04:29:01',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Urho Kekkonen\" <notanemailukk@mailinator.com>','','','Submission Acknowledgement','<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(8,1048585,3,0,'2023-02-15 04:29:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(9,1048585,3,0,'2023-02-15 04:29:40',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(10,1048585,3,0,'2023-02-15 04:29:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(11,1048585,3,0,'2023-02-15 04:29:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission Acknowledgement','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(12,1048585,4,0,'2023-02-15 04:30:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(13,1048585,4,0,'2023-02-15 04:30:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(14,1048585,4,0,'2023-02-15 04:30:35',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(15,1048585,4,3,'2023-02-15 04:30:46',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(16,1048585,4,3,'2023-02-15 04:30:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>\n'),(17,1048585,4,3,'2023-02-15 04:31:00',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(18,1048585,5,0,'2023-02-15 04:31:27',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(19,1048585,5,0,'2023-02-15 04:31:27',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(20,1048585,5,0,'2023-02-15 04:31:27',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(21,1048585,6,0,'2023-02-15 04:32:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(22,1048585,6,0,'2023-02-15 04:32:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(23,1048585,6,0,'2023-02-15 04:32:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(24,1048585,7,0,'2023-02-15 04:32:46',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(25,1048585,7,0,'2023-02-15 04:32:46',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(26,1048585,7,0,'2023-02-15 04:32:46',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(27,1048585,7,0,'2023-02-15 04:32:46',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission Acknowledgement','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(28,1048585,8,0,'2023-02-15 04:33:19',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Hansen &amp; Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(29,1048585,8,0,'2023-02-15 04:33:19',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Hansen &amp; Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(30,1048585,8,0,'2023-02-15 04:33:19',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen &amp; Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/8\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(31,1048585,9,0,'2023-02-15 04:33:51',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(32,1048585,9,0,'2023-02-15 04:33:51',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(33,1048585,9,0,'2023-02-15 04:33:51',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(34,1048585,10,0,'2023-02-15 04:34:24',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(35,1048585,10,0,'2023-02-15 04:34:24',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(36,1048585,10,0,'2023-02-15 04:34:24',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(37,1048585,11,0,'2023-02-15 04:34:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(38,1048585,11,0,'2023-02-15 04:34:58',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(39,1048585,11,0,'2023-02-15 04:34:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(40,1048585,11,0,'2023-02-15 04:34:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission Acknowledgement','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(41,1048585,12,0,'2023-02-15 04:35:32',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(42,1048585,12,0,'2023-02-15 04:35:32',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(43,1048585,12,0,'2023-02-15 04:35:32',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(44,1048585,13,0,'2023-02-15 04:36:05',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(45,1048585,13,0,'2023-02-15 04:36:05',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(46,1048585,13,0,'2023-02-15 04:36:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(47,1048585,14,0,'2023-02-15 04:36:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(48,1048585,14,0,'2023-02-15 04:36:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(49,1048585,14,0,'2023-02-15 04:36:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(50,1048585,15,0,'2023-02-15 04:37:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(51,1048585,15,0,'2023-02-15 04:37:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(52,1048585,15,0,'2023-02-15 04:37:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(53,1048585,16,0,'2023-02-15 04:37:46',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(54,1048585,16,0,'2023-02-15 04:37:46',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(55,1048585,16,0,'2023-02-15 04:37:46',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(56,1048585,17,0,'2023-02-15 04:38:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(57,1048585,17,0,'2023-02-15 04:38:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(58,1048585,17,0,'2023-02-15 04:38:20',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(59,1048585,18,0,'2023-02-15 04:38:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(60,1048585,18,0,'2023-02-15 04:38:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(61,1048585,18,0,'2023-02-15 04:38:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/18\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(62,1048585,19,0,'2023-02-15 04:39:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(63,1048585,19,0,'2023-02-15 04:39:28',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(64,1048585,19,0,'2023-02-15 04:39:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/19\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>');
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
INSERT INTO `email_log_users` VALUES (1,4),(2,5),(3,7),(4,4),(5,5),(6,8),(8,4),(9,5),(10,9),(12,4),(13,5),(14,10),(15,10),(16,10),(17,10),(18,4),(19,5),(20,11),(21,4),(22,5),(23,12),(24,4),(25,5),(26,13),(28,4),(29,5),(30,14),(31,4),(32,5),(33,15),(34,4),(35,5),(36,16),(37,4),(38,5),(39,17),(41,4),(42,5),(43,18),(44,4),(45,5),(46,19),(47,4),(48,5),(49,20),(50,4),(51,5),(52,21),(53,4),(54,5),(55,22),(56,4),(57,5),(58,23),(59,4),(60,5),(61,24),(62,4),(63,5),(64,25);
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
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),('ANNOUNCEMENT','fr_CA','','',''),('DISCUSSION_NOTIFICATION_PRODUCTION','en_US','Discussion (Production)','A message regarding {$serverName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$serverName}','Prière de saisir votre message.'),('EDITOR_ASSIGN','en_US','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),('EDITOR_ASSIGN','fr_CA','','',''),('EDITOR_ASSIGN_PRODUCTION','en_US','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),('EDITOR_ASSIGN_PRODUCTION','fr_CA','','',''),('EDITOR_DECISION_ACCEPT','en_US','Submission Accepted','Your submission has passed moderation at {$serverName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$serverName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$serverName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_ACCEPT','fr_CA','','',''),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$serverName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en_US','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en_US','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),('POSTED_ACK','en_US','Posted Acknowledgement','Preprint Posted Acknowledgement','{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}'),('POSTED_ACK','fr_CA','','',''),('POSTED_NEW_VERSION_ACK','en_US','New Version Posted','New Version Posted Acknowledgement','<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$serverName}. The new version is now <a href=\"{$submissionPublishedUrl}\">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}'),('POSTED_NEW_VERSION_ACK','fr_CA','','',''),('STATISTICS_REPORT_NOTIFICATION','en_US','Statistics Report Notification','Preprint Server activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href=\"{$editorialStatsLink}\">trends</a> and <a href=\"{$publicationStatsLink}\">posted preprint stats</a>. A full copy of this month\'s trends is attached.<br />\n<br />\nSincerely,<br />\n{$serverSignature}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','',''),('SUBMISSION_ACK','en_US','Submission Acknowledgement (Pending Moderation)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),('SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),('SUBMISSION_ACK_CAN_POST','en_US','Submission Acknowledgement (No Moderation Required)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href=\"{$authorSubmissionUrl}\">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),('SUBMISSION_ACK_CAN_POST','fr_CA','','Accusé de réception de la soumission',''),('SUBMISSION_ACK_NOT_USER','en_US','Submission Confirmation (Other Authors)','Submission Acknowledgement','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$serverName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$serverSignature}'),('SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),('SUBMISSION_NEEDS_EDITOR','en_US','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),('SUBMISSION_NEEDS_EDITOR','fr_CA','','',''),('SUBMISSION_SAVED_FOR_LATER','en_US','Submission Saved for Later','Resume your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),('SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),('USER_REGISTER','en_US','User Created','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_REGISTER','fr_CA','','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','en_US','Validate Email (Server Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$serverSignature}'),('USER_VALIDATE_CONTEXT','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}'),('USER_VALIDATE_SITE','en_US','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),('USER_VALIDATE_SITE','fr_CA','','',''),('VERSION_CREATED','en_US','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),('VERSION_CREATED','fr_CA','','','');
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
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2023-02-15 04:27:37',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,7,'2023-02-15 04:27:37',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,7,'2023-02-15 04:27:48',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,7,'2023-02-15 04:27:48',1342177288,'submission.event.fileRevised',0),(5,515,1,7,'2023-02-15 04:27:50',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2023-02-15 04:27:50',1342177296,'submission.event.fileEdited',0),(7,1048585,1,7,'2023-02-15 04:27:51',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2023-02-15 04:28:02',268435458,'submission.event.general.metadataUpdated',0),(9,1048585,2,8,'2023-02-15 04:28:02',268435458,'submission.event.general.metadataUpdated',0),(10,1048585,2,8,'2023-02-15 04:28:25',268435458,'submission.event.general.metadataUpdated',0),(11,515,2,8,'2023-02-15 04:28:32',1342177281,'submission.event.fileUploaded',0),(12,1048585,2,8,'2023-02-15 04:28:32',1342177288,'submission.event.fileRevised',0),(13,515,2,8,'2023-02-15 04:28:35',1342177296,'submission.event.fileEdited',0),(14,1048585,2,8,'2023-02-15 04:28:35',1342177296,'submission.event.fileEdited',0),(15,1048585,2,8,'2023-02-15 04:29:01',268435457,'submission.event.submissionSubmitted',0),(16,1048585,2,3,'2023-02-15 04:29:15',268435462,'publication.event.published',0),(17,1048585,3,9,'2023-02-15 04:29:24',268435458,'submission.event.general.metadataUpdated',0),(18,1048585,3,9,'2023-02-15 04:29:25',268435458,'submission.event.general.metadataUpdated',0),(19,515,3,9,'2023-02-15 04:29:36',1342177281,'submission.event.fileUploaded',0),(20,1048585,3,9,'2023-02-15 04:29:36',1342177288,'submission.event.fileRevised',0),(21,515,3,9,'2023-02-15 04:29:38',1342177296,'submission.event.fileEdited',0),(22,1048585,3,9,'2023-02-15 04:29:38',1342177296,'submission.event.fileEdited',0),(23,1048585,3,9,'2023-02-15 04:29:39',268435457,'submission.event.submissionSubmitted',0),(24,1048585,3,3,'2023-02-15 04:29:47',268435462,'publication.event.published',0),(25,1048585,3,3,'2023-02-15 04:29:55',268435463,'publication.event.unpublished',0),(26,1048585,3,3,'2023-02-15 04:29:58',268435458,'submission.event.general.metadataUpdated',0),(27,1048585,3,3,'2023-02-15 04:30:01',268435462,'publication.event.published',0),(28,1048585,3,3,'2023-02-15 04:30:04',268435458,'submission.event.general.metadataUpdated',0),(29,1048585,3,3,'2023-02-15 04:30:04',268435464,'publication.event.versionCreated',0),(30,1048585,3,3,'2023-02-15 04:30:08',268435458,'submission.event.general.metadataUpdated',0),(31,1048585,3,3,'2023-02-15 04:30:11',268435462,'publication.event.versionPublished',0),(32,1048585,4,10,'2023-02-15 04:30:21',268435458,'submission.event.general.metadataUpdated',0),(33,1048585,4,10,'2023-02-15 04:30:21',268435458,'submission.event.general.metadataUpdated',0),(34,515,4,10,'2023-02-15 04:30:32',1342177281,'submission.event.fileUploaded',0),(35,1048585,4,10,'2023-02-15 04:30:32',1342177288,'submission.event.fileRevised',0),(36,515,4,10,'2023-02-15 04:30:34',1342177296,'submission.event.fileEdited',0),(37,1048585,4,10,'2023-02-15 04:30:34',1342177296,'submission.event.fileEdited',0),(38,1048585,4,10,'2023-02-15 04:30:35',268435457,'submission.event.submissionSubmitted',0),(39,1048585,4,3,'2023-02-15 04:30:46',805306371,'editor.submission.decision.decline.log',0),(40,1048585,4,3,'2023-02-15 04:30:53',805306371,'editor.submission.decision.revertDecline.log',0),(41,1048585,4,3,'2023-02-15 04:31:00',805306371,'editor.submission.decision.decline.log',0),(42,1048585,5,11,'2023-02-15 04:31:13',268435458,'submission.event.general.metadataUpdated',0),(43,1048585,5,11,'2023-02-15 04:31:13',268435458,'submission.event.general.metadataUpdated',0),(44,515,5,11,'2023-02-15 04:31:24',1342177281,'submission.event.fileUploaded',0),(45,1048585,5,11,'2023-02-15 04:31:24',1342177288,'submission.event.fileRevised',0),(46,515,5,11,'2023-02-15 04:31:26',1342177296,'submission.event.fileEdited',0),(47,1048585,5,11,'2023-02-15 04:31:26',1342177296,'submission.event.fileEdited',0),(48,1048585,5,11,'2023-02-15 04:31:27',268435457,'submission.event.submissionSubmitted',0),(49,1048585,5,3,'2023-02-15 04:31:35',268435462,'publication.event.published',0),(50,1048585,5,3,'2023-02-15 04:31:41',268435463,'publication.event.unpublished',0),(51,1048585,5,3,'2023-02-15 04:31:49',268435462,'publication.event.published',0),(52,1048585,6,12,'2023-02-15 04:31:59',268435458,'submission.event.general.metadataUpdated',0),(53,1048585,6,12,'2023-02-15 04:31:59',268435458,'submission.event.general.metadataUpdated',0),(54,515,6,12,'2023-02-15 04:32:10',1342177281,'submission.event.fileUploaded',0),(55,1048585,6,12,'2023-02-15 04:32:10',1342177288,'submission.event.fileRevised',0),(56,515,6,12,'2023-02-15 04:32:12',1342177296,'submission.event.fileEdited',0),(57,1048585,6,12,'2023-02-15 04:32:12',1342177296,'submission.event.fileEdited',0),(58,1048585,6,12,'2023-02-15 04:32:13',268435457,'submission.event.submissionSubmitted',0),(59,1048585,6,3,'2023-02-15 04:32:21',268435462,'publication.event.published',0),(60,1048585,7,13,'2023-02-15 04:32:31',268435458,'submission.event.general.metadataUpdated',0),(61,1048585,7,13,'2023-02-15 04:32:32',268435458,'submission.event.general.metadataUpdated',0),(62,515,7,13,'2023-02-15 04:32:42',1342177281,'submission.event.fileUploaded',0),(63,1048585,7,13,'2023-02-15 04:32:42',1342177288,'submission.event.fileRevised',0),(64,515,7,13,'2023-02-15 04:32:44',1342177296,'submission.event.fileEdited',0),(65,1048585,7,13,'2023-02-15 04:32:44',1342177296,'submission.event.fileEdited',0),(66,1048585,7,13,'2023-02-15 04:32:46',268435457,'submission.event.submissionSubmitted',0),(67,1048585,7,3,'2023-02-15 04:32:54',268435462,'publication.event.published',0),(68,1048585,8,14,'2023-02-15 04:33:05',268435458,'submission.event.general.metadataUpdated',0),(69,1048585,8,14,'2023-02-15 04:33:05',268435458,'submission.event.general.metadataUpdated',0),(70,515,8,14,'2023-02-15 04:33:16',1342177281,'submission.event.fileUploaded',0),(71,1048585,8,14,'2023-02-15 04:33:16',1342177288,'submission.event.fileRevised',0),(72,515,8,14,'2023-02-15 04:33:18',1342177296,'submission.event.fileEdited',0),(73,1048585,8,14,'2023-02-15 04:33:18',1342177296,'submission.event.fileEdited',0),(74,1048585,8,14,'2023-02-15 04:33:19',268435457,'submission.event.submissionSubmitted',0),(75,1048585,8,3,'2023-02-15 04:33:27',268435462,'publication.event.published',0),(76,1048585,9,15,'2023-02-15 04:33:37',268435458,'submission.event.general.metadataUpdated',0),(77,1048585,9,15,'2023-02-15 04:33:37',268435458,'submission.event.general.metadataUpdated',0),(78,515,9,15,'2023-02-15 04:33:48',1342177281,'submission.event.fileUploaded',0),(79,1048585,9,15,'2023-02-15 04:33:48',1342177288,'submission.event.fileRevised',0),(80,515,9,15,'2023-02-15 04:33:50',1342177296,'submission.event.fileEdited',0),(81,1048585,9,15,'2023-02-15 04:33:50',1342177296,'submission.event.fileEdited',0),(82,1048585,9,15,'2023-02-15 04:33:51',268435457,'submission.event.submissionSubmitted',0),(83,1048585,9,3,'2023-02-15 04:33:59',268435462,'publication.event.published',0),(84,1048585,10,16,'2023-02-15 04:34:10',268435458,'submission.event.general.metadataUpdated',0),(85,1048585,10,16,'2023-02-15 04:34:10',268435458,'submission.event.general.metadataUpdated',0),(86,515,10,16,'2023-02-15 04:34:21',1342177281,'submission.event.fileUploaded',0),(87,1048585,10,16,'2023-02-15 04:34:21',1342177288,'submission.event.fileRevised',0),(88,515,10,16,'2023-02-15 04:34:23',1342177296,'submission.event.fileEdited',0),(89,1048585,10,16,'2023-02-15 04:34:23',1342177296,'submission.event.fileEdited',0),(90,1048585,10,16,'2023-02-15 04:34:24',268435457,'submission.event.submissionSubmitted',0),(91,1048585,10,3,'2023-02-15 04:34:32',268435462,'publication.event.published',0),(92,1048585,11,17,'2023-02-15 04:34:43',268435458,'submission.event.general.metadataUpdated',0),(93,1048585,11,17,'2023-02-15 04:34:44',268435458,'submission.event.general.metadataUpdated',0),(94,515,11,17,'2023-02-15 04:34:54',1342177281,'submission.event.fileUploaded',0),(95,1048585,11,17,'2023-02-15 04:34:54',1342177288,'submission.event.fileRevised',0),(96,515,11,17,'2023-02-15 04:34:57',1342177296,'submission.event.fileEdited',0),(97,1048585,11,17,'2023-02-15 04:34:57',1342177296,'submission.event.fileEdited',0),(98,1048585,11,17,'2023-02-15 04:34:58',268435457,'submission.event.submissionSubmitted',0),(99,1048585,11,3,'2023-02-15 04:35:06',268435462,'publication.event.published',0),(100,1048585,12,18,'2023-02-15 04:35:17',268435458,'submission.event.general.metadataUpdated',0),(101,1048585,12,18,'2023-02-15 04:35:18',268435458,'submission.event.general.metadataUpdated',0),(102,515,12,18,'2023-02-15 04:35:28',1342177281,'submission.event.fileUploaded',0),(103,1048585,12,18,'2023-02-15 04:35:28',1342177288,'submission.event.fileRevised',0),(104,515,12,18,'2023-02-15 04:35:31',1342177296,'submission.event.fileEdited',0),(105,1048585,12,18,'2023-02-15 04:35:31',1342177296,'submission.event.fileEdited',0),(106,1048585,12,18,'2023-02-15 04:35:31',268435457,'submission.event.submissionSubmitted',0),(107,1048585,12,3,'2023-02-15 04:35:40',268435462,'publication.event.published',0),(108,1048585,13,19,'2023-02-15 04:35:51',268435458,'submission.event.general.metadataUpdated',0),(109,1048585,13,19,'2023-02-15 04:35:51',268435458,'submission.event.general.metadataUpdated',0),(110,515,13,19,'2023-02-15 04:36:02',1342177281,'submission.event.fileUploaded',0),(111,1048585,13,19,'2023-02-15 04:36:02',1342177288,'submission.event.fileRevised',0),(112,515,13,19,'2023-02-15 04:36:04',1342177296,'submission.event.fileEdited',0),(113,1048585,13,19,'2023-02-15 04:36:04',1342177296,'submission.event.fileEdited',0),(114,1048585,13,19,'2023-02-15 04:36:05',268435457,'submission.event.submissionSubmitted',0),(115,1048585,13,3,'2023-02-15 04:36:13',268435462,'publication.event.published',0),(116,1048585,14,20,'2023-02-15 04:36:25',268435458,'submission.event.general.metadataUpdated',0),(117,1048585,14,20,'2023-02-15 04:36:25',268435458,'submission.event.general.metadataUpdated',0),(118,515,14,20,'2023-02-15 04:36:36',1342177281,'submission.event.fileUploaded',0),(119,1048585,14,20,'2023-02-15 04:36:36',1342177288,'submission.event.fileRevised',0),(120,515,14,20,'2023-02-15 04:36:38',1342177296,'submission.event.fileEdited',0),(121,1048585,14,20,'2023-02-15 04:36:38',1342177296,'submission.event.fileEdited',0),(122,1048585,14,20,'2023-02-15 04:36:39',268435457,'submission.event.submissionSubmitted',0),(123,1048585,14,3,'2023-02-15 04:36:48',268435462,'publication.event.published',0),(124,1048585,15,21,'2023-02-15 04:36:58',268435458,'submission.event.general.metadataUpdated',0),(125,1048585,15,21,'2023-02-15 04:36:59',268435458,'submission.event.general.metadataUpdated',0),(126,515,15,21,'2023-02-15 04:37:09',1342177281,'submission.event.fileUploaded',0),(127,1048585,15,21,'2023-02-15 04:37:09',1342177288,'submission.event.fileRevised',0),(128,515,15,21,'2023-02-15 04:37:12',1342177296,'submission.event.fileEdited',0),(129,1048585,15,21,'2023-02-15 04:37:12',1342177296,'submission.event.fileEdited',0),(130,1048585,15,21,'2023-02-15 04:37:12',268435457,'submission.event.submissionSubmitted',0),(131,1048585,15,3,'2023-02-15 04:37:21',268435462,'publication.event.published',0),(132,1048585,16,22,'2023-02-15 04:37:32',268435458,'submission.event.general.metadataUpdated',0),(133,1048585,16,22,'2023-02-15 04:37:32',268435458,'submission.event.general.metadataUpdated',0),(134,515,16,22,'2023-02-15 04:37:43',1342177281,'submission.event.fileUploaded',0),(135,1048585,16,22,'2023-02-15 04:37:43',1342177288,'submission.event.fileRevised',0),(136,515,16,22,'2023-02-15 04:37:45',1342177296,'submission.event.fileEdited',0),(137,1048585,16,22,'2023-02-15 04:37:45',1342177296,'submission.event.fileEdited',0),(138,1048585,16,22,'2023-02-15 04:37:46',268435457,'submission.event.submissionSubmitted',0),(139,1048585,16,3,'2023-02-15 04:37:55',268435462,'publication.event.published',0),(140,1048585,17,23,'2023-02-15 04:38:06',268435458,'submission.event.general.metadataUpdated',0),(141,1048585,17,23,'2023-02-15 04:38:06',268435458,'submission.event.general.metadataUpdated',0),(142,515,17,23,'2023-02-15 04:38:17',1342177281,'submission.event.fileUploaded',0),(143,1048585,17,23,'2023-02-15 04:38:17',1342177288,'submission.event.fileRevised',0),(144,515,17,23,'2023-02-15 04:38:19',1342177296,'submission.event.fileEdited',0),(145,1048585,17,23,'2023-02-15 04:38:19',1342177296,'submission.event.fileEdited',0),(146,1048585,17,23,'2023-02-15 04:38:20',268435457,'submission.event.submissionSubmitted',0),(147,1048585,17,3,'2023-02-15 04:38:29',268435462,'publication.event.published',0),(148,1048585,18,24,'2023-02-15 04:38:40',268435458,'submission.event.general.metadataUpdated',0),(149,1048585,18,24,'2023-02-15 04:38:40',268435458,'submission.event.general.metadataUpdated',0),(150,515,18,24,'2023-02-15 04:38:51',1342177281,'submission.event.fileUploaded',0),(151,1048585,18,24,'2023-02-15 04:38:51',1342177288,'submission.event.fileRevised',0),(152,515,18,24,'2023-02-15 04:38:53',1342177296,'submission.event.fileEdited',0),(153,1048585,18,24,'2023-02-15 04:38:53',1342177296,'submission.event.fileEdited',0),(154,1048585,18,24,'2023-02-15 04:38:54',268435457,'submission.event.submissionSubmitted',0),(155,1048585,18,3,'2023-02-15 04:39:03',268435462,'publication.event.published',0),(156,1048585,19,25,'2023-02-15 04:39:14',268435458,'submission.event.general.metadataUpdated',0),(157,1048585,19,25,'2023-02-15 04:39:14',268435458,'submission.event.general.metadataUpdated',0),(158,515,19,25,'2023-02-15 04:39:25',1342177281,'submission.event.fileUploaded',0),(159,1048585,19,25,'2023-02-15 04:39:25',1342177288,'submission.event.fileRevised',0),(160,515,19,25,'2023-02-15 04:39:27',1342177296,'submission.event.fileEdited',0),(161,1048585,19,25,'2023-02-15 04:39:27',1342177296,'submission.event.fileEdited',0),(162,1048585,19,25,'2023-02-15 04:39:28',268435457,'submission.event.submissionSubmitted',0),(163,1048585,19,3,'2023-02-15 04:39:37',268435462,'publication.event.published',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','10','int'),(3,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','ccorino','string'),(4,'fileId','1','int'),(4,'fileStage','10','int'),(4,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','ccorino','string'),(5,'fileId','1','int'),(5,'fileStage','10','int'),(5,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','ccorino','string'),(6,'fileId','1','int'),(6,'fileStage','10','int'),(6,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(6,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','ccorino','string'),(11,'fileId','2','int'),(11,'fileStage','10','int'),(11,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','2','int'),(11,'username','ckwantes','string'),(12,'fileId','2','int'),(12,'fileStage','10','int'),(12,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'submissionFileId','2','int'),(12,'submissionId','2','int'),(12,'username','ckwantes','string'),(13,'fileId','2','int'),(13,'fileStage','10','int'),(13,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(13,'sourceSubmissionFileId',NULL,'string'),(13,'submissionFileId','2','int'),(13,'submissionId','2','int'),(13,'username','ckwantes','string'),(14,'fileId','2','int'),(14,'fileStage','10','int'),(14,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(14,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(14,'sourceSubmissionFileId',NULL,'string'),(14,'submissionFileId','2','int'),(14,'submissionId','2','int'),(14,'username','ckwantes','string'),(19,'fileId','3','int'),(19,'fileStage','10','int'),(19,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','3','int'),(19,'username','cmontgomerie','string'),(20,'fileId','3','int'),(20,'fileStage','10','int'),(20,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(20,'submissionFileId','3','int'),(20,'submissionId','3','int'),(20,'username','cmontgomerie','string'),(21,'fileId','3','int'),(21,'fileStage','10','int'),(21,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','3','int'),(21,'submissionId','3','int'),(21,'username','cmontgomerie','string'),(22,'fileId','3','int'),(22,'fileStage','10','int'),(22,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','3','int'),(22,'submissionId','3','int'),(22,'username','cmontgomerie','string'),(34,'fileId','4','int'),(34,'fileStage','10','int'),(34,'originalFileName','Genetic transformation of forest trees.pdf','string'),(34,'sourceSubmissionFileId',NULL,'string'),(34,'submissionFileId','4','int'),(34,'submissionId','4','int'),(34,'username','ddiouf','string'),(35,'fileId','4','int'),(35,'fileStage','10','int'),(35,'name','Genetic transformation of forest trees.pdf','string'),(35,'submissionFileId','4','int'),(35,'submissionId','4','int'),(35,'username','ddiouf','string'),(36,'fileId','4','int'),(36,'fileStage','10','int'),(36,'originalFileName','Genetic transformation of forest trees.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','4','int'),(36,'submissionId','4','int'),(36,'username','ddiouf','string'),(37,'fileId','4','int'),(37,'fileStage','10','int'),(37,'name','Genetic transformation of forest trees.pdf','string'),(37,'originalFileName','Genetic transformation of forest trees.pdf','string'),(37,'sourceSubmissionFileId',NULL,'string'),(37,'submissionFileId','4','int'),(37,'submissionId','4','int'),(37,'username','ddiouf','string'),(39,'decision','8','int'),(39,'editorId','3','int'),(39,'editorName','Daniel Barnes','string'),(39,'submissionId','4','int'),(40,'decision','16','int'),(40,'editorId','3','int'),(40,'editorName','Daniel Barnes','string'),(40,'submissionId','4','int'),(41,'decision','8','int'),(41,'editorId','3','int'),(41,'editorName','Daniel Barnes','string'),(41,'submissionId','4','int'),(44,'fileId','5','int'),(44,'fileStage','10','int'),(44,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','5','int'),(44,'submissionId','5','int'),(44,'username','dphillips','string'),(45,'fileId','5','int'),(45,'fileStage','10','int'),(45,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(45,'submissionFileId','5','int'),(45,'submissionId','5','int'),(45,'username','dphillips','string'),(46,'fileId','5','int'),(46,'fileStage','10','int'),(46,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','5','int'),(46,'submissionId','5','int'),(46,'username','dphillips','string'),(47,'fileId','5','int'),(47,'fileStage','10','int'),(47,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(47,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','5','int'),(47,'submissionId','5','int'),(47,'username','dphillips','string'),(54,'fileId','6','int'),(54,'fileStage','10','int'),(54,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(54,'sourceSubmissionFileId',NULL,'string'),(54,'submissionFileId','6','int'),(54,'submissionId','6','int'),(54,'username','dsokoloff','string'),(55,'fileId','6','int'),(55,'fileStage','10','int'),(55,'name','Developing efficacy beliefs in the classroom.pdf','string'),(55,'submissionFileId','6','int'),(55,'submissionId','6','int'),(55,'username','dsokoloff','string'),(56,'fileId','6','int'),(56,'fileStage','10','int'),(56,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','6','int'),(56,'submissionId','6','int'),(56,'username','dsokoloff','string'),(57,'fileId','6','int'),(57,'fileStage','10','int'),(57,'name','Developing efficacy beliefs in the classroom.pdf','string'),(57,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(57,'sourceSubmissionFileId',NULL,'string'),(57,'submissionFileId','6','int'),(57,'submissionId','6','int'),(57,'username','dsokoloff','string'),(62,'fileId','7','int'),(62,'fileStage','10','int'),(62,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','7','int'),(62,'submissionId','7','int'),(62,'username','eostrom','string'),(63,'fileId','7','int'),(63,'fileStage','10','int'),(63,'name','Developing efficacy beliefs in the classroom.pdf','string'),(63,'submissionFileId','7','int'),(63,'submissionId','7','int'),(63,'username','eostrom','string'),(64,'fileId','7','int'),(64,'fileStage','10','int'),(64,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(64,'sourceSubmissionFileId',NULL,'string'),(64,'submissionFileId','7','int'),(64,'submissionId','7','int'),(64,'username','eostrom','string'),(65,'fileId','7','int'),(65,'fileStage','10','int'),(65,'name','Developing efficacy beliefs in the classroom.pdf','string'),(65,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(65,'sourceSubmissionFileId',NULL,'string'),(65,'submissionFileId','7','int'),(65,'submissionId','7','int'),(65,'username','eostrom','string'),(70,'fileId','8','int'),(70,'fileStage','10','int'),(70,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','8','int'),(70,'submissionId','8','int'),(70,'username','fpaglieri','string'),(71,'fileId','8','int'),(71,'fileStage','10','int'),(71,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(71,'submissionFileId','8','int'),(71,'submissionId','8','int'),(71,'username','fpaglieri','string'),(72,'fileId','8','int'),(72,'fileStage','10','int'),(72,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(72,'sourceSubmissionFileId',NULL,'string'),(72,'submissionFileId','8','int'),(72,'submissionId','8','int'),(72,'username','fpaglieri','string'),(73,'fileId','8','int'),(73,'fileStage','10','int'),(73,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(73,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','8','int'),(73,'submissionId','8','int'),(73,'username','fpaglieri','string'),(78,'fileId','9','int'),(78,'fileStage','10','int'),(78,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(78,'sourceSubmissionFileId',NULL,'string'),(78,'submissionFileId','9','int'),(78,'submissionId','9','int'),(78,'username','jmwandenga','string'),(79,'fileId','9','int'),(79,'fileStage','10','int'),(79,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(79,'submissionFileId','9','int'),(79,'submissionId','9','int'),(79,'username','jmwandenga','string'),(80,'fileId','9','int'),(80,'fileStage','10','int'),(80,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(80,'sourceSubmissionFileId',NULL,'string'),(80,'submissionFileId','9','int'),(80,'submissionId','9','int'),(80,'username','jmwandenga','string'),(81,'fileId','9','int'),(81,'fileStage','10','int'),(81,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(81,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(81,'sourceSubmissionFileId',NULL,'string'),(81,'submissionFileId','9','int'),(81,'submissionId','9','int'),(81,'username','jmwandenga','string'),(86,'fileId','10','int'),(86,'fileStage','10','int'),(86,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(86,'sourceSubmissionFileId',NULL,'string'),(86,'submissionFileId','10','int'),(86,'submissionId','10','int'),(86,'username','jnovak','string'),(87,'fileId','10','int'),(87,'fileStage','10','int'),(87,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(87,'submissionFileId','10','int'),(87,'submissionId','10','int'),(87,'username','jnovak','string'),(88,'fileId','10','int'),(88,'fileStage','10','int'),(88,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(88,'sourceSubmissionFileId',NULL,'string'),(88,'submissionFileId','10','int'),(88,'submissionId','10','int'),(88,'username','jnovak','string'),(89,'fileId','10','int'),(89,'fileStage','10','int'),(89,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(89,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(89,'sourceSubmissionFileId',NULL,'string'),(89,'submissionFileId','10','int'),(89,'submissionId','10','int'),(89,'username','jnovak','string'),(94,'fileId','11','int'),(94,'fileStage','10','int'),(94,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(94,'sourceSubmissionFileId',NULL,'string'),(94,'submissionFileId','11','int'),(94,'submissionId','11','int'),(94,'username','kalkhafaji','string'),(95,'fileId','11','int'),(95,'fileStage','10','int'),(95,'name','Learning Sustainable Design through Service.pdf','string'),(95,'submissionFileId','11','int'),(95,'submissionId','11','int'),(95,'username','kalkhafaji','string'),(96,'fileId','11','int'),(96,'fileStage','10','int'),(96,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(96,'sourceSubmissionFileId',NULL,'string'),(96,'submissionFileId','11','int'),(96,'submissionId','11','int'),(96,'username','kalkhafaji','string'),(97,'fileId','11','int'),(97,'fileStage','10','int'),(97,'name','Learning Sustainable Design through Service.pdf','string'),(97,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','11','int'),(97,'submissionId','11','int'),(97,'username','kalkhafaji','string'),(102,'fileId','12','int'),(102,'fileStage','10','int'),(102,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(102,'sourceSubmissionFileId',NULL,'string'),(102,'submissionFileId','12','int'),(102,'submissionId','12','int'),(102,'username','lchristopher','string'),(103,'fileId','12','int'),(103,'fileStage','10','int'),(103,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(103,'submissionFileId','12','int'),(103,'submissionId','12','int'),(103,'username','lchristopher','string'),(104,'fileId','12','int'),(104,'fileStage','10','int'),(104,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(104,'sourceSubmissionFileId',NULL,'string'),(104,'submissionFileId','12','int'),(104,'submissionId','12','int'),(104,'username','lchristopher','string'),(105,'fileId','12','int'),(105,'fileStage','10','int'),(105,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(105,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(105,'sourceSubmissionFileId',NULL,'string'),(105,'submissionFileId','12','int'),(105,'submissionId','12','int'),(105,'username','lchristopher','string'),(110,'fileId','13','int'),(110,'fileStage','10','int'),(110,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(110,'sourceSubmissionFileId',NULL,'string'),(110,'submissionFileId','13','int'),(110,'submissionId','13','int'),(110,'username','lkumiega','string'),(111,'fileId','13','int'),(111,'fileStage','10','int'),(111,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(111,'submissionFileId','13','int'),(111,'submissionId','13','int'),(111,'username','lkumiega','string'),(112,'fileId','13','int'),(112,'fileStage','10','int'),(112,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(112,'sourceSubmissionFileId',NULL,'string'),(112,'submissionFileId','13','int'),(112,'submissionId','13','int'),(112,'username','lkumiega','string'),(113,'fileId','13','int'),(113,'fileStage','10','int'),(113,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(113,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(113,'sourceSubmissionFileId',NULL,'string'),(113,'submissionFileId','13','int'),(113,'submissionId','13','int'),(113,'username','lkumiega','string'),(118,'fileId','14','int'),(118,'fileStage','10','int'),(118,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(118,'sourceSubmissionFileId',NULL,'string'),(118,'submissionFileId','14','int'),(118,'submissionId','14','int'),(118,'username','pdaniel','string'),(119,'fileId','14','int'),(119,'fileStage','10','int'),(119,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(119,'submissionFileId','14','int'),(119,'submissionId','14','int'),(119,'username','pdaniel','string'),(120,'fileId','14','int'),(120,'fileStage','10','int'),(120,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(120,'sourceSubmissionFileId',NULL,'string'),(120,'submissionFileId','14','int'),(120,'submissionId','14','int'),(120,'username','pdaniel','string'),(121,'fileId','14','int'),(121,'fileStage','10','int'),(121,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(121,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(121,'sourceSubmissionFileId',NULL,'string'),(121,'submissionFileId','14','int'),(121,'submissionId','14','int'),(121,'username','pdaniel','string'),(126,'fileId','15','int'),(126,'fileStage','10','int'),(126,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','15','int'),(126,'submissionId','15','int'),(126,'username','rbaiyewu','string'),(127,'fileId','15','int'),(127,'fileStage','10','int'),(127,'name','Yam diseases and its management in Nigeria.pdf','string'),(127,'submissionFileId','15','int'),(127,'submissionId','15','int'),(127,'username','rbaiyewu','string'),(128,'fileId','15','int'),(128,'fileStage','10','int'),(128,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(128,'sourceSubmissionFileId',NULL,'string'),(128,'submissionFileId','15','int'),(128,'submissionId','15','int'),(128,'username','rbaiyewu','string'),(129,'fileId','15','int'),(129,'fileStage','10','int'),(129,'name','Yam diseases and its management in Nigeria.pdf','string'),(129,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','15','int'),(129,'submissionId','15','int'),(129,'username','rbaiyewu','string'),(134,'fileId','16','int'),(134,'fileStage','10','int'),(134,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','16','int'),(134,'submissionId','16','int'),(134,'username','rrossi','string'),(135,'fileId','16','int'),(135,'fileStage','10','int'),(135,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(135,'submissionFileId','16','int'),(135,'submissionId','16','int'),(135,'username','rrossi','string'),(136,'fileId','16','int'),(136,'fileStage','10','int'),(136,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(136,'sourceSubmissionFileId',NULL,'string'),(136,'submissionFileId','16','int'),(136,'submissionId','16','int'),(136,'username','rrossi','string'),(137,'fileId','16','int'),(137,'fileStage','10','int'),(137,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(137,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','16','int'),(137,'submissionId','16','int'),(137,'username','rrossi','string'),(142,'fileId','17','int'),(142,'fileStage','10','int'),(142,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','17','int'),(142,'submissionId','17','int'),(142,'username','vkarbasizaed','string'),(143,'fileId','17','int'),(143,'fileStage','10','int'),(143,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(143,'submissionFileId','17','int'),(143,'submissionId','17','int'),(143,'username','vkarbasizaed','string'),(144,'fileId','17','int'),(144,'fileStage','10','int'),(144,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(144,'sourceSubmissionFileId',NULL,'string'),(144,'submissionFileId','17','int'),(144,'submissionId','17','int'),(144,'username','vkarbasizaed','string'),(145,'fileId','17','int'),(145,'fileStage','10','int'),(145,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(145,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(145,'sourceSubmissionFileId',NULL,'string'),(145,'submissionFileId','17','int'),(145,'submissionId','17','int'),(145,'username','vkarbasizaed','string'),(150,'fileId','18','int'),(150,'fileStage','10','int'),(150,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(150,'sourceSubmissionFileId',NULL,'string'),(150,'submissionFileId','18','int'),(150,'submissionId','18','int'),(150,'username','vwilliamson','string'),(151,'fileId','18','int'),(151,'fileStage','10','int'),(151,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(151,'submissionFileId','18','int'),(151,'submissionId','18','int'),(151,'username','vwilliamson','string'),(152,'fileId','18','int'),(152,'fileStage','10','int'),(152,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(152,'sourceSubmissionFileId',NULL,'string'),(152,'submissionFileId','18','int'),(152,'submissionId','18','int'),(152,'username','vwilliamson','string'),(153,'fileId','18','int'),(153,'fileStage','10','int'),(153,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(153,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(153,'sourceSubmissionFileId',NULL,'string'),(153,'submissionFileId','18','int'),(153,'submissionId','18','int'),(153,'username','vwilliamson','string'),(158,'fileId','19','int'),(158,'fileStage','10','int'),(158,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','19','int'),(158,'submissionId','19','int'),(158,'username','zwoods','string'),(159,'fileId','19','int'),(159,'fileStage','10','int'),(159,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(159,'submissionFileId','19','int'),(159,'submissionId','19','int'),(159,'username','zwoods','string'),(160,'fileId','19','int'),(160,'fileStage','10','int'),(160,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(160,'sourceSubmissionFileId',NULL,'string'),(160,'submissionFileId','19','int'),(160,'submissionId','19','int'),(160,'username','zwoods','string'),(161,'fileId','19','int'),(161,'fileStage','10','int'),(161,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(161,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(161,'sourceSubmissionFileId',NULL,'string'),(161,'submissionFileId','19','int'),(161,'submissionId','19','int'),(161,'username','zwoods','string');
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
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/63ec5f4474253.pdf','application/pdf'),(2,'contexts/1/submissions/2/63ec5f70bd41a.pdf','application/pdf'),(3,'contexts/1/submissions/3/63ec5fb0270dc.pdf','application/pdf'),(4,'contexts/1/submissions/4/63ec5fe7f2135.pdf','application/pdf'),(5,'contexts/1/submissions/5/63ec601c54aac.pdf','application/pdf'),(6,'contexts/1/submissions/6/63ec604a2b278.pdf','application/pdf'),(7,'contexts/1/submissions/7/63ec606a9025c.pdf','application/pdf'),(8,'contexts/1/submissions/8/63ec608c1c132.pdf','application/pdf'),(9,'contexts/1/submissions/9/63ec60ac5ee97.pdf','application/pdf'),(10,'contexts/1/submissions/10/63ec60cd14b06.pdf','application/pdf'),(11,'contexts/1/submissions/11/63ec60ee93724.pdf','application/pdf'),(12,'contexts/1/submissions/12/63ec6110a9668.pdf','application/pdf'),(13,'contexts/1/submissions/13/63ec61322daff.pdf','application/pdf'),(14,'contexts/1/submissions/14/63ec6154216d0.pdf','application/pdf'),(15,'contexts/1/submissions/15/63ec6175a9b2b.pdf','application/pdf'),(16,'contexts/1/submissions/16/63ec6197751af.pdf','application/pdf'),(17,'contexts/1/submissions/17/63ec61b94eda3.pdf','application/pdf'),(18,'contexts/1/submissions/18/63ec61db58494.pdf','application/pdf'),(19,'contexts/1/submissions/19/63ec61fd37bba.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PREPRINT)'),(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]');
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
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Crossref XML preprint export','APP\\plugins\\generic\\crossref\\filter\\PreprintCrossrefXmlFilter',0,0,0),(2,2,0,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPreprintAdapter',0,0,0),(3,3,0,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\PreprintNativeXmlFilter',0,0,0),(4,4,0,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFilter',0,0,0),(5,5,0,'Native XML author export',NULL,0,0,0),(6,6,0,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,0,0),(7,8,0,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFileFilter',0,0,0),(8,7,0,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,0,0),(9,9,0,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PreprintGalleyNativeXmlFilter',0,0,0),(10,10,0,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintGalleyFilter',0,0,0),(11,11,0,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,0,0),(12,12,0,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,0,0);
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
  `required` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutions` (
  `institution_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `ror` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('98788bca-81aa-43f8-aada-c43fe42307ce','',0,0,0,'[]','a:0:{}',NULL,1676435088,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
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
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
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
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `msgd_context_id` (`context_id`),
  KEY `msgd_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `msgm_context_id` (`context_id`),
  KEY `msgm_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
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
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
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
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
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
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context`),
  CONSTRAINT `notification_subscription_settings_context_foreign` FOREIGN KEY (`context`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2023-02-15 04:27:51',NULL,1048585,1),(4,1,0,3,16777223,'2023-02-15 04:27:51',NULL,1048585,1),(5,1,4,2,16777217,'2023-02-15 04:27:51',NULL,1048585,1),(6,1,5,2,16777217,'2023-02-15 04:27:51',NULL,1048585,1),(7,1,0,3,16777222,'2023-02-15 04:29:01',NULL,1048585,2),(8,1,0,3,16777223,'2023-02-15 04:29:01',NULL,1048585,2),(9,1,4,2,16777217,'2023-02-15 04:29:01',NULL,1048585,2),(10,1,5,2,16777217,'2023-02-15 04:29:01',NULL,1048585,2),(11,1,0,3,16777222,'2023-02-15 04:29:39',NULL,1048585,3),(12,1,0,3,16777223,'2023-02-15 04:29:39',NULL,1048585,3),(13,1,4,2,16777217,'2023-02-15 04:29:39',NULL,1048585,3),(14,1,5,2,16777217,'2023-02-15 04:29:39',NULL,1048585,3),(15,1,4,3,16777259,'2023-02-15 04:30:04',NULL,1048585,3),(16,1,5,3,16777259,'2023-02-15 04:30:04',NULL,1048585,3),(17,1,9,3,16777259,'2023-02-15 04:30:05',NULL,1048585,3),(18,1,0,3,16777222,'2023-02-15 04:30:35',NULL,1048585,4),(19,1,0,3,16777223,'2023-02-15 04:30:35',NULL,1048585,4),(20,1,4,2,16777217,'2023-02-15 04:30:35',NULL,1048585,4),(21,1,5,2,16777217,'2023-02-15 04:30:35',NULL,1048585,4),(23,1,10,2,16777234,'2023-02-15 04:31:00',NULL,1048585,4),(24,1,0,3,16777222,'2023-02-15 04:31:27',NULL,1048585,5),(25,1,0,3,16777223,'2023-02-15 04:31:27',NULL,1048585,5),(26,1,4,2,16777217,'2023-02-15 04:31:27',NULL,1048585,5),(27,1,5,2,16777217,'2023-02-15 04:31:27',NULL,1048585,5),(28,1,0,3,16777222,'2023-02-15 04:32:13',NULL,1048585,6),(29,1,0,3,16777223,'2023-02-15 04:32:13',NULL,1048585,6),(30,1,4,2,16777217,'2023-02-15 04:32:13',NULL,1048585,6),(31,1,5,2,16777217,'2023-02-15 04:32:13',NULL,1048585,6),(32,1,0,3,16777222,'2023-02-15 04:32:46',NULL,1048585,7),(33,1,0,3,16777223,'2023-02-15 04:32:46',NULL,1048585,7),(34,1,4,2,16777217,'2023-02-15 04:32:46',NULL,1048585,7),(35,1,5,2,16777217,'2023-02-15 04:32:46',NULL,1048585,7),(36,1,0,3,16777222,'2023-02-15 04:33:19',NULL,1048585,8),(37,1,0,3,16777223,'2023-02-15 04:33:19',NULL,1048585,8),(38,1,4,2,16777217,'2023-02-15 04:33:19',NULL,1048585,8),(39,1,5,2,16777217,'2023-02-15 04:33:19',NULL,1048585,8),(40,1,0,3,16777222,'2023-02-15 04:33:51',NULL,1048585,9),(41,1,0,3,16777223,'2023-02-15 04:33:51',NULL,1048585,9),(42,1,4,2,16777217,'2023-02-15 04:33:51',NULL,1048585,9),(43,1,5,2,16777217,'2023-02-15 04:33:51',NULL,1048585,9),(44,1,0,3,16777222,'2023-02-15 04:34:24',NULL,1048585,10),(45,1,0,3,16777223,'2023-02-15 04:34:24',NULL,1048585,10),(46,1,4,2,16777217,'2023-02-15 04:34:24',NULL,1048585,10),(47,1,5,2,16777217,'2023-02-15 04:34:24',NULL,1048585,10),(48,1,0,3,16777222,'2023-02-15 04:34:58',NULL,1048585,11),(49,1,0,3,16777223,'2023-02-15 04:34:58',NULL,1048585,11),(50,1,4,2,16777217,'2023-02-15 04:34:58',NULL,1048585,11),(51,1,5,2,16777217,'2023-02-15 04:34:58',NULL,1048585,11),(52,1,0,3,16777222,'2023-02-15 04:35:31',NULL,1048585,12),(53,1,0,3,16777223,'2023-02-15 04:35:31',NULL,1048585,12),(54,1,4,2,16777217,'2023-02-15 04:35:31',NULL,1048585,12),(55,1,5,2,16777217,'2023-02-15 04:35:31',NULL,1048585,12),(56,1,0,3,16777222,'2023-02-15 04:36:05',NULL,1048585,13),(57,1,0,3,16777223,'2023-02-15 04:36:05',NULL,1048585,13),(58,1,4,2,16777217,'2023-02-15 04:36:05',NULL,1048585,13),(59,1,5,2,16777217,'2023-02-15 04:36:05',NULL,1048585,13),(60,1,0,3,16777222,'2023-02-15 04:36:39',NULL,1048585,14),(61,1,0,3,16777223,'2023-02-15 04:36:39',NULL,1048585,14),(62,1,4,2,16777217,'2023-02-15 04:36:39',NULL,1048585,14),(63,1,5,2,16777217,'2023-02-15 04:36:39',NULL,1048585,14),(64,1,0,3,16777222,'2023-02-15 04:37:12',NULL,1048585,15),(65,1,0,3,16777223,'2023-02-15 04:37:12',NULL,1048585,15),(66,1,4,2,16777217,'2023-02-15 04:37:12',NULL,1048585,15),(67,1,5,2,16777217,'2023-02-15 04:37:12',NULL,1048585,15),(68,1,0,3,16777222,'2023-02-15 04:37:46',NULL,1048585,16),(69,1,0,3,16777223,'2023-02-15 04:37:46',NULL,1048585,16),(70,1,4,2,16777217,'2023-02-15 04:37:46',NULL,1048585,16),(71,1,5,2,16777217,'2023-02-15 04:37:46',NULL,1048585,16),(72,1,0,3,16777222,'2023-02-15 04:38:20',NULL,1048585,17),(73,1,0,3,16777223,'2023-02-15 04:38:20',NULL,1048585,17),(74,1,4,2,16777217,'2023-02-15 04:38:20',NULL,1048585,17),(75,1,5,2,16777217,'2023-02-15 04:38:20',NULL,1048585,17),(76,1,0,3,16777222,'2023-02-15 04:38:54',NULL,1048585,18),(77,1,0,3,16777223,'2023-02-15 04:38:54',NULL,1048585,18),(78,1,4,2,16777217,'2023-02-15 04:38:54',NULL,1048585,18),(79,1,5,2,16777217,'2023-02-15 04:38:54',NULL,1048585,18),(80,1,0,3,16777222,'2023-02-15 04:39:28',NULL,1048585,19),(81,1,0,3,16777223,'2023-02-15 04:39:28',NULL,1048585,19),(82,1,4,2,16777217,'2023-02-15 04:39:28',NULL,1048585,19),(83,1,5,2,16777217,'2023-02-15 04:39:28',NULL,1048585,19);
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
  `setting_value` mediumtext,
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'displayStats','none','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','','string'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool'),('webfeedplugin',1,'includeIdentifiers','0','bool'),('webfeedplugin',1,'recentItems','30','int');
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
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_galley_settings_galley_id_foreign` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`)
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
  KEY `publication_galleys_submission_file_id` (`submission_file_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_doi_id` (`doi_id`),
  CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_galleys_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE SET NULL
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
  `setting_value` mediumtext,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(2,'','categoryIds','[]'),(2,'','copyrightYear','2023'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'','categoryIds','[]'),(3,'','copyrightYear','2023'),(3,'en_US','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'','categoryIds','[]'),(4,'','copyrightYear','2023'),(4,'en_US','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(4,'en_US','copyrightHolder','Craig Montgomerie'),(4,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'','categoryIds','[]'),(5,'en_US','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),(5,'en_US','title','Genetic transformation of forest trees'),(6,'','categoryIds','[]'),(6,'','copyrightYear','2023'),(6,'en_US','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'','categoryIds','[]'),(7,'','copyrightYear','2023'),(7,'en_US','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','title','Developing efficacy beliefs in the classroom'),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'','categoryIds','[]'),(8,'','copyrightYear','2023'),(8,'en_US','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','title','Developing efficacy beliefs in the classroom'),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'','categoryIds','[]'),(9,'','copyrightYear','2023'),(9,'en_US','abstract','None.'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'','categoryIds','[]'),(10,'','copyrightYear','2023'),(10,'en_US','abstract','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'','categoryIds','[]'),(11,'','copyrightYear','2023'),(11,'en_US','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'','categoryIds','[]'),(12,'','copyrightYear','2023'),(12,'en_US','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','title','Learning Sustainable Design through Service'),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'','categoryIds','[]'),(13,'','copyrightYear','2023'),(13,'en_US','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P<0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'','categoryIds','[]'),(14,'','copyrightYear','2023'),(14,'en_US','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'','categoryIds','[]'),(15,'','copyrightYear','2023'),(15,'en_US','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'','categoryIds','[]'),(16,'','copyrightYear','2023'),(16,'en_US','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','title','Yam diseases and its management in Nigeria'),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'','categoryIds','[]'),(17,'','copyrightYear','2023'),(17,'en_US','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'','categoryIds','[]'),(18,'','copyrightYear','2023'),(18,'en_US','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'','categoryIds','[]'),(19,'','copyrightYear','2023'),(19,'en_US','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(20,'','categoryIds','[]'),(20,'','copyrightYear','2023'),(20,'en_US','abstract','None.'),(20,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(20,'en_US','title','Finocchiaro: Arguments About Arguments'),(20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public');
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
  KEY `publications_author_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_url_path` (`url_path`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2023-02-15 04:27:37',1,1,1,1,NULL,1,NULL),(2,0,'2023-02-15','2023-02-15 04:29:15',2,1,2,3,NULL,1,NULL),(3,0,'2023-02-15','2023-02-15 04:30:01',5,1,3,3,NULL,1,NULL),(4,0,'2023-02-15','2023-02-15 04:30:10',7,1,3,3,NULL,2,NULL),(5,0,NULL,'2023-02-15 04:30:21',9,1,4,1,NULL,1,NULL),(6,0,'2023-02-15','2023-02-15 04:31:49',10,1,5,3,NULL,1,NULL),(7,0,'2023-02-15','2023-02-15 04:32:21',11,1,6,3,NULL,1,NULL),(8,0,'2023-02-15','2023-02-15 04:32:54',12,1,7,3,NULL,1,NULL),(9,0,'2023-02-15','2023-02-15 04:33:27',14,1,8,3,NULL,1,NULL),(10,0,'2023-02-15','2023-02-15 04:33:59',15,1,9,3,NULL,1,NULL),(11,0,'2023-02-15','2023-02-15 04:34:32',16,1,10,3,NULL,1,NULL),(12,0,'2023-02-15','2023-02-15 04:35:06',17,1,11,3,NULL,1,NULL),(13,0,'2023-02-15','2023-02-15 04:35:40',19,1,12,3,NULL,1,NULL),(14,0,'2023-02-15','2023-02-15 04:36:13',20,1,13,3,NULL,1,NULL),(15,0,'2023-02-15','2023-02-15 04:36:47',21,1,14,3,NULL,1,NULL),(16,0,'2023-02-15','2023-02-15 04:37:21',22,1,15,3,NULL,1,NULL),(17,0,'2023-02-15','2023-02-15 04:37:55',23,1,16,3,NULL,1,NULL),(18,0,'2023-02-15','2023-02-15 04:38:28',24,1,17,3,NULL,1,NULL),(19,0,'2023-02-15','2023-02-15 04:39:03',25,1,18,3,NULL,1,NULL),(20,0,'2023-02-15','2023-02-15 04:39:36',26,1,19,3,NULL,1,NULL);
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
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
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
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
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
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
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
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
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
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
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
INSERT INTO `scheduled_tasks` VALUES ('APP\\tasks\\UsageStatsLoader','2023-02-15 04:24:49'),('PKP\\task\\ProcessQueueJobs','2023-02-15 04:24:49'),('PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-02-15 04:24:48'),('PKP\\task\\StatisticsReport','2023-02-15 04:24:47'),('PKP\\task\\UpdateIPGeoDB','2023-02-15 04:24:48');
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
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`),
  CONSTRAINT `section_settings_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'','path','preprints'),(1,'en_US','abbrev','PRE'),(1,'en_US','description',''),(1,'en_US','identifyType',''),(1,'en_US','policy','<p>Section default policy</p>'),(1,'en_US','title','Preprints'),(1,'fr_CA','abbrev',''),(1,'fr_CA','description',''),(1,'fr_CA','identifyType',''),(1,'fr_CA','policy',''),(1,'fr_CA','title','');
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
  KEY `sections_server_id` (`server_id`),
  KEY `sections_review_form_id` (`review_form_id`),
  CONSTRAINT `sections_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL,
  CONSTRAINT `sections_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_settings` (
  `server_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `server_settings_pkey` (`server_id`,`locale`,`setting_name`),
  KEY `server_settings_server_id` (`server_id`),
  CONSTRAINT `server_settings_server_id` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copySubmissionAckAddress','',NULL),(1,'','copySubmissionAckPrimaryContact','0',NULL),(1,'','country','IS',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiSuffixType','default',NULL),(1,'','doiVersioning','1',NULL),(1,'','editorialStatsEmail','1',NULL),(1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enabledDoiTypes','[\"publication\"]',NULL),(1,'','enableDois','1',NULL),(1,'','enableGeoUsageStats','',NULL),(1,'','enableInstitutionUsageStats','0',NULL),(1,'','enableOai','1',NULL),(1,'','isSushiApiPublic','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','postedAcknowledgement','1',NULL),(1,'','registrationAgency','',NULL),(1,'','submissionAcknowledgement','allAuthors',NULL),(1,'','submitWithCategories','0',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorGuidelines','<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p> When you\'re satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','beginSubmissionHelp','<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>',NULL),(1,'en_US','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','description','<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>',NULL),(1,'en_US','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>',NULL),(1,'en_US','forTheEditorsHelp','<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"https://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>',NULL),(1,'en_US','uploadFilesHelp','<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>',NULL),(1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##',NULL),(1,'fr_CA','contributorsHelp','##default.submission.step.contributors##',NULL),(1,'fr_CA','description','<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>',NULL),(1,'fr_CA','detailsHelp','##default.submission.step.details##',NULL),(1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','reviewHelp','##default.submission.step.review##',NULL),(1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##',NULL),(1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##',NULL);
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
  KEY `sessions_user_id` (`user_id`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0jkebdi6bsjqs5lup7avq5k127',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435467,1676435488,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435487;s:5:\"token\";s:32:\"37840764043a44b0b62d6254d98f8829\";}username|s:9:\"dphillips\";','localhost'),('119g66hntdgmuubk1q51n9b8cl',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435935,1676435944,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435944;s:5:\"token\";s:32:\"8b7b48bebdac2bd840751e1c1e41b7f2\";}','localhost'),('1dvj6kjbrmqug7v2rt3eou4882',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435901,1676435909,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435909;s:5:\"token\";s:32:\"9066e9057b7b6f4e679a0df626a854b7\";}','localhost'),('1k6gckri8r7evhqfbhpvolh2i9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435912,1676435935,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435935;s:5:\"token\";s:32:\"06beb3136954486d81faff4f1a270aae\";}username|s:11:\"vwilliamson\";','localhost'),('2qe118q4qrn2rfsl4ioib7ea03',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435415,1676435435,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435435;s:5:\"token\";s:32:\"b68fc2fa8e0a88b78b46136219d67da8\";}username|s:6:\"ddiouf\";userId|i:10;','localhost'),('610368bkq3knf91s819re0dipl',8,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435275,1676435348,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435348;s:5:\"token\";s:32:\"6b2c5b369b3595669512dc2dc45c8e6f\";}username|s:8:\"ckwantes\";userId|i:8;','localhost'),('659r9ut64nctfqvgh48klujgqu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435643,1676435664,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435664;s:5:\"token\";s:32:\"d898d2203adac24f90fe10c9d826e00e\";}username|s:6:\"jnovak\";','localhost'),('65kppsiojdeht028khmqscafhk',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435112,1676435134,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435134;s:5:\"token\";s:32:\"c6d67fe07040f298d462fd169045a761\";}','localhost'),('6c108cjim3po11dmk44sjs3l54',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435504,1676435510,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435510;s:5:\"token\";s:32:\"19e7c41325bb7a7f9469cc50c3c8add8\";}','localhost'),('7fregi3mv49oa3pfe9stbbgce2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435436,1676435464,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435464;s:5:\"token\";s:32:\"ad1a11093548bbb0033ecd046a2948fb\";}','localhost'),('7gcku8ak41rhu84k68nrqimk2m',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435947,1676435968,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435968;s:5:\"token\";s:32:\"c333c79cb3228fb75c0bd31d8c01fc04\";}username|s:6:\"zwoods\";','localhost'),('807gt6dh39da380paf0tq6t3pv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435665,1676435673,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435673;s:5:\"token\";s:32:\"cd57a434c6785480c8c298ce8dcd308a\";}','localhost'),('8lft8vbjbu6a9cvulhnjbgo3q4',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435087,1676435111,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435112;s:5:\"token\";s:32:\"200f91c719b18ad53a1b41919b954800\";}','localhost'),('9adso4pbgqrmnm2tfi9urf0rgr',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435545,1676435566,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435566;s:5:\"token\";s:32:\"b5f670ccd3ddc5236b6ef4abdc297ce7\";}username|s:7:\"eostrom\";','localhost'),('9bij0a1hui8lonqffl49s0ie4u',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435800,1676435809,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435809;s:5:\"token\";s:32:\"7b0c6883e264d32f8f917037983a5d74\";}','localhost'),('a0lrpgge5g97hhpel5a91p07gh',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435744,1676435766,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435766;s:5:\"token\";s:32:\"0698ae75a618f49e9bf86cc49b6fc876\";}username|s:8:\"lkumiega\";','localhost'),('asfpgemamg1sj1pc7mdvrmpdn7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435497,1676435503,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435503;s:5:\"token\";s:32:\"be44c925d1ac1a8146938fd769261366\";}','localhost'),('b7622a4164646g1bc51o7enlcs',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435252,1676435271,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435271;s:5:\"token\";s:32:\"8935281c5af73a95cf9110ffc3938903\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('c0gtu7i6ant6kmfg6ehl45n2q8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435969,1676435977,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435977;s:5:\"token\";s:32:\"03875d45c4c90e2b157031dd71a48c77\";}','localhost'),('c1ehjk5bntad61niq0t9sp323t',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435811,1676435833,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435833;s:5:\"token\";s:32:\"f1b66156055240abe85506ff7ea32d4b\";}username|s:8:\"rbaiyewu\";','localhost'),('c833ns98ggjo9hclnc4dpd3ive',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435215,1676435223,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435223;s:5:\"token\";s:32:\"31498baa105749cde01c56a9d8d7739e\";}','localhost'),('cfa80gk418ja8l5e2ot6idku36',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435160,1676435199,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435198;s:5:\"token\";s:32:\"94dedf866f2918a1837a6db733e6cbee\";}','localhost'),('eja3c6idt6f7ju0a3q0ha8neoj',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435676,1676435698,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435698;s:5:\"token\";s:32:\"eade3cc18edd79dc4b6408a204021e76\";}username|s:10:\"kalkhafaji\";','localhost'),('f5sdmmetg6tgumh8u1789kbvq1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435777,1676435800,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435799;s:5:\"token\";s:32:\"d3e3b9a125217b3c9e373dec88d0854e\";}username|s:7:\"pdaniel\";','localhost'),('fflcjee3rbo1shquq5l6as16vc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435600,1676435608,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435608;s:5:\"token\";s:32:\"d4ff3a71214170a168ee2a630c8a01e3\";}','localhost'),('fkb9ce6ej8bdecbqgvc43jgpq2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435534,1676435542,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435542;s:5:\"token\";s:32:\"0900d6b6c90e9a254fa2488eb1b1d6b1\";}','localhost'),('fls38h5kspd3aqqj6hl8t90bfb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435488,1676435496,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435496;s:5:\"token\";s:32:\"657185809c42c439621f159d5dc6e380\";}','localhost'),('gbofsqfpfe9jtr5mq2nqcrjbdp',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435699,1676435707,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435707;s:5:\"token\";s:32:\"6ead70dd4c0f3db3b8dc308679bb403c\";}','localhost'),('gsid20dceujneg31j6srestasf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435732,1676435741,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435741;s:5:\"token\";s:32:\"1617de5685ab8266eaf8865cf0a0134d\";}','localhost'),('iek1j67f2am2pa02vn7gqhjf2t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435632,1676435640,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435640;s:5:\"token\";s:32:\"753c4b2448aaf5b551c79aeff758b601\";}','localhost'),('jjik2jsals31n7ca9ds00ds23q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435710,1676435732,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435732;s:5:\"token\";s:32:\"f65f1ac15395e99d96972b210a050264\";}username|s:12:\"lchristopher\";','localhost'),('kncvdhunurq7lr65q77j99o582',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435149,1676435157,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435157;s:5:\"token\";s:32:\"ff545fcfdb451077bf7d992cee121750\";}','localhost'),('l5aa638t835r5hga6cf849fko8',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435136,1676435148,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435148;s:5:\"token\";s:32:\"dc70437de09b351f35b5bcce1c5587e1\";}','localhost'),('l9sohq6um65jak7l1m22n9gtd0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435567,1676435575,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435575;s:5:\"token\";s:32:\"35278a7f32d10438c2c5003062df4cc1\";}','localhost'),('lo0n67bl96v5vsppdn2v211usc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435349,1676435356,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435356;s:5:\"token\";s:32:\"84566e89150a2d51dc84927073dfe554\";}','localhost'),('n1a5uegljcb5e8ofn2thqt6m5q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435578,1676435599,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435599;s:5:\"token\";s:32:\"3d03392077f330d12fd13cc97c2c0e0a\";}username|s:9:\"fpaglieri\";','localhost'),('npt31phufhd46ai7dq05lsbqop',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435388,1676435412,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435412;s:5:\"token\";s:32:\"110ad1b80d461974a951d1527afd66b1\";}','localhost'),('o60ov5cauj5bg2t3ss0j0lfd4k',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435199,1676435211,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1676435211;s:5:\"token\";s:32:\"550bca6ba53a4879ad2bf53c80f8153f\";}','localhost'),('o99fff5pb7o6pl2u05bk83h3jv',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435225,1676435248,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1676435248;s:5:\"token\";s:32:\"11ab9e6f9d037e772d73bb648fd065e6\";}','localhost'),('ojg5irdtl6q80j0kj9e2bnvgkd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435359,1676435380,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435380;s:5:\"token\";s:32:\"a1689377733566dd2acf80cf3b568f06\";}username|s:12:\"cmontgomerie\";','localhost'),('om8clqtjo54k75lu8fffdaje6o',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435845,1676435867,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435867;s:5:\"token\";s:32:\"dd2c97a913620bd6fc29a8b4c28639d2\";}username|s:6:\"rrossi\";','localhost'),('p24lbgekllblc1udeltc3sg2fq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435513,1676435533,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435533;s:5:\"token\";s:32:\"75b48d22f0d63b207b94baded3a59f42\";}username|s:9:\"dsokoloff\";','localhost'),('pmbc67t3gje5n9cueoi7d96nvr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435766,1676435774,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435774;s:5:\"token\";s:32:\"f2a4e93595e1e98faa6c9c0d6028b463\";}','localhost'),('qigt410j5nfaf775nrpqj3gkd2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435867,1676435876,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435876;s:5:\"token\";s:32:\"f25a2eef250c8cf7b3160d12b17ded4d\";}','localhost'),('r36tj889u9blovpo1hf4jmubsb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435610,1676435632,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435632;s:5:\"token\";s:32:\"879b7dff7cf1ef21ad9d98bca29cc6b0\";}username|s:10:\"jmwandenga\";','localhost'),('r3lfns5camekvuijia64p51k2f',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435380,1676435388,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435388;s:5:\"token\";s:32:\"887f0cdc8d7d8d21117f1f165436c2ef\";}','localhost'),('rklr77k0l5hgl6ohpj0hkv382j',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435833,1676435842,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1676435842;s:5:\"token\";s:32:\"025ad46999e294a610f73694e6da3239\";}','localhost'),('ub87muoojpt13i0kl3vti7hvvf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.96 Safari/537.36',1676435879,1676435901,0,'csrf|a:2:{s:9:\"timestamp\";i:1676435900;s:5:\"token\";s:32:\"2c2ee778ccd5a2b82e674334b1742e7b\";}username|s:12:\"vkarbasizaed\";','localhost');
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
  `setting_value` mediumtext,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('compressStatsLogs','','0'),('contactEmail','en_US','pkpadmin@mailinator.com'),('contactName','en_US','Open Preprint Systems'),('contactName','fr_CA','Open Preprint Systems'),('enableGeoUsageStats','','disabled'),('enableInstitutionUsageStats','','0'),('isSiteSushiPlatform','','0'),('isSushiApiPublic','','1'),('keepDailyUsageStats','','0'),('themePluginPath','','default');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2023-02-15 04:27:51',0,1),(2,1,3,4,'2023-02-15 04:27:51',0,1),(3,1,3,5,'2023-02-15 04:27:51',0,1),(4,2,4,8,'2023-02-15 04:29:01',0,1),(5,2,3,4,'2023-02-15 04:29:01',0,1),(6,2,3,5,'2023-02-15 04:29:01',0,1),(7,3,4,9,'2023-02-15 04:29:39',0,1),(8,3,3,4,'2023-02-15 04:29:39',0,1),(9,3,3,5,'2023-02-15 04:29:39',0,1),(10,4,4,10,'2023-02-15 04:30:35',0,1),(11,4,3,4,'2023-02-15 04:30:35',0,1),(12,4,3,5,'2023-02-15 04:30:35',0,1),(13,5,4,11,'2023-02-15 04:31:27',0,1),(14,5,3,4,'2023-02-15 04:31:27',0,1),(15,5,3,5,'2023-02-15 04:31:27',0,1),(16,6,4,12,'2023-02-15 04:32:13',0,1),(17,6,3,4,'2023-02-15 04:32:13',0,1),(18,6,3,5,'2023-02-15 04:32:13',0,1),(19,7,4,13,'2023-02-15 04:32:46',0,1),(20,7,3,4,'2023-02-15 04:32:46',0,1),(21,7,3,5,'2023-02-15 04:32:46',0,1),(22,8,4,14,'2023-02-15 04:33:19',0,1),(23,8,3,4,'2023-02-15 04:33:19',0,1),(24,8,3,5,'2023-02-15 04:33:19',0,1),(25,9,4,15,'2023-02-15 04:33:51',0,1),(26,9,3,4,'2023-02-15 04:33:51',0,1),(27,9,3,5,'2023-02-15 04:33:51',0,1),(28,10,4,16,'2023-02-15 04:34:24',0,1),(29,10,3,4,'2023-02-15 04:34:24',0,1),(30,10,3,5,'2023-02-15 04:34:24',0,1),(31,11,4,17,'2023-02-15 04:34:58',0,1),(32,11,3,4,'2023-02-15 04:34:58',0,1),(33,11,3,5,'2023-02-15 04:34:58',0,1),(34,12,4,18,'2023-02-15 04:35:31',0,1),(35,12,3,4,'2023-02-15 04:35:31',0,1),(36,12,3,5,'2023-02-15 04:35:31',0,1),(37,13,4,19,'2023-02-15 04:36:05',0,1),(38,13,3,4,'2023-02-15 04:36:05',0,1),(39,13,3,5,'2023-02-15 04:36:05',0,1),(40,14,4,20,'2023-02-15 04:36:39',0,1),(41,14,3,4,'2023-02-15 04:36:39',0,1),(42,14,3,5,'2023-02-15 04:36:39',0,1),(43,15,4,21,'2023-02-15 04:37:12',0,1),(44,15,3,4,'2023-02-15 04:37:12',0,1),(45,15,3,5,'2023-02-15 04:37:12',0,1),(46,16,4,22,'2023-02-15 04:37:46',0,1),(47,16,3,4,'2023-02-15 04:37:46',0,1),(48,16,3,5,'2023-02-15 04:37:46',0,1),(49,17,4,23,'2023-02-15 04:38:20',0,1),(50,17,3,4,'2023-02-15 04:38:20',0,1),(51,17,3,5,'2023-02-15 04:38:20',0,1),(52,18,4,24,'2023-02-15 04:38:54',0,1),(53,18,3,4,'2023-02-15 04:38:54',0,1),(54,18,3,5,'2023-02-15 04:38:54',0,1),(55,19,4,25,'2023-02-15 04:39:28',0,1),(56,19,3,4,'2023-02-15 04:39:28',0,1),(57,19,3,5,'2023-02-15 04:39:28',0,1);
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
  `user_group_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,4,3),(1,1,530,5,3);
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
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
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
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(2,'fr_CA','name','','string'),(3,'en_US','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(3,'fr_CA','name','','string'),(4,'en_US','name','Genetic transformation of forest trees.pdf','string'),(4,'fr_CA','name','','string'),(5,'en_US','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(5,'fr_CA','name','','string'),(6,'en_US','name','Developing efficacy beliefs in the classroom.pdf','string'),(6,'fr_CA','name','','string'),(7,'en_US','name','Developing efficacy beliefs in the classroom.pdf','string'),(7,'fr_CA','name','','string'),(8,'en_US','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(8,'fr_CA','name','','string'),(9,'en_US','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(9,'fr_CA','name','','string'),(10,'en_US','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(10,'fr_CA','name','','string'),(11,'en_US','name','Learning Sustainable Design through Service.pdf','string'),(11,'fr_CA','name','','string'),(12,'en_US','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(12,'fr_CA','name','','string'),(13,'en_US','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(13,'fr_CA','name','','string'),(14,'en_US','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(14,'fr_CA','name','','string'),(15,'en_US','name','Yam diseases and its management in Nigeria.pdf','string'),(15,'fr_CA','name','','string'),(16,'en_US','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(16,'fr_CA','name','','string'),(17,'en_US','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(17,'fr_CA','name','','string'),(18,'en_US','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(18,'fr_CA','name','','string'),(19,'en_US','name','Finocchiaro: Arguments About Arguments.pdf','string'),(19,'fr_CA','name','','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:27:48','2023-02-15 04:27:50',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:28:32','2023-02-15 04:28:35',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:29:36','2023-02-15 04:29:38',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:30:31','2023-02-15 04:30:34',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:31:24','2023-02-15 04:31:26',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:32:10','2023-02-15 04:32:12',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:32:42','2023-02-15 04:32:44',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:33:16','2023-02-15 04:33:18',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:33:48','2023-02-15 04:33:50',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:34:21','2023-02-15 04:34:23',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:34:54','2023-02-15 04:34:57',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:35:28','2023-02-15 04:35:31',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:36:02','2023-02-15 04:36:04',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:36:36','2023-02-15 04:36:38',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:37:09','2023-02-15 04:37:12',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:37:43','2023-02-15 04:37:45',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:38:17','2023-02-15 04:38:19',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:38:51','2023-02-15 04:38:53',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2023-02-15 04:39:25','2023-02-15 04:39:27',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(9,3,2),(25,3,2),(25,3,6),(33,3,3),(49,3,2),(57,3,2),(65,3,3),(65,3,8),(73,3,2),(81,3,2),(89,3,3),(97,3,3),(97,3,7),(105,3,4),(113,3,2),(121,3,2),(123,3,28),(123,3,37),(123,3,80),(129,3,2),(137,3,3),(145,3,2),(153,3,2),(1,4,3),(2,5,0),(107,5,3),(115,5,175),(138,5,0),(2,6,1),(2,7,2),(131,7,40),(2,8,3),(107,8,137),(107,8,140),(139,8,12),(139,8,36),(139,8,69),(2,9,4),(2,10,5),(3,10,126),(139,10,49),(139,10,118),(3,11,0),(59,11,54),(91,11,79),(107,11,138),(3,12,1),(3,13,2),(3,14,3),(3,15,4),(3,16,5),(3,16,40),(3,16,50),(3,16,72),(3,16,109),(3,16,118),(3,17,6),(3,17,120),(3,18,7),(3,18,42),(3,18,52),(3,18,121),(3,19,8),(3,19,43),(3,19,49),(3,19,53),(123,19,13),(123,19,47),(123,19,86),(3,20,9),(67,20,13),(67,20,26),(3,21,10),(3,21,124),(107,21,10),(107,21,121),(138,21,8),(146,21,1),(147,21,1),(147,21,51),(147,21,58),(147,21,74),(3,22,11),(3,22,17),(3,22,29),(3,22,68),(3,22,91),(3,22,107),(107,22,54),(109,22,0),(138,22,9),(3,23,12),(3,23,30),(107,23,32),(107,23,55),(107,23,62),(107,23,75),(3,24,13),(3,24,58),(3,24,122),(3,25,14),(3,25,59),(3,26,15),(3,26,56),(3,26,69),(3,26,103),(107,26,23),(3,27,16),(3,28,18),(3,29,19),(3,30,20),(3,30,84),(139,30,59),(3,31,21),(107,31,17),(3,32,22),(3,33,23),(3,34,24),(3,35,25),(3,36,26),(3,37,27),(3,38,28),(139,38,122),(3,39,31),(3,40,32),(3,41,33),(3,42,34),(3,43,35),(3,44,36),(3,45,37),(3,45,123),(3,46,38),(131,46,28),(131,46,35),(131,46,75),(3,47,39),(3,48,41),(3,48,51),(3,49,44),(3,49,55),(106,49,7),(131,49,96),(3,50,45),(3,51,46),(3,52,47),(3,53,48),(3,54,54),(3,55,57),(3,56,60),(147,56,66),(155,56,37),(3,57,61),(147,57,53),(3,58,62),(3,59,63),(139,59,124),(3,60,64),(67,60,5),(106,60,3),(115,60,185),(3,61,65),(139,61,37),(3,62,66),(3,63,67),(3,64,70),(3,65,71),(107,65,94),(3,66,73),(3,66,110),(139,66,76),(3,67,74),(3,67,88),(107,67,110),(115,67,149),(3,68,75),(11,68,59),(107,68,96),(3,69,76),(3,69,80),(3,70,77),(3,71,78),(3,71,82),(3,72,79),(3,72,94),(3,72,111),(3,73,81),(3,73,101),(107,73,5),(107,73,134),(107,73,141),(139,73,70),(3,74,83),(3,74,100),(107,74,102),(3,75,85),(131,75,26),(3,76,86),(3,77,87),(3,78,89),(131,78,38),(3,79,90),(3,80,92),(3,81,93),(3,82,95),(3,83,96),(11,83,9),(115,83,176),(3,84,97),(107,84,7),(107,84,42),(107,84,48),(107,84,58),(107,84,66),(107,84,71),(107,84,118),(107,84,131),(138,84,5),(3,85,98),(107,85,8),(107,85,43),(107,85,49),(107,85,59),(107,85,67),(107,85,72),(107,85,79),(107,85,84),(107,85,89),(107,85,119),(138,85,6),(3,86,99),(107,86,44),(107,86,50),(138,86,7),(139,86,38),(3,87,102),(3,88,104),(3,89,105),(3,90,106),(3,91,108),(3,92,112),(3,93,113),(147,93,46),(3,94,114),(3,95,115),(3,96,116),(51,96,37),(3,97,117),(3,98,119),(3,99,125),(107,99,11),(107,99,122),(107,99,133),(3,100,127),(67,100,39),(155,100,36),(3,101,128),(115,101,191),(3,102,129),(3,103,130),(9,104,0),(9,105,1),(9,106,3),(153,106,3),(10,107,0),(10,108,1),(11,108,14),(11,108,70),(10,109,2),(11,109,15),(11,109,60),(11,109,71),(10,110,3),(10,111,4),(10,112,5),(67,112,0),(107,112,1),(115,112,43),(122,112,4),(123,112,18),(10,113,6),(11,113,43),(10,114,7),(11,114,44),(11,115,0),(11,116,1),(115,116,39),(115,116,47),(115,116,64),(115,116,127),(115,116,203),(139,116,110),(11,117,2),(11,118,3),(13,118,1),(27,118,62),(29,118,4),(11,119,4),(11,119,48),(13,119,0),(29,119,10),(11,120,5),(11,121,6),(11,122,7),(11,123,8),(11,124,10),(11,124,64),(27,124,7),(29,124,6),(105,124,3),(11,125,11),(123,125,15),(125,125,8),(11,126,12),(11,127,13),(11,127,69),(115,127,157),(11,128,16),(11,129,17),(11,130,18),(11,131,19),(11,132,20),(11,133,21),(11,133,57),(11,134,22),(155,134,3),(11,135,23),(147,135,15),(147,135,36),(11,136,24),(11,136,38),(11,137,25),(115,137,45),(115,137,63),(11,138,26),(11,139,27),(123,139,61),(11,140,28),(11,140,30),(11,140,33),(11,140,40),(11,141,29),(11,141,41),(27,141,27),(11,142,31),(11,143,32),(11,144,34),(27,144,80),(59,144,49),(11,145,35),(11,145,45),(11,146,36),(11,146,46),(11,147,37),(11,148,39),(11,149,42),(11,150,47),(11,150,50),(11,151,49),(11,152,51),(11,153,52),(147,153,62),(11,154,53),(11,155,54),(11,155,62),(59,155,27),(11,156,55),(11,157,56),(11,158,58),(11,159,61),(59,159,26),(59,159,40),(123,159,35),(123,159,81),(139,159,1),(11,160,63),(51,160,33),(115,160,98),(11,161,65),(11,162,66),(59,162,31),(11,163,67),(11,164,68),(107,164,87),(9,165,4),(9,166,5),(25,167,0),(25,168,1),(25,169,3),(27,169,18),(27,169,38),(27,169,68),(29,169,5),(26,170,0),(27,170,54),(27,170,72),(29,170,2),(26,171,1),(26,172,2),(26,173,3),(83,173,25),(26,174,4),(27,174,40),(27,174,79),(27,174,84),(26,175,5),(59,175,65),(83,175,17),(115,175,87),(26,176,6),(83,176,16),(83,176,22),(26,177,7),(27,178,0),(27,179,1),(27,179,10),(27,179,28),(29,179,1),(27,180,2),(58,180,3),(59,180,70),(66,180,3),(27,181,3),(59,181,0),(115,181,9),(115,181,85),(27,182,4),(83,182,14),(27,183,5),(59,183,2),(61,183,0),(99,183,8),(101,183,2),(123,183,7),(165,183,0),(27,184,6),(27,185,8),(29,185,7),(27,186,9),(27,187,11),(27,187,55),(27,187,73),(29,187,3),(59,187,6),(27,188,12),(27,188,34),(123,188,39),(27,189,13),(27,190,14),(27,191,15),(115,191,164),(115,191,195),(27,192,16),(27,193,17),(27,193,67),(27,194,19),(27,195,20),(27,196,21),(27,197,22),(27,197,29),(27,197,43),(122,197,2),(123,197,43),(123,197,53),(123,197,65),(27,198,23),(27,199,24),(27,200,25),(27,201,26),(27,202,30),(27,203,31),(27,204,32),(27,205,33),(27,206,35),(27,207,36),(27,208,37),(27,209,39),(59,209,38),(59,209,50),(59,209,56),(98,209,0),(101,209,4),(27,210,41),(50,210,3),(51,210,19),(51,210,41),(27,211,42),(27,212,44),(27,212,65),(27,212,74),(59,212,24),(27,213,45),(27,213,66),(27,213,75),(27,214,46),(27,215,47),(29,215,8),(27,216,48),(29,216,9),(67,216,6),(99,216,3),(101,216,0),(123,216,31),(123,216,63),(27,217,49),(27,217,81),(123,217,44),(131,217,5),(131,217,50),(27,218,50),(27,219,51),(27,220,52),(27,221,53),(27,222,56),(27,223,57),(59,223,1),(27,224,58),(59,224,15),(27,225,59),(27,226,60),(107,226,112),(147,226,82),(27,227,61),(27,228,63),(27,229,64),(27,230,69),(115,230,165),(27,231,70),(27,232,71),(27,233,76),(27,234,77),(27,235,78),(27,236,82),(27,236,83),(131,236,6),(29,237,0),(25,238,4),(25,239,5),(25,240,7),(33,241,0),(33,242,1),(33,243,2),(34,244,0),(35,244,3),(35,244,9),(34,245,1),(35,245,4),(123,245,92),(125,245,12),(34,246,2),(35,246,5),(35,246,12),(34,247,3),(35,247,6),(35,247,13),(35,248,0),(82,248,3),(131,248,0),(35,249,1),(83,249,8),(35,250,2),(35,251,7),(59,251,71),(99,251,58),(35,252,8),(91,252,42),(91,252,44),(35,253,10),(99,253,7),(101,253,1),(35,254,11),(107,254,135),(35,255,14),(123,255,51),(35,256,15),(35,257,16),(35,258,17),(35,259,18),(35,260,19),(35,261,20),(49,262,0),(49,263,1),(49,264,3),(50,265,0),(51,265,16),(50,266,1),(51,266,17),(51,266,29),(51,266,38),(50,267,2),(51,267,6),(51,267,18),(51,267,23),(51,267,42),(50,268,4),(51,268,12),(51,268,21),(51,268,44),(50,269,5),(50,270,6),(50,271,7),(50,272,8),(50,273,9),(51,274,0),(51,275,1),(51,275,34),(51,276,2),(51,277,3),(51,278,4),(51,279,5),(59,279,58),(51,280,7),(51,280,26),(51,280,39),(51,280,50),(58,280,2),(59,280,20),(66,280,2),(51,281,8),(51,281,31),(51,282,9),(59,282,21),(51,283,10),(51,284,11),(51,285,13),(51,286,14),(51,287,15),(51,288,20),(51,288,43),(51,289,22),(51,290,24),(51,291,25),(69,291,0),(69,291,3),(139,291,48),(139,291,82),(51,292,27),(51,292,53),(51,293,28),(51,293,54),(51,294,30),(51,295,32),(51,296,35),(51,297,36),(51,298,40),(59,298,39),(51,299,45),(51,300,46),(51,301,47),(51,302,48),(51,303,49),(51,304,51),(51,305,52),(131,305,16),(57,306,0),(57,307,1),(57,308,3),(57,309,4),(58,310,0),(66,310,0),(91,310,56),(115,310,11),(58,311,1),(59,311,19),(66,311,1),(59,312,3),(59,313,4),(59,313,46),(59,313,60),(59,314,5),(59,315,7),(59,316,8),(59,317,9),(67,317,32),(59,318,10),(59,318,11),(59,319,12),(123,319,10),(59,320,13),(59,321,14),(59,322,16),(59,323,17),(59,324,18),(59,325,22),(59,325,69),(59,326,23),(59,327,25),(59,328,28),(115,328,44),(59,329,29),(59,329,63),(99,329,14),(123,329,91),(125,329,11),(59,330,30),(59,331,32),(91,331,55),(131,331,13),(59,332,33),(59,333,34),(59,334,35),(59,335,36),(59,336,37),(59,336,55),(59,336,67),(59,337,41),(59,338,42),(59,339,43),(59,340,44),(59,340,52),(59,341,45),(59,342,47),(59,343,48),(59,344,51),(59,345,53),(59,346,57),(59,347,59),(59,348,61),(59,349,62),(59,350,64),(59,351,66),(59,352,68),(61,353,1),(165,353,1),(65,354,0),(65,355,1),(65,356,2),(65,356,7),(67,357,1),(67,357,28),(67,358,2),(67,359,3),(67,360,4),(67,361,7),(115,361,79),(115,361,101),(67,362,8),(67,363,9),(67,364,10),(67,364,34),(67,365,11),(67,365,35),(67,366,12),(67,367,14),(67,367,27),(90,367,5),(67,368,15),(67,369,16),(67,370,17),(67,371,18),(67,372,19),(67,373,20),(67,374,21),(67,375,22),(67,376,23),(67,377,24),(67,378,25),(67,379,29),(67,380,30),(67,381,31),(67,382,33),(67,383,36),(67,384,37),(67,385,38),(123,385,25),(123,385,76),(147,385,88),(67,386,40),(67,387,41),(99,387,38),(69,388,1),(69,389,2),(69,390,4),(69,391,5),(69,392,6),(65,393,4),(65,394,5),(65,395,6),(73,396,0),(73,397,1),(73,398,3),(74,399,0),(74,400,1),(74,401,2),(74,402,3),(81,403,0),(89,403,0),(81,404,1),(81,405,3),(113,405,3),(81,406,4),(113,406,4),(82,407,0),(82,408,1),(83,408,1),(82,409,2),(83,409,3),(82,410,4),(82,411,5),(83,411,9),(82,412,6),(83,412,10),(83,412,13),(83,413,0),(83,414,2),(115,414,67),(83,415,4),(83,416,5),(99,416,24),(99,416,59),(115,416,204),(83,417,6),(83,418,7),(83,419,11),(83,420,12),(83,421,15),(83,422,18),(83,423,19),(83,424,20),(83,425,21),(83,425,37),(83,426,23),(83,427,24),(83,427,36),(90,427,7),(91,427,20),(91,427,52),(115,427,89),(130,427,2),(131,427,4),(131,427,49),(83,428,26),(115,428,76),(147,428,85),(83,429,27),(83,430,28),(83,431,29),(83,432,30),(83,433,31),(83,434,32),(83,435,33),(83,435,38),(155,435,16),(155,435,35),(83,436,34),(83,437,35),(83,438,39),(83,439,40),(83,440,41),(89,441,1),(89,442,2),(90,443,0),(90,444,1),(90,444,6),(91,444,1),(91,444,8),(91,444,19),(91,444,25),(91,444,51),(91,444,64),(91,444,80),(91,444,106),(93,444,0),(115,444,4),(115,444,163),(115,444,187),(117,444,0),(90,445,2),(91,445,2),(91,445,107),(115,445,90),(90,446,3),(90,447,4),(91,447,50),(90,448,8),(91,448,53),(91,449,0),(91,449,105),(115,449,7),(91,450,3),(91,450,18),(91,450,35),(91,450,38),(91,450,108),(91,451,4),(91,451,11),(91,451,36),(91,451,61),(91,451,78),(91,451,102),(91,451,109),(139,451,50),(139,451,62),(91,452,5),(91,453,6),(91,453,94),(91,454,7),(91,455,9),(91,455,65),(91,455,81),(91,456,10),(91,457,12),(139,457,127),(91,458,13),(91,459,14),(91,460,15),(99,460,61),(91,461,16),(91,462,17),(91,463,21),(91,463,82),(91,463,99),(91,463,112),(115,463,58),(115,463,116),(91,464,22),(91,465,23),(91,466,24),(91,466,62),(91,467,26),(91,468,27),(91,468,67),(91,469,28),(91,469,49),(91,470,29),(91,471,30),(107,471,15),(91,472,31),(91,473,32),(115,473,202),(139,473,2),(91,474,33),(91,475,34),(91,476,37),(91,476,74),(91,477,39),(91,478,40),(91,479,41),(91,480,43),(91,481,45),(91,482,46),(91,483,47),(91,484,48),(91,484,88),(91,485,54),(91,485,93),(91,486,57),(91,486,91),(91,486,96),(91,487,58),(91,487,71),(91,487,89),(91,487,92),(91,487,110),(91,488,59),(91,488,77),(139,488,32),(91,489,60),(91,489,101),(91,490,63),(91,491,66),(91,492,68),(91,493,69),(91,493,85),(91,494,70),(91,494,86),(91,495,72),(115,495,128),(91,496,73),(91,497,75),(91,498,76),(91,499,83),(91,499,113),(91,500,84),(91,501,87),(91,501,97),(99,501,27),(99,501,39),(99,501,53),(99,501,62),(115,501,97),(123,501,46),(123,501,49),(91,502,90),(91,503,95),(91,504,98),(91,504,111),(91,505,100),(91,506,103),(99,506,32),(91,507,104),(97,508,0),(97,509,1),(97,510,2),(97,510,6),(99,510,34),(98,511,1),(99,511,2),(99,511,22),(99,511,30),(99,511,37),(98,512,2),(99,512,23),(99,512,31),(99,512,48),(98,513,3),(99,513,15),(101,513,3),(99,514,0),(99,515,1),(101,515,5),(99,516,4),(99,517,5),(99,518,6),(99,519,9),(99,520,10),(99,521,11),(115,521,36),(99,522,12),(99,522,28),(99,523,13),(99,524,16),(99,525,17),(155,525,1),(155,525,6),(99,526,18),(99,527,19),(99,528,20),(99,529,21),(99,529,29),(99,530,25),(99,530,36),(99,531,26),(99,532,33),(99,533,35),(99,534,40),(99,535,41),(99,536,42),(99,537,43),(99,537,51),(99,538,44),(99,538,52),(99,539,45),(99,540,46),(99,541,47),(99,542,49),(99,543,50),(99,544,54),(99,545,55),(99,546,56),(123,546,0),(99,547,57),(123,547,11),(99,548,60),(97,549,4),(97,550,5),(105,551,0),(105,552,1),(105,553,2),(106,554,0),(106,555,1),(106,556,2),(106,557,4),(106,558,5),(106,559,6),(106,560,8),(107,561,0),(139,561,0),(139,561,115),(107,562,2),(107,563,4),(107,563,114),(138,563,1),(107,564,6),(107,564,116),(107,564,125),(107,565,9),(107,565,120),(146,565,5),(147,565,65),(107,566,12),(107,566,123),(107,567,13),(107,567,108),(107,567,124),(107,568,14),(107,569,16),(139,569,52),(107,570,18),(107,571,19),(107,572,20),(107,573,21),(107,574,22),(107,575,24),(107,575,51),(107,576,25),(107,577,26),(107,578,27),(107,578,29),(107,578,127),(107,579,28),(107,579,126),(107,580,30),(107,580,52),(107,580,117),(138,580,4),(107,581,31),(107,582,33),(107,583,34),(139,583,30),(107,584,35),(107,584,45),(107,584,53),(107,584,92),(107,584,107),(138,584,10),(107,585,36),(107,586,37),(115,586,65),(107,587,38),(107,588,39),(107,589,40),(107,589,86),(107,590,41),(107,591,46),(107,592,47),(107,593,56),(107,593,63),(107,593,76),(107,594,57),(107,595,60),(107,595,64),(107,595,74),(107,595,77),(139,595,71),(107,596,61),(107,597,65),(107,598,68),(107,599,69),(107,600,70),(107,601,73),(107,602,78),(107,603,80),(107,603,97),(107,604,81),(107,605,82),(107,606,83),(107,607,85),(107,608,88),(107,609,90),(107,609,95),(115,609,139),(115,609,152),(107,610,91),(107,611,93),(107,612,98),(107,613,99),(107,614,100),(107,615,101),(107,616,103),(107,617,104),(107,618,105),(107,619,106),(107,620,109),(107,621,111),(107,622,113),(107,623,115),(138,623,3),(107,624,128),(131,624,93),(107,625,129),(107,626,130),(107,627,132),(107,628,136),(107,629,139),(107,630,142),(107,631,143),(109,632,1),(141,632,1),(109,633,2),(141,633,2),(113,634,0),(113,635,1),(114,636,0),(115,636,25),(115,636,61),(115,636,177),(114,637,1),(114,638,2),(115,638,0),(115,638,32),(115,638,92),(114,639,3),(115,639,1),(115,639,33),(115,639,93),(115,639,173),(114,640,4),(115,640,18),(115,640,27),(115,640,80),(115,640,102),(115,640,134),(115,640,179),(115,640,198),(114,641,5),(115,641,19),(115,641,81),(115,641,103),(115,641,135),(115,641,180),(115,641,199),(114,642,6),(114,642,8),(115,642,10),(115,642,20),(115,642,30),(115,642,82),(115,642,84),(115,642,105),(115,642,136),(115,642,145),(115,642,182),(115,642,200),(114,643,7),(115,643,29),(115,643,83),(115,643,104),(115,643,144),(115,643,181),(114,644,9),(115,644,34),(115,644,66),(115,644,106),(115,644,140),(115,644,153),(114,645,10),(115,645,35),(115,645,62),(115,645,107),(139,645,23),(139,645,84),(115,646,2),(123,646,72),(115,647,3),(115,648,5),(139,648,121),(115,649,6),(115,650,8),(115,650,156),(115,651,12),(115,652,13),(131,652,81),(115,653,14),(115,654,15),(115,655,16),(115,656,17),(115,657,21),(115,657,37),(115,658,22),(115,659,23),(115,660,24),(115,661,26),(115,661,49),(115,661,54),(115,661,69),(115,661,109),(115,662,28),(115,663,31),(115,663,74),(115,664,38),(115,665,40),(115,666,41),(115,666,197),(115,667,42),(115,667,205),(115,668,46),(115,669,48),(115,669,68),(115,669,77),(115,669,91),(115,669,108),(115,669,194),(115,670,50),(115,671,51),(115,671,124),(115,672,52),(115,672,133),(115,672,147),(115,673,53),(115,674,55),(115,674,113),(115,675,56),(115,675,114),(115,676,57),(115,676,115),(115,677,59),(115,678,60),(115,679,70),(115,680,71),(115,681,72),(115,682,73),(115,683,75),(115,684,78),(115,685,86),(115,686,88),(115,687,94),(115,688,95),(115,689,96),(115,690,99),(115,691,100),(115,692,110),(115,692,117),(115,693,111),(115,694,112),(115,694,121),(115,695,118),(115,696,119),(115,697,120),(115,697,142),(115,697,155),(115,698,122),(115,699,123),(115,700,125),(115,700,137),(115,700,143),(115,700,166),(115,700,189),(115,701,126),(115,701,190),(115,701,201),(115,702,129),(115,703,130),(139,703,72),(115,704,131),(115,705,132),(115,705,146),(115,705,160),(115,706,138),(115,707,141),(115,707,154),(115,708,148),(115,709,150),(115,710,151),(115,711,158),(115,711,174),(115,712,159),(115,713,161),(115,714,162),(115,715,167),(115,716,168),(115,717,169),(115,718,170),(115,719,171),(115,720,172),(115,721,178),(115,722,183),(115,723,184),(115,724,186),(115,725,188),(115,726,192),(115,727,193),(115,728,196),(115,729,206),(115,730,207),(121,731,0),(121,732,1),(121,733,3),(122,734,0),(122,735,1),(123,735,42),(123,735,64),(122,736,3),(123,736,17),(122,737,5),(123,737,20),(122,738,6),(123,738,21),(122,739,7),(123,739,22),(123,740,1),(123,741,2),(125,741,0),(123,742,3),(125,742,1),(123,743,4),(123,744,5),(123,745,6),(125,745,2),(123,746,8),(123,747,9),(123,748,12),(123,749,14),(125,749,7),(123,750,16),(125,750,9),(123,751,19),(123,752,23),(125,752,3),(123,753,24),(125,753,4),(123,754,26),(123,755,27),(123,755,50),(123,756,29),(123,757,30),(123,758,32),(123,758,88),(123,759,33),(123,760,34),(123,760,84),(125,760,5),(123,761,36),(139,761,41),(123,762,38),(123,763,40),(123,764,41),(123,765,45),(123,766,48),(123,767,52),(123,768,54),(123,769,55),(123,770,56),(123,771,57),(155,771,30),(123,772,58),(123,772,71),(123,773,59),(123,774,60),(123,775,62),(123,776,66),(123,777,67),(123,778,68),(123,779,69),(123,780,70),(123,781,73),(123,782,74),(123,783,75),(123,784,77),(123,785,78),(123,786,79),(125,786,10),(123,787,82),(123,788,83),(123,789,85),(125,789,6),(123,790,87),(123,791,89),(123,792,90),(129,793,0),(129,794,1),(129,795,3),(130,796,0),(131,796,3),(131,796,20),(131,796,34),(131,796,82),(131,796,89),(130,797,1),(131,797,2),(131,797,12),(131,797,19),(131,797,33),(131,797,55),(131,797,70),(139,797,125),(130,798,3),(131,798,9),(131,799,1),(131,800,7),(131,800,53),(131,801,8),(131,802,10),(131,802,18),(131,802,54),(131,803,11),(131,803,32),(131,803,69),(131,803,79),(131,803,86),(131,804,14),(131,805,15),(131,806,17),(131,807,21),(131,808,22),(131,809,23),(131,810,24),(131,810,30),(139,810,19),(131,811,25),(131,811,46),(131,812,27),(131,812,37),(131,812,48),(131,813,29),(131,813,36),(131,814,31),(131,815,39),(131,816,41),(131,817,42),(131,818,43),(131,819,44),(131,819,83),(131,819,90),(131,820,45),(131,821,47),(131,822,51),(131,823,52),(131,824,56),(131,825,57),(131,825,65),(131,826,58),(131,827,59),(131,828,60),(131,829,61),(147,829,12),(147,829,38),(147,829,60),(131,830,62),(131,831,63),(131,832,64),(131,833,66),(131,833,68),(131,834,67),(131,835,71),(131,836,72),(131,837,73),(131,838,74),(155,838,23),(131,839,76),(131,840,77),(131,841,78),(131,842,80),(131,843,84),(131,844,85),(147,844,87),(131,845,87),(131,846,88),(131,847,91),(131,848,92),(131,849,94),(131,850,95),(131,851,97),(131,852,98),(139,852,67),(137,853,0),(137,854,1),(137,855,2),(138,856,2),(139,857,3),(139,858,4),(139,859,5),(139,859,25),(139,859,43),(139,859,63),(139,859,117),(141,859,0),(139,860,6),(139,860,35),(139,860,80),(139,861,7),(139,861,18),(139,862,8),(139,863,9),(139,864,10),(139,865,11),(139,866,13),(139,867,14),(139,867,120),(139,868,15),(139,869,16),(139,870,17),(139,871,20),(139,872,21),(139,873,22),(139,874,24),(139,875,26),(139,875,31),(139,875,99),(139,876,27),(139,877,28),(139,877,39),(139,878,29),(139,878,40),(139,879,33),(139,880,34),(139,881,42),(139,882,44),(139,883,45),(155,883,28),(139,884,46),(139,885,47),(139,886,51),(139,886,75),(139,887,53),(139,888,54),(139,889,55),(139,890,56),(139,890,74),(139,891,57),(139,892,58),(139,893,60),(139,893,108),(139,894,61),(139,895,64),(139,896,65),(139,897,66),(139,898,68),(139,898,78),(139,899,73),(139,900,77),(139,901,79),(139,902,81),(139,903,83),(139,904,85),(139,905,86),(139,906,87),(139,907,88),(139,908,89),(139,909,90),(139,910,91),(139,910,98),(139,911,92),(139,912,93),(139,913,94),(139,914,95),(139,915,96),(139,916,97),(139,917,100),(139,918,101),(139,918,105),(139,919,102),(139,920,103),(139,921,104),(139,922,106),(155,922,18),(139,923,107),(139,924,109),(139,925,111),(139,926,112),(139,927,113),(139,928,114),(139,929,116),(139,930,119),(139,931,123),(139,932,126),(139,933,128),(145,934,0),(145,935,1),(145,936,3),(146,937,0),(147,937,0),(147,937,67),(146,938,2),(147,938,2),(147,938,59),(146,939,3),(147,939,3),(147,939,34),(147,939,68),(147,939,73),(146,940,4),(147,940,5),(147,940,64),(147,940,71),(146,941,6),(147,941,7),(147,941,84),(146,942,7),(147,942,9),(147,942,29),(147,942,55),(147,942,79),(146,943,8),(147,943,10),(147,943,18),(147,943,30),(147,943,80),(147,943,86),(146,944,9),(147,944,11),(147,944,19),(147,944,31),(147,944,81),(146,945,10),(147,945,56),(146,946,11),(146,947,12),(147,948,4),(147,949,6),(147,950,8),(147,951,13),(147,951,39),(147,952,14),(147,952,40),(147,952,50),(147,953,16),(147,954,17),(147,955,20),(147,956,21),(147,957,22),(147,958,23),(147,959,24),(147,960,25),(147,961,26),(147,962,27),(147,963,28),(147,963,37),(147,963,47),(147,963,54),(147,963,78),(147,964,32),(147,965,33),(147,966,35),(147,966,76),(147,967,41),(147,968,42),(147,969,43),(147,970,44),(147,971,45),(147,972,48),(147,973,49),(147,974,52),(147,974,75),(147,975,57),(147,976,61),(147,977,63),(147,978,69),(147,979,70),(147,980,72),(147,981,77),(147,982,83),(153,983,0),(153,984,1),(154,985,0),(157,985,0),(154,986,1),(157,986,1),(154,987,2),(157,987,2),(154,988,3),(154,989,4),(155,990,0),(155,991,2),(155,991,9),(155,991,31),(155,992,4),(155,993,5),(155,994,7),(155,995,8),(155,996,10),(155,996,24),(155,997,11),(155,998,12),(155,999,13),(155,1000,14),(155,1000,33),(155,1001,15),(155,1001,26),(155,1001,34),(155,1002,17),(155,1003,19),(155,1004,20),(155,1005,21),(155,1006,22),(155,1007,25),(155,1008,27),(155,1009,29),(155,1010,32),(157,1011,3),(161,1012,0),(161,1013,1),(161,1014,2),(162,1015,0),(162,1016,1),(162,1016,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
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
  `stage_id` bigint(20) NOT NULL DEFAULT '5',
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_current_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_current_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2023-02-15 04:27:51','2023-02-15 04:27:51','2023-02-15 04:27:51',5,'en_US',1,'',0),(2,1,2,'2023-02-15 04:29:15','2023-02-15 04:29:01','2023-02-15 04:29:01',5,'en_US',3,'',0),(3,1,4,'2023-02-15 04:30:11','2023-02-15 04:29:39','2023-02-15 04:29:39',5,'en_US',3,'',0),(4,1,5,'2023-02-15 04:31:00','2023-02-15 04:30:35','2023-02-15 04:30:35',5,'en_US',4,'',0),(5,1,6,'2023-02-15 04:31:49','2023-02-15 04:31:27','2023-02-15 04:31:27',5,'en_US',3,'',0),(6,1,7,'2023-02-15 04:32:21','2023-02-15 04:32:13','2023-02-15 04:32:13',5,'en_US',3,'',0),(7,1,8,'2023-02-15 04:32:54','2023-02-15 04:32:46','2023-02-15 04:32:46',5,'en_US',3,'',0),(8,1,9,'2023-02-15 04:33:27','2023-02-15 04:33:19','2023-02-15 04:33:19',5,'en_US',3,'',0),(9,1,10,'2023-02-15 04:33:59','2023-02-15 04:33:51','2023-02-15 04:33:51',5,'en_US',3,'',0),(10,1,11,'2023-02-15 04:34:32','2023-02-15 04:34:24','2023-02-15 04:34:24',5,'en_US',3,'',0),(11,1,12,'2023-02-15 04:35:06','2023-02-15 04:34:58','2023-02-15 04:34:58',5,'en_US',3,'',0),(12,1,13,'2023-02-15 04:35:40','2023-02-15 04:35:31','2023-02-15 04:35:31',5,'en_US',3,'',0),(13,1,14,'2023-02-15 04:36:13','2023-02-15 04:36:05','2023-02-15 04:36:05',5,'en_US',3,'',0),(14,1,15,'2023-02-15 04:36:48','2023-02-15 04:36:39','2023-02-15 04:36:39',5,'en_US',3,'',0),(15,1,16,'2023-02-15 04:37:21','2023-02-15 04:37:12','2023-02-15 04:37:12',5,'en_US',3,'',0),(16,1,17,'2023-02-15 04:37:55','2023-02-15 04:37:46','2023-02-15 04:37:46',5,'en_US',3,'',0),(17,1,18,'2023-02-15 04:38:29','2023-02-15 04:38:20','2023-02-15 04:38:20',5,'en_US',3,'',0),(18,1,19,'2023-02-15 04:39:03','2023-02-15 04:38:54','2023-02-15 04:38:54',5,'en_US',3,'',0),(19,1,20,'2023-02-15 04:39:37','2023-02-15 04:39:28','2023-02-15 04:39:28',5,'en_US',3,'',0);
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
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin'),(1,'fr_CA','name','Administrateur-trice du site'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(2,'','nameLocaleKey','default.groups.name.manager'),(2,'en_US','abbrev','PSM'),(2,'en_US','name','Preprint Server manager'),(2,'fr_CA','abbrev','##default.groups.abbrev.manager##'),(2,'fr_CA','name','##default.groups.name.manager##'),(3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(3,'','nameLocaleKey','default.groups.name.sectionEditor'),(3,'en_US','abbrev','MOD'),(3,'en_US','name','Moderator'),(3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##'),(3,'fr_CA','name','##default.groups.name.sectionEditor##'),(4,'','abbrevLocaleKey','default.groups.abbrev.author'),(4,'','nameLocaleKey','default.groups.name.author'),(4,'en_US','abbrev','AU'),(4,'en_US','name','Author'),(4,'fr_CA','abbrev','AU'),(4,'fr_CA','name','Auteur-e'),(5,'','abbrevLocaleKey','default.groups.abbrev.reader'),(5,'','nameLocaleKey','default.groups.name.reader'),(5,'en_US','abbrev','Read'),(5,'en_US','name','Reader'),(5,'fr_CA','abbrev','Lect'),(5,'fr_CA','name','Lecteur-trice');
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
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
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
INSERT INTO `user_groups` VALUES (1,0,1,1,1,0,0),(2,1,16,1,1,0,1),(3,1,17,1,1,0,1),(4,1,65536,1,1,1,1),(5,1,1048576,1,1,1,0);
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
  `setting_value` mediumtext,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
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
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$epFMQdS81pLirjOwWHqohu4.8jsMSmJI.I4yQ5WkOi1A8YZobMFSO','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-02-15 04:24:40',NULL,'2023-02-15 04:27:05',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$nWcnjl6XKjYG8iMfViZI4ukJnDsyN/Xi0lgFCjxIqdn2BFapYjSVC','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-02-15 04:26:10',NULL,'2023-02-15 04:26:49',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$nQ37./o5IJ5RcAl743QkNuDuxW7vOoUUDCqj1toatEA4/eURjcp7O','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-02-15 04:26:16',NULL,'2023-02-15 04:39:29',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$d7erRMC.KPRpWOZSMdMicugP2lMDj3dzkrXpO5tA/pkFkyygm.n0.','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-02-15 04:26:23',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$Q55.rTLpkNJXoW4YAt8cneLU9ZX0DxLEVl7vJFRBK8jTkoBX/JtvS','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-02-15 04:26:30',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$md3J6LY.sOpGXNwaDqYm6uIxPjtql1MfM5sbHJLEmQ36Ox9qZFUlS','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-02-15 04:26:37',NULL,NULL,0,NULL,NULL,0,NULL,1),(7,'ccorino','$2y$10$5VvNNGOZy4NxFP3zpN.uaeIbLq3oc9gIYp4zl2/EiuTOJRAJDc9Ja','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2023-02-15 04:27:34',NULL,'2023-02-15 04:27:34',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$x9DAyipALLjbPEOXXPrn1uf97rnooGGfTxGfWrTrdtaghh.v0TATC','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-02-15 04:27:58',NULL,'2023-02-15 04:27:58',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$siw1muFcx8.oLe5ea91lsORdg68B9XvSDvjFEntPZuqNO7fvSd66G','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-02-15 04:29:22',NULL,'2023-02-15 04:29:22',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$EnESfQF8JATCUKG8nbNPJuZ3o1haN8s3np3QWopkrV8Q4LWNXUTpe','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2023-02-15 04:30:18',NULL,'2023-02-15 04:30:18',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$cm0NvPgLtlpl.0FSP87ZBeMaLx3odCVW2IGWF3uC8bhOLXankfTgK','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-02-15 04:31:10',NULL,'2023-02-15 04:31:10',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$ehHg5gFCxvXLGaekZVKwMey7keYhI9e2EFPh1y6mKI7tmEXqaSanq','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2023-02-15 04:31:56',NULL,'2023-02-15 04:31:56',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$/.EAuAgccSKX8fwdA49tgOMgIb7IjOU5AHi28S/UrvWuzZMrkZpEK','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-02-15 04:32:28',NULL,'2023-02-15 04:32:29',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$ieQqusr42kdSNgdXyto5aeOqpV0DeQc3EBW2aDc1r7j0KnidAgyPe','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2023-02-15 04:33:02',NULL,'2023-02-15 04:33:02',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$8eQ15UTCZ2afrIzFExIatOyU2Psf7QhQPjaQukpqi8FheuqJMD0q2','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2023-02-15 04:33:34',NULL,'2023-02-15 04:33:35',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$o4K059Os4kFDpyODJMplhOL3eu1N60.DvvRtFX7yRr1wZ8W/aecMS','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2023-02-15 04:34:07',NULL,'2023-02-15 04:34:07',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$Lox9Vo1yz8qsVPEgDuecyONY6.irFyMMHu2qi83EAp58iOJByMom2','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-02-15 04:34:40',NULL,'2023-02-15 04:34:41',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$IyiBqh3ryPPn7Gh0i41IjeM1kFb06qUl/I0B.hFKsuWebFD/iCu9.','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2023-02-15 04:35:15',NULL,'2023-02-15 04:35:15',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$zOMWWB7GOYuEGSZPmevCe.OnRvAj.79yf/D2PeY53cUd2hVcIsgy2','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2023-02-15 04:35:48',NULL,'2023-02-15 04:35:48',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$K6nZCkOB3k4YSxcaJ0IlRel1ynHt7JsnxLwzLgGxIWdIfOubhD8xy','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2023-02-15 04:36:22',NULL,'2023-02-15 04:36:22',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$VSBb7/ELQ27fdEI4rw5u.eQAvL/umG6Wg5HY2pHtshH4VeEtPIwYu','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2023-02-15 04:36:56',NULL,'2023-02-15 04:36:56',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$dwQO.mOadJxYN7vv2ez9ZulxBmXG9PEMd6Krnx1d./hhSX.aqH17G','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2023-02-15 04:37:29',NULL,'2023-02-15 04:37:29',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$/KWibrJRCm9.NRX0fpCX/.cUc.3kWsMqh1P/O5UWhgykVaJcLUI42','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2023-02-15 04:38:03',NULL,'2023-02-15 04:38:03',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$iGohFRaCZxNUeGMwvQAx..g4oZeM7FW9tcbRr.dP3B2MH5rv7eqdm','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-02-15 04:38:37',NULL,'2023-02-15 04:38:37',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$tELjXn7BxCglWkxJ1MFBVuGiO4ii2/TXlPBXl.kF37zgfCbxIxmeK','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-02-15 04:39:11',NULL,'2023-02-15 04:39:11',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2023-02-15 04:24:40',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2023-02-15 04:24:40',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(0,1,0,0,'2023-02-15 04:24:40',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,3,0,0,'2023-02-15 04:24:40',1,'plugins.generic','acron','AcronPlugin',1,1),(2,2,0,0,'2023-02-15 04:24:40',1,'plugins.generic','crossref','',0,0),(1,1,0,0,'2023-02-15 04:24:40',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,1,0,'2023-02-15 04:24:40',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2023-02-15 04:24:40',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,2,0,0,'2023-02-15 04:24:40',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2023-02-15 04:24:40',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2023-02-15 04:24:33',1,'core','ops','',0,1);
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

-- Dump completed on 2023-02-15  4:39:39
