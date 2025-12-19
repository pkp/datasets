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
INSERT INTO `author_settings` VALUES (1,'','country','IT'),(1,'en_US','affiliation','University of Bologna'),(1,'en_US','familyName','Corino'),(1,'en_US','givenName','Carlo'),(2,'','country','CA'),(2,'en_US','affiliation','University of Windsor'),(2,'en_US','familyName','Kwantes'),(2,'en_US','givenName','Catherine'),(3,'','country','FI'),(3,'','orcid',''),(3,'','url',''),(3,'en_US','affiliation','Academy of Finland'),(3,'en_US','biography',''),(3,'en_US','familyName','Kekkonen'),(3,'en_US','givenName','Urho'),(3,'en_US','preferredPublicName',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(4,'','country','CA'),(4,'en_US','affiliation','University of Alberta'),(4,'en_US','familyName','Montgomerie'),(4,'en_US','givenName','Craig'),(5,'','country','CA'),(5,'','orcid',''),(5,'','url',''),(5,'en_US','affiliation','University of Victoria'),(5,'en_US','biography',''),(5,'en_US','familyName','Irvine'),(5,'en_US','givenName','Mark'),(5,'en_US','preferredPublicName',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(6,'','country','CA'),(6,'en_US','affiliation','University of Alberta'),(6,'en_US','familyName','Montgomerie'),(6,'en_US','givenName','Craig'),(7,'','country','CA'),(7,'','orcid',''),(7,'','url',''),(7,'en_US','affiliation','University of Victoria'),(7,'en_US','biography',''),(7,'en_US','familyName','Irvine'),(7,'en_US','givenName','Mark'),(7,'en_US','preferredPublicName',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(8,'','country','EG'),(8,'en_US','affiliation','Alexandria University'),(8,'en_US','familyName','Diouf'),(8,'en_US','givenName','Diaga'),(9,'','country','CA'),(9,'en_US','affiliation','University of Toronto'),(9,'en_US','familyName','Phillips'),(9,'en_US','givenName','Dana'),(10,'','country','IE'),(10,'en_US','affiliation','University College Cork'),(10,'en_US','familyName','Sokoloff'),(10,'en_US','givenName','Domatilia'),(11,'','country','US'),(11,'en_US','affiliation','Indiana University'),(11,'en_US','familyName','Ostrom'),(11,'en_US','givenName','Elinor'),(12,'','country','US'),(12,'','orcid',''),(12,'','url',''),(12,'en_US','affiliation','Indiana University'),(12,'en_US','biography',''),(12,'en_US','familyName','van Laerhoven'),(12,'en_US','givenName','Frank'),(12,'en_US','preferredPublicName',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(13,'','country','IT'),(13,'en_US','affiliation','University of Rome'),(13,'en_US','familyName','Paglieri'),(13,'en_US','givenName','Fabio'),(14,'','country','ZA'),(14,'en_US','affiliation','University of Cape Town'),(14,'en_US','familyName','Mwandenga'),(14,'en_US','givenName','John'),(15,'','country','DK'),(15,'en_US','affiliation','Aalborg University'),(15,'en_US','familyName','Novak'),(15,'en_US','givenName','John'),(16,'','country','US'),(16,'en_US','affiliation','Stanford University'),(16,'en_US','familyName','Al-Khafaji'),(16,'en_US','givenName','Karim'),(17,'','country','US'),(17,'','orcid',''),(17,'','url',''),(17,'en_US','affiliation','Stanford University'),(17,'en_US','biography',''),(17,'en_US','familyName','Morse'),(17,'en_US','givenName','Margaret'),(17,'en_US','preferredPublicName',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(18,'','country','AU'),(18,'en_US','affiliation','Australian National University'),(18,'en_US','familyName','Christopher'),(18,'en_US','givenName','Leo'),(19,'','country','ZA'),(19,'en_US','affiliation','University of Cape Town'),(19,'en_US','familyName','Kumiega'),(19,'en_US','givenName','Lise'),(20,'','country','GB'),(20,'en_US','affiliation','University of Wolverhampton'),(20,'en_US','familyName','Daniel'),(20,'en_US','givenName','Patricia'),(21,'','country','KE'),(21,'en_US','affiliation','University of Nairobi'),(21,'en_US','familyName','Baiyewu'),(21,'en_US','givenName','Rana'),(22,'','country','ES'),(22,'en_US','affiliation','Barcelona University'),(22,'en_US','familyName','Rossi'),(22,'en_US','givenName','Rosanna'),(23,'','country','IR'),(23,'en_US','affiliation','University of Tehran'),(23,'en_US','familyName','Karbasizaed'),(23,'en_US','givenName','Vajiheh'),(24,'','country','CA'),(24,'en_US','affiliation','University of Windsor'),(24,'en_US','familyName','Williamson'),(24,'en_US','givenName','Valerie'),(25,'','country','US'),(25,'en_US','affiliation','CUNY'),(25,'en_US','familyName','Woods'),(25,'en_US','givenName','Zita');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,0.00,4),(2,'ckwantes@mailinator.com',1,2,0.00,4),(3,'ukk@mailinator.com',1,2,1.00,4),(4,'cmontgomerie@mailinator.com',1,3,0.00,4),(5,'mirvine@mailinator.com',1,3,1.00,4),(6,'cmontgomerie@mailinator.com',1,4,0.00,4),(7,'mirvine@mailinator.com',1,4,1.00,4),(8,'ddiouf@mailinator.com',1,5,0.00,4),(9,'dphillips@mailinator.com',1,6,0.00,4),(10,'dsokoloff@mailinator.com',1,7,0.00,4),(11,'eostrom@mailinator.com',1,8,0.00,4),(12,'fvanlaerhoven@mailinator.com',1,8,1.00,4),(13,'fpaglieri@mailinator.com',1,9,0.00,4),(14,'jmwandenga@mailinator.com',1,10,0.00,4),(15,'jnovak@mailinator.com',1,11,0.00,4),(16,'kalkhafaji@mailinator.com',1,12,0.00,4),(17,'mmorse@mailinator.com',1,12,1.00,4),(18,'lchristopher@mailinator.com',1,13,0.00,4),(19,'lkumiega@mailinator.com',1,14,0.00,4),(20,'pdaniel@mailinator.com',1,15,0.00,4),(21,'rbaiyewu@mailinator.com',1,16,0.00,4),(22,'rrossi@mailinator.com',1,17,0.00,4),(23,'vkarbasizaed@mailinator.com',1,18,0.00,4),(24,'vwilliamson@mailinator.com',1,19,0.00,4),(25,'zwoods@mailinator.com',1,20,0.00,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,0,0,'history','a:0:{}'),(2,1,0,0,'biology','a:0:{}'),(3,1,0,0,'social-sciences','a:0:{}'),(4,1,0,0,'mathematics','a:0:{}'),(5,1,1,0,'cultural-history','a:0:{}');
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
INSERT INTO `category_settings` VALUES (1,'','sortOption','title-1','string'),(1,'en_US','description','','string'),(1,'en_US','title','History','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','title','','string'),(2,'','sortOption','title-1','string'),(2,'en_US','description','','string'),(2,'en_US','title','Biology','string'),(2,'fr_CA','description','','string'),(2,'fr_CA','title','','string'),(3,'','sortOption','title-1','string'),(3,'en_US','description','','string'),(3,'en_US','title','Social sciences','string'),(3,'fr_CA','description','','string'),(3,'fr_CA','title','','string'),(4,'','sortOption','title-1','string'),(4,'en_US','description','','string'),(4,'en_US','title','Mathematics','string'),(4,'fr_CA','description','','string'),(4,'fr_CA','title','','string'),(5,'','sortOption','title-1','string'),(5,'en_US','description','','string'),(5,'en_US','title','Cultural History','string'),(5,'fr_CA','description','','string'),(5,'fr_CA','title','','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,2,1.00),(2,2,2.00),(14,7,1.00),(15,7,2.00),(16,7,3.00),(46,12,1.00),(47,12,2.00),(48,12,3.00),(49,12,4.00),(50,12,5.00),(51,12,6.00),(52,12,7.00),(53,12,8.00),(78,17,1.00),(79,17,2.00),(80,17,3.00),(81,17,4.00),(82,17,5.00),(83,17,6.00),(84,17,7.00),(85,17,8.00),(88,32,1.00),(89,32,2.00),(93,37,1.00),(94,37,2.00),(95,37,3.00),(97,52,1.00),(102,57,1.00),(103,57,2.00),(104,57,3.00),(105,57,4.00),(108,62,1.00),(109,62,2.00),(111,67,1.00),(122,72,1.00),(123,72,2.00),(124,72,3.00),(125,72,4.00),(126,72,5.00),(127,72,6.00),(128,72,7.00),(129,72,8.00),(130,72,9.00),(131,72,10.00),(134,82,1.00),(135,82,2.00),(139,92,1.00),(140,92,2.00),(141,92,3.00);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'en_US','submissionKeyword','pigs','string'),(2,'en_US','submissionKeyword','food security','string'),(14,'en_US','submissionKeyword','employees','string'),(15,'en_US','submissionKeyword','survey','string'),(16,'en_US','submissionKeyword','multinational','string'),(46,'en_US','submissionKeyword','Integrating Technology','string'),(47,'en_US','submissionKeyword','Computer Skills','string'),(48,'en_US','submissionKeyword','Survey','string'),(49,'en_US','submissionKeyword','Alberta','string'),(50,'en_US','submissionKeyword','National','string'),(51,'en_US','submissionKeyword','Provincial','string'),(52,'en_US','submissionKeyword','Professional Development','string'),(53,'en_US','submissionKeyword','employees','string'),(78,'en_US','submissionKeyword','Integrating Technology','string'),(79,'en_US','submissionKeyword','Computer Skills','string'),(80,'en_US','submissionKeyword','Survey','string'),(81,'en_US','submissionKeyword','Alberta','string'),(82,'en_US','submissionKeyword','National','string'),(83,'en_US','submissionKeyword','Provincial','string'),(84,'en_US','submissionKeyword','Professional Development','string'),(85,'en_US','submissionKeyword','employees','string'),(88,'en_US','submissionKeyword','education','string'),(89,'en_US','submissionKeyword','citizenship','string'),(93,'en_US','submissionKeyword','Common pool resource','string'),(94,'en_US','submissionKeyword','common property','string'),(95,'en_US','submissionKeyword','intellectual developments','string'),(97,'en_US','submissionKeyword','water','string'),(102,'en_US','submissionKeyword','Development','string'),(103,'en_US','submissionKeyword','engineering education','string'),(104,'en_US','submissionKeyword','service learning','string'),(105,'en_US','submissionKeyword','sustainability','string'),(108,'en_US','submissionKeyword','pigs','string'),(109,'en_US','submissionKeyword','food security','string'),(111,'en_US','submissionKeyword','water','string'),(122,'en_US','submissionKeyword','21st Century','string'),(123,'en_US','submissionKeyword','Diversity','string'),(124,'en_US','submissionKeyword','Multilingual','string'),(125,'en_US','submissionKeyword','Multiethnic','string'),(126,'en_US','submissionKeyword','Participatory Pedagogy','string'),(127,'en_US','submissionKeyword','Language','string'),(128,'en_US','submissionKeyword','Culture','string'),(129,'en_US','submissionKeyword','Gender','string'),(130,'en_US','submissionKeyword','Egalitarianism','string'),(131,'en_US','submissionKeyword','Social Transformation','string'),(134,'en_US','submissionKeyword','cattle','string'),(135,'en_US','submissionKeyword','food security','string'),(139,'en_US','submissionKeyword','Self-Organization','string'),(140,'en_US','submissionKeyword','Multi-Level Institutions','string'),(141,'en_US','submissionKeyword','Goverance','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
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
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,7,'2025-12-19 05:17:18',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Carlo Corino:<br />\n<br />\nThank you for submitting the manuscript, &quot;The influence of lactation on the quantity and quality of cashmere production&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/1\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a><br />\nUsername: ccorino<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(2,1048585,2,8,'2025-12-19 05:17:36',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Catherine Kwantes:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/2\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/2</a><br />\nUsername: ckwantes<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(3,1048585,2,3,'2025-12-19 05:17:48',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/2\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/2</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(4,1048585,3,9,'2025-12-19 05:18:08',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Craig Montgomerie:<br />\n<br />\nThank you for submitting the manuscript, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/3\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/3</a><br />\nUsername: cmontgomerie<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(5,1048585,3,9,'2025-12-19 05:18:08',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>',NULL,NULL,'[JPKPKP] Submission Acknowledgement','Hello,<br />\n<br />\nCraig Montgomerie has submitted the manuscript, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; to Public Knowledge Preprint Server. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(6,1048585,3,3,'2025-12-19 05:18:12',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/3\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/3</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(7,1048585,3,3,'2025-12-19 05:18:20',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/3\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/3</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(8,1048585,4,10,'2025-12-19 05:18:45',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Diaga Diouf:<br />\n<br />\nThank you for submitting the manuscript, &quot;Genetic transformation of forest trees&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/4\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a><br />\nUsername: ddiouf<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(9,1048585,4,3,'2025-12-19 05:18:48',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Genetic transformation of forest trees&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/4\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/4</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(10,1048585,5,11,'2025-12-19 05:19:07',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Dana Phillips:<br />\n<br />\nThank you for submitting the manuscript, &quot;Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/5\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a><br />\nUsername: dphillips<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(11,1048585,5,3,'2025-12-19 05:19:10',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/5\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/5</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(12,1048585,6,12,'2025-12-19 05:19:28',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Domatilia Sokoloff:<br />\n<br />\nThank you for submitting the manuscript, &quot;Developing efficacy beliefs in the classroom&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/6\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/6</a><br />\nUsername: dsokoloff<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(13,1048585,6,3,'2025-12-19 05:19:31',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Developing efficacy beliefs in the classroom&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/6\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/6</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(14,1048585,7,13,'2025-12-19 05:19:51',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Elinor Ostrom:<br />\n<br />\nThank you for submitting the manuscript, &quot;Traditions and Trends in the Study of the Commons&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/7\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a><br />\nUsername: eostrom<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(15,1048585,7,13,'2025-12-19 05:19:51',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>',NULL,NULL,'[JPKPKP] Submission Acknowledgement','Hello,<br />\n<br />\nElinor Ostrom has submitted the manuscript, &quot;Traditions and Trends in the Study of the Commons&quot; to Public Knowledge Preprint Server. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(16,1048585,7,3,'2025-12-19 05:19:55',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Traditions and Trends in the Study of the Commons&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/7\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/7</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(17,1048585,8,14,'2025-12-19 05:20:12',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Fabio Paglieri:<br />\n<br />\nThank you for submitting the manuscript, &quot;Hansen &amp; Pinto: Reason Reclaimed&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/8\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/8</a><br />\nUsername: fpaglieri<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(18,1048585,8,3,'2025-12-19 05:20:16',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Hansen &amp; Pinto: Reason Reclaimed&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/8\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/8</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(19,1048585,9,15,'2025-12-19 05:20:34',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','John Mwandenga:<br />\n<br />\nThank you for submitting the manuscript, &quot;Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/9\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/9</a><br />\nUsername: jmwandenga<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(20,1048585,9,3,'2025-12-19 05:20:38',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/9\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/9</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(21,1048585,10,16,'2025-12-19 05:20:55',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','John Novak:<br />\n<br />\nThank you for submitting the manuscript, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/10\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/10</a><br />\nUsername: jnovak<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(22,1048585,10,3,'2025-12-19 05:20:59',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Condensing Water Availability Models to Focus on Specific Water Management Systems&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/10\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/10</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(23,1048585,11,17,'2025-12-19 05:21:19',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Karim Al-Khafaji:<br />\n<br />\nThank you for submitting the manuscript, &quot;Learning Sustainable Design through Service&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/11\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a><br />\nUsername: kalkhafaji<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(24,1048585,11,17,'2025-12-19 05:21:19',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>',NULL,NULL,'[JPKPKP] Submission Acknowledgement','Hello,<br />\n<br />\nKarim Al-Khafaji has submitted the manuscript, &quot;Learning Sustainable Design through Service&quot; to Public Knowledge Preprint Server. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(25,1048585,11,3,'2025-12-19 05:21:23',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Learning Sustainable Design through Service&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/11\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/11</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(26,1048585,12,18,'2025-12-19 05:21:41',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Leo Christopher:<br />\n<br />\nThank you for submitting the manuscript, &quot;Sodium butyrate improves growth performance of weaned piglets during the first period after weaning&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/12\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/12</a><br />\nUsername: lchristopher<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(27,1048585,12,3,'2025-12-19 05:21:45',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Sodium butyrate improves growth performance of weaned piglets during the first period after weaning&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/12\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/12</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(28,1048585,13,19,'2025-12-19 05:22:03',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Lise Kumiega:<br />\n<br />\nThank you for submitting the manuscript, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/13\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a><br />\nUsername: lkumiega<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(29,1048585,13,3,'2025-12-19 05:22:07',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/13\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/13</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(30,1048585,14,20,'2025-12-19 05:22:24',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Patricia Daniel:<br />\n<br />\nThank you for submitting the manuscript, &quot;Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/14\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a><br />\nUsername: pdaniel<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(31,1048585,14,3,'2025-12-19 05:22:28',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/14\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/14</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(32,1048585,15,21,'2025-12-19 05:22:46',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Rana Baiyewu:<br />\n<br />\nThank you for submitting the manuscript, &quot;Yam diseases and its management in Nigeria&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/15\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/15</a><br />\nUsername: rbaiyewu<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(33,1048585,15,3,'2025-12-19 05:22:49',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Yam diseases and its management in Nigeria&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/15\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/15</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(34,1048585,16,22,'2025-12-19 05:23:07',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Rosanna Rossi:<br />\n<br />\nThank you for submitting the manuscript, &quot;Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/16\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/16</a><br />\nUsername: rrossi<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(35,1048585,16,3,'2025-12-19 05:23:11',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/16\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/16</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(36,1048585,17,23,'2025-12-19 05:23:30',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Vajiheh Karbasizaed:<br />\n<br />\nThank you for submitting the manuscript, &quot;Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/17\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/17</a><br />\nUsername: vkarbasizaed<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(37,1048585,17,3,'2025-12-19 05:23:33',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/17\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/17</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(38,1048585,18,24,'2025-12-19 05:23:52',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Valerie Williamson:<br />\n<br />\nThank you for submitting the manuscript, &quot;Self-Organization in Multi-Level Institutions in Networked Environments&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/18\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/18</a><br />\nUsername: vwilliamson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(39,1048585,18,3,'2025-12-19 05:23:56',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Self-Organization in Multi-Level Institutions in Networked Environments&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/18\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/18</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(40,1048585,19,25,'2025-12-19 05:24:14',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>',NULL,'dbuskins@mailinator.com, sberardo@mailinator.com','[JPKPKP] Submission Acknowledgement','Zita Woods:<br />\n<br />\nThank you for submitting the manuscript, &quot;Finocchiaro: Arguments About Arguments&quot; to Public Knowledge Preprint Server. You can manage your submission by logging in to the server web site.<br />\n<br />\nAuthors on this server can not post by themselves. The server has been notified of your submission, and you\'ve been emailed a confirmation for your records. Once the moderator has reviewed the submission, they will post your preprint or contact you.<br />\n<br />\nSubmission URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/19\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/19</a><br />\nUsername: zwoods<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>'),(41,1048585,19,3,'2025-12-19 05:24:18',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPKPKP] Preprint Posted Acknowledgement','Daniel Barnes:<br />\n<br />\nYour preprint, &quot;Finocchiaro: Arguments About Arguments&quot; has been posted online on Public Knowledge Preprint Server.<br />\n<br />\nPreprint URL: <a href=\'http://localhost/index.php/publicknowledge/preprint/view/19\' class=\'publicationUrl-style-class\'>http://localhost/index.php/publicknowledge/preprint/view/19</a><br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\nRamiro Vaca<br/><br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>');
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
INSERT INTO `email_log_users` VALUES (1,7),(2,8),(3,3),(4,9),(6,3),(7,3),(8,10),(9,3),(10,11),(11,3),(12,12),(13,3),(14,13),(16,3),(17,14),(18,3),(19,15),(20,3),(21,16),(22,3),(23,17),(25,3),(26,18),(27,3),(28,19),(29,3),(30,20),(31,3),(32,21),(33,3),(34,22),(35,3),(36,23),(37,3),(38,24),(39,3),(40,25),(41,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'USER_REGISTER',0,1,NULL,NULL,NULL),(5,'USER_VALIDATE',0,1,NULL,NULL,NULL),(6,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(7,'SUBMISSION_ACK',1,1,NULL,65536,5),(8,'POSTED_ACK',1,1,NULL,65536,5),(9,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,5),(10,'EDITOR_ASSIGN',1,1,16,16,5),(11,'EDITOR_DECISION_ACCEPT',0,1,16,65536,5),(12,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,5),(13,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(14,'ANNOUNCEMENT',0,1,16,1048576,NULL),(15,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(16,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Moderator Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the moderator declines his submission initially.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('POSTED_ACK','en_US','Preprint Posted Acknowledgement','{$authorName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$contextName}.<br />\n<br />\nPreprint URL: {$publicationUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.'),('PUBLISH_NOTIFY','en_US','New Preprint Posted','Readers:<br />\n<br />\n{$contextName} has just posted its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$contextName} vient d\'être publiée à l\'adresse suivante : {$contextUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$editorialContactSignature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$authorName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$contextName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$contextName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName},<br />\n<br />\nVous avez créé un compte avec {$contextName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.');
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2025-12-19 05:17:05',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2025-12-19 05:17:13',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2025-12-19 05:17:13',1342177288,'submission.event.fileRevised',0),(4,515,1,7,'2025-12-19 05:17:15',1342177296,'submission.event.fileEdited',0),(5,1048585,1,7,'2025-12-19 05:17:15',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2025-12-19 05:17:17',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,7,'2025-12-19 05:17:18',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2025-12-19 05:17:23',268435458,'submission.event.general.metadataUpdated',0),(9,515,2,8,'2025-12-19 05:17:31',1342177281,'submission.event.fileUploaded',0),(10,1048585,2,8,'2025-12-19 05:17:31',1342177288,'submission.event.fileRevised',0),(11,515,2,8,'2025-12-19 05:17:33',1342177296,'submission.event.fileEdited',0),(12,1048585,2,8,'2025-12-19 05:17:33',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2025-12-19 05:17:35',268435458,'submission.event.general.metadataUpdated',0),(14,1048585,2,8,'2025-12-19 05:17:36',268435457,'submission.event.submissionSubmitted',0),(15,1048585,2,8,'2025-12-19 05:17:38',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,8,'2025-12-19 05:17:42',268435458,'submission.event.general.metadataUpdated',0),(17,1048585,2,8,'2025-12-19 05:17:44',268435458,'submission.event.general.metadataUpdated',0),(18,1048585,2,3,'2025-12-19 05:17:48',268435462,'publication.event.published',0),(19,1048585,3,9,'2025-12-19 05:17:53',268435458,'submission.event.general.metadataUpdated',0),(20,515,3,9,'2025-12-19 05:18:01',1342177281,'submission.event.fileUploaded',0),(21,1048585,3,9,'2025-12-19 05:18:01',1342177288,'submission.event.fileRevised',0),(22,515,3,9,'2025-12-19 05:18:03',1342177296,'submission.event.fileEdited',0),(23,1048585,3,9,'2025-12-19 05:18:03',1342177296,'submission.event.fileEdited',0),(24,1048585,3,9,'2025-12-19 05:18:07',268435458,'submission.event.general.metadataUpdated',0),(25,1048585,3,9,'2025-12-19 05:18:07',268435458,'submission.event.general.metadataUpdated',0),(26,1048585,3,9,'2025-12-19 05:18:08',268435457,'submission.event.submissionSubmitted',0),(27,1048585,3,3,'2025-12-19 05:18:12',268435462,'publication.event.published',0),(28,1048585,3,3,'2025-12-19 05:18:16',268435463,'publication.event.unpublished',0),(29,1048585,3,3,'2025-12-19 05:18:18',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,3,3,'2025-12-19 05:18:20',268435462,'publication.event.published',0),(31,1048585,3,3,'2025-12-19 05:18:22',268435458,'submission.event.general.metadataUpdated',0),(32,1048585,3,3,'2025-12-19 05:18:22',268435464,'publication.event.versionCreated',0),(33,1048585,3,3,'2025-12-19 05:18:25',268435458,'submission.event.general.metadataUpdated',0),(34,1048585,3,3,'2025-12-19 05:18:27',268435462,'publication.event.versionPublished',0),(35,1048585,4,10,'2025-12-19 05:18:32',268435458,'submission.event.general.metadataUpdated',0),(36,515,4,10,'2025-12-19 05:18:40',1342177281,'submission.event.fileUploaded',0),(37,1048585,4,10,'2025-12-19 05:18:40',1342177288,'submission.event.fileRevised',0),(38,515,4,10,'2025-12-19 05:18:43',1342177296,'submission.event.fileEdited',0),(39,1048585,4,10,'2025-12-19 05:18:43',1342177296,'submission.event.fileEdited',0),(40,1048585,4,10,'2025-12-19 05:18:44',268435458,'submission.event.general.metadataUpdated',0),(41,1048585,4,10,'2025-12-19 05:18:45',268435457,'submission.event.submissionSubmitted',0),(42,1048585,4,3,'2025-12-19 05:18:48',268435462,'publication.event.published',0),(43,1048585,5,11,'2025-12-19 05:18:53',268435458,'submission.event.general.metadataUpdated',0),(44,515,5,11,'2025-12-19 05:19:02',1342177281,'submission.event.fileUploaded',0),(45,1048585,5,11,'2025-12-19 05:19:02',1342177288,'submission.event.fileRevised',0),(46,515,5,11,'2025-12-19 05:19:04',1342177296,'submission.event.fileEdited',0),(47,1048585,5,11,'2025-12-19 05:19:04',1342177296,'submission.event.fileEdited',0),(48,1048585,5,11,'2025-12-19 05:19:06',268435458,'submission.event.general.metadataUpdated',0),(49,1048585,5,11,'2025-12-19 05:19:07',268435457,'submission.event.submissionSubmitted',0),(50,1048585,5,3,'2025-12-19 05:19:10',268435462,'publication.event.published',0),(51,1048585,6,12,'2025-12-19 05:19:15',268435458,'submission.event.general.metadataUpdated',0),(52,515,6,12,'2025-12-19 05:19:23',1342177281,'submission.event.fileUploaded',0),(53,1048585,6,12,'2025-12-19 05:19:23',1342177288,'submission.event.fileRevised',0),(54,515,6,12,'2025-12-19 05:19:25',1342177296,'submission.event.fileEdited',0),(55,1048585,6,12,'2025-12-19 05:19:25',1342177296,'submission.event.fileEdited',0),(56,1048585,6,12,'2025-12-19 05:19:27',268435458,'submission.event.general.metadataUpdated',0),(57,1048585,6,12,'2025-12-19 05:19:28',268435457,'submission.event.submissionSubmitted',0),(58,1048585,6,3,'2025-12-19 05:19:31',268435462,'publication.event.published',0),(59,1048585,7,13,'2025-12-19 05:19:36',268435458,'submission.event.general.metadataUpdated',0),(60,515,7,13,'2025-12-19 05:19:45',1342177281,'submission.event.fileUploaded',0),(61,1048585,7,13,'2025-12-19 05:19:45',1342177288,'submission.event.fileRevised',0),(62,515,7,13,'2025-12-19 05:19:47',1342177296,'submission.event.fileEdited',0),(63,1048585,7,13,'2025-12-19 05:19:47',1342177296,'submission.event.fileEdited',0),(64,1048585,7,13,'2025-12-19 05:19:50',268435458,'submission.event.general.metadataUpdated',0),(65,1048585,7,13,'2025-12-19 05:19:51',268435458,'submission.event.general.metadataUpdated',0),(66,1048585,7,13,'2025-12-19 05:19:51',268435457,'submission.event.submissionSubmitted',0),(67,1048585,7,3,'2025-12-19 05:19:55',268435462,'publication.event.published',0),(68,1048585,8,14,'2025-12-19 05:20:00',268435458,'submission.event.general.metadataUpdated',0),(69,515,8,14,'2025-12-19 05:20:08',1342177281,'submission.event.fileUploaded',0),(70,1048585,8,14,'2025-12-19 05:20:08',1342177288,'submission.event.fileRevised',0),(71,515,8,14,'2025-12-19 05:20:10',1342177296,'submission.event.fileEdited',0),(72,1048585,8,14,'2025-12-19 05:20:10',1342177296,'submission.event.fileEdited',0),(73,1048585,8,14,'2025-12-19 05:20:12',268435458,'submission.event.general.metadataUpdated',0),(74,1048585,8,14,'2025-12-19 05:20:12',268435457,'submission.event.submissionSubmitted',0),(75,1048585,8,3,'2025-12-19 05:20:16',268435462,'publication.event.published',0),(76,1048585,9,15,'2025-12-19 05:20:21',268435458,'submission.event.general.metadataUpdated',0),(77,515,9,15,'2025-12-19 05:20:29',1342177281,'submission.event.fileUploaded',0),(78,1048585,9,15,'2025-12-19 05:20:29',1342177288,'submission.event.fileRevised',0),(79,515,9,15,'2025-12-19 05:20:31',1342177296,'submission.event.fileEdited',0),(80,1048585,9,15,'2025-12-19 05:20:31',1342177296,'submission.event.fileEdited',0),(81,1048585,9,15,'2025-12-19 05:20:33',268435458,'submission.event.general.metadataUpdated',0),(82,1048585,9,15,'2025-12-19 05:20:34',268435457,'submission.event.submissionSubmitted',0),(83,1048585,9,3,'2025-12-19 05:20:37',268435462,'publication.event.published',0),(84,1048585,10,16,'2025-12-19 05:20:42',268435458,'submission.event.general.metadataUpdated',0),(85,515,10,16,'2025-12-19 05:20:51',1342177281,'submission.event.fileUploaded',0),(86,1048585,10,16,'2025-12-19 05:20:51',1342177288,'submission.event.fileRevised',0),(87,515,10,16,'2025-12-19 05:20:53',1342177296,'submission.event.fileEdited',0),(88,1048585,10,16,'2025-12-19 05:20:53',1342177296,'submission.event.fileEdited',0),(89,1048585,10,16,'2025-12-19 05:20:55',268435458,'submission.event.general.metadataUpdated',0),(90,1048585,10,16,'2025-12-19 05:20:55',268435457,'submission.event.submissionSubmitted',0),(91,1048585,10,3,'2025-12-19 05:20:59',268435462,'publication.event.published',0),(92,1048585,11,17,'2025-12-19 05:21:04',268435458,'submission.event.general.metadataUpdated',0),(93,515,11,17,'2025-12-19 05:21:12',1342177281,'submission.event.fileUploaded',0),(94,1048585,11,17,'2025-12-19 05:21:12',1342177288,'submission.event.fileRevised',0),(95,515,11,17,'2025-12-19 05:21:14',1342177296,'submission.event.fileEdited',0),(96,1048585,11,17,'2025-12-19 05:21:14',1342177296,'submission.event.fileEdited',0),(97,1048585,11,17,'2025-12-19 05:21:18',268435458,'submission.event.general.metadataUpdated',0),(98,1048585,11,17,'2025-12-19 05:21:18',268435458,'submission.event.general.metadataUpdated',0),(99,1048585,11,17,'2025-12-19 05:21:19',268435457,'submission.event.submissionSubmitted',0),(100,1048585,11,3,'2025-12-19 05:21:23',268435462,'publication.event.published',0),(101,1048585,12,18,'2025-12-19 05:21:28',268435458,'submission.event.general.metadataUpdated',0),(102,515,12,18,'2025-12-19 05:21:36',1342177281,'submission.event.fileUploaded',0),(103,1048585,12,18,'2025-12-19 05:21:36',1342177288,'submission.event.fileRevised',0),(104,515,12,18,'2025-12-19 05:21:38',1342177296,'submission.event.fileEdited',0),(105,1048585,12,18,'2025-12-19 05:21:38',1342177296,'submission.event.fileEdited',0),(106,1048585,12,18,'2025-12-19 05:21:40',268435458,'submission.event.general.metadataUpdated',0),(107,1048585,12,18,'2025-12-19 05:21:41',268435457,'submission.event.submissionSubmitted',0),(108,1048585,12,3,'2025-12-19 05:21:44',268435462,'publication.event.published',0),(109,1048585,13,19,'2025-12-19 05:21:49',268435458,'submission.event.general.metadataUpdated',0),(110,515,13,19,'2025-12-19 05:21:58',1342177281,'submission.event.fileUploaded',0),(111,1048585,13,19,'2025-12-19 05:21:58',1342177288,'submission.event.fileRevised',0),(112,515,13,19,'2025-12-19 05:22:00',1342177296,'submission.event.fileEdited',0),(113,1048585,13,19,'2025-12-19 05:22:00',1342177296,'submission.event.fileEdited',0),(114,1048585,13,19,'2025-12-19 05:22:02',268435458,'submission.event.general.metadataUpdated',0),(115,1048585,13,19,'2025-12-19 05:22:03',268435457,'submission.event.submissionSubmitted',0),(116,1048585,13,3,'2025-12-19 05:22:06',268435462,'publication.event.published',0),(117,1048585,14,20,'2025-12-19 05:22:11',268435458,'submission.event.general.metadataUpdated',0),(118,515,14,20,'2025-12-19 05:22:20',1342177281,'submission.event.fileUploaded',0),(119,1048585,14,20,'2025-12-19 05:22:20',1342177288,'submission.event.fileRevised',0),(120,515,14,20,'2025-12-19 05:22:22',1342177296,'submission.event.fileEdited',0),(121,1048585,14,20,'2025-12-19 05:22:22',1342177296,'submission.event.fileEdited',0),(122,1048585,14,20,'2025-12-19 05:22:24',268435458,'submission.event.general.metadataUpdated',0),(123,1048585,14,20,'2025-12-19 05:22:24',268435457,'submission.event.submissionSubmitted',0),(124,1048585,14,3,'2025-12-19 05:22:28',268435462,'publication.event.published',0),(125,1048585,15,21,'2025-12-19 05:22:33',268435458,'submission.event.general.metadataUpdated',0),(126,515,15,21,'2025-12-19 05:22:41',1342177281,'submission.event.fileUploaded',0),(127,1048585,15,21,'2025-12-19 05:22:41',1342177288,'submission.event.fileRevised',0),(128,515,15,21,'2025-12-19 05:22:43',1342177296,'submission.event.fileEdited',0),(129,1048585,15,21,'2025-12-19 05:22:43',1342177296,'submission.event.fileEdited',0),(130,1048585,15,21,'2025-12-19 05:22:45',268435458,'submission.event.general.metadataUpdated',0),(131,1048585,15,21,'2025-12-19 05:22:46',268435457,'submission.event.submissionSubmitted',0),(132,1048585,15,3,'2025-12-19 05:22:49',268435462,'publication.event.published',0),(133,1048585,16,22,'2025-12-19 05:22:54',268435458,'submission.event.general.metadataUpdated',0),(134,515,16,22,'2025-12-19 05:23:03',1342177281,'submission.event.fileUploaded',0),(135,1048585,16,22,'2025-12-19 05:23:03',1342177288,'submission.event.fileRevised',0),(136,515,16,22,'2025-12-19 05:23:05',1342177296,'submission.event.fileEdited',0),(137,1048585,16,22,'2025-12-19 05:23:05',1342177296,'submission.event.fileEdited',0),(138,1048585,16,22,'2025-12-19 05:23:07',268435458,'submission.event.general.metadataUpdated',0),(139,1048585,16,22,'2025-12-19 05:23:07',268435457,'submission.event.submissionSubmitted',0),(140,1048585,16,3,'2025-12-19 05:23:11',268435462,'publication.event.published',0),(141,1048585,17,23,'2025-12-19 05:23:16',268435458,'submission.event.general.metadataUpdated',0),(142,515,17,23,'2025-12-19 05:23:25',1342177281,'submission.event.fileUploaded',0),(143,1048585,17,23,'2025-12-19 05:23:25',1342177288,'submission.event.fileRevised',0),(144,515,17,23,'2025-12-19 05:23:27',1342177296,'submission.event.fileEdited',0),(145,1048585,17,23,'2025-12-19 05:23:27',1342177296,'submission.event.fileEdited',0),(146,1048585,17,23,'2025-12-19 05:23:29',268435458,'submission.event.general.metadataUpdated',0),(147,1048585,17,23,'2025-12-19 05:23:30',268435457,'submission.event.submissionSubmitted',0),(148,1048585,17,3,'2025-12-19 05:23:33',268435462,'publication.event.published',0),(149,1048585,18,24,'2025-12-19 05:23:39',268435458,'submission.event.general.metadataUpdated',0),(150,515,18,24,'2025-12-19 05:23:47',1342177281,'submission.event.fileUploaded',0),(151,1048585,18,24,'2025-12-19 05:23:47',1342177288,'submission.event.fileRevised',0),(152,515,18,24,'2025-12-19 05:23:50',1342177296,'submission.event.fileEdited',0),(153,1048585,18,24,'2025-12-19 05:23:50',1342177296,'submission.event.fileEdited',0),(154,1048585,18,24,'2025-12-19 05:23:51',268435458,'submission.event.general.metadataUpdated',0),(155,1048585,18,24,'2025-12-19 05:23:52',268435457,'submission.event.submissionSubmitted',0),(156,1048585,18,3,'2025-12-19 05:23:56',268435462,'publication.event.published',0),(157,1048585,19,25,'2025-12-19 05:24:01',268435458,'submission.event.general.metadataUpdated',0),(158,515,19,25,'2025-12-19 05:24:09',1342177281,'submission.event.fileUploaded',0),(159,1048585,19,25,'2025-12-19 05:24:09',1342177288,'submission.event.fileRevised',0),(160,515,19,25,'2025-12-19 05:24:12',1342177296,'submission.event.fileEdited',0),(161,1048585,19,25,'2025-12-19 05:24:12',1342177296,'submission.event.fileEdited',0),(162,1048585,19,25,'2025-12-19 05:24:13',268435458,'submission.event.general.metadataUpdated',0),(163,1048585,19,25,'2025-12-19 05:24:14',268435457,'submission.event.submissionSubmitted',0),(164,1048585,19,3,'2025-12-19 05:24:18',268435462,'publication.event.published',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','10','int'),(2,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','ccorino','string'),(3,'fileId','1','int'),(3,'fileStage','10','int'),(3,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','ccorino','string'),(4,'fileId','1','int'),(4,'fileStage','10','int'),(4,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','ccorino','string'),(5,'fileId','1','int'),(5,'fileStage','10','int'),(5,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','ccorino','string'),(9,'fileId','2','int'),(9,'fileStage','10','int'),(9,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(9,'sourceSubmissionFileId',NULL,'string'),(9,'submissionFileId','2','int'),(9,'submissionId','2','int'),(9,'username','ckwantes','string'),(10,'fileId','2','int'),(10,'fileStage','10','int'),(10,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(10,'submissionFileId','2','int'),(10,'submissionId','2','int'),(10,'username','ckwantes','string'),(11,'fileId','2','int'),(11,'fileStage','10','int'),(11,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','2','int'),(11,'username','ckwantes','string'),(12,'fileId','2','int'),(12,'fileStage','10','int'),(12,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'sourceSubmissionFileId',NULL,'string'),(12,'submissionFileId','2','int'),(12,'submissionId','2','int'),(12,'username','ckwantes','string'),(20,'fileId','3','int'),(20,'fileStage','10','int'),(20,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','3','int'),(20,'submissionId','3','int'),(20,'username','cmontgomerie','string'),(21,'fileId','3','int'),(21,'fileStage','10','int'),(21,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(21,'submissionFileId','3','int'),(21,'submissionId','3','int'),(21,'username','cmontgomerie','string'),(22,'fileId','3','int'),(22,'fileStage','10','int'),(22,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','3','int'),(22,'submissionId','3','int'),(22,'username','cmontgomerie','string'),(23,'fileId','3','int'),(23,'fileStage','10','int'),(23,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(23,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','3','int'),(23,'submissionId','3','int'),(23,'username','cmontgomerie','string'),(36,'fileId','4','int'),(36,'fileStage','10','int'),(36,'originalFileName','Genetic transformation of forest trees.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','4','int'),(36,'submissionId','4','int'),(36,'username','ddiouf','string'),(37,'fileId','4','int'),(37,'fileStage','10','int'),(37,'name','Genetic transformation of forest trees.pdf','string'),(37,'submissionFileId','4','int'),(37,'submissionId','4','int'),(37,'username','ddiouf','string'),(38,'fileId','4','int'),(38,'fileStage','10','int'),(38,'originalFileName','Genetic transformation of forest trees.pdf','string'),(38,'sourceSubmissionFileId',NULL,'string'),(38,'submissionFileId','4','int'),(38,'submissionId','4','int'),(38,'username','ddiouf','string'),(39,'fileId','4','int'),(39,'fileStage','10','int'),(39,'name','Genetic transformation of forest trees.pdf','string'),(39,'originalFileName','Genetic transformation of forest trees.pdf','string'),(39,'sourceSubmissionFileId',NULL,'string'),(39,'submissionFileId','4','int'),(39,'submissionId','4','int'),(39,'username','ddiouf','string'),(44,'fileId','5','int'),(44,'fileStage','10','int'),(44,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','5','int'),(44,'submissionId','5','int'),(44,'username','dphillips','string'),(45,'fileId','5','int'),(45,'fileStage','10','int'),(45,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(45,'submissionFileId','5','int'),(45,'submissionId','5','int'),(45,'username','dphillips','string'),(46,'fileId','5','int'),(46,'fileStage','10','int'),(46,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','5','int'),(46,'submissionId','5','int'),(46,'username','dphillips','string'),(47,'fileId','5','int'),(47,'fileStage','10','int'),(47,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(47,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','5','int'),(47,'submissionId','5','int'),(47,'username','dphillips','string'),(52,'fileId','6','int'),(52,'fileStage','10','int'),(52,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','6','int'),(52,'submissionId','6','int'),(52,'username','dsokoloff','string'),(53,'fileId','6','int'),(53,'fileStage','10','int'),(53,'name','Developing efficacy beliefs in the classroom.pdf','string'),(53,'submissionFileId','6','int'),(53,'submissionId','6','int'),(53,'username','dsokoloff','string'),(54,'fileId','6','int'),(54,'fileStage','10','int'),(54,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(54,'sourceSubmissionFileId',NULL,'string'),(54,'submissionFileId','6','int'),(54,'submissionId','6','int'),(54,'username','dsokoloff','string'),(55,'fileId','6','int'),(55,'fileStage','10','int'),(55,'name','Developing efficacy beliefs in the classroom.pdf','string'),(55,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','6','int'),(55,'submissionId','6','int'),(55,'username','dsokoloff','string'),(60,'fileId','7','int'),(60,'fileStage','10','int'),(60,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(60,'sourceSubmissionFileId',NULL,'string'),(60,'submissionFileId','7','int'),(60,'submissionId','7','int'),(60,'username','eostrom','string'),(61,'fileId','7','int'),(61,'fileStage','10','int'),(61,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(61,'submissionFileId','7','int'),(61,'submissionId','7','int'),(61,'username','eostrom','string'),(62,'fileId','7','int'),(62,'fileStage','10','int'),(62,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','7','int'),(62,'submissionId','7','int'),(62,'username','eostrom','string'),(63,'fileId','7','int'),(63,'fileStage','10','int'),(63,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(63,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','7','int'),(63,'submissionId','7','int'),(63,'username','eostrom','string'),(69,'fileId','8','int'),(69,'fileStage','10','int'),(69,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(69,'sourceSubmissionFileId',NULL,'string'),(69,'submissionFileId','8','int'),(69,'submissionId','8','int'),(69,'username','fpaglieri','string'),(70,'fileId','8','int'),(70,'fileStage','10','int'),(70,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(70,'submissionFileId','8','int'),(70,'submissionId','8','int'),(70,'username','fpaglieri','string'),(71,'fileId','8','int'),(71,'fileStage','10','int'),(71,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','8','int'),(71,'submissionId','8','int'),(71,'username','fpaglieri','string'),(72,'fileId','8','int'),(72,'fileStage','10','int'),(72,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(72,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(72,'sourceSubmissionFileId',NULL,'string'),(72,'submissionFileId','8','int'),(72,'submissionId','8','int'),(72,'username','fpaglieri','string'),(77,'fileId','9','int'),(77,'fileStage','10','int'),(77,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(77,'sourceSubmissionFileId',NULL,'string'),(77,'submissionFileId','9','int'),(77,'submissionId','9','int'),(77,'username','jmwandenga','string'),(78,'fileId','9','int'),(78,'fileStage','10','int'),(78,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(78,'submissionFileId','9','int'),(78,'submissionId','9','int'),(78,'username','jmwandenga','string'),(79,'fileId','9','int'),(79,'fileStage','10','int'),(79,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(79,'sourceSubmissionFileId',NULL,'string'),(79,'submissionFileId','9','int'),(79,'submissionId','9','int'),(79,'username','jmwandenga','string'),(80,'fileId','9','int'),(80,'fileStage','10','int'),(80,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(80,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(80,'sourceSubmissionFileId',NULL,'string'),(80,'submissionFileId','9','int'),(80,'submissionId','9','int'),(80,'username','jmwandenga','string'),(85,'fileId','10','int'),(85,'fileStage','10','int'),(85,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(85,'sourceSubmissionFileId',NULL,'string'),(85,'submissionFileId','10','int'),(85,'submissionId','10','int'),(85,'username','jnovak','string'),(86,'fileId','10','int'),(86,'fileStage','10','int'),(86,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(86,'submissionFileId','10','int'),(86,'submissionId','10','int'),(86,'username','jnovak','string'),(87,'fileId','10','int'),(87,'fileStage','10','int'),(87,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(87,'sourceSubmissionFileId',NULL,'string'),(87,'submissionFileId','10','int'),(87,'submissionId','10','int'),(87,'username','jnovak','string'),(88,'fileId','10','int'),(88,'fileStage','10','int'),(88,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(88,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(88,'sourceSubmissionFileId',NULL,'string'),(88,'submissionFileId','10','int'),(88,'submissionId','10','int'),(88,'username','jnovak','string'),(93,'fileId','11','int'),(93,'fileStage','10','int'),(93,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(93,'sourceSubmissionFileId',NULL,'string'),(93,'submissionFileId','11','int'),(93,'submissionId','11','int'),(93,'username','kalkhafaji','string'),(94,'fileId','11','int'),(94,'fileStage','10','int'),(94,'name','Learning Sustainable Design through Service.pdf','string'),(94,'submissionFileId','11','int'),(94,'submissionId','11','int'),(94,'username','kalkhafaji','string'),(95,'fileId','11','int'),(95,'fileStage','10','int'),(95,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(95,'sourceSubmissionFileId',NULL,'string'),(95,'submissionFileId','11','int'),(95,'submissionId','11','int'),(95,'username','kalkhafaji','string'),(96,'fileId','11','int'),(96,'fileStage','10','int'),(96,'name','Learning Sustainable Design through Service.pdf','string'),(96,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(96,'sourceSubmissionFileId',NULL,'string'),(96,'submissionFileId','11','int'),(96,'submissionId','11','int'),(96,'username','kalkhafaji','string'),(102,'fileId','12','int'),(102,'fileStage','10','int'),(102,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(102,'sourceSubmissionFileId',NULL,'string'),(102,'submissionFileId','12','int'),(102,'submissionId','12','int'),(102,'username','lchristopher','string'),(103,'fileId','12','int'),(103,'fileStage','10','int'),(103,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(103,'submissionFileId','12','int'),(103,'submissionId','12','int'),(103,'username','lchristopher','string'),(104,'fileId','12','int'),(104,'fileStage','10','int'),(104,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(104,'sourceSubmissionFileId',NULL,'string'),(104,'submissionFileId','12','int'),(104,'submissionId','12','int'),(104,'username','lchristopher','string'),(105,'fileId','12','int'),(105,'fileStage','10','int'),(105,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(105,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(105,'sourceSubmissionFileId',NULL,'string'),(105,'submissionFileId','12','int'),(105,'submissionId','12','int'),(105,'username','lchristopher','string'),(110,'fileId','13','int'),(110,'fileStage','10','int'),(110,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(110,'sourceSubmissionFileId',NULL,'string'),(110,'submissionFileId','13','int'),(110,'submissionId','13','int'),(110,'username','lkumiega','string'),(111,'fileId','13','int'),(111,'fileStage','10','int'),(111,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(111,'submissionFileId','13','int'),(111,'submissionId','13','int'),(111,'username','lkumiega','string'),(112,'fileId','13','int'),(112,'fileStage','10','int'),(112,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(112,'sourceSubmissionFileId',NULL,'string'),(112,'submissionFileId','13','int'),(112,'submissionId','13','int'),(112,'username','lkumiega','string'),(113,'fileId','13','int'),(113,'fileStage','10','int'),(113,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(113,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(113,'sourceSubmissionFileId',NULL,'string'),(113,'submissionFileId','13','int'),(113,'submissionId','13','int'),(113,'username','lkumiega','string'),(118,'fileId','14','int'),(118,'fileStage','10','int'),(118,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(118,'sourceSubmissionFileId',NULL,'string'),(118,'submissionFileId','14','int'),(118,'submissionId','14','int'),(118,'username','pdaniel','string'),(119,'fileId','14','int'),(119,'fileStage','10','int'),(119,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(119,'submissionFileId','14','int'),(119,'submissionId','14','int'),(119,'username','pdaniel','string'),(120,'fileId','14','int'),(120,'fileStage','10','int'),(120,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(120,'sourceSubmissionFileId',NULL,'string'),(120,'submissionFileId','14','int'),(120,'submissionId','14','int'),(120,'username','pdaniel','string'),(121,'fileId','14','int'),(121,'fileStage','10','int'),(121,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(121,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(121,'sourceSubmissionFileId',NULL,'string'),(121,'submissionFileId','14','int'),(121,'submissionId','14','int'),(121,'username','pdaniel','string'),(126,'fileId','15','int'),(126,'fileStage','10','int'),(126,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','15','int'),(126,'submissionId','15','int'),(126,'username','rbaiyewu','string'),(127,'fileId','15','int'),(127,'fileStage','10','int'),(127,'name','Yam diseases and its management in Nigeria.pdf','string'),(127,'submissionFileId','15','int'),(127,'submissionId','15','int'),(127,'username','rbaiyewu','string'),(128,'fileId','15','int'),(128,'fileStage','10','int'),(128,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(128,'sourceSubmissionFileId',NULL,'string'),(128,'submissionFileId','15','int'),(128,'submissionId','15','int'),(128,'username','rbaiyewu','string'),(129,'fileId','15','int'),(129,'fileStage','10','int'),(129,'name','Yam diseases and its management in Nigeria.pdf','string'),(129,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','15','int'),(129,'submissionId','15','int'),(129,'username','rbaiyewu','string'),(134,'fileId','16','int'),(134,'fileStage','10','int'),(134,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','16','int'),(134,'submissionId','16','int'),(134,'username','rrossi','string'),(135,'fileId','16','int'),(135,'fileStage','10','int'),(135,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(135,'submissionFileId','16','int'),(135,'submissionId','16','int'),(135,'username','rrossi','string'),(136,'fileId','16','int'),(136,'fileStage','10','int'),(136,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(136,'sourceSubmissionFileId',NULL,'string'),(136,'submissionFileId','16','int'),(136,'submissionId','16','int'),(136,'username','rrossi','string'),(137,'fileId','16','int'),(137,'fileStage','10','int'),(137,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(137,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','16','int'),(137,'submissionId','16','int'),(137,'username','rrossi','string'),(142,'fileId','17','int'),(142,'fileStage','10','int'),(142,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','17','int'),(142,'submissionId','17','int'),(142,'username','vkarbasizaed','string'),(143,'fileId','17','int'),(143,'fileStage','10','int'),(143,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(143,'submissionFileId','17','int'),(143,'submissionId','17','int'),(143,'username','vkarbasizaed','string'),(144,'fileId','17','int'),(144,'fileStage','10','int'),(144,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(144,'sourceSubmissionFileId',NULL,'string'),(144,'submissionFileId','17','int'),(144,'submissionId','17','int'),(144,'username','vkarbasizaed','string'),(145,'fileId','17','int'),(145,'fileStage','10','int'),(145,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(145,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(145,'sourceSubmissionFileId',NULL,'string'),(145,'submissionFileId','17','int'),(145,'submissionId','17','int'),(145,'username','vkarbasizaed','string'),(150,'fileId','18','int'),(150,'fileStage','10','int'),(150,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(150,'sourceSubmissionFileId',NULL,'string'),(150,'submissionFileId','18','int'),(150,'submissionId','18','int'),(150,'username','vwilliamson','string'),(151,'fileId','18','int'),(151,'fileStage','10','int'),(151,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(151,'submissionFileId','18','int'),(151,'submissionId','18','int'),(151,'username','vwilliamson','string'),(152,'fileId','18','int'),(152,'fileStage','10','int'),(152,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(152,'sourceSubmissionFileId',NULL,'string'),(152,'submissionFileId','18','int'),(152,'submissionId','18','int'),(152,'username','vwilliamson','string'),(153,'fileId','18','int'),(153,'fileStage','10','int'),(153,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(153,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(153,'sourceSubmissionFileId',NULL,'string'),(153,'submissionFileId','18','int'),(153,'submissionId','18','int'),(153,'username','vwilliamson','string'),(158,'fileId','19','int'),(158,'fileStage','10','int'),(158,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','19','int'),(158,'submissionId','19','int'),(158,'username','zwoods','string'),(159,'fileId','19','int'),(159,'fileStage','10','int'),(159,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(159,'submissionFileId','19','int'),(159,'submissionId','19','int'),(159,'username','zwoods','string'),(160,'fileId','19','int'),(160,'fileStage','10','int'),(160,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(160,'sourceSubmissionFileId',NULL,'string'),(160,'submissionFileId','19','int'),(160,'submissionId','19','int'),(160,'username','zwoods','string'),(161,'fileId','19','int'),(161,'fileStage','10','int'),(161,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(161,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(161,'sourceSubmissionFileId',NULL,'string'),(161,'submissionFileId','19','int'),(161,'submissionId','19','int'),(161,'username','zwoods','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'journals/1/articles/1/6944dfd94eacf.pdf','application/pdf'),(2,'journals/1/articles/2/6944dfeb4ab01.pdf','application/pdf'),(3,'journals/1/articles/3/6944e0097be3c.pdf','application/pdf'),(4,'journals/1/articles/4/6944e030e7a7e.pdf','application/pdf'),(5,'journals/1/articles/5/6944e04624f1b.pdf','application/pdf'),(6,'journals/1/articles/6/6944e05bac7a8.pdf','application/pdf'),(7,'journals/1/articles/7/6944e070f39a6.pdf','application/pdf'),(8,'journals/1/articles/8/6944e0888179e.pdf','application/pdf'),(9,'journals/1/articles/9/6944e09da7a94.pdf','application/pdf'),(10,'journals/1/articles/10/6944e0b31a9f8.pdf','application/pdf'),(11,'journals/1/articles/11/6944e0c8a9b4a.pdf','application/pdf'),(12,'journals/1/articles/12/6944e0e064830.pdf','application/pdf'),(13,'journals/1/articles/13/6944e0f62d61d.pdf','application/pdf'),(14,'journals/1/articles/14/6944e10c07300.pdf','application/pdf'),(15,'journals/1/articles/15/6944e121ad7e4.pdf','application/pdf'),(16,'journals/1/articles/16/6944e136ee409.pdf','application/pdf'),(17,'journals/1/articles/17/6944e14d064a1.pdf','application/pdf'),(18,'journals/1/articles/18/6944e163bf34d.pdf','application/pdf'),(19,'journals/1/articles/19/6944e179c0dcd.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'Crossref XML preprint export','plugins.importexport.crossref.filter.PreprintCrossrefXmlFilter',0,0,0);
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
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Preprint Text','string'),(1,'fr_CA','name','Texte de la prépublication','string'),(2,'en_US','name','Research Instrument','string'),(2,'fr_CA','name','##default.genres.researchInstrument##','string'),(3,'en_US','name','Research Materials','string'),(3,'fr_CA','name','##default.genres.researchMaterials##','string'),(4,'en_US','name','Research Results','string'),(4,'fr_CA','name','##default.genres.researchResults##','string'),(5,'en_US','name','Transcripts','string'),(5,'fr_CA','name','##default.genres.transcripts##','string'),(6,'en_US','name','Data Analysis','string'),(6,'fr_CA','name','##default.genres.dataAnalysis##','string'),(7,'en_US','name','Data Set','string'),(7,'fr_CA','name','##default.genres.dataSet##','string'),(8,'en_US','name','Source Texts','string'),(8,'fr_CA','name','##default.genres.sourceTexts##','string'),(9,'en_US','name','Multimedia','string'),(9,'fr_CA','name','Multimédias','string'),(10,'en_US','name','Image','string'),(10,'fr_CA','name','Image','string'),(11,'en_US','name','HTML Stylesheet','string'),(11,'fr_CA','name','Feuille de style HTML','string'),(12,'en_US','name','Other','string'),(12,'fr_CA','name','Autre','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
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
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"http://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously posted.\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par un autre serveur. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\"},{\"order\":2,\"content\":\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\"},{\"order\":3,\"content\":\"Lorsque possible, les URL des références ont été fournies.\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]',NULL);
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `journal_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'publicknowledge',1.00,'en_US',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
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
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','manager.announcements','string'),(16,'','titleLocaleKey','navigation.archives','string'),(17,'','titleLocaleKey','navigation.about','string'),(18,'','titleLocaleKey','about.aboutContext','string'),(19,'','titleLocaleKey','about.submissions','string'),(20,'','titleLocaleKey','about.editorialTeam','string'),(21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,'','titleLocaleKey','about.contact','string'),(23,'','titleLocaleKey','common.search','string');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2025-12-19 05:17:17',NULL,1048585,1),(4,1,0,3,16777223,'2025-12-19 05:17:17',NULL,1048585,1),(5,1,5,2,16777217,'2025-12-19 05:17:17',NULL,1048585,1),(6,1,4,2,16777217,'2025-12-19 05:17:18',NULL,1048585,1),(7,1,0,2,16777243,'2025-12-19 05:17:18',NULL,1048585,1),(8,1,0,2,16777245,'2025-12-19 05:17:18',NULL,1048585,1),(9,1,0,3,16777222,'2025-12-19 05:17:35',NULL,1048585,2),(10,1,0,3,16777223,'2025-12-19 05:17:35',NULL,1048585,2),(11,1,5,2,16777217,'2025-12-19 05:17:35',NULL,1048585,2),(12,1,4,2,16777217,'2025-12-19 05:17:36',NULL,1048585,2),(13,1,0,2,16777243,'2025-12-19 05:17:36',NULL,1048585,2),(14,1,0,2,16777245,'2025-12-19 05:17:36',NULL,1048585,2),(17,1,0,3,16777222,'2025-12-19 05:18:08',NULL,1048585,3),(18,1,0,3,16777223,'2025-12-19 05:18:08',NULL,1048585,3),(19,1,5,2,16777217,'2025-12-19 05:18:08',NULL,1048585,3),(20,1,4,2,16777217,'2025-12-19 05:18:08',NULL,1048585,3),(21,1,0,2,16777243,'2025-12-19 05:18:08',NULL,1048585,3),(22,1,0,2,16777245,'2025-12-19 05:18:08',NULL,1048585,3),(23,1,9,3,16777259,'2025-12-19 05:18:23',NULL,1048585,3),(24,1,5,3,16777259,'2025-12-19 05:18:23',NULL,1048585,3),(25,1,4,3,16777259,'2025-12-19 05:18:23',NULL,1048585,3),(26,1,0,3,16777222,'2025-12-19 05:18:45',NULL,1048585,4),(27,1,0,3,16777223,'2025-12-19 05:18:45',NULL,1048585,4),(28,1,5,2,16777217,'2025-12-19 05:18:45',NULL,1048585,4),(29,1,4,2,16777217,'2025-12-19 05:18:45',NULL,1048585,4),(30,1,0,2,16777243,'2025-12-19 05:18:45',NULL,1048585,4),(31,1,0,2,16777245,'2025-12-19 05:18:45',NULL,1048585,4),(32,1,0,3,16777222,'2025-12-19 05:19:06',NULL,1048585,5),(33,1,0,3,16777223,'2025-12-19 05:19:06',NULL,1048585,5),(34,1,5,2,16777217,'2025-12-19 05:19:06',NULL,1048585,5),(35,1,4,2,16777217,'2025-12-19 05:19:07',NULL,1048585,5),(36,1,0,2,16777243,'2025-12-19 05:19:07',NULL,1048585,5),(37,1,0,2,16777245,'2025-12-19 05:19:07',NULL,1048585,5),(38,1,0,3,16777222,'2025-12-19 05:19:28',NULL,1048585,6),(39,1,0,3,16777223,'2025-12-19 05:19:28',NULL,1048585,6),(40,1,5,2,16777217,'2025-12-19 05:19:28',NULL,1048585,6),(41,1,4,2,16777217,'2025-12-19 05:19:28',NULL,1048585,6),(42,1,0,2,16777243,'2025-12-19 05:19:28',NULL,1048585,6),(43,1,0,2,16777245,'2025-12-19 05:19:28',NULL,1048585,6),(45,1,0,3,16777222,'2025-12-19 05:19:51',NULL,1048585,7),(46,1,0,3,16777223,'2025-12-19 05:19:51',NULL,1048585,7),(47,1,5,2,16777217,'2025-12-19 05:19:51',NULL,1048585,7),(48,1,4,2,16777217,'2025-12-19 05:19:51',NULL,1048585,7),(49,1,0,2,16777243,'2025-12-19 05:19:51',NULL,1048585,7),(50,1,0,2,16777245,'2025-12-19 05:19:51',NULL,1048585,7),(51,1,0,3,16777222,'2025-12-19 05:20:12',NULL,1048585,8),(52,1,0,3,16777223,'2025-12-19 05:20:12',NULL,1048585,8),(53,1,5,2,16777217,'2025-12-19 05:20:12',NULL,1048585,8),(54,1,4,2,16777217,'2025-12-19 05:20:12',NULL,1048585,8),(55,1,0,2,16777243,'2025-12-19 05:20:12',NULL,1048585,8),(56,1,0,2,16777245,'2025-12-19 05:20:12',NULL,1048585,8),(57,1,0,3,16777222,'2025-12-19 05:20:34',NULL,1048585,9),(58,1,0,3,16777223,'2025-12-19 05:20:34',NULL,1048585,9),(59,1,5,2,16777217,'2025-12-19 05:20:34',NULL,1048585,9),(60,1,4,2,16777217,'2025-12-19 05:20:34',NULL,1048585,9),(61,1,0,2,16777243,'2025-12-19 05:20:34',NULL,1048585,9),(62,1,0,2,16777245,'2025-12-19 05:20:34',NULL,1048585,9),(63,1,0,3,16777222,'2025-12-19 05:20:55',NULL,1048585,10),(64,1,0,3,16777223,'2025-12-19 05:20:55',NULL,1048585,10),(65,1,5,2,16777217,'2025-12-19 05:20:55',NULL,1048585,10),(66,1,4,2,16777217,'2025-12-19 05:20:55',NULL,1048585,10),(67,1,0,2,16777243,'2025-12-19 05:20:55',NULL,1048585,10),(68,1,0,2,16777245,'2025-12-19 05:20:55',NULL,1048585,10),(70,1,0,3,16777222,'2025-12-19 05:21:19',NULL,1048585,11),(71,1,0,3,16777223,'2025-12-19 05:21:19',NULL,1048585,11),(72,1,5,2,16777217,'2025-12-19 05:21:19',NULL,1048585,11),(73,1,4,2,16777217,'2025-12-19 05:21:19',NULL,1048585,11),(74,1,0,2,16777243,'2025-12-19 05:21:19',NULL,1048585,11),(75,1,0,2,16777245,'2025-12-19 05:21:19',NULL,1048585,11),(76,1,0,3,16777222,'2025-12-19 05:21:41',NULL,1048585,12),(77,1,0,3,16777223,'2025-12-19 05:21:41',NULL,1048585,12),(78,1,5,2,16777217,'2025-12-19 05:21:41',NULL,1048585,12),(79,1,4,2,16777217,'2025-12-19 05:21:41',NULL,1048585,12),(80,1,0,2,16777243,'2025-12-19 05:21:41',NULL,1048585,12),(81,1,0,2,16777245,'2025-12-19 05:21:41',NULL,1048585,12),(82,1,0,3,16777222,'2025-12-19 05:22:03',NULL,1048585,13),(83,1,0,3,16777223,'2025-12-19 05:22:03',NULL,1048585,13),(84,1,5,2,16777217,'2025-12-19 05:22:03',NULL,1048585,13),(85,1,4,2,16777217,'2025-12-19 05:22:03',NULL,1048585,13),(86,1,0,2,16777243,'2025-12-19 05:22:03',NULL,1048585,13),(87,1,0,2,16777245,'2025-12-19 05:22:03',NULL,1048585,13),(88,1,0,3,16777222,'2025-12-19 05:22:24',NULL,1048585,14),(89,1,0,3,16777223,'2025-12-19 05:22:24',NULL,1048585,14),(90,1,5,2,16777217,'2025-12-19 05:22:24',NULL,1048585,14),(91,1,4,2,16777217,'2025-12-19 05:22:24',NULL,1048585,14),(92,1,0,2,16777243,'2025-12-19 05:22:24',NULL,1048585,14),(93,1,0,2,16777245,'2025-12-19 05:22:24',NULL,1048585,14),(94,1,0,3,16777222,'2025-12-19 05:22:46',NULL,1048585,15),(95,1,0,3,16777223,'2025-12-19 05:22:46',NULL,1048585,15),(96,1,5,2,16777217,'2025-12-19 05:22:46',NULL,1048585,15),(97,1,4,2,16777217,'2025-12-19 05:22:46',NULL,1048585,15),(98,1,0,2,16777243,'2025-12-19 05:22:46',NULL,1048585,15),(99,1,0,2,16777245,'2025-12-19 05:22:46',NULL,1048585,15),(100,1,0,3,16777222,'2025-12-19 05:23:07',NULL,1048585,16),(101,1,0,3,16777223,'2025-12-19 05:23:07',NULL,1048585,16),(102,1,5,2,16777217,'2025-12-19 05:23:07',NULL,1048585,16),(103,1,4,2,16777217,'2025-12-19 05:23:07',NULL,1048585,16),(104,1,0,2,16777243,'2025-12-19 05:23:07',NULL,1048585,16),(105,1,0,2,16777245,'2025-12-19 05:23:07',NULL,1048585,16),(106,1,0,3,16777222,'2025-12-19 05:23:29',NULL,1048585,17),(107,1,0,3,16777223,'2025-12-19 05:23:29',NULL,1048585,17),(108,1,5,2,16777217,'2025-12-19 05:23:29',NULL,1048585,17),(109,1,4,2,16777217,'2025-12-19 05:23:30',NULL,1048585,17),(110,1,0,2,16777243,'2025-12-19 05:23:30',NULL,1048585,17),(111,1,0,2,16777245,'2025-12-19 05:23:30',NULL,1048585,17),(112,1,0,3,16777222,'2025-12-19 05:23:52',NULL,1048585,18),(113,1,0,3,16777223,'2025-12-19 05:23:52',NULL,1048585,18),(114,1,5,2,16777217,'2025-12-19 05:23:52',NULL,1048585,18),(115,1,4,2,16777217,'2025-12-19 05:23:52',NULL,1048585,18),(116,1,0,2,16777243,'2025-12-19 05:23:52',NULL,1048585,18),(117,1,0,2,16777245,'2025-12-19 05:23:52',NULL,1048585,18),(118,1,0,3,16777222,'2025-12-19 05:24:14',NULL,1048585,19),(119,1,0,3,16777223,'2025-12-19 05:24:14',NULL,1048585,19),(120,1,5,2,16777217,'2025-12-19 05:24:14',NULL,1048585,19),(121,1,4,2,16777217,'2025-12-19 05:24:14',NULL,1048585,19),(122,1,0,2,16777243,'2025-12-19 05:24:14',NULL,1048585,19),(123,1,0,2,16777245,'2025-12-19 05:24:14',NULL,1048585,19);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','6944df7b51acf','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool'),('webfeedplugin',1,'includeIdentifiers','0','bool'),('webfeedplugin',1,'recentItems','30','int');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
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
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',1,0.00,'',0,''),(2,'en_US',2,'PDF',2,0.00,'',0,''),(3,'en_US',3,'PDF',3,0.00,'',0,''),(4,'en_US',4,'PDF',3,0.00,'',0,''),(5,'en_US',5,'PDF',4,0.00,'',0,''),(6,'en_US',6,'PDF',5,0.00,'',0,''),(7,'en_US',7,'PDF',6,0.00,'',0,''),(8,'en_US',8,'PDF',7,0.00,'',0,''),(9,'en_US',9,'PDF',8,0.00,'',0,''),(10,'en_US',10,'PDF',9,0.00,'',0,''),(11,'en_US',11,'PDF',10,0.00,'',0,''),(12,'en_US',12,'PDF',11,0.00,'',0,''),(13,'en_US',13,'PDF',12,0.00,'',0,''),(14,'en_US',14,'PDF',13,0.00,'',0,''),(15,'en_US',15,'PDF',14,0.00,'',0,''),(16,'en_US',16,'PDF',15,0.00,'',0,''),(17,'en_US',17,'PDF',16,0.00,'',0,''),(18,'en_US',18,'PDF',17,0.00,'',0,''),(19,'en_US',19,'PDF',18,0.00,'',0,''),(20,'en_US',20,'PDF',19,0.00,'',0,'');
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2025'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','subtitle','A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'en_US','title','The Facets Of Job Satisfaction'),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'','categoryIds','[]'),(3,'','copyrightYear','2025'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'','copyrightYear','2025'),(4,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(4,'en_US','copyrightHolder','Craig Montgomerie'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2025'),(5,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Genetic transformation of forest trees'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'','copyrightYear','2025'),(6,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2025'),(7,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Developing efficacy beliefs in the classroom'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'','copyrightYear','2025'),(8,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Traditions and Trends in the Study of the Commons'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'','copyrightYear','2025'),(9,'en_US','abstract','<p>None.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'','copyrightYear','2025'),(10,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'','copyrightYear','2025'),(11,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'','copyrightYear','2025'),(12,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Learning Sustainable Design through Service'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'','copyrightYear','2025'),(13,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2025'),(14,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'','copyrightYear','2025'),(15,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'','copyrightYear','2025'),(16,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Yam diseases and its management in Nigeria'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'','copyrightYear','2025'),(17,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2025'),(18,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'','copyrightYear','2025'),(19,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title',''),(20,'','categoryIds','[]'),(20,'','copyrightYear','2025'),(20,'en_US','abstract','<p>None.</p>'),(20,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(20,'en_US','prefix',''),(20,'en_US','subtitle',''),(20,'en_US','title','Finocchiaro: Arguments About Arguments'),(20,'fr_CA','abstract',''),(20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(20,'fr_CA','prefix',''),(20,'fr_CA','subtitle',''),(20,'fr_CA','title','');
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
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint DEFAULT NULL,
  `section_id` bigint DEFAULT NULL,
  `submission_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2025-12-19 05:17:17',NULL,1,1,1,1,NULL,1),(2,0,'2025-12-19','2025-12-19 05:17:48',NULL,2,1,2,3,NULL,1),(3,0,'2025-12-19','2025-12-19 05:18:20',NULL,4,1,3,3,NULL,1),(4,0,'2025-12-19','2025-12-19 05:18:27',NULL,6,1,3,3,NULL,2),(5,0,'2025-12-19','2025-12-19 05:18:48',NULL,8,1,4,3,NULL,1),(6,0,'2025-12-19','2025-12-19 05:19:10',NULL,9,1,5,3,NULL,1),(7,0,'2025-12-19','2025-12-19 05:19:31',NULL,10,1,6,3,NULL,1),(8,0,'2025-12-19','2025-12-19 05:19:55',NULL,11,1,7,3,NULL,1),(9,0,'2025-12-19','2025-12-19 05:20:16',NULL,13,1,8,3,NULL,1),(10,0,'2025-12-19','2025-12-19 05:20:37',NULL,14,1,9,3,NULL,1),(11,0,'2025-12-19','2025-12-19 05:20:59',NULL,15,1,10,3,NULL,1),(12,0,'2025-12-19','2025-12-19 05:21:23',NULL,16,1,11,3,NULL,1),(13,0,'2025-12-19','2025-12-19 05:21:44',NULL,18,1,12,3,NULL,1),(14,0,'2025-12-19','2025-12-19 05:22:06',NULL,19,1,13,3,NULL,1),(15,0,'2025-12-19','2025-12-19 05:22:28',NULL,20,1,14,3,NULL,1),(16,0,'2025-12-19','2025-12-19 05:22:49',NULL,21,1,15,3,NULL,1),(17,0,'2025-12-19','2025-12-19 05:23:11',NULL,22,1,16,3,NULL,1),(18,0,'2025-12-19','2025-12-19 05:23:33',NULL,23,1,17,3,NULL,1),(19,0,'2025-12-19','2025-12-19 05:23:56',NULL,24,1,18,3,NULL,1),(20,0,'2025-12-19','2025-12-19 05:24:18',NULL,25,1,19,3,NULL,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `unconsidered` smallint DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.StatisticsReport','2025-12-19 05:15:28'),('plugins.generic.usageStats.UsageStatsLoader','2025-12-19 05:15:28');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_settings` (
  `section_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` bigint NOT NULL AUTO_INCREMENT,
  `journal_id` bigint NOT NULL,
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
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
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
INSERT INTO `sessions` VALUES ('1u1mb6qak8vbhu7ijjh86g8h18',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121529,1766121550,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121550;s:5:\"token\";s:32:\"b27e7f90ee0cbf3b64f3913d8f0497a1\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('24jdrvee06pu5irh1md4vl3km8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121359,1766121393,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121393;s:5:\"token\";s:32:\"967ddaa61c5567a1e5bb2e3abbaa5318\";}username|s:5:\"rvaca\";','localhost'),('297fepdmjv7vba94u4vkad9lfv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121792,1766121814,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121814;s:5:\"token\";s:32:\"d4fd038c1c38a50714196831070dc861\";}username|s:7:\"dbarnes\";','localhost'),('2iikho92l950phihtnjfa8rthk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121639,1766121659,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121659;s:5:\"token\";s:32:\"2f9f2899d3aa537711bd8319abe05bc6\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2k68kup9jgdtvk3fbs758adopk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121660,1766121683,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121683;s:5:\"token\";s:32:\"49d5e30b7a8020e30f454bb50ad5efb1\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3oride1r4qvj0vsu3802rt75fo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121596,1766121616,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121616;s:5:\"token\";s:32:\"b68f06e3c61a81bc8803f7a00597a1e9\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('4m3livc93fotoc834vppcjr4ls',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121348,1766121353,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121353;s:5:\"token\";s:32:\"8852a65fd18ec22e6d1d010c40c561da\";}userId|i:1;username|s:5:\"admin\";','localhost'),('5jefbgqhf4ojvs6gpcghnpl2kj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121837,1766121858,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121858;s:5:\"token\";s:32:\"536dae04d00f96062322a46da5c82ca2\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('64h06qdb8udfu8q199mugdg5e0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121815,1766121836,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121836;s:5:\"token\";s:32:\"8ce0bbe976e010d93da5f79eab676cd7\";}username|s:7:\"dbarnes\";','localhost'),('7voa71hpr2v4iftk02m6037klm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121684,1766121705,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121705;s:5:\"token\";s:32:\"b0c718c103aeb1f870f05dc9ba3fc628\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('8ckff4s5muk5dlcq1cjde2ts2k',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121469,1766121507,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121507;s:5:\"token\";s:32:\"876737db60badef581d442c635a3799f\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('9mt0b2iv4dgplsvr58dkuuor6p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121508,1766121529,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121529;s:5:\"token\";s:32:\"dbbe08026c8267b3704493d7b69a0fb4\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('aj2uapfu5nv34r3g8v4936qost',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121338,1766121348,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121348;s:5:\"token\";s:32:\"a077753961ab8296b872c78db024d62e\";}userId|i:1;username|s:5:\"admin\";','localhost'),('bb0rpgt40tqpindihf68baa1jb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121394,1766121398,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121398;s:5:\"token\";s:32:\"66addab350bfeb84d36ced87ad75c260\";}username|s:5:\"admin\";','localhost'),('d101jothalie1akle7t7frj8jv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121749,1766121769,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121769;s:5:\"token\";s:32:\"56537e778b5084f3f7bdc31042cc7770\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('djh1ct8t5hlit4i2sp7nvjflob',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121727,1766121748,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121748;s:5:\"token\";s:32:\"b60c79b3f56ad0c5b1aa6dbb2342d0bd\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('f4a7jlmd0ib15fnm0b3vnntiv9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121551,1766121572,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121572;s:5:\"token\";s:32:\"c56a89575426ac0782ce297886df2106\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fu5n11i4q4r4gjborl3l6cnddn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121399,1766121420,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121419;s:5:\"token\";s:32:\"66bd33e783fb510023da77bb06799d11\";}username|s:5:\"admin\";','localhost'),('hn084h435ko1nlsno6j875qhtj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121465,1766121468,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121468;s:5:\"token\";s:32:\"b0b00c8f62c533707a6631a89e4916d3\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('k1v9hv1ump436nopc1ksp4mgle',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121770,1766121792,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121792;s:5:\"token\";s:32:\"aa7023d7f8448d44fde25b4ffa931c40\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('k5hec5gi6g50uetbiv956ftb26',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121353,1766121358,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121358;s:5:\"token\";s:32:\"345d9926e9e3d025bd419dafd225ce31\";}userId|i:1;username|s:5:\"admin\";','localhost'),('kri77i3lvf3jmlj6klqnrs4ge0',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121328,1766121338,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121338;s:5:\"token\";s:32:\"3b5f68c38dba6ec82e8fb61327b62319\";}userId|i:1;username|s:5:\"admin\";','localhost'),('l8v1vkdfafi78mk830lu9kj3ps',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121421,1766121438,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121437;s:5:\"token\";s:32:\"ce26af87ff9c96c296187bd2b417551f\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('lki8j6kt0l7cnfkpg5equm83s9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121439,1766121465,0,'csrf|a:2:{s:9:\"timestamp\";i:1766121465;s:5:\"token\";s:32:\"3c14383660b02b66ea12d6d766a3ce3a\";}username|s:8:\"ckwantes\";','localhost'),('pd8g4muksijbu5082in0r66bdp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121326,1766121326,0,'','localhost'),('q6jqn9a4jdcrivknkmok9roslp',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121706,1766121726,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121726;s:5:\"token\";s:32:\"f0db085f481473069e30075daf498f8b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('t9o15quslccdd2alt7pdrbgj4c',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121617,1766121638,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121638;s:5:\"token\";s:32:\"91030bc691496f86d8ab837ac14b48f7\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('umjsp46ruhdfiv9eovtgfde2pr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1766121572,1766121595,1,'csrf|a:2:{s:9:\"timestamp\";i:1766121595;s:5:\"token\";s:32:\"e24e6dcb6492d098148f1d399d7e2d02\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','pkpadmin@mailinator.com'),('contactName','en_US','Open Preprint Systems'),('contactName','fr_CA','Open Preprint Systems'),('themePluginPath','','default');
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
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2025-12-19 05:17:05',0,1),(2,1,3,5,'2025-12-19 05:17:17',0,1),(3,1,3,4,'2025-12-19 05:17:17',0,1),(4,2,4,8,'2025-12-19 05:17:23',0,1),(5,2,3,5,'2025-12-19 05:17:35',0,1),(6,2,3,4,'2025-12-19 05:17:35',0,1),(7,3,4,9,'2025-12-19 05:17:53',0,1),(8,3,3,5,'2025-12-19 05:18:08',0,1),(9,3,3,4,'2025-12-19 05:18:08',0,1),(10,4,4,10,'2025-12-19 05:18:32',0,1),(11,4,3,5,'2025-12-19 05:18:45',0,1),(12,4,3,4,'2025-12-19 05:18:45',0,1),(13,5,4,11,'2025-12-19 05:18:53',0,1),(14,5,3,5,'2025-12-19 05:19:06',0,1),(15,5,3,4,'2025-12-19 05:19:06',0,1),(16,6,4,12,'2025-12-19 05:19:15',0,1),(17,6,3,5,'2025-12-19 05:19:28',0,1),(18,6,3,4,'2025-12-19 05:19:28',0,1),(19,7,4,13,'2025-12-19 05:19:36',0,1),(20,7,3,5,'2025-12-19 05:19:51',0,1),(21,7,3,4,'2025-12-19 05:19:51',0,1),(22,8,4,14,'2025-12-19 05:20:00',0,1),(23,8,3,5,'2025-12-19 05:20:12',0,1),(24,8,3,4,'2025-12-19 05:20:12',0,1),(25,9,4,15,'2025-12-19 05:20:21',0,1),(26,9,3,5,'2025-12-19 05:20:34',0,1),(27,9,3,4,'2025-12-19 05:20:34',0,1),(28,10,4,16,'2025-12-19 05:20:42',0,1),(29,10,3,5,'2025-12-19 05:20:55',0,1),(30,10,3,4,'2025-12-19 05:20:55',0,1),(31,11,4,17,'2025-12-19 05:21:04',0,1),(32,11,3,5,'2025-12-19 05:21:19',0,1),(33,11,3,4,'2025-12-19 05:21:19',0,1),(34,12,4,18,'2025-12-19 05:21:28',0,1),(35,12,3,5,'2025-12-19 05:21:41',0,1),(36,12,3,4,'2025-12-19 05:21:41',0,1),(37,13,4,19,'2025-12-19 05:21:49',0,1),(38,13,3,5,'2025-12-19 05:22:03',0,1),(39,13,3,4,'2025-12-19 05:22:03',0,1),(40,14,4,20,'2025-12-19 05:22:11',0,1),(41,14,3,5,'2025-12-19 05:22:24',0,1),(42,14,3,4,'2025-12-19 05:22:24',0,1),(43,15,4,21,'2025-12-19 05:22:33',0,1),(44,15,3,5,'2025-12-19 05:22:46',0,1),(45,15,3,4,'2025-12-19 05:22:46',0,1),(46,16,4,22,'2025-12-19 05:22:54',0,1),(47,16,3,5,'2025-12-19 05:23:07',0,1),(48,16,3,4,'2025-12-19 05:23:07',0,1),(49,17,4,23,'2025-12-19 05:23:16',0,1),(50,17,3,5,'2025-12-19 05:23:29',0,1),(51,17,3,4,'2025-12-19 05:23:29',0,1),(52,18,4,24,'2025-12-19 05:23:39',0,1),(53,18,3,5,'2025-12-19 05:23:52',0,1),(54,18,3,4,'2025-12-19 05:23:52',0,1),(55,19,4,25,'2025-12-19 05:24:01',0,1),(56,19,3,5,'2025-12-19 05:24:14',0,1),(57,19,3,4,'2025-12-19 05:24:14',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
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
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,4),(1,1,530,5);
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
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(2,'fr_CA','name','','string'),(3,'en_US','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(3,'fr_CA','name','','string'),(4,'en_US','name','Genetic transformation of forest trees.pdf','string'),(4,'fr_CA','name','','string'),(5,'en_US','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(5,'fr_CA','name','','string'),(6,'en_US','name','Developing efficacy beliefs in the classroom.pdf','string'),(6,'fr_CA','name','','string'),(7,'en_US','name','Traditions and Trends in the Study of the Commons.pdf','string'),(7,'fr_CA','name','','string'),(8,'en_US','name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(8,'fr_CA','name','','string'),(9,'en_US','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(9,'fr_CA','name','','string'),(10,'en_US','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(10,'fr_CA','name','','string'),(11,'en_US','name','Learning Sustainable Design through Service.pdf','string'),(11,'fr_CA','name','','string'),(12,'en_US','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(12,'fr_CA','name','','string'),(13,'en_US','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(13,'fr_CA','name','','string'),(14,'en_US','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(14,'fr_CA','name','','string'),(15,'en_US','name','Yam diseases and its management in Nigeria.pdf','string'),(15,'fr_CA','name','','string'),(16,'en_US','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(16,'fr_CA','name','','string'),(17,'en_US','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(17,'fr_CA','name','','string'),(18,'en_US','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(18,'fr_CA','name','','string'),(19,'en_US','name','Finocchiaro: Arguments About Arguments.pdf','string'),(19,'fr_CA','name','','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:17:13','2025-12-19 05:17:15',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:17:31','2025-12-19 05:17:33',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:18:01','2025-12-19 05:18:03',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:18:40','2025-12-19 05:18:43',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:19:02','2025-12-19 05:19:04',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:19:23','2025-12-19 05:19:25',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:19:45','2025-12-19 05:19:47',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:20:08','2025-12-19 05:20:10',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:20:29','2025-12-19 05:20:31',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:20:51','2025-12-19 05:20:53',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:21:12','2025-12-19 05:21:14',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:21:36','2025-12-19 05:21:38',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:21:58','2025-12-19 05:22:00',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:22:20','2025-12-19 05:22:22',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:22:41','2025-12-19 05:22:43',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:23:02','2025-12-19 05:23:05',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:23:25','2025-12-19 05:23:27',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:23:47','2025-12-19 05:23:50',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2025-12-19 05:24:09','2025-12-19 05:24:12',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=941 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (288,'1980s'),(660,'21st'),(349,'aalborg'),(786,'abattoir'),(825,'abnormal'),(431,'academic'),(7,'academy'),(529,'accepted'),(397,'accompanying'),(709,'achieving'),(474,'acid'),(547,'acids'),(251,'action'),(923,'actor'),(916,'actors'),(384,'added'),(429,'address'),(478,'adipose'),(131,'administered'),(361,'administration'),(743,'adopted'),(744,'advocated'),(814,'affected'),(29,'affects'),(783,'african'),(922,'agree'),(846,'aid'),(467,'aim'),(71,'alberta'),(143,'alexandria'),(649,'analyses'),(40,'analysis'),(505,'analyzed'),(503,'animals'),(722,'anthracnose'),(889,'antibiotics'),(860,'antimicrobial'),(584,'antonio'),(611,'appears'),(152,'applications'),(360,'applied'),(560,'aquifer'),(17,'archival'),(644,'areas'),(168,'argument'),(940,'arguments'),(761,'ash'),(468,'assess'),(552,'assessed'),(606,'assessments'),(656,'atlantic'),(19,'attitude'),(458,'australian'),(847,'authorities'),(411,'authority'),(352,'availability'),(483,'averaging'),(499,'backfat'),(167,'background'),(712,'baiyewu'),(775,'barcelona'),(666,'barriers'),(482,'barrows'),(564,'barton'),(412,'based'),(405,'basin'),(371,'basins'),(667,'basis'),(605,'bearings'),(785,'beef'),(103,'began'),(215,'belief'),(179,'beliefs'),(689,'belonging'),(35,'benchmark'),(49,'benefit'),(596,'blanco'),(55,'brazil'),(410,'brazos'),(810,'breeds'),(620,'buda'),(798,'bulls'),(460,'butyrate'),(520,'c18'),(523,'c20'),(105,'called'),(781,'cameroon'),(99,'canada'),(381,'capabilities'),(312,'cape'),(812,'carcass'),(793,'carcasses'),(551,'carefully'),(680,'carried'),(655,'case'),(897,'cases'),(816,'category'),(1,'catherine'),(779,'cattle'),(193,'cedural'),(571,'central'),(661,'century'),(609,'cfs'),(453,'challenges'),(630,'change'),(440,'chapter'),(792,'characteristics'),(213,'children'),(54,'china'),(767,'chips'),(457,'christopher'),(521,'cis'),(218,'citizens'),(254,'citizenship'),(185,'claim'),(175,'claims'),(85,'classroom'),(896,'clinical'),(507,'close'),(657,'coast'),(880,'coli'),(864,'coliforms'),(290,'colleagues'),(501,'collected'),(586,'collection'),(925,'collective'),(921,'collectively'),(60,'collectivistic'),(208,'college'),(718,'combating'),(180,'commitments'),(189,'common'),(263,'commons'),(44,'communication'),(691,'communities'),(674,'community'),(13,'comparative'),(915,'compare'),(38,'compared'),(50,'comparisons'),(194,'competencies'),(33,'compiled'),(400,'complete'),(842,'completely'),(379,'complex'),(506,'composition'),(75,'computer'),(893,'concentration'),(582,'concept'),(327,'conclusive'),(839,'condemned'),(392,'condensed'),(350,'condensing'),(566,'conditions'),(228,'conducted'),(216,'confident'),(328,'conflicting'),(905,'conjugative'),(639,'connection'),(558,'connectivity'),(930,'consensus'),(728,'considered'),(56,'consistent'),(188,'consists'),(531,'consortium'),(15,'construct'),(406,'contained'),(289,'contemporary'),(512,'content'),(66,'context'),(646,'continual'),(219,'continue'),(343,'continuous'),(676,'contributing'),(933,'contributors'),(852,'control'),(450,'coordinated'),(108,'core'),(209,'cork'),(338,'corporate'),(687,'council'),(32,'countries'),(702,'country'),(109,'courses'),(281,'coward'),(823,'cows'),(239,'cps'),(69,'craig'),(34,'create'),(236,'creative'),(595,'creek'),(169,'critique'),(746,'crop'),(768,'cubes'),(753,'cultivars'),(65,'cultural'),(28,'culture'),(692,'cultures'),(938,'cuny'),(533,'cured'),(102,'curriculum'),(162,'dana'),(651,'daniel'),(18,'data'),(393,'dataset'),(376,'datasets'),(269,'decades'),(917,'decide'),(248,'decision'),(342,'decisions'),(172,'deep'),(683,'defining'),(26,'degree'),(684,'delivering'),(643,'demands'),(94,'demonstrate'),(678,'describes'),(420,'design'),(653,'designing'),(751,'destruction'),(733,'devastating'),(409,'develop'),(382,'developed'),(210,'developing'),(120,'development'),(302,'developments'),(141,'diaga'),(543,'dietary'),(488,'diets'),(539,'differed'),(890,'difference'),(201,'difficult'),(928,'difficulty'),(142,'diouf'),(455,'directions'),(173,'disagreement'),(272,'disciplines'),(629,'discontinuity'),(151,'discussed'),(685,'discussions'),(727,'disease'),(715,'diseases'),(599,'dissipated'),(270,'distinguished'),(836,'distress'),(341,'distribution'),(204,'diverge'),(664,'diversity'),(583,'divide'),(332,'dividend'),(316,'dividends'),(206,'domatilia'),(578,'downstream'),(593,'drainage'),(628,'dramatic'),(848,'draw'),(565,'drought'),(604,'droughts'),(532,'dry'),(843,'due'),(632,'dynamic'),(330,'economists'),(522,'ecosenoic'),(827,'ectoparasites'),(738,'edible'),(88,'education'),(559,'edwards'),(68,'effect'),(46,'effectiveness'),(245,'effects'),(211,'efficacy'),(45,'efficiency'),(704,'egalitarianism'),(255,'elinor'),(663,'embracing'),(433,'emerging'),(688,'emphasises'),(318,'empirical'),(139,'employed'),(21,'employees'),(906,'encoding'),(826,'encountered'),(575,'endangered'),(369,'endeavors'),(153,'engineering'),(437,'engineers'),(235,'enhance'),(387,'enhanced'),(252,'enhancing'),(832,'enlarged'),(873,'enterobacteriacea'),(422,'environmental'),(914,'environments'),(212,'equip'),(16,'equivalence'),(879,'escherichia'),(581,'established'),(697,'ethnic'),(698,'ethno'),(347,'evaluation'),(319,'evidence'),(25,'examine'),(135,'examined'),(673,'examines'),(67,'exerts'),(52,'exhibited'),(454,'exist'),(78,'existing'),(590,'exists'),(367,'expanding'),(264,'expe'),(111,'expected'),(439,'experiences'),(159,'expression'),(615,'extended'),(617,'extensive'),(303,'fabio'),(9,'facets'),(39,'factor'),(42,'factors'),(875,'faeces'),(428,'failed'),(748,'fallowing'),(471,'fat'),(828,'fatigue'),(494,'fats'),(473,'fatty'),(383,'features'),(496,'fed'),(720,'field'),(876,'fifteen'),(480,'fifty'),(765,'finally'),(329,'financial'),(340,'financing'),(187,'find'),(58,'findings'),(8,'finland'),(939,'finocchiaro'),(325,'firm'),(603,'flow'),(610,'flowing'),(404,'flows'),(841,'flukes'),(354,'focus'),(170,'fogelin'),(553,'food'),(146,'forest'),(762,'found'),(178,'framework'),(258,'frank'),(182,'fruitfully'),(807,'fulani'),(344,'function'),(763,'fungal'),(323,'future'),(669,'gender'),(777,'general'),(158,'genes'),(144,'genetic'),(662,'genuinely'),(759,'gins'),(126,'goal'),(935,'goverance'),(157,'governing'),(97,'government'),(95,'grade'),(623,'gradient'),(631,'gradients'),(221,'graduation'),(589,'groundwater'),(903,'group'),(386,'growing'),(267,'growth'),(806,'gudali'),(333,'guidance'),(801,'guinea'),(534,'ham'),(191,'hand'),(306,'hansen'),(546,'healthy'),(476,'heavy'),(802,'high'),(62,'higher'),(510,'highest'),(705,'highlights'),(138,'hired'),(122,'hiring'),(868,'hospital'),(874,'human'),(636,'hydraulic'),(588,'hydrogeologic'),(557,'hydrologic'),(601,'hydrologically'),(442,'identification'),(878,'identified'),(577,'immediately'),(396,'impacts'),(115,'implement'),(101,'implementation'),(920,'implemented'),(80,'implications'),(706,'importance'),(851,'improve'),(461,'improves'),(154,'improving'),(695,'include'),(408,'included'),(745,'includes'),(642,'increased'),(544,'increases'),(536,'index'),(257,'indiana'),(690,'individual'),(37,'individually'),(59,'individuals'),(752,'infected'),(764,'infection'),(867,'infections'),(469,'influence'),(612,'influenced'),(635,'influences'),(106,'information'),(217,'informed'),(107,'infused'),(528,'ing'),(638,'inherent'),(892,'inhibitory'),(91,'initiatives'),(390,'input'),(912,'institutions'),(234,'instruction'),(430,'integrates'),(140,'integrating'),(83,'integration'),(301,'intellectual'),(682,'intention'),(654,'intercultural'),(677,'interculturality'),(295,'interest'),(176,'interlocutors'),(449,'internships'),(346,'intuitive'),(165,'investigating'),(339,'investment'),(336,'investors'),(247,'involve'),(696,'involvement'),(441,'involves'),(526,'iodine'),(870,'iran'),(73,'irvine'),(869,'isfahan'),(487,'isoenergetic'),(865,'isolated'),(877,'isolates'),(87,'issue'),(789,'january'),(10,'job'),(310,'john'),(117,'jurisdictions'),(858,'karbasizaed'),(414,'karim'),(6,'kekkonen'),(882,'kelebsiella'),(222,'key'),(415,'khafaji'),(214,'knowledge'),(556,'kumiega'),(2,'kwantes'),(619,'kyle'),(260,'laerhoven'),(829,'lameness'),(668,'language'),(378,'large'),(427,'largely'),(788,'largest'),(710,'lasting'),(537,'layers'),(250,'leads'),(225,'learn'),(220,'learners'),(113,'learning'),(447,'led'),(456,'leo'),(831,'lesions'),(96,'level'),(525,'levels'),(435,'leveraged'),(452,'limitations'),(699,'linguistic'),(524,'linoleic'),(519,'linolenic'),(555,'lise'),(317,'literature'),(770,'live'),(840,'liver'),(757,'locally'),(273,'long'),(600,'longer'),(795,'longissimus'),(282,'los'),(730,'losses'),(622,'low'),(516,'lowest'),(845,'lungs'),(833,'lymph'),(284,'mackenzie'),(758,'made'),(491,'maize'),(86,'major'),(249,'making'),(277,'managed'),(334,'management'),(100,'mandated'),(790,'march'),(562,'marcos'),(417,'margaret'),(72,'mark'),(734,'marked'),(817,'markedly'),(737,'marketable'),(485,'matched'),(750,'material'),(809,'mbororo'),(241,'means'),(819,'meat'),(156,'mechanisms'),(125,'meet'),(719,'menace'),(659,'met'),(861,'metal'),(898,'metals'),(391,'methodology'),(894,'mic'),(287,'mid'),(703,'militate'),(891,'minimal'),(278,'mismanaged'),(196,'mistakenly'),(200,'mitments'),(407,'model'),(357,'modeling'),(353,'models'),(413,'modifying'),(647,'monitoring'),(517,'monounsaturated'),(70,'montgomerie'),(771,'months'),(418,'morse'),(725,'mosaic'),(242,'motivate'),(253,'motivation'),(518,'mufa'),(911,'multi'),(908,'multidrug'),(672,'multiethnic'),(671,'multilingual'),(23,'multinational'),(888,'multiple'),(311,'mwandenga'),(713,'nairobi'),(12,'nation'),(27,'national'),(36,'nations'),(30,'nature'),(377,'necessarily'),(645,'necessitates'),(913,'networked'),(137,'newly'),(658,'nicaragua'),(716,'nigeria'),(834,'nodes'),(837,'nodular'),(598,'normal'),(627,'north'),(866,'nosocomial'),(348,'novak'),(608,'numerical'),(224,'nurturing'),(776,'nutrition'),(548,'nutritional'),(854,'observed'),(326,'offer'),(492,'oil'),(594,'onion'),(181,'order'),(24,'organization'),(43,'organizational'),(445,'organizations'),(838,'organs'),(800,'origin'),(399,'original'),(256,'ostrom'),(665,'overcome'),(304,'paglieri'),(127,'paper'),(799,'parameters'),(530,'parma'),(198,'part'),(226,'participate'),(679,'participatory'),(444,'partner'),(268,'past'),(650,'patricia'),(904,'pattern'),(871,'patterns'),(707,'pedagogy'),(203,'people'),(885,'percent'),(462,'performance'),(465,'period'),(616,'periods'),(363,'permit'),(374,'permits'),(48,'personal'),(901,'persons'),(931,'perverse'),(163,'phillips'),(477,'pig'),(464,'piglets'),(509,'pigs'),(307,'pinto'),(280,'places'),(573,'plan'),(366,'planning'),(749,'planting'),(161,'plants'),(863,'plasmid'),(883,'pneumoniae'),(81,'policy'),(514,'polyunsaturated'),(298,'pool'),(641,'population'),(739,'portions'),(244,'positive'),(887,'possess'),(335,'potential'),(624,'potentiometric'),(700,'power'),(331,'practical'),(82,'practice'),(791,'pre'),(811,'predominant'),(824,'pregnant'),(438,'present'),(231,'presented'),(717,'presents'),(853,'prevent'),(57,'previous'),(568,'primary'),(424,'principles'),(192,'pro'),(237,'problem'),(927,'problematic'),(199,'procedural'),(766,'processing'),(805,'production'),(186,'productive'),(119,'professional'),(475,'profile'),(872,'profiles'),(587,'program'),(849,'programmes'),(150,'progress'),(448,'project'),(443,'projects'),(855,'promote'),(708,'promoting'),(637,'properties'),(300,'property'),(545,'proportion'),(324,'prospects'),(574,'protect'),(380,'provide'),(98,'province'),(90,'provincial'),(132,'public'),(515,'pufa'),(618,'pumping'),(932,'punishing'),(183,'pursue'),(549,'quality'),(736,'quantity'),(579,'questions'),(580,'raised'),(711,'rana'),(484,'randomized'),(493,'rapeseed'),(640,'rapid'),(134,'rate'),(929,'reaching'),(815,'rearing'),(308,'reason'),(149,'recent'),(613,'recharge'),(309,'reclaimed'),(794,'recorded'),(907,'recovered'),(808,'red'),(735,'reduction'),(741,'reductions'),(508,'reflected'),(373,'reflects'),(184,'refute'),(723,'regarded'),(294,'region'),(364,'regional'),(296,'regions'),(701,'relations'),(902,'relationship'),(345,'rely'),(881,'remaining'),(398,'removed'),(61,'report'),(797,'represent'),(782,'representative'),(403,'represents'),(136,'require'),(114,'required'),(77,'requirements'),(63,'research'),(286,'researchers'),(395,'reservoir'),(375,'reservoirs'),(862,'resistance'),(754,'resistant'),(299,'resource'),(276,'resources'),(112,'respect'),(835,'respiratory'),(133,'response'),(31,'responses'),(527,'result'),(129,'results'),(41,'revealed'),(148,'review'),(283,'reyes'),(265,'rienced'),(362,'rights'),(370,'river'),(174,'robert'),(223,'role'),(305,'rome'),(773,'rosanna'),(774,'rossi'),(732,'rot'),(747,'rotation'),(359,'routinely'),(934,'ruled'),(784,'safety'),(500,'samples'),(561,'san'),(918,'sanction'),(924,'sanctioned'),(926,'sanctioning'),(919,'sanctions'),(11,'satisfaction'),(53,'satisfied'),(511,'saturated'),(803,'savannah'),(271,'scholars'),(116,'school'),(292,'sec'),(554,'security'),(585,'segments'),(394,'selected'),(602,'separated'),(104,'september'),(567,'serves'),(421,'service'),(401,'set'),(432,'setting'),(884,'seventy'),(729,'severe'),(513,'sfa'),(177,'share'),(166,'shared'),(337,'shareholding'),(769,'shelf'),(542,'show'),(821,'showed'),(232,'showing'),(243,'shown'),(621,'shows'),(322,'signal'),(320,'signaling'),(314,'signalling'),(899,'significant'),(540,'significantly'),(820,'similar'),(388,'simplifying'),(389,'simulation'),(607,'simulations'),(22,'single'),(778,'situation'),(76,'skill'),(92,'skills'),(830,'skin'),(498,'slaughter'),(780,'slaughtered'),(497,'slaughtering'),(626,'slopes'),(229,'social'),(227,'society'),(459,'sodium'),(207,'sokoloff'),(238,'solving'),(572,'source'),(570,'south'),(576,'species'),(275,'specific'),(110,'specifies'),(724,'spread'),(563,'springs'),(681,'staff'),(123,'standards'),(416,'stanford'),(372,'state'),(365,'statewide'),(721,'storage'),(742,'stored'),(886,'strains'),(121,'strategies'),(233,'strategy'),(402,'streamflows'),(850,'strengthen'),(634,'structural'),(51,'structures'),(446,'student'),(93,'students'),(274,'studied'),(230,'studies'),(14,'study'),(538,'subcutaneous'),(266,'substantial'),(451,'successful'),(64,'suggest'),(321,'suggests'),(128,'summarizes'),(495,'supplement'),(472,'supplementation'),(489,'supplemented'),(569,'supply'),(47,'support'),(195,'supporters'),(694,'supporting'),(592,'surface'),(20,'survey'),(423,'sustainability'),(419,'sustainable'),(358,'system'),(355,'systems'),(670,'takes'),(490,'tallow'),(240,'taught'),(436,'teach'),(79,'teachers'),(550,'technological'),(84,'technology'),(755,'tecto'),(859,'tehran'),(130,'telephone'),(502,'ten'),(470,'term'),(356,'texas'),(315,'theory'),(171,'thesis'),(756,'thiabendazole'),(796,'thoracis'),(693,'time'),(279,'times'),(479,'tissue'),(89,'today'),(900,'tolerant'),(434,'tool'),(190,'topic'),(426,'topics'),(164,'toronto'),(293,'tors'),(822,'toughest'),(313,'town'),(856,'trade'),(261,'traditions'),(145,'transformation'),(804,'transhumance'),(504,'treatment'),(541,'treatments'),(147,'trees'),(648,'trend'),(262,'trends'),(844,'tuberculosis'),(740,'tubers'),(118,'turning'),(385,'types'),(155,'understanding'),(3,'university'),(633,'unknown'),(535,'unsaturation'),(124,'upgrade'),(202,'uphold'),(675,'uraccan'),(5,'urho'),(857,'vajiheh'),(909,'valerie'),(246,'valuable'),(895,'values'),(259,'van'),(625,'variation'),(818,'varied'),(368,'variety'),(591,'vicinity'),(74,'victoria'),(197,'view'),(726,'virus'),(425,'vital'),(614,'vulnerable'),(686,'wales'),(351,'water'),(463,'weaned'),(466,'weaning'),(813,'weight'),(486,'weights'),(597,'wet'),(481,'white'),(205,'widely'),(910,'williamson'),(4,'windsor'),(285,'wittfogel'),(652,'wolverhampton'),(760,'wood'),(937,'woods'),(160,'woody'),(291,'work'),(297,'world'),(714,'yam'),(731,'yams'),(787,'yaoundé'),(772,'year'),(936,'zita');
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(17,3,2),(17,3,6),(25,3,3),(33,3,2),(41,3,2),(49,3,3),(49,3,8),(57,3,2),(65,3,2),(73,3,3),(81,3,3),(81,3,7),(89,3,4),(97,3,2),(105,3,2),(107,3,28),(107,3,37),(107,3,67),(107,3,81),(113,3,2),(121,3,3),(129,3,2),(137,3,2),(1,4,3),(137,4,3),(1,5,4),(1,6,5),(1,7,6),(1,8,7),(2,9,0),(2,10,1),(3,10,14),(3,10,70),(2,11,2),(3,11,15),(3,11,60),(3,11,71),(2,12,3),(2,13,4),(2,14,5),(50,14,2),(51,14,0),(91,14,1),(99,14,45),(106,14,4),(107,14,18),(2,15,6),(3,15,43),(2,16,7),(3,16,44),(3,17,0),(3,18,1),(99,18,41),(99,18,50),(99,18,67),(99,18,130),(99,18,206),(123,18,111),(3,19,2),(3,20,3),(5,20,1),(19,20,62),(21,20,4),(3,21,4),(3,21,48),(5,21,0),(21,21,10),(3,22,5),(3,23,6),(5,23,2),(3,24,7),(138,24,0),(141,24,0),(3,25,8),(3,26,9),(99,26,179),(3,27,10),(3,27,64),(19,27,7),(21,27,6),(89,27,3),(3,28,11),(107,28,15),(109,28,8),(3,29,12),(3,30,13),(3,30,69),(99,30,160),(3,31,16),(3,32,17),(3,33,18),(3,34,19),(3,35,20),(3,36,21),(3,36,57),(3,37,22),(139,37,3),(3,38,23),(131,38,15),(131,38,36),(3,39,24),(3,39,38),(3,40,25),(99,40,47),(99,40,66),(3,41,26),(3,42,27),(107,42,61),(3,43,28),(3,43,30),(3,43,33),(3,43,40),(3,44,29),(3,44,41),(19,44,27),(3,45,31),(3,46,32),(3,47,34),(19,47,80),(43,47,49),(75,47,34),(3,48,35),(3,48,45),(3,49,36),(3,49,46),(3,50,37),(3,51,39),(3,52,42),(3,53,47),(3,53,50),(3,54,49),(3,55,51),(3,56,52),(131,56,62),(3,57,53),(3,58,54),(3,58,62),(43,58,27),(3,59,55),(3,60,56),(3,61,58),(3,62,59),(91,62,96),(3,63,61),(43,63,26),(43,63,40),(107,63,35),(107,63,82),(123,63,1),(3,64,63),(35,64,34),(99,64,101),(3,65,65),(3,66,66),(43,66,31),(3,67,67),(3,68,68),(91,68,87),(17,69,0),(17,70,1),(17,71,3),(19,71,18),(19,71,38),(19,71,68),(21,71,5),(17,72,4),(17,73,5),(17,74,7),(18,75,0),(19,75,54),(19,75,72),(21,75,2),(18,76,1),(18,77,2),(18,78,3),(67,78,25),(18,79,4),(19,79,40),(19,79,53),(19,79,79),(19,79,84),(18,80,5),(43,80,66),(67,80,17),(99,80,90),(18,81,6),(67,81,16),(67,81,22),(18,82,7),(19,83,0),(19,84,1),(19,84,10),(19,84,28),(19,84,37),(21,84,1),(19,85,2),(42,85,3),(43,85,71),(19,86,3),(43,86,0),(99,86,10),(99,86,88),(19,87,4),(67,87,14),(19,88,5),(43,88,2),(45,88,0),(83,88,8),(85,88,2),(107,88,7),(19,89,6),(19,90,8),(21,90,7),(19,91,9),(19,92,11),(19,92,55),(19,92,73),(21,92,3),(43,92,6),(19,93,12),(19,93,34),(107,93,39),(19,94,13),(19,95,14),(19,96,15),(99,96,40),(99,96,49),(99,96,167),(99,96,198),(138,96,2),(141,96,2),(19,97,16),(19,98,17),(19,98,67),(19,99,19),(19,100,20),(19,101,21),(19,102,22),(19,102,29),(19,102,43),(106,102,2),(107,102,43),(107,102,53),(107,102,65),(19,103,23),(19,104,24),(19,105,25),(19,106,26),(19,107,30),(19,108,31),(19,109,32),(19,110,33),(19,111,35),(19,112,36),(19,113,39),(43,113,38),(43,113,50),(43,113,56),(82,113,0),(83,113,13),(83,113,30),(85,113,4),(19,114,41),(34,114,3),(35,114,19),(35,114,42),(19,115,42),(19,116,44),(19,116,65),(19,116,74),(43,116,24),(19,117,45),(19,117,66),(19,117,75),(19,118,46),(19,119,47),(21,119,8),(19,120,48),(21,120,9),(51,120,6),(83,120,3),(85,120,0),(107,120,31),(107,120,63),(19,121,49),(19,121,81),(107,121,44),(115,121,5),(115,121,50),(19,122,50),(19,123,51),(19,124,52),(19,125,56),(19,126,57),(43,126,1),(19,127,58),(43,127,15),(19,128,59),(19,129,60),(91,129,113),(131,129,82),(19,130,61),(19,131,63),(19,132,64),(19,133,69),(99,133,168),(19,134,70),(19,135,71),(19,136,76),(19,137,77),(19,138,78),(19,139,82),(19,139,83),(115,139,6),(21,140,0),(25,141,0),(25,142,1),(25,143,2),(26,144,0),(27,144,3),(27,144,9),(26,145,1),(27,145,4),(107,145,93),(109,145,12),(26,146,2),(27,146,5),(27,146,12),(26,147,3),(27,147,6),(27,147,13),(27,148,0),(66,148,3),(115,148,0),(27,149,1),(67,149,8),(27,150,2),(27,151,7),(43,151,72),(83,151,61),(27,152,8),(75,152,43),(75,152,45),(27,153,10),(83,153,7),(85,153,1),(27,154,11),(91,154,137),(27,155,14),(107,155,51),(27,156,15),(27,157,16),(27,158,17),(27,159,18),(27,160,19),(27,161,20),(33,162,0),(33,163,1),(33,164,3),(34,165,0),(35,165,16),(34,166,1),(35,166,17),(35,166,29),(35,166,39),(34,167,2),(35,167,6),(35,167,18),(35,167,23),(35,167,43),(34,168,4),(35,168,12),(35,168,21),(35,168,45),(34,169,5),(34,170,6),(35,170,1),(35,170,14),(35,170,35),(34,171,7),(34,172,8),(34,173,9),(35,174,0),(35,175,2),(35,176,3),(35,177,4),(35,178,5),(43,178,58),(35,179,7),(35,179,26),(35,179,40),(35,179,51),(42,179,2),(43,179,20),(35,180,8),(35,180,32),(35,181,9),(43,181,21),(35,182,10),(35,183,11),(35,184,13),(35,185,15),(35,186,20),(35,186,44),(35,187,22),(35,188,24),(35,189,25),(53,189,0),(53,189,3),(123,189,49),(123,189,83),(35,190,27),(35,190,54),(35,191,28),(35,191,55),(35,192,30),(35,193,31),(35,194,33),(35,195,36),(35,196,37),(35,197,38),(35,198,41),(43,198,39),(35,199,46),(35,200,47),(35,201,48),(35,202,49),(35,203,50),(107,203,12),(35,204,52),(35,205,53),(115,205,16),(41,206,0),(41,207,1),(41,208,3),(41,209,4),(42,210,0),(75,210,57),(99,210,12),(42,211,1),(43,211,19),(43,211,37),(43,211,55),(43,211,68),(43,212,3),(43,213,4),(43,213,46),(43,213,60),(43,214,5),(43,215,7),(43,216,8),(43,217,9),(51,217,33),(43,218,10),(43,218,11),(43,219,12),(107,219,10),(43,220,13),(43,221,14),(43,222,16),(43,223,17),(43,224,18),(43,225,22),(43,225,70),(43,226,23),(43,227,25),(43,228,28),(99,228,46),(43,229,29),(43,229,64),(83,229,15),(107,229,92),(109,229,11),(43,230,30),(43,231,32),(75,231,56),(115,231,13),(43,232,33),(43,233,34),(43,234,35),(43,235,36),(43,236,41),(43,237,42),(43,238,43),(43,239,44),(43,239,52),(43,240,45),(43,241,47),(43,242,48),(43,243,51),(43,244,53),(43,245,54),(75,245,80),(91,245,140),(43,246,57),(43,247,59),(43,248,61),(75,248,33),(139,248,22),(43,249,62),(43,250,63),(43,251,65),(43,252,67),(43,253,69),(45,254,1),(49,255,0),(49,256,1),(49,257,2),(49,257,7),(49,258,4),(49,259,5),(49,260,6),(50,261,0),(50,262,1),(50,263,3),(51,263,1),(51,263,28),(51,264,2),(51,265,3),(51,266,4),(51,267,5),(90,267,3),(99,267,188),(51,268,7),(99,268,82),(99,268,104),(51,269,8),(51,270,9),(51,271,10),(51,271,35),(51,272,11),(51,272,36),(51,273,12),(91,273,4),(91,273,115),(122,273,1),(51,274,13),(51,274,26),(51,275,14),(51,275,27),(74,275,5),(51,276,15),(51,277,16),(51,278,17),(51,279,18),(51,280,19),(51,281,20),(51,282,21),(51,283,22),(51,284,23),(51,285,24),(51,286,25),(51,287,29),(51,288,30),(51,289,31),(51,290,32),(51,291,34),(51,292,37),(51,293,38),(51,294,39),(107,294,25),(107,294,77),(123,294,11),(131,294,89),(51,295,40),(139,295,36),(51,296,41),(51,297,42),(83,297,40),(53,298,1),(53,299,2),(53,300,4),(53,301,5),(53,302,6),(57,303,0),(57,304,1),(57,305,3),(58,306,0),(58,307,1),(58,308,2),(58,309,3),(65,310,0),(73,310,0),(65,311,1),(65,312,3),(97,312,3),(65,313,4),(97,313,4),(66,314,0),(66,315,1),(67,315,1),(66,316,2),(67,316,3),(66,317,4),(66,318,5),(67,318,9),(66,319,6),(67,319,10),(67,319,13),(67,320,0),(67,321,2),(99,321,70),(67,322,4),(67,323,5),(83,323,25),(83,323,62),(99,323,207),(67,324,6),(67,325,7),(67,326,11),(67,327,12),(67,328,15),(67,329,18),(67,330,19),(67,331,20),(67,332,21),(67,332,37),(67,333,23),(67,334,24),(67,334,36),(74,334,7),(75,334,20),(75,334,53),(99,334,92),(114,334,2),(115,334,4),(115,334,49),(67,335,26),(99,335,79),(131,335,86),(67,336,27),(67,337,28),(67,338,29),(67,339,30),(67,340,31),(67,341,32),(67,342,33),(67,342,38),(139,342,16),(139,342,35),(67,343,34),(67,344,35),(67,345,39),(67,346,40),(67,347,41),(73,348,1),(73,349,2),(74,350,0),(74,351,1),(74,351,6),(75,351,1),(75,351,8),(75,351,19),(75,351,25),(75,351,52),(75,351,65),(75,351,81),(75,351,107),(77,351,0),(99,351,4),(99,351,39),(99,351,166),(99,351,190),(101,351,0),(74,352,2),(75,352,2),(75,352,108),(99,352,93),(74,353,3),(74,354,4),(75,354,51),(74,355,8),(75,355,54),(75,356,0),(75,356,106),(99,356,8),(75,357,3),(75,357,18),(75,357,36),(75,357,39),(75,357,109),(75,358,4),(75,358,11),(75,358,37),(75,358,62),(75,358,79),(75,358,103),(75,358,110),(123,358,51),(123,358,63),(75,359,5),(75,360,6),(75,360,95),(75,361,7),(75,362,9),(75,362,66),(75,362,82),(75,363,10),(75,364,12),(123,364,128),(75,365,13),(75,366,14),(75,367,15),(83,367,64),(75,368,16),(75,369,17),(75,370,21),(75,370,83),(75,370,100),(75,370,113),(99,370,61),(99,370,119),(75,371,22),(75,372,23),(75,373,24),(75,373,63),(75,374,26),(75,375,27),(75,375,68),(75,376,28),(75,376,50),(75,377,29),(75,378,30),(91,378,16),(75,379,31),(75,380,32),(99,380,205),(123,380,2),(75,381,35),(75,382,38),(75,382,75),(75,383,40),(75,384,41),(75,385,42),(75,386,44),(75,387,46),(75,388,47),(75,389,48),(75,390,49),(75,390,89),(75,391,55),(75,391,94),(75,392,58),(75,392,92),(75,392,97),(75,393,59),(75,393,72),(75,393,90),(75,393,93),(75,393,111),(75,394,60),(75,394,78),(123,394,33),(75,395,61),(75,395,102),(75,396,64),(75,397,67),(75,398,69),(75,399,70),(75,399,86),(75,400,71),(75,400,87),(75,401,73),(99,401,131),(75,402,74),(75,403,76),(75,404,77),(75,405,84),(75,405,114),(75,406,85),(75,407,88),(75,407,98),(83,407,28),(83,407,41),(83,407,56),(83,407,65),(99,407,100),(107,407,46),(107,407,49),(75,408,91),(75,409,96),(75,410,99),(75,410,112),(75,411,101),(75,412,104),(83,412,34),(83,412,50),(75,413,105),(81,414,0),(81,415,1),(81,416,2),(81,416,6),(83,416,36),(81,417,4),(81,418,5),(82,419,1),(83,419,2),(83,419,23),(83,419,32),(83,419,39),(82,420,2),(83,420,24),(83,420,33),(83,420,51),(82,421,3),(83,421,12),(83,421,16),(83,421,29),(85,421,3),(83,422,0),(83,423,1),(85,423,5),(83,424,4),(83,425,5),(83,426,6),(83,427,9),(83,428,10),(83,429,11),(99,429,37),(83,430,14),(83,431,17),(83,432,18),(139,432,1),(139,432,6),(83,433,19),(83,434,20),(83,435,21),(83,436,22),(83,436,31),(83,437,26),(83,437,38),(83,438,27),(83,439,35),(83,440,37),(83,441,42),(83,442,43),(83,443,44),(83,444,45),(83,444,54),(83,445,46),(83,445,55),(83,446,47),(83,447,48),(83,448,49),(83,449,52),(83,450,53),(83,451,57),(83,452,58),(83,453,59),(107,453,0),(83,454,60),(107,454,11),(83,455,63),(89,456,0),(89,457,1),(89,458,2),(90,459,0),(90,460,1),(90,461,2),(90,462,4),(90,463,5),(90,464,6),(90,465,7),(115,465,96),(90,466,8),(91,467,0),(123,467,0),(123,467,116),(91,468,2),(91,469,3),(99,469,178),(122,469,0),(91,470,5),(91,470,116),(122,470,2),(91,471,6),(91,471,136),(91,471,143),(123,471,71),(91,472,7),(91,472,118),(91,472,127),(91,473,8),(91,473,43),(91,473,49),(91,473,59),(91,473,67),(91,473,72),(91,473,120),(91,473,133),(122,473,6),(91,474,9),(91,474,44),(91,474,50),(91,474,60),(91,474,68),(91,474,73),(91,474,80),(91,474,84),(91,474,89),(91,474,121),(122,474,7),(91,475,10),(91,475,122),(130,475,5),(131,475,65),(91,476,11),(91,476,123),(122,476,9),(130,476,1),(131,476,1),(131,476,51),(131,476,58),(131,476,74),(91,477,12),(91,477,124),(91,477,135),(91,478,13),(91,478,125),(91,479,14),(91,479,109),(91,479,126),(91,480,15),(91,481,17),(123,481,53),(91,482,18),(91,483,19),(91,484,20),(91,485,21),(91,486,22),(91,487,23),(91,488,24),(91,489,25),(91,489,52),(91,490,26),(91,491,27),(91,492,28),(91,492,30),(91,492,129),(91,493,29),(91,493,128),(91,494,31),(91,494,53),(91,494,119),(122,494,5),(91,495,32),(91,496,33),(91,496,56),(91,496,63),(91,496,76),(91,497,34),(91,498,35),(123,498,23),(123,498,31),(91,499,36),(91,499,46),(91,499,54),(91,499,92),(91,499,108),(122,499,11),(91,500,37),(91,501,38),(99,501,68),(91,502,39),(91,503,40),(91,504,41),(91,504,86),(91,505,42),(91,506,45),(91,506,51),(122,506,8),(123,506,39),(91,507,47),(107,507,68),(91,508,48),(91,509,55),(93,509,0),(122,509,10),(91,510,57),(91,510,64),(91,510,77),(91,511,58),(91,512,61),(91,512,65),(91,512,75),(91,512,78),(123,512,72),(91,513,62),(91,514,66),(91,515,69),(91,516,70),(91,517,71),(91,518,74),(91,519,79),(91,520,81),(91,520,97),(91,521,82),(91,522,83),(91,523,85),(91,524,88),(91,525,90),(91,525,95),(99,525,142),(99,525,155),(91,526,91),(91,527,93),(99,527,78),(91,528,94),(91,529,98),(91,530,99),(91,531,100),(91,532,101),(115,532,28),(115,532,35),(115,532,75),(91,533,102),(91,534,103),(91,535,104),(91,536,105),(91,537,106),(91,538,107),(91,539,110),(91,540,111),(99,540,152),(91,541,112),(91,542,114),(91,543,117),(122,543,4),(91,544,130),(115,544,93),(91,545,131),(91,546,132),(115,546,61),(131,546,12),(131,546,38),(131,546,60),(91,547,134),(91,548,138),(91,549,139),(91,549,142),(123,549,12),(123,549,37),(123,549,70),(91,550,141),(91,551,144),(91,552,145),(93,553,1),(125,553,1),(93,554,2),(125,554,2),(97,555,0),(97,556,1),(98,557,0),(99,557,26),(99,557,64),(99,557,180),(98,558,1),(98,559,2),(99,559,0),(99,559,33),(99,559,95),(98,560,3),(99,560,1),(99,560,34),(99,560,96),(99,560,176),(98,561,4),(99,561,19),(99,561,28),(99,561,83),(99,561,105),(99,561,137),(99,561,182),(99,561,201),(98,562,5),(99,562,20),(99,562,84),(99,562,106),(99,562,138),(99,562,183),(99,562,202),(98,563,6),(98,563,8),(99,563,11),(99,563,21),(99,563,31),(99,563,85),(99,563,87),(99,563,108),(99,563,139),(99,563,148),(99,563,185),(99,563,203),(98,564,7),(99,564,30),(99,564,86),(99,564,107),(99,564,147),(99,564,184),(98,565,9),(99,565,35),(99,565,69),(99,565,109),(99,565,143),(99,565,144),(99,565,156),(99,565,157),(98,566,10),(99,566,36),(99,566,65),(99,566,110),(123,566,24),(123,566,85),(99,567,2),(107,567,72),(99,568,3),(99,569,5),(123,569,122),(99,570,6),(99,571,7),(123,571,9),(99,572,9),(99,572,159),(99,573,13),(99,574,14),(115,574,81),(99,575,15),(99,576,16),(99,577,17),(99,578,18),(99,579,22),(99,579,38),(99,580,23),(99,581,24),(99,582,25),(99,583,27),(99,583,52),(99,583,57),(99,583,72),(99,583,112),(99,584,29),(99,585,32),(99,585,77),(99,586,42),(99,587,43),(99,587,200),(99,588,44),(99,588,208),(99,589,48),(99,589,51),(99,589,71),(99,589,80),(99,589,94),(99,589,111),(99,589,197),(99,590,53),(99,591,54),(99,591,127),(99,592,55),(99,592,136),(99,592,150),(99,593,56),(99,594,58),(99,594,116),(99,595,59),(99,595,117),(99,596,60),(99,596,118),(99,597,62),(99,598,63),(99,599,73),(99,600,74),(99,601,75),(99,602,76),(99,603,81),(99,604,89),(99,605,91),(99,606,97),(99,607,98),(99,608,99),(99,609,102),(99,610,103),(99,611,113),(99,611,120),(99,612,114),(99,613,115),(99,613,124),(99,614,121),(99,615,122),(99,616,123),(99,616,145),(99,616,158),(99,617,125),(99,618,126),(99,619,128),(99,619,140),(99,619,146),(99,619,169),(99,619,192),(99,620,129),(99,620,193),(99,620,204),(99,621,132),(99,622,133),(123,622,73),(99,623,134),(99,624,135),(99,624,149),(99,624,163),(99,625,141),(99,626,151),(99,627,153),(99,628,154),(99,629,161),(99,629,177),(99,630,162),(99,631,164),(99,632,165),(99,633,170),(99,634,171),(99,635,172),(99,636,173),(99,637,174),(99,638,175),(99,639,181),(99,640,186),(99,641,187),(99,642,189),(99,643,191),(99,644,194),(99,645,195),(99,646,196),(99,647,199),(99,648,209),(99,649,210),(105,650,0),(105,651,1),(105,652,3),(106,653,0),(106,654,1),(107,654,42),(107,654,64),(106,655,3),(107,655,17),(106,656,5),(107,656,20),(106,657,6),(107,657,21),(106,658,7),(107,658,22),(107,659,1),(107,660,2),(109,660,0),(107,661,3),(109,661,1),(107,662,4),(107,663,5),(107,664,6),(109,664,2),(107,665,8),(107,666,9),(107,667,13),(107,667,47),(107,667,87),(107,668,14),(109,668,7),(107,669,16),(109,669,9),(107,670,19),(107,671,23),(109,671,3),(107,672,24),(109,672,4),(107,673,26),(107,674,27),(107,674,50),(107,675,29),(107,676,30),(107,677,32),(107,677,89),(107,678,33),(107,679,34),(107,679,85),(109,679,5),(107,680,36),(123,680,42),(107,681,38),(107,682,40),(107,683,41),(107,684,45),(107,685,48),(107,686,52),(107,687,54),(107,688,55),(107,689,56),(107,690,57),(139,690,30),(107,691,58),(107,691,71),(107,692,59),(107,693,60),(107,694,62),(107,695,66),(107,696,69),(107,697,70),(107,698,73),(107,699,74),(107,700,75),(107,701,76),(107,702,78),(107,703,79),(107,704,80),(109,704,10),(107,705,83),(107,706,84),(107,707,86),(109,707,6),(107,708,88),(107,709,90),(107,710,91),(113,711,0),(113,712,1),(113,713,3),(114,714,0),(115,714,3),(115,714,20),(115,714,34),(115,714,82),(115,714,89),(114,715,1),(115,715,2),(115,715,12),(115,715,19),(115,715,33),(115,715,55),(115,715,70),(123,715,126),(114,716,3),(115,716,9),(115,717,1),(115,718,7),(115,718,53),(115,719,8),(115,720,10),(115,720,18),(115,720,54),(115,721,11),(115,721,32),(115,721,69),(115,721,79),(115,721,86),(115,722,14),(115,723,15),(115,724,17),(115,725,21),(115,726,22),(115,727,23),(115,728,24),(115,728,30),(123,728,19),(115,729,25),(115,729,46),(115,730,26),(115,731,27),(115,731,37),(115,731,48),(115,732,29),(115,732,36),(115,733,31),(115,734,38),(115,735,39),(115,736,40),(115,737,41),(115,738,42),(115,739,43),(115,740,44),(115,740,83),(115,740,90),(115,741,45),(115,742,47),(115,743,51),(115,744,52),(115,745,56),(115,746,57),(115,746,65),(115,747,58),(115,748,59),(115,749,60),(115,750,62),(115,751,63),(115,752,64),(115,753,66),(115,753,68),(115,754,67),(115,755,71),(115,756,72),(115,757,73),(115,758,74),(139,758,23),(115,759,76),(115,760,77),(115,761,78),(115,762,80),(115,763,84),(123,763,90),(115,764,85),(131,764,88),(115,765,87),(115,766,88),(115,767,91),(115,768,92),(115,769,94),(115,770,95),(115,771,97),(115,772,98),(123,772,68),(121,773,0),(121,774,1),(121,775,2),(122,776,3),(123,777,3),(123,778,4),(123,779,5),(123,779,26),(123,779,44),(123,779,64),(123,779,118),(125,779,0),(123,780,6),(123,780,36),(123,780,81),(123,781,7),(123,781,18),(123,782,8),(123,783,10),(123,784,13),(123,785,14),(123,785,121),(123,786,15),(123,787,16),(123,788,17),(123,789,20),(123,790,21),(123,791,22),(123,792,25),(123,793,27),(123,793,32),(123,793,100),(123,794,28),(123,795,29),(123,795,40),(123,796,30),(123,796,41),(123,797,34),(123,798,35),(123,799,38),(123,800,43),(123,801,45),(123,802,46),(139,802,28),(123,803,47),(123,804,48),(123,805,50),(123,805,119),(123,806,52),(123,806,76),(123,807,54),(123,808,55),(123,809,56),(123,810,57),(123,810,75),(123,811,58),(123,812,59),(123,813,60),(123,814,61),(123,814,109),(123,815,62),(123,816,65),(123,817,66),(123,818,67),(123,819,69),(123,819,79),(123,820,74),(123,821,77),(123,822,78),(123,823,80),(123,824,82),(123,825,84),(123,826,86),(123,827,87),(123,828,88),(123,829,89),(123,830,91),(123,831,92),(123,831,99),(123,832,93),(123,833,94),(123,834,95),(123,835,96),(123,836,97),(123,837,98),(123,838,101),(123,839,102),(123,839,106),(123,840,103),(123,841,104),(123,842,105),(123,843,107),(139,843,18),(123,844,108),(123,845,110),(123,846,112),(123,847,113),(123,848,114),(123,849,115),(123,850,117),(123,851,120),(123,852,123),(123,853,124),(123,854,125),(123,855,127),(123,856,129),(129,857,0),(129,858,1),(129,859,3),(130,860,0),(131,860,0),(131,860,67),(130,861,2),(131,861,2),(131,861,59),(130,862,3),(131,862,3),(131,862,34),(131,862,68),(131,862,73),(131,862,84),(130,863,4),(131,863,5),(131,863,64),(131,863,71),(130,864,6),(131,864,7),(131,864,85),(130,865,7),(131,865,9),(131,865,29),(131,865,55),(131,865,79),(130,866,8),(131,866,10),(131,866,18),(131,866,30),(131,866,80),(131,866,87),(130,867,9),(131,867,11),(131,867,19),(131,867,31),(131,867,81),(130,868,10),(131,868,56),(130,869,11),(130,870,12),(131,871,4),(131,872,6),(131,873,8),(131,874,13),(131,874,39),(131,875,14),(131,875,40),(131,875,50),(131,876,16),(131,877,17),(131,878,20),(131,879,21),(131,880,22),(131,881,23),(131,882,24),(131,883,25),(131,884,26),(131,885,27),(131,886,28),(131,886,37),(131,886,47),(131,886,54),(131,886,78),(131,887,32),(131,888,33),(131,889,35),(131,889,76),(131,890,41),(131,891,42),(131,892,43),(131,893,44),(131,894,45),(131,895,46),(131,896,48),(131,897,49),(131,898,52),(131,898,75),(131,899,53),(131,900,57),(131,901,61),(131,902,63),(131,903,66),(139,903,37),(131,904,69),(131,905,70),(131,906,72),(131,907,77),(131,908,83),(137,909,0),(137,910,1),(138,911,1),(141,911,1),(138,912,3),(141,912,3),(138,913,4),(138,914,5),(139,915,0),(139,916,2),(139,916,9),(139,916,31),(139,917,4),(139,918,5),(139,919,7),(139,920,8),(139,921,10),(139,921,24),(139,922,11),(139,923,12),(139,924,13),(139,925,14),(139,925,33),(139,926,15),(139,926,26),(139,926,34),(139,927,17),(139,928,19),(139,929,20),(139,930,21),(139,931,25),(139,932,27),(139,933,29),(139,934,32),(141,935,4),(145,936,0),(145,937,1),(145,938,2),(146,939,0),(146,940,1),(146,940,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,2,1,0),(2,2,2,0),(3,2,4,0),(4,2,16,0),(5,2,17,0),(6,2,8,0),(7,2,32,0),(8,2,64,0),(17,3,1,0),(18,3,2,0),(19,3,4,0),(20,3,16,0),(21,3,17,0),(22,3,8,0),(23,3,32,0),(24,3,64,0),(25,4,1,0),(26,4,2,0),(27,4,4,0),(28,4,16,0),(29,4,17,0),(30,4,8,0),(31,4,32,0),(32,4,64,0),(33,5,1,0),(34,5,2,0),(35,5,4,0),(36,5,16,0),(37,5,17,0),(38,5,8,0),(39,5,32,0),(40,5,64,0),(41,6,1,0),(42,6,2,0),(43,6,4,0),(44,6,16,0),(45,6,17,0),(46,6,8,0),(47,6,32,0),(48,6,64,0),(49,7,1,0),(50,7,2,0),(51,7,4,0),(52,7,16,0),(53,7,17,0),(54,7,8,0),(55,7,32,0),(56,7,64,0),(57,8,1,0),(58,8,2,0),(59,8,4,0),(60,8,16,0),(61,8,17,0),(62,8,8,0),(63,8,32,0),(64,8,64,0),(65,9,1,0),(66,9,2,0),(67,9,4,0),(68,9,16,0),(69,9,17,0),(70,9,8,0),(71,9,32,0),(72,9,64,0),(73,10,1,0),(74,10,2,0),(75,10,4,0),(76,10,16,0),(77,10,17,0),(78,10,8,0),(79,10,32,0),(80,10,64,0),(81,11,1,0),(82,11,2,0),(83,11,4,0),(84,11,16,0),(85,11,17,0),(86,11,8,0),(87,11,32,0),(88,11,64,0),(89,12,1,0),(90,12,2,0),(91,12,4,0),(92,12,16,0),(93,12,17,0),(94,12,8,0),(95,12,32,0),(96,12,64,0),(97,13,1,0),(98,13,2,0),(99,13,4,0),(100,13,16,0),(101,13,17,0),(102,13,8,0),(103,13,32,0),(104,13,64,0),(105,14,1,0),(106,14,2,0),(107,14,4,0),(108,14,16,0),(109,14,17,0),(110,14,8,0),(111,14,32,0),(112,14,64,0),(113,15,1,0),(114,15,2,0),(115,15,4,0),(116,15,16,0),(117,15,17,0),(118,15,8,0),(119,15,32,0),(120,15,64,0),(121,16,1,0),(122,16,2,0),(123,16,4,0),(124,16,16,0),(125,16,17,0),(126,16,8,0),(127,16,32,0),(128,16,64,0),(129,17,1,0),(130,17,2,0),(131,17,4,0),(132,17,16,0),(133,17,17,0),(134,17,8,0),(135,17,32,0),(136,17,64,0),(137,18,1,0),(138,18,2,0),(139,18,4,0),(140,18,16,0),(141,18,17,0),(142,18,8,0),(143,18,32,0),(144,18,64,0),(145,19,1,0),(146,19,2,0),(147,19,4,0),(148,19,16,0),(149,19,17,0),(150,19,8,0),(151,19,32,0),(152,19,64,0);
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
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2025-12-19 05:17:18','2025-12-19 05:17:17','2025-12-19 05:17:17',5,'en_US',1,0,0),(2,1,2,'2025-12-19 05:17:48','2025-12-19 05:17:35','2025-12-19 05:17:35',5,'en_US',3,0,0),(3,1,4,'2025-12-19 05:18:27','2025-12-19 05:18:08','2025-12-19 05:18:08',5,'en_US',3,0,0),(4,1,5,'2025-12-19 05:18:48','2025-12-19 05:18:45','2025-12-19 05:18:45',5,'en_US',3,0,0),(5,1,6,'2025-12-19 05:19:10','2025-12-19 05:19:06','2025-12-19 05:19:06',5,'en_US',3,0,0),(6,1,7,'2025-12-19 05:19:31','2025-12-19 05:19:28','2025-12-19 05:19:28',5,'en_US',3,0,0),(7,1,8,'2025-12-19 05:19:55','2025-12-19 05:19:51','2025-12-19 05:19:51',5,'en_US',3,0,0),(8,1,9,'2025-12-19 05:20:16','2025-12-19 05:20:12','2025-12-19 05:20:12',5,'en_US',3,0,0),(9,1,10,'2025-12-19 05:20:37','2025-12-19 05:20:34','2025-12-19 05:20:34',5,'en_US',3,0,0),(10,1,11,'2025-12-19 05:20:59','2025-12-19 05:20:55','2025-12-19 05:20:55',5,'en_US',3,0,0),(11,1,12,'2025-12-19 05:21:23','2025-12-19 05:21:19','2025-12-19 05:21:19',5,'en_US',3,0,0),(12,1,13,'2025-12-19 05:21:44','2025-12-19 05:21:41','2025-12-19 05:21:41',5,'en_US',3,0,0),(13,1,14,'2025-12-19 05:22:06','2025-12-19 05:22:03','2025-12-19 05:22:03',5,'en_US',3,0,0),(14,1,15,'2025-12-19 05:22:28','2025-12-19 05:22:24','2025-12-19 05:22:24',5,'en_US',3,0,0),(15,1,16,'2025-12-19 05:22:49','2025-12-19 05:22:46','2025-12-19 05:22:46',5,'en_US',3,0,0),(16,1,17,'2025-12-19 05:23:11','2025-12-19 05:23:07','2025-12-19 05:23:07',5,'en_US',3,0,0),(17,1,18,'2025-12-19 05:23:33','2025-12-19 05:23:29','2025-12-19 05:23:29',5,'en_US',3,0,0),(18,1,19,'2025-12-19 05:23:56','2025-12-19 05:23:52','2025-12-19 05:23:52',5,'en_US',3,0,0),(19,1,20,'2025-12-19 05:24:18','2025-12-19 05:24:14','2025-12-19 05:24:14',5,'en_US',3,0,0);
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
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PSM','string'),(2,'en_US','name','Preprint Server manager','string'),(2,'fr_CA','abbrev','##default.groups.abbrev.manager##','string'),(2,'fr_CA','name','##default.groups.name.manager##','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(3,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(3,'en_US','abbrev','MOD','string'),(3,'en_US','name','Moderator','string'),(3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##','string'),(3,'fr_CA','name','##default.groups.name.sectionEditor##','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(4,'','nameLocaleKey','default.groups.name.author','string'),(4,'en_US','abbrev','AU','string'),(4,'en_US','name','Author','string'),(4,'fr_CA','abbrev','AU','string'),(4,'fr_CA','name','Auteur-e','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(5,'','nameLocaleKey','default.groups.name.reader','string'),(5,'en_US','abbrev','Read','string'),(5,'en_US','name','Reader','string'),(5,'fr_CA','abbrev','Lect','string'),(5,'fr_CA','name','Lecteur-trice','string');
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
INSERT INTO `user_group_stage` VALUES (1,2,1),(1,2,5),(1,3,1),(1,3,5),(1,4,1),(1,4,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName',0,0,'admin','string'),(1,'en_US','givenName',0,0,'admin','string'),(2,'','orcid',0,0,'','string'),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México','string'),(2,'en_US','biography',0,0,'','string'),(2,'en_US','familyName',0,0,'Vaca','string'),(2,'en_US','givenName',0,0,'Ramiro','string'),(2,'en_US','preferredPublicName',0,0,'','string'),(2,'en_US','signature',0,0,'','string'),(2,'fr_CA','affiliation',0,0,'','string'),(2,'fr_CA','biography',0,0,'','string'),(2,'fr_CA','familyName',0,0,'','string'),(2,'fr_CA','givenName',0,0,'','string'),(2,'fr_CA','preferredPublicName',0,0,'','string'),(2,'fr_CA','signature',0,0,'','string'),(3,'','orcid',0,0,'','string'),(3,'en_US','affiliation',0,0,'University of Melbourne','string'),(3,'en_US','biography',0,0,'','string'),(3,'en_US','familyName',0,0,'Barnes','string'),(3,'en_US','givenName',0,0,'Daniel','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'fr_CA','affiliation',0,0,'','string'),(3,'fr_CA','biography',0,0,'','string'),(3,'fr_CA','familyName',0,0,'','string'),(3,'fr_CA','givenName',0,0,'','string'),(3,'fr_CA','preferredPublicName',0,0,'','string'),(3,'fr_CA','signature',0,0,'','string'),(4,'','orcid',0,0,'','string'),(4,'en_US','affiliation',0,0,'University of Chicago','string'),(4,'en_US','biography',0,0,'','string'),(4,'en_US','familyName',0,0,'Buskins','string'),(4,'en_US','givenName',0,0,'David','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'fr_CA','affiliation',0,0,'','string'),(4,'fr_CA','biography',0,0,'','string'),(4,'fr_CA','familyName',0,0,'','string'),(4,'fr_CA','givenName',0,0,'','string'),(4,'fr_CA','preferredPublicName',0,0,'','string'),(4,'fr_CA','signature',0,0,'','string'),(5,'','orcid',0,0,'','string'),(5,'en_US','affiliation',0,0,'University of Toronto','string'),(5,'en_US','biography',0,0,'','string'),(5,'en_US','familyName',0,0,'Berardo','string'),(5,'en_US','givenName',0,0,'Stephanie','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'fr_CA','affiliation',0,0,'','string'),(5,'fr_CA','biography',0,0,'','string'),(5,'fr_CA','familyName',0,0,'','string'),(5,'fr_CA','givenName',0,0,'','string'),(5,'fr_CA','preferredPublicName',0,0,'','string'),(5,'fr_CA','signature',0,0,'','string'),(6,'','orcid',0,0,'','string'),(6,'en_US','affiliation',0,0,'Kyoto University','string'),(6,'en_US','biography',0,0,'','string'),(6,'en_US','familyName',0,0,'Inoue','string'),(6,'en_US','givenName',0,0,'Minoti','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'fr_CA','affiliation',0,0,'','string'),(6,'fr_CA','biography',0,0,'','string'),(6,'fr_CA','familyName',0,0,'','string'),(6,'fr_CA','givenName',0,0,'','string'),(6,'fr_CA','preferredPublicName',0,0,'','string'),(6,'fr_CA','signature',0,0,'','string'),(7,'en_US','affiliation',0,0,'University of Bologna','string'),(7,'en_US','familyName',0,0,'Corino','string'),(7,'en_US','givenName',0,0,'Carlo','string'),(8,'en_US','affiliation',0,0,'University of Windsor','string'),(8,'en_US','familyName',0,0,'Kwantes','string'),(8,'en_US','givenName',0,0,'Catherine','string'),(9,'en_US','affiliation',0,0,'University of Alberta','string'),(9,'en_US','familyName',0,0,'Montgomerie','string'),(9,'en_US','givenName',0,0,'Craig','string'),(10,'en_US','affiliation',0,0,'Alexandria University','string'),(10,'en_US','familyName',0,0,'Diouf','string'),(10,'en_US','givenName',0,0,'Diaga','string'),(11,'en_US','affiliation',0,0,'University of Toronto','string'),(11,'en_US','familyName',0,0,'Phillips','string'),(11,'en_US','givenName',0,0,'Dana','string'),(12,'en_US','affiliation',0,0,'University College Cork','string'),(12,'en_US','familyName',0,0,'Sokoloff','string'),(12,'en_US','givenName',0,0,'Domatilia','string'),(13,'en_US','affiliation',0,0,'Indiana University','string'),(13,'en_US','familyName',0,0,'Ostrom','string'),(13,'en_US','givenName',0,0,'Elinor','string'),(14,'en_US','affiliation',0,0,'University of Rome','string'),(14,'en_US','familyName',0,0,'Paglieri','string'),(14,'en_US','givenName',0,0,'Fabio','string'),(15,'en_US','affiliation',0,0,'University of Cape Town','string'),(15,'en_US','familyName',0,0,'Mwandenga','string'),(15,'en_US','givenName',0,0,'John','string'),(16,'en_US','affiliation',0,0,'Aalborg University','string'),(16,'en_US','familyName',0,0,'Novak','string'),(16,'en_US','givenName',0,0,'John','string'),(17,'en_US','affiliation',0,0,'Stanford University','string'),(17,'en_US','familyName',0,0,'Al-Khafaji','string'),(17,'en_US','givenName',0,0,'Karim','string'),(18,'en_US','affiliation',0,0,'Australian National University','string'),(18,'en_US','familyName',0,0,'Christopher','string'),(18,'en_US','givenName',0,0,'Leo','string'),(19,'en_US','affiliation',0,0,'University of Cape Town','string'),(19,'en_US','familyName',0,0,'Kumiega','string'),(19,'en_US','givenName',0,0,'Lise','string'),(20,'en_US','affiliation',0,0,'University of Wolverhampton','string'),(20,'en_US','familyName',0,0,'Daniel','string'),(20,'en_US','givenName',0,0,'Patricia','string'),(21,'en_US','affiliation',0,0,'University of Nairobi','string'),(21,'en_US','familyName',0,0,'Baiyewu','string'),(21,'en_US','givenName',0,0,'Rana','string'),(22,'en_US','affiliation',0,0,'Barcelona University','string'),(22,'en_US','familyName',0,0,'Rossi','string'),(22,'en_US','givenName',0,0,'Rosanna','string'),(23,'en_US','affiliation',0,0,'University of Tehran','string'),(23,'en_US','familyName',0,0,'Karbasizaed','string'),(23,'en_US','givenName',0,0,'Vajiheh','string'),(24,'en_US','affiliation',0,0,'University of Windsor','string'),(24,'en_US','familyName',0,0,'Williamson','string'),(24,'en_US','givenName',0,0,'Valerie','string'),(25,'en_US','affiliation',0,0,'CUNY','string'),(25,'en_US','familyName',0,0,'Woods','string'),(25,'en_US','givenName',0,0,'Zita','string');
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
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(2,3),(3,4),(3,5),(3,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$olhq41LXOlqNwHqnjbhFiOVl8skUgh60bg.d6CUHmstW.GjNAQf8a','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2025-12-19 05:15:26',NULL,'2025-12-19 05:16:39',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$dNZfccppIN0UQFwNModnc.0OiUbSAB1erf8iOOuA/C4uiQ1d10ag2','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2025-12-19 05:16:06',NULL,'2025-12-19 05:16:32',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$ui9wDgcbOiVgA22cG8rQHeI9Q80CmMzo0P9tNZJJ0QcNbiDnni50a','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2025-12-19 05:16:11',NULL,'2025-12-19 05:24:15',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$vMlaM2PH5xHSeKUCsT8wU.VufXeJe7yg4dkXP.Dnv5y3Nu5yjS4Wq','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2025-12-19 05:16:16',NULL,'2025-12-19 05:16:16',0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$W6.cF3SPNl/2BzbNCDxeSe6GiEJH07Iz0J5Bp8PgzHxYOzBAkLarm','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2025-12-19 05:16:22',NULL,'2025-12-19 05:16:22',0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$XwNWDux/RulMq3h5p4NyCO19BoTLtCm5w7NYpAAZUuptO0QJRxYCO','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2025-12-19 05:16:28',NULL,'2025-12-19 05:16:28',0,NULL,NULL,0,NULL,1),(7,'ccorino','$2y$10$Y5cQyubIypnDqjoMg8rblOlNNMqZjFp2sKtdAI.qVzaViOEGRqV.6','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2025-12-19 05:17:03',NULL,'2025-12-19 05:17:03',0,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$8GAl0EdZSS0flMHrIJLslOvpnVgvAXQA3J7FuX49C0dQXCVfi6h6W','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-12-19 05:17:21',NULL,'2025-12-19 05:17:21',0,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$LvR9MIOnf0goDxN59SGdvOMBJWPMHQocIIow7CGNmGTjH2SVCDcoy','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-12-19 05:17:51',NULL,'2025-12-19 05:17:51',0,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$T5Pu2hC7njePJh79ssgsH.3Y6HfNksU0mPixTlknsn5zksMCdcLlC','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','',NULL,NULL,'2025-12-19 05:18:31',NULL,'2025-12-19 05:18:31',0,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$BG2YtIcd7VS74IQY8y641ugsv/Wg.iP7nyBL0gO4snu8dUDODlYMu','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-12-19 05:18:52',NULL,'2025-12-19 05:18:52',0,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$1O7RsXycfg.34wDn7HI.feQWXLmhxbxCP9Bzl58pgusB3LxNWQqQu','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','',NULL,NULL,'2025-12-19 05:19:13',NULL,'2025-12-19 05:19:14',0,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$4ufc6X7vOJ0AU518Hf6jRORc4hM6iJA.yM5WNcbug7WrqNbrvAqeW','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2025-12-19 05:19:35',NULL,'2025-12-19 05:19:35',0,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$2JglutAt9BQB6KDac/lDr.57eLjh.YdXF.wwqnJwTP32xF9zeyAjq','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2025-12-19 05:19:58',NULL,'2025-12-19 05:19:58',0,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$QQRDaqMsjWB8aMAVF.Vu2uXI6wq4LxMZYql4or0r8wLnq63z.l7XW','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2025-12-19 05:20:19',NULL,'2025-12-19 05:20:19',0,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$13t0jBfRZr1XMLjTjjkif.DvdaqDvXv9K.9neX/2JckgWJAUJaNyK','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','',NULL,NULL,'2025-12-19 05:20:41',NULL,'2025-12-19 05:20:41',0,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$J.0pzVmRJz1H6UmI.0C8EO5LRFJ0D.spGtYatA2.Ea92Njwuh85xe','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2025-12-19 05:21:02',NULL,'2025-12-19 05:21:02',0,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$YVN3jKmI5G6P76mxkS4psuxEANswuI.cHW2iIx8mUfB6u9B5gdHX2','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','',NULL,NULL,'2025-12-19 05:21:26',NULL,'2025-12-19 05:21:26',0,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$aaesypnDgRri7homvJvcIuRwVKyYNjDL7HEhPk5sODz12M7DMFQMi','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2025-12-19 05:21:48',NULL,'2025-12-19 05:21:48',0,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$iAiKNg5UuqjU5OD2dHy7T.doGKQkumOrJAKZ8g442bo7HJEqsPp1G','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','',NULL,NULL,'2025-12-19 05:22:10',NULL,'2025-12-19 05:22:10',0,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$U4K5jhw0LkryhLK7DBApr.8rLpHDuaIQYbfo.L5qLbKJe8VzD8Jei','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','',NULL,NULL,'2025-12-19 05:22:31',NULL,'2025-12-19 05:22:31',0,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$.cceXaLUSZmxNR7B1onVXerEw0Ku6AxBHTt8DnByu9v0.Irz09Rzm','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','',NULL,NULL,'2025-12-19 05:22:53',NULL,'2025-12-19 05:22:53',0,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$1GBv7uglWX2cCflMoObqqeJ09xZ265nJwX1wCTCc0uz1ckHlVBhO.','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','',NULL,NULL,'2025-12-19 05:23:15',NULL,'2025-12-19 05:23:15',0,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$9heh9IcXSo5Oy5JXmnZA9eGTLuOmZK2Of8n26RLyTmwuNsXOMLJq6','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2025-12-19 05:23:37',NULL,'2025-12-19 05:23:38',0,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$ZnUndDf32wEczHu//sY74edXhyHDeqMHQUwhQrvwyZVrV7xvqzpki','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2025-12-19 05:23:59',NULL,'2025-12-19 05:24:00',0,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2025-12-19 05:15:26',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,1,0,'2025-12-19 05:15:26',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,1,0,'2025-12-19 05:15:26',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,2,0,0,'2025-12-19 05:15:26',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,1,3,15,'2025-12-19 05:15:26',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.generic','crossrefDeposit','CrossrefDepositPlugin',1,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,1,0,0,'2025-12-19 05:15:26',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,2,0,0,'2025-12-19 05:15:26',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(2,2,0,0,'2025-12-19 05:15:26',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,1,0,0,'2025-12-19 05:15:26',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2025-12-19 05:15:26',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,3,0,22,'2025-12-19 05:15:24',1,'core','ops','',0,1);
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

-- Dump completed on 2025-12-19  5:24:18
