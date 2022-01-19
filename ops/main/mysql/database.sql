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
INSERT INTO `author_settings` VALUES (1,'','country','IT'),(1,'en_US','affiliation','University of Bologna'),(1,'en_US','familyName','Corino'),(1,'en_US','givenName','Carlo'),(2,'','country','CA'),(2,'en_US','affiliation','University of Windsor'),(2,'en_US','familyName','Kwantes'),(2,'en_US','givenName','Catherine'),(3,'','country','CA'),(3,'en_US','affiliation','University of Alberta'),(3,'en_US','familyName','Montgomerie'),(3,'en_US','givenName','Craig'),(4,'','country','CA'),(4,'','orcid',''),(4,'','url',''),(4,'en_US','affiliation','University of Victoria'),(4,'en_US','biography',''),(4,'en_US','familyName','Irvine'),(4,'en_US','givenName','Mark'),(4,'en_US','preferredPublicName',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(5,'','country','EG'),(5,'en_US','affiliation','Alexandria University'),(5,'en_US','familyName','Diouf'),(5,'en_US','givenName','Diaga'),(6,'','country','CA'),(6,'en_US','affiliation','University of Toronto'),(6,'en_US','familyName','Phillips'),(6,'en_US','givenName','Dana'),(7,'','country','IE'),(7,'en_US','affiliation','University College Cork'),(7,'en_US','familyName','Sokoloff'),(7,'en_US','givenName','Domatilia'),(8,'','country','US'),(8,'en_US','affiliation','Indiana University'),(8,'en_US','familyName','Ostrom'),(8,'en_US','givenName','Elinor'),(9,'','country','US'),(9,'','orcid',''),(9,'','url',''),(9,'en_US','affiliation','Indiana University'),(9,'en_US','biography',''),(9,'en_US','familyName','van Laerhoven'),(9,'en_US','givenName','Frank'),(9,'en_US','preferredPublicName',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(10,'','country','IT'),(10,'en_US','affiliation','University of Rome'),(10,'en_US','familyName','Paglieri'),(10,'en_US','givenName','Fabio'),(11,'','country','ZA'),(11,'en_US','affiliation','University of Cape Town'),(11,'en_US','familyName','Mwandenga'),(11,'en_US','givenName','John'),(12,'','country','DK'),(12,'en_US','affiliation','Aalborg University'),(12,'en_US','familyName','Novak'),(12,'en_US','givenName','John'),(13,'','country','US'),(13,'en_US','affiliation','Stanford University'),(13,'en_US','familyName','Al-Khafaji'),(13,'en_US','givenName','Karim'),(14,'','country','US'),(14,'','orcid',''),(14,'','url',''),(14,'en_US','affiliation','Stanford University'),(14,'en_US','biography',''),(14,'en_US','familyName','Morse'),(14,'en_US','givenName','Margaret'),(14,'en_US','preferredPublicName',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(15,'','country','AU'),(15,'en_US','affiliation','Australian National University'),(15,'en_US','familyName','Christopher'),(15,'en_US','givenName','Leo'),(16,'','country','ZA'),(16,'en_US','affiliation','University of Cape Town'),(16,'en_US','familyName','Kumiega'),(16,'en_US','givenName','Lise'),(17,'','country','GB'),(17,'en_US','affiliation','University of Wolverhampton'),(17,'en_US','familyName','Daniel'),(17,'en_US','givenName','Patricia'),(18,'','country','KE'),(18,'en_US','affiliation','University of Nairobi'),(18,'en_US','familyName','Baiyewu'),(18,'en_US','givenName','Rana'),(19,'','country','ES'),(19,'en_US','affiliation','Barcelona University'),(19,'en_US','familyName','Rossi'),(19,'en_US','givenName','Rosanna'),(20,'','country','IR'),(20,'en_US','affiliation','University of Tehran'),(20,'en_US','familyName','Karbasizaed'),(20,'en_US','givenName','Vajiheh'),(21,'','country','CA'),(21,'en_US','affiliation','University of Windsor'),(21,'en_US','familyName','Williamson'),(21,'en_US','givenName','Valerie'),(22,'','country','US'),(22,'en_US','affiliation','CUNY'),(22,'en_US','familyName','Woods'),(22,'en_US','givenName','Zita');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,0.00,4),(2,'ckwantes@mailinator.com',1,2,0.00,4),(3,'cmontgomerie@mailinator.com',1,3,0.00,4),(4,'mirvine@mailinator.com',1,3,1.00,4),(5,'ddiouf@mailinator.com',1,4,0.00,4),(6,'dphillips@mailinator.com',1,5,0.00,4),(7,'dsokoloff@mailinator.com',1,6,0.00,4),(8,'eostrom@mailinator.com',1,7,0.00,4),(9,'fvanlaerhoven@mailinator.com',1,7,1.00,4),(10,'fpaglieri@mailinator.com',1,8,0.00,4),(11,'jmwandenga@mailinator.com',1,9,0.00,4),(12,'jnovak@mailinator.com',1,10,0.00,4),(13,'kalkhafaji@mailinator.com',1,11,0.00,4),(14,'mmorse@mailinator.com',1,11,1.00,4),(15,'lchristopher@mailinator.com',1,12,0.00,4),(16,'lkumiega@mailinator.com',1,13,0.00,4),(17,'pdaniel@mailinator.com',1,14,0.00,4),(18,'rbaiyewu@mailinator.com',1,15,0.00,4),(19,'rrossi@mailinator.com',1,16,0.00,4),(20,'vkarbasizaed@mailinator.com',1,17,0.00,4),(21,'vwilliamson@mailinator.com',1,18,0.00,4),(22,'zwoods@mailinator.com',1,19,0.00,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,2,1.00),(2,2,2.00),(5,7,1.00),(6,7,2.00),(14,12,1.00),(15,12,2.00),(16,12,3.00),(17,12,4.00),(18,12,5.00),(19,12,6.00),(20,12,7.00),(23,27,1.00),(24,27,2.00),(28,32,1.00),(29,32,2.00),(30,32,3.00),(32,47,1.00),(37,52,1.00),(38,52,2.00),(39,52,3.00),(40,52,4.00),(43,57,1.00),(44,57,2.00),(46,62,1.00),(57,67,1.00),(58,67,2.00),(59,67,3.00),(60,67,4.00),(61,67,5.00),(62,67,6.00),(63,67,7.00),(64,67,8.00),(65,67,9.00),(66,67,10.00),(69,77,1.00),(70,77,2.00),(74,87,1.00),(75,87,2.00),(76,87,3.00);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'en_US','submissionKeyword','pigs','string'),(2,'en_US','submissionKeyword','food security','string'),(5,'en_US','submissionKeyword','employees','string'),(6,'en_US','submissionKeyword','survey','string'),(14,'en_US','submissionKeyword','Integrating Technology','string'),(15,'en_US','submissionKeyword','Computer Skills','string'),(16,'en_US','submissionKeyword','Survey','string'),(17,'en_US','submissionKeyword','Alberta','string'),(18,'en_US','submissionKeyword','National','string'),(19,'en_US','submissionKeyword','Provincial','string'),(20,'en_US','submissionKeyword','Professional Development','string'),(23,'en_US','submissionKeyword','education','string'),(24,'en_US','submissionKeyword','citizenship','string'),(28,'en_US','submissionKeyword','Common pool resource','string'),(29,'en_US','submissionKeyword','common property','string'),(30,'en_US','submissionKeyword','intellectual developments','string'),(32,'en_US','submissionKeyword','water','string'),(37,'en_US','submissionKeyword','Development','string'),(38,'en_US','submissionKeyword','engineering education','string'),(39,'en_US','submissionKeyword','service learning','string'),(40,'en_US','submissionKeyword','sustainability','string'),(43,'en_US','submissionKeyword','pigs','string'),(44,'en_US','submissionKeyword','food security','string'),(46,'en_US','submissionKeyword','water','string'),(57,'en_US','submissionKeyword','21st Century','string'),(58,'en_US','submissionKeyword','Diversity','string'),(59,'en_US','submissionKeyword','Multilingual','string'),(60,'en_US','submissionKeyword','Multiethnic','string'),(61,'en_US','submissionKeyword','Participatory Pedagogy','string'),(62,'en_US','submissionKeyword','Language','string'),(63,'en_US','submissionKeyword','Culture','string'),(64,'en_US','submissionKeyword','Gender','string'),(65,'en_US','submissionKeyword','Egalitarianism','string'),(66,'en_US','submissionKeyword','Social Transformation','string'),(69,'en_US','submissionKeyword','cattle','string'),(70,'en_US','submissionKeyword','food security','string'),(74,'en_US','submissionKeyword','Self-Organization','string'),(75,'en_US','submissionKeyword','Multi-Level Institutions','string'),(76,'en_US','submissionKeyword','Goverance','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(6,'submissionAgency',1048588,1),(11,'submissionAgency',1048588,2),(16,'submissionAgency',1048588,3),(21,'submissionAgency',1048588,4),(26,'submissionAgency',1048588,5),(31,'submissionAgency',1048588,6),(36,'submissionAgency',1048588,7),(41,'submissionAgency',1048588,8),(46,'submissionAgency',1048588,9),(51,'submissionAgency',1048588,10),(56,'submissionAgency',1048588,11),(61,'submissionAgency',1048588,12),(66,'submissionAgency',1048588,13),(71,'submissionAgency',1048588,14),(76,'submissionAgency',1048588,15),(81,'submissionAgency',1048588,16),(86,'submissionAgency',1048588,17),(91,'submissionAgency',1048588,18),(96,'submissionAgency',1048588,19),(4,'submissionDiscipline',1048588,1),(9,'submissionDiscipline',1048588,2),(14,'submissionDiscipline',1048588,3),(19,'submissionDiscipline',1048588,4),(24,'submissionDiscipline',1048588,5),(29,'submissionDiscipline',1048588,6),(34,'submissionDiscipline',1048588,7),(39,'submissionDiscipline',1048588,8),(44,'submissionDiscipline',1048588,9),(49,'submissionDiscipline',1048588,10),(54,'submissionDiscipline',1048588,11),(59,'submissionDiscipline',1048588,12),(64,'submissionDiscipline',1048588,13),(69,'submissionDiscipline',1048588,14),(74,'submissionDiscipline',1048588,15),(79,'submissionDiscipline',1048588,16),(84,'submissionDiscipline',1048588,17),(89,'submissionDiscipline',1048588,18),(94,'submissionDiscipline',1048588,19),(2,'submissionKeyword',1048588,1),(7,'submissionKeyword',1048588,2),(12,'submissionKeyword',1048588,3),(17,'submissionKeyword',1048588,4),(22,'submissionKeyword',1048588,5),(27,'submissionKeyword',1048588,6),(32,'submissionKeyword',1048588,7),(37,'submissionKeyword',1048588,8),(42,'submissionKeyword',1048588,9),(47,'submissionKeyword',1048588,10),(52,'submissionKeyword',1048588,11),(57,'submissionKeyword',1048588,12),(62,'submissionKeyword',1048588,13),(67,'submissionKeyword',1048588,14),(72,'submissionKeyword',1048588,15),(77,'submissionKeyword',1048588,16),(82,'submissionKeyword',1048588,17),(87,'submissionKeyword',1048588,18),(92,'submissionKeyword',1048588,19),(5,'submissionLanguage',1048588,1),(10,'submissionLanguage',1048588,2),(15,'submissionLanguage',1048588,3),(20,'submissionLanguage',1048588,4),(25,'submissionLanguage',1048588,5),(30,'submissionLanguage',1048588,6),(35,'submissionLanguage',1048588,7),(40,'submissionLanguage',1048588,8),(45,'submissionLanguage',1048588,9),(50,'submissionLanguage',1048588,10),(55,'submissionLanguage',1048588,11),(60,'submissionLanguage',1048588,12),(65,'submissionLanguage',1048588,13),(70,'submissionLanguage',1048588,14),(75,'submissionLanguage',1048588,15),(80,'submissionLanguage',1048588,16),(85,'submissionLanguage',1048588,17),(90,'submissionLanguage',1048588,18),(95,'submissionLanguage',1048588,19),(3,'submissionSubject',1048588,1),(8,'submissionSubject',1048588,2),(13,'submissionSubject',1048588,3),(18,'submissionSubject',1048588,4),(23,'submissionSubject',1048588,5),(28,'submissionSubject',1048588,6),(33,'submissionSubject',1048588,7),(38,'submissionSubject',1048588,8),(43,'submissionSubject',1048588,9),(48,'submissionSubject',1048588,10),(53,'submissionSubject',1048588,11),(58,'submissionSubject',1048588,12),(63,'submissionSubject',1048588,13),(68,'submissionSubject',1048588,14),(73,'submissionSubject',1048588,15),(78,'submissionSubject',1048588,16),(83,'submissionSubject',1048588,17),(88,'submissionSubject',1048588,18),(93,'submissionSubject',1048588,19);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.','This email is sent when a new announcement is created.'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$serverName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Moderator Decision','\n			{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$serverName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the moderator declines his submission initially.'),('ISSUE_PUBLISH_NOTIFY','en_US','New Preprint Posted','Readers:<br />\n<br />\n{$serverName} has just posted its latest preprint at {$serverUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$signature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('ISSUE_PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$serverName} vient d\'être publiée à l\'adresse suivante : {$serverUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$signature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\n{$signature}<hr />{$unsubscribeLink}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$notificationUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$serverName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\n{$signature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('POSTED_ACK','en_US','Preprint Posted Acknowledgement','{$authorPrimary}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$recipientName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$serverName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$serverName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$signature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a new user signed up on the server to validate their email account.'),('USER_VALIDATE_CONTEXT','fr_CA','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.'),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a new user signed up on the site to validate their email account.');
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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2022-01-19 08:39:38',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2022-01-19 08:39:48',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2022-01-19 08:39:48',1342177288,'submission.event.fileRevised',0),(4,515,1,7,'2022-01-19 08:39:50',1342177296,'submission.event.fileEdited',0),(5,1048585,1,7,'2022-01-19 08:39:50',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2022-01-19 08:39:54',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,7,'2022-01-19 08:39:55',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2022-01-19 08:40:04',268435458,'submission.event.general.metadataUpdated',0),(9,515,2,8,'2022-01-19 08:40:13',1342177281,'submission.event.fileUploaded',0),(10,1048585,2,8,'2022-01-19 08:40:13',1342177288,'submission.event.fileRevised',0),(11,515,2,8,'2022-01-19 08:40:16',1342177296,'submission.event.fileEdited',0),(12,1048585,2,8,'2022-01-19 08:40:16',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2022-01-19 08:40:20',268435458,'submission.event.general.metadataUpdated',0),(14,1048585,2,8,'2022-01-19 08:40:21',268435457,'submission.event.submissionSubmitted',0),(15,1048585,2,3,'2022-01-19 08:40:27',268435462,'publication.event.published',0),(16,1048585,3,9,'2022-01-19 08:40:36',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,9,'2022-01-19 08:40:45',1342177281,'submission.event.fileUploaded',0),(18,1048585,3,9,'2022-01-19 08:40:45',1342177288,'submission.event.fileRevised',0),(19,515,3,9,'2022-01-19 08:40:48',1342177296,'submission.event.fileEdited',0),(20,1048585,3,9,'2022-01-19 08:40:48',1342177296,'submission.event.fileEdited',0),(21,1048585,3,9,'2022-01-19 08:40:56',268435458,'submission.event.general.metadataUpdated',0),(22,1048585,3,9,'2022-01-19 08:40:57',268435457,'submission.event.submissionSubmitted',0),(23,1048585,3,3,'2022-01-19 08:41:04',268435462,'publication.event.published',0),(24,1048585,4,10,'2022-01-19 08:41:12',268435458,'submission.event.general.metadataUpdated',0),(25,515,4,10,'2022-01-19 08:41:22',1342177281,'submission.event.fileUploaded',0),(26,1048585,4,10,'2022-01-19 08:41:22',1342177288,'submission.event.fileRevised',0),(27,515,4,10,'2022-01-19 08:41:25',1342177296,'submission.event.fileEdited',0),(28,1048585,4,10,'2022-01-19 08:41:25',1342177296,'submission.event.fileEdited',0),(29,1048585,4,10,'2022-01-19 08:41:28',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,4,10,'2022-01-19 08:41:29',268435457,'submission.event.submissionSubmitted',0),(31,1048585,4,3,'2022-01-19 08:41:35',268435462,'publication.event.published',0),(32,1048585,5,11,'2022-01-19 08:41:44',268435458,'submission.event.general.metadataUpdated',0),(33,515,5,11,'2022-01-19 08:41:53',1342177281,'submission.event.fileUploaded',0),(34,1048585,5,11,'2022-01-19 08:41:53',1342177288,'submission.event.fileRevised',0),(35,515,5,11,'2022-01-19 08:41:56',1342177296,'submission.event.fileEdited',0),(36,1048585,5,11,'2022-01-19 08:41:56',1342177296,'submission.event.fileEdited',0),(37,1048585,5,11,'2022-01-19 08:42:01',268435458,'submission.event.general.metadataUpdated',0),(38,1048585,5,11,'2022-01-19 08:42:01',268435457,'submission.event.submissionSubmitted',0),(39,1048585,5,3,'2022-01-19 08:42:08',268435462,'publication.event.published',0),(40,1048585,6,12,'2022-01-19 08:42:17',268435458,'submission.event.general.metadataUpdated',0),(41,515,6,12,'2022-01-19 08:42:27',1342177281,'submission.event.fileUploaded',0),(42,1048585,6,12,'2022-01-19 08:42:27',1342177288,'submission.event.fileRevised',0),(43,515,6,12,'2022-01-19 08:42:29',1342177296,'submission.event.fileEdited',0),(44,1048585,6,12,'2022-01-19 08:42:29',1342177296,'submission.event.fileEdited',0),(45,1048585,6,12,'2022-01-19 08:42:32',268435458,'submission.event.general.metadataUpdated',0),(46,1048585,6,12,'2022-01-19 08:42:33',268435457,'submission.event.submissionSubmitted',0),(47,1048585,6,3,'2022-01-19 08:42:39',268435462,'publication.event.published',0),(48,1048585,7,13,'2022-01-19 08:42:48',268435458,'submission.event.general.metadataUpdated',0),(49,515,7,13,'2022-01-19 08:42:57',1342177281,'submission.event.fileUploaded',0),(50,1048585,7,13,'2022-01-19 08:42:57',1342177288,'submission.event.fileRevised',0),(51,515,7,13,'2022-01-19 08:43:00',1342177296,'submission.event.fileEdited',0),(52,1048585,7,13,'2022-01-19 08:43:00',1342177296,'submission.event.fileEdited',0),(53,1048585,7,13,'2022-01-19 08:43:07',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,7,13,'2022-01-19 08:43:08',268435457,'submission.event.submissionSubmitted',0),(55,1048585,7,3,'2022-01-19 08:43:16',268435462,'publication.event.published',0),(56,1048585,8,14,'2022-01-19 08:43:24',268435458,'submission.event.general.metadataUpdated',0),(57,515,8,14,'2022-01-19 08:43:34',1342177281,'submission.event.fileUploaded',0),(58,1048585,8,14,'2022-01-19 08:43:34',1342177288,'submission.event.fileRevised',0),(59,515,8,14,'2022-01-19 08:43:36',1342177296,'submission.event.fileEdited',0),(60,1048585,8,14,'2022-01-19 08:43:36',1342177296,'submission.event.fileEdited',0),(61,1048585,8,14,'2022-01-19 08:43:39',268435458,'submission.event.general.metadataUpdated',0),(62,1048585,8,14,'2022-01-19 08:43:39',268435457,'submission.event.submissionSubmitted',0),(63,1048585,8,3,'2022-01-19 08:43:46',268435462,'publication.event.published',0),(64,1048585,9,15,'2022-01-19 08:43:55',268435458,'submission.event.general.metadataUpdated',0),(65,515,9,15,'2022-01-19 08:44:04',1342177281,'submission.event.fileUploaded',0),(66,1048585,9,15,'2022-01-19 08:44:04',1342177288,'submission.event.fileRevised',0),(67,515,9,15,'2022-01-19 08:44:07',1342177296,'submission.event.fileEdited',0),(68,1048585,9,15,'2022-01-19 08:44:07',1342177296,'submission.event.fileEdited',0),(69,1048585,9,15,'2022-01-19 08:44:11',268435458,'submission.event.general.metadataUpdated',0),(70,1048585,9,15,'2022-01-19 08:44:12',268435457,'submission.event.submissionSubmitted',0),(71,1048585,9,3,'2022-01-19 08:44:18',268435462,'publication.event.published',0),(72,1048585,10,16,'2022-01-19 08:44:27',268435458,'submission.event.general.metadataUpdated',0),(73,515,10,16,'2022-01-19 08:44:37',1342177281,'submission.event.fileUploaded',0),(74,1048585,10,16,'2022-01-19 08:44:37',1342177288,'submission.event.fileRevised',0),(75,515,10,16,'2022-01-19 08:44:39',1342177296,'submission.event.fileEdited',0),(76,1048585,10,16,'2022-01-19 08:44:39',1342177296,'submission.event.fileEdited',0),(77,1048585,10,16,'2022-01-19 08:44:43',268435458,'submission.event.general.metadataUpdated',0),(78,1048585,10,16,'2022-01-19 08:44:44',268435457,'submission.event.submissionSubmitted',0),(79,1048585,10,3,'2022-01-19 08:44:50',268435462,'publication.event.published',0),(80,1048585,11,17,'2022-01-19 08:44:59',268435458,'submission.event.general.metadataUpdated',0),(81,515,11,17,'2022-01-19 08:45:09',1342177281,'submission.event.fileUploaded',0),(82,1048585,11,17,'2022-01-19 08:45:09',1342177288,'submission.event.fileRevised',0),(83,515,11,17,'2022-01-19 08:45:12',1342177296,'submission.event.fileEdited',0),(84,1048585,11,17,'2022-01-19 08:45:12',1342177296,'submission.event.fileEdited',0),(85,1048585,11,17,'2022-01-19 08:45:18',268435458,'submission.event.general.metadataUpdated',0),(86,1048585,11,17,'2022-01-19 08:45:19',268435457,'submission.event.submissionSubmitted',0),(87,1048585,11,3,'2022-01-19 08:45:26',268435462,'publication.event.published',0),(88,1048585,12,18,'2022-01-19 08:45:36',268435458,'submission.event.general.metadataUpdated',0),(89,515,12,18,'2022-01-19 08:45:46',1342177281,'submission.event.fileUploaded',0),(90,1048585,12,18,'2022-01-19 08:45:46',1342177288,'submission.event.fileRevised',0),(91,515,12,18,'2022-01-19 08:45:48',1342177296,'submission.event.fileEdited',0),(92,1048585,12,18,'2022-01-19 08:45:48',1342177296,'submission.event.fileEdited',0),(93,1048585,12,18,'2022-01-19 08:45:53',268435458,'submission.event.general.metadataUpdated',0),(94,1048585,12,18,'2022-01-19 08:45:54',268435457,'submission.event.submissionSubmitted',0),(95,1048585,12,3,'2022-01-19 08:46:00',268435462,'publication.event.published',0),(96,1048585,13,19,'2022-01-19 08:46:09',268435458,'submission.event.general.metadataUpdated',0),(97,515,13,19,'2022-01-19 08:46:19',1342177281,'submission.event.fileUploaded',0),(98,1048585,13,19,'2022-01-19 08:46:19',1342177288,'submission.event.fileRevised',0),(99,515,13,19,'2022-01-19 08:46:21',1342177296,'submission.event.fileEdited',0),(100,1048585,13,19,'2022-01-19 08:46:21',1342177296,'submission.event.fileEdited',0),(101,1048585,13,19,'2022-01-19 08:46:27',268435458,'submission.event.general.metadataUpdated',0),(102,1048585,13,19,'2022-01-19 08:46:27',268435457,'submission.event.submissionSubmitted',0),(103,1048585,13,3,'2022-01-19 08:46:34',268435462,'publication.event.published',0),(104,1048585,14,20,'2022-01-19 08:46:43',268435458,'submission.event.general.metadataUpdated',0),(105,515,14,20,'2022-01-19 08:46:53',1342177281,'submission.event.fileUploaded',0),(106,1048585,14,20,'2022-01-19 08:46:53',1342177288,'submission.event.fileRevised',0),(107,515,14,20,'2022-01-19 08:46:55',1342177296,'submission.event.fileEdited',0),(108,1048585,14,20,'2022-01-19 08:46:55',1342177296,'submission.event.fileEdited',0),(109,1048585,14,20,'2022-01-19 08:47:00',268435458,'submission.event.general.metadataUpdated',0),(110,1048585,14,20,'2022-01-19 08:47:01',268435457,'submission.event.submissionSubmitted',0),(111,1048585,14,3,'2022-01-19 08:47:08',268435462,'publication.event.published',0),(112,1048585,15,21,'2022-01-19 08:47:17',268435458,'submission.event.general.metadataUpdated',0),(113,515,15,21,'2022-01-19 08:47:27',1342177281,'submission.event.fileUploaded',0),(114,1048585,15,21,'2022-01-19 08:47:27',1342177288,'submission.event.fileRevised',0),(115,515,15,21,'2022-01-19 08:47:29',1342177296,'submission.event.fileEdited',0),(116,1048585,15,21,'2022-01-19 08:47:29',1342177296,'submission.event.fileEdited',0),(117,1048585,15,21,'2022-01-19 08:47:33',268435458,'submission.event.general.metadataUpdated',0),(118,1048585,15,21,'2022-01-19 08:47:33',268435457,'submission.event.submissionSubmitted',0),(119,1048585,15,3,'2022-01-19 08:47:40',268435462,'publication.event.published',0),(120,1048585,16,22,'2022-01-19 08:47:49',268435458,'submission.event.general.metadataUpdated',0),(121,515,16,22,'2022-01-19 08:47:59',1342177281,'submission.event.fileUploaded',0),(122,1048585,16,22,'2022-01-19 08:47:59',1342177288,'submission.event.fileRevised',0),(123,515,16,22,'2022-01-19 08:48:01',1342177296,'submission.event.fileEdited',0),(124,1048585,16,22,'2022-01-19 08:48:01',1342177296,'submission.event.fileEdited',0),(125,1048585,16,22,'2022-01-19 08:48:05',268435458,'submission.event.general.metadataUpdated',0),(126,1048585,16,22,'2022-01-19 08:48:06',268435457,'submission.event.submissionSubmitted',0),(127,1048585,16,3,'2022-01-19 08:48:13',268435462,'publication.event.published',0),(128,1048585,17,23,'2022-01-19 08:48:22',268435458,'submission.event.general.metadataUpdated',0),(129,515,17,23,'2022-01-19 08:48:32',1342177281,'submission.event.fileUploaded',0),(130,1048585,17,23,'2022-01-19 08:48:32',1342177288,'submission.event.fileRevised',0),(131,515,17,23,'2022-01-19 08:48:34',1342177296,'submission.event.fileEdited',0),(132,1048585,17,23,'2022-01-19 08:48:34',1342177296,'submission.event.fileEdited',0),(133,1048585,17,23,'2022-01-19 08:48:39',268435458,'submission.event.general.metadataUpdated',0),(134,1048585,17,23,'2022-01-19 08:48:40',268435457,'submission.event.submissionSubmitted',0),(135,1048585,17,3,'2022-01-19 08:48:47',268435462,'publication.event.published',0),(136,1048585,18,24,'2022-01-19 08:48:57',268435458,'submission.event.general.metadataUpdated',0),(137,515,18,24,'2022-01-19 08:49:06',1342177281,'submission.event.fileUploaded',0),(138,1048585,18,24,'2022-01-19 08:49:06',1342177288,'submission.event.fileRevised',0),(139,515,18,24,'2022-01-19 08:49:09',1342177296,'submission.event.fileEdited',0),(140,1048585,18,24,'2022-01-19 08:49:09',1342177296,'submission.event.fileEdited',0),(141,1048585,18,24,'2022-01-19 08:49:12',268435458,'submission.event.general.metadataUpdated',0),(142,1048585,18,24,'2022-01-19 08:49:13',268435457,'submission.event.submissionSubmitted',0),(143,1048585,18,3,'2022-01-19 08:49:19',268435462,'publication.event.published',0),(144,1048585,19,25,'2022-01-19 08:49:29',268435458,'submission.event.general.metadataUpdated',0),(145,515,19,25,'2022-01-19 08:49:38',1342177281,'submission.event.fileUploaded',0),(146,1048585,19,25,'2022-01-19 08:49:38',1342177288,'submission.event.fileRevised',0),(147,515,19,25,'2022-01-19 08:49:41',1342177296,'submission.event.fileEdited',0),(148,1048585,19,25,'2022-01-19 08:49:41',1342177296,'submission.event.fileEdited',0),(149,1048585,19,25,'2022-01-19 08:49:43',268435458,'submission.event.general.metadataUpdated',0),(150,1048585,19,25,'2022-01-19 08:49:44',268435457,'submission.event.submissionSubmitted',0),(151,1048585,19,3,'2022-01-19 08:49:51',268435462,'publication.event.published',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','10','int'),(2,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','ccorino','string'),(3,'fileId','1','int'),(3,'fileStage','10','int'),(3,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','ccorino','string'),(4,'fileId','1','int'),(4,'fileStage','10','int'),(4,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','ccorino','string'),(5,'fileId','1','int'),(5,'fileStage','10','int'),(5,'name','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','ccorino','string'),(9,'fileId','2','int'),(9,'fileStage','10','int'),(9,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(9,'sourceSubmissionFileId',NULL,'string'),(9,'submissionFileId','2','int'),(9,'submissionId','2','int'),(9,'username','ckwantes','string'),(10,'fileId','2','int'),(10,'fileStage','10','int'),(10,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(10,'submissionFileId','2','int'),(10,'submissionId','2','int'),(10,'username','ckwantes','string'),(11,'fileId','2','int'),(11,'fileStage','10','int'),(11,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','2','int'),(11,'submissionId','2','int'),(11,'username','ckwantes','string'),(12,'fileId','2','int'),(12,'fileStage','10','int'),(12,'name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(12,'sourceSubmissionFileId',NULL,'string'),(12,'submissionFileId','2','int'),(12,'submissionId','2','int'),(12,'username','ckwantes','string'),(17,'fileId','3','int'),(17,'fileStage','10','int'),(17,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','3','int'),(17,'submissionId','3','int'),(17,'username','cmontgomerie','string'),(18,'fileId','3','int'),(18,'fileStage','10','int'),(18,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(18,'submissionFileId','3','int'),(18,'submissionId','3','int'),(18,'username','cmontgomerie','string'),(19,'fileId','3','int'),(19,'fileStage','10','int'),(19,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','3','int'),(19,'username','cmontgomerie','string'),(20,'fileId','3','int'),(20,'fileStage','10','int'),(20,'name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(20,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','3','int'),(20,'submissionId','3','int'),(20,'username','cmontgomerie','string'),(25,'fileId','4','int'),(25,'fileStage','10','int'),(25,'originalFileName','Genetic transformation of forest trees.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','4','int'),(25,'submissionId','4','int'),(25,'username','ddiouf','string'),(26,'fileId','4','int'),(26,'fileStage','10','int'),(26,'name','Genetic transformation of forest trees.pdf','string'),(26,'submissionFileId','4','int'),(26,'submissionId','4','int'),(26,'username','ddiouf','string'),(27,'fileId','4','int'),(27,'fileStage','10','int'),(27,'originalFileName','Genetic transformation of forest trees.pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','4','int'),(27,'submissionId','4','int'),(27,'username','ddiouf','string'),(28,'fileId','4','int'),(28,'fileStage','10','int'),(28,'name','Genetic transformation of forest trees.pdf','string'),(28,'originalFileName','Genetic transformation of forest trees.pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','4','int'),(28,'submissionId','4','int'),(28,'username','ddiouf','string'),(33,'fileId','5','int'),(33,'fileStage','10','int'),(33,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(33,'sourceSubmissionFileId',NULL,'string'),(33,'submissionFileId','5','int'),(33,'submissionId','5','int'),(33,'username','dphillips','string'),(34,'fileId','5','int'),(34,'fileStage','10','int'),(34,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(34,'submissionFileId','5','int'),(34,'submissionId','5','int'),(34,'username','dphillips','string'),(35,'fileId','5','int'),(35,'fileStage','10','int'),(35,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(35,'sourceSubmissionFileId',NULL,'string'),(35,'submissionFileId','5','int'),(35,'submissionId','5','int'),(35,'username','dphillips','string'),(36,'fileId','5','int'),(36,'fileStage','10','int'),(36,'name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(36,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','5','int'),(36,'submissionId','5','int'),(36,'username','dphillips','string'),(41,'fileId','6','int'),(41,'fileStage','10','int'),(41,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(41,'sourceSubmissionFileId',NULL,'string'),(41,'submissionFileId','6','int'),(41,'submissionId','6','int'),(41,'username','dsokoloff','string'),(42,'fileId','6','int'),(42,'fileStage','10','int'),(42,'name','Developing efficacy beliefs in the classroom.pdf','string'),(42,'submissionFileId','6','int'),(42,'submissionId','6','int'),(42,'username','dsokoloff','string'),(43,'fileId','6','int'),(43,'fileStage','10','int'),(43,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(43,'sourceSubmissionFileId',NULL,'string'),(43,'submissionFileId','6','int'),(43,'submissionId','6','int'),(43,'username','dsokoloff','string'),(44,'fileId','6','int'),(44,'fileStage','10','int'),(44,'name','Developing efficacy beliefs in the classroom.pdf','string'),(44,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','6','int'),(44,'submissionId','6','int'),(44,'username','dsokoloff','string'),(49,'fileId','7','int'),(49,'fileStage','10','int'),(49,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(49,'sourceSubmissionFileId',NULL,'string'),(49,'submissionFileId','7','int'),(49,'submissionId','7','int'),(49,'username','eostrom','string'),(50,'fileId','7','int'),(50,'fileStage','10','int'),(50,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(50,'submissionFileId','7','int'),(50,'submissionId','7','int'),(50,'username','eostrom','string'),(51,'fileId','7','int'),(51,'fileStage','10','int'),(51,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(51,'sourceSubmissionFileId',NULL,'string'),(51,'submissionFileId','7','int'),(51,'submissionId','7','int'),(51,'username','eostrom','string'),(52,'fileId','7','int'),(52,'fileStage','10','int'),(52,'name','Traditions and Trends in the Study of the Commons.pdf','string'),(52,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','7','int'),(52,'submissionId','7','int'),(52,'username','eostrom','string'),(57,'fileId','8','int'),(57,'fileStage','10','int'),(57,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(57,'sourceSubmissionFileId',NULL,'string'),(57,'submissionFileId','8','int'),(57,'submissionId','8','int'),(57,'username','fpaglieri','string'),(58,'fileId','8','int'),(58,'fileStage','10','int'),(58,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(58,'submissionFileId','8','int'),(58,'submissionId','8','int'),(58,'username','fpaglieri','string'),(59,'fileId','8','int'),(59,'fileStage','10','int'),(59,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(59,'sourceSubmissionFileId',NULL,'string'),(59,'submissionFileId','8','int'),(59,'submissionId','8','int'),(59,'username','fpaglieri','string'),(60,'fileId','8','int'),(60,'fileStage','10','int'),(60,'name','Hansen & Pinto: Reason Reclaimed.pdf','string'),(60,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(60,'sourceSubmissionFileId',NULL,'string'),(60,'submissionFileId','8','int'),(60,'submissionId','8','int'),(60,'username','fpaglieri','string'),(65,'fileId','9','int'),(65,'fileStage','10','int'),(65,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(65,'sourceSubmissionFileId',NULL,'string'),(65,'submissionFileId','9','int'),(65,'submissionId','9','int'),(65,'username','jmwandenga','string'),(66,'fileId','9','int'),(66,'fileStage','10','int'),(66,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(66,'submissionFileId','9','int'),(66,'submissionId','9','int'),(66,'username','jmwandenga','string'),(67,'fileId','9','int'),(67,'fileStage','10','int'),(67,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','9','int'),(67,'submissionId','9','int'),(67,'username','jmwandenga','string'),(68,'fileId','9','int'),(68,'fileStage','10','int'),(68,'name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(68,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(68,'sourceSubmissionFileId',NULL,'string'),(68,'submissionFileId','9','int'),(68,'submissionId','9','int'),(68,'username','jmwandenga','string'),(73,'fileId','10','int'),(73,'fileStage','10','int'),(73,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','10','int'),(73,'submissionId','10','int'),(73,'username','jnovak','string'),(74,'fileId','10','int'),(74,'fileStage','10','int'),(74,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(74,'submissionFileId','10','int'),(74,'submissionId','10','int'),(74,'username','jnovak','string'),(75,'fileId','10','int'),(75,'fileStage','10','int'),(75,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(75,'sourceSubmissionFileId',NULL,'string'),(75,'submissionFileId','10','int'),(75,'submissionId','10','int'),(75,'username','jnovak','string'),(76,'fileId','10','int'),(76,'fileStage','10','int'),(76,'name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(76,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(76,'sourceSubmissionFileId',NULL,'string'),(76,'submissionFileId','10','int'),(76,'submissionId','10','int'),(76,'username','jnovak','string'),(81,'fileId','11','int'),(81,'fileStage','10','int'),(81,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(81,'sourceSubmissionFileId',NULL,'string'),(81,'submissionFileId','11','int'),(81,'submissionId','11','int'),(81,'username','kalkhafaji','string'),(82,'fileId','11','int'),(82,'fileStage','10','int'),(82,'name','Learning Sustainable Design through Service.pdf','string'),(82,'submissionFileId','11','int'),(82,'submissionId','11','int'),(82,'username','kalkhafaji','string'),(83,'fileId','11','int'),(83,'fileStage','10','int'),(83,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(83,'sourceSubmissionFileId',NULL,'string'),(83,'submissionFileId','11','int'),(83,'submissionId','11','int'),(83,'username','kalkhafaji','string'),(84,'fileId','11','int'),(84,'fileStage','10','int'),(84,'name','Learning Sustainable Design through Service.pdf','string'),(84,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(84,'sourceSubmissionFileId',NULL,'string'),(84,'submissionFileId','11','int'),(84,'submissionId','11','int'),(84,'username','kalkhafaji','string'),(89,'fileId','12','int'),(89,'fileStage','10','int'),(89,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(89,'sourceSubmissionFileId',NULL,'string'),(89,'submissionFileId','12','int'),(89,'submissionId','12','int'),(89,'username','lchristopher','string'),(90,'fileId','12','int'),(90,'fileStage','10','int'),(90,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(90,'submissionFileId','12','int'),(90,'submissionId','12','int'),(90,'username','lchristopher','string'),(91,'fileId','12','int'),(91,'fileStage','10','int'),(91,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(91,'sourceSubmissionFileId',NULL,'string'),(91,'submissionFileId','12','int'),(91,'submissionId','12','int'),(91,'username','lchristopher','string'),(92,'fileId','12','int'),(92,'fileStage','10','int'),(92,'name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(92,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(92,'sourceSubmissionFileId',NULL,'string'),(92,'submissionFileId','12','int'),(92,'submissionId','12','int'),(92,'username','lchristopher','string'),(97,'fileId','13','int'),(97,'fileStage','10','int'),(97,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','13','int'),(97,'submissionId','13','int'),(97,'username','lkumiega','string'),(98,'fileId','13','int'),(98,'fileStage','10','int'),(98,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(98,'submissionFileId','13','int'),(98,'submissionId','13','int'),(98,'username','lkumiega','string'),(99,'fileId','13','int'),(99,'fileStage','10','int'),(99,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(99,'sourceSubmissionFileId',NULL,'string'),(99,'submissionFileId','13','int'),(99,'submissionId','13','int'),(99,'username','lkumiega','string'),(100,'fileId','13','int'),(100,'fileStage','10','int'),(100,'name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(100,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(100,'sourceSubmissionFileId',NULL,'string'),(100,'submissionFileId','13','int'),(100,'submissionId','13','int'),(100,'username','lkumiega','string'),(105,'fileId','14','int'),(105,'fileStage','10','int'),(105,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(105,'sourceSubmissionFileId',NULL,'string'),(105,'submissionFileId','14','int'),(105,'submissionId','14','int'),(105,'username','pdaniel','string'),(106,'fileId','14','int'),(106,'fileStage','10','int'),(106,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(106,'submissionFileId','14','int'),(106,'submissionId','14','int'),(106,'username','pdaniel','string'),(107,'fileId','14','int'),(107,'fileStage','10','int'),(107,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(107,'sourceSubmissionFileId',NULL,'string'),(107,'submissionFileId','14','int'),(107,'submissionId','14','int'),(107,'username','pdaniel','string'),(108,'fileId','14','int'),(108,'fileStage','10','int'),(108,'name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(108,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(108,'sourceSubmissionFileId',NULL,'string'),(108,'submissionFileId','14','int'),(108,'submissionId','14','int'),(108,'username','pdaniel','string'),(113,'fileId','15','int'),(113,'fileStage','10','int'),(113,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(113,'sourceSubmissionFileId',NULL,'string'),(113,'submissionFileId','15','int'),(113,'submissionId','15','int'),(113,'username','rbaiyewu','string'),(114,'fileId','15','int'),(114,'fileStage','10','int'),(114,'name','Yam diseases and its management in Nigeria.pdf','string'),(114,'submissionFileId','15','int'),(114,'submissionId','15','int'),(114,'username','rbaiyewu','string'),(115,'fileId','15','int'),(115,'fileStage','10','int'),(115,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(115,'sourceSubmissionFileId',NULL,'string'),(115,'submissionFileId','15','int'),(115,'submissionId','15','int'),(115,'username','rbaiyewu','string'),(116,'fileId','15','int'),(116,'fileStage','10','int'),(116,'name','Yam diseases and its management in Nigeria.pdf','string'),(116,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(116,'sourceSubmissionFileId',NULL,'string'),(116,'submissionFileId','15','int'),(116,'submissionId','15','int'),(116,'username','rbaiyewu','string'),(121,'fileId','16','int'),(121,'fileStage','10','int'),(121,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(121,'sourceSubmissionFileId',NULL,'string'),(121,'submissionFileId','16','int'),(121,'submissionId','16','int'),(121,'username','rrossi','string'),(122,'fileId','16','int'),(122,'fileStage','10','int'),(122,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(122,'submissionFileId','16','int'),(122,'submissionId','16','int'),(122,'username','rrossi','string'),(123,'fileId','16','int'),(123,'fileStage','10','int'),(123,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(123,'sourceSubmissionFileId',NULL,'string'),(123,'submissionFileId','16','int'),(123,'submissionId','16','int'),(123,'username','rrossi','string'),(124,'fileId','16','int'),(124,'fileStage','10','int'),(124,'name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(124,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','16','int'),(124,'submissionId','16','int'),(124,'username','rrossi','string'),(129,'fileId','17','int'),(129,'fileStage','10','int'),(129,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','17','int'),(129,'submissionId','17','int'),(129,'username','vkarbasizaed','string'),(130,'fileId','17','int'),(130,'fileStage','10','int'),(130,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(130,'submissionFileId','17','int'),(130,'submissionId','17','int'),(130,'username','vkarbasizaed','string'),(131,'fileId','17','int'),(131,'fileStage','10','int'),(131,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(131,'sourceSubmissionFileId',NULL,'string'),(131,'submissionFileId','17','int'),(131,'submissionId','17','int'),(131,'username','vkarbasizaed','string'),(132,'fileId','17','int'),(132,'fileStage','10','int'),(132,'name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(132,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','17','int'),(132,'submissionId','17','int'),(132,'username','vkarbasizaed','string'),(137,'fileId','18','int'),(137,'fileStage','10','int'),(137,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','18','int'),(137,'submissionId','18','int'),(137,'username','vwilliamson','string'),(138,'fileId','18','int'),(138,'fileStage','10','int'),(138,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(138,'submissionFileId','18','int'),(138,'submissionId','18','int'),(138,'username','vwilliamson','string'),(139,'fileId','18','int'),(139,'fileStage','10','int'),(139,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(139,'sourceSubmissionFileId',NULL,'string'),(139,'submissionFileId','18','int'),(139,'submissionId','18','int'),(139,'username','vwilliamson','string'),(140,'fileId','18','int'),(140,'fileStage','10','int'),(140,'name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(140,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(140,'sourceSubmissionFileId',NULL,'string'),(140,'submissionFileId','18','int'),(140,'submissionId','18','int'),(140,'username','vwilliamson','string'),(145,'fileId','19','int'),(145,'fileStage','10','int'),(145,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(145,'sourceSubmissionFileId',NULL,'string'),(145,'submissionFileId','19','int'),(145,'submissionId','19','int'),(145,'username','zwoods','string'),(146,'fileId','19','int'),(146,'fileStage','10','int'),(146,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(146,'submissionFileId','19','int'),(146,'submissionId','19','int'),(146,'username','zwoods','string'),(147,'fileId','19','int'),(147,'fileStage','10','int'),(147,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(147,'sourceSubmissionFileId',NULL,'string'),(147,'submissionFileId','19','int'),(147,'submissionId','19','int'),(147,'username','zwoods','string'),(148,'fileId','19','int'),(148,'fileStage','10','int'),(148,'name','Finocchiaro: Arguments About Arguments.pdf','string'),(148,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(148,'sourceSubmissionFileId',NULL,'string'),(148,'submissionFileId','19','int'),(148,'submissionId','19','int'),(148,'username','zwoods','string');
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
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/61e7ce542204f.pdf','application/pdf'),(2,'contexts/1/submissions/2/61e7ce6dbeaaf.pdf','application/pdf'),(3,'contexts/1/submissions/3/61e7ce8ddc68f.pdf','application/pdf'),(4,'contexts/1/submissions/4/61e7ceb2ebdeb.pdf','application/pdf'),(5,'contexts/1/submissions/5/61e7ced1d91f4.pdf','application/pdf'),(6,'contexts/1/submissions/6/61e7cef338a22.pdf','application/pdf'),(7,'contexts/1/submissions/7/61e7cf11e2443.pdf','application/pdf'),(8,'contexts/1/submissions/8/61e7cf362fc11.pdf','application/pdf'),(9,'contexts/1/submissions/9/61e7cf54d414e.pdf','application/pdf'),(10,'contexts/1/submissions/10/61e7cf7546c52.pdf','application/pdf'),(11,'contexts/1/submissions/11/61e7cf95adf1d.pdf','application/pdf'),(12,'contexts/1/submissions/12/61e7cfba75658.pdf','application/pdf'),(13,'contexts/1/submissions/13/61e7cfdba1b40.pdf','application/pdf'),(14,'contexts/1/submissions/14/61e7cffd4cf08.pdf','application/pdf'),(15,'contexts/1/submissions/15/61e7d01f980aa.pdf','application/pdf'),(16,'contexts/1/submissions/16/61e7d03f0ca18.pdf','application/pdf'),(17,'contexts/1/submissions/17/61e7d0604e43c.pdf','application/pdf'),(18,'contexts/1/submissions/18/61e7d082df646.pdf','application/pdf'),(19,'contexts/1/submissions/19/61e7d0a2b8c6e.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(PREPRINT)'),(2,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(6,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(8,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.preprint.PreprintGalley','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.preprint.PreprintGalley[]'),(10,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(11,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(12,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)');
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
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaPreprintAdapter',0,0,0),(2,2,0,'Native XML submission export','plugins.importexport.native.filter.PreprintNativeXmlFilter',0,0,0),(3,3,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlPreprintFilter',0,0,0),(4,4,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(5,5,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(6,7,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlPreprintFileFilter',0,0,0),(7,6,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(8,8,0,'Native XML representation export','plugins.importexport.native.filter.PreprintGalleyNativeXmlFilter',0,0,0),(9,9,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPreprintGalleyFilter',0,0,0),(10,10,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(11,11,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(12,12,0,'Crossref XML preprint export','plugins.importexport.crossref.filter.PreprintCrossrefXmlFilter',0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
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
INSERT INTO `notification_settings` VALUES (197,'','contents','There was a problem sending an email message. Please try again later, or contact your system administrator.','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2022-01-19 08:39:55',NULL,1048585,1),(4,1,0,3,16777223,'2022-01-19 08:39:55',NULL,1048585,1),(5,1,4,2,16777217,'2022-01-19 08:39:55',NULL,1048585,1),(7,1,5,2,16777217,'2022-01-19 08:39:55',NULL,1048585,1),(9,1,0,2,16777243,'2022-01-19 08:39:55',NULL,1048585,1),(10,1,0,2,16777245,'2022-01-19 08:39:55',NULL,1048585,1),(12,1,0,3,16777222,'2022-01-19 08:40:21',NULL,1048585,2),(13,1,0,3,16777223,'2022-01-19 08:40:21',NULL,1048585,2),(14,1,4,2,16777217,'2022-01-19 08:40:21',NULL,1048585,2),(16,1,5,2,16777217,'2022-01-19 08:40:21',NULL,1048585,2),(18,1,0,2,16777243,'2022-01-19 08:40:21',NULL,1048585,2),(19,1,0,2,16777245,'2022-01-19 08:40:21',NULL,1048585,2),(23,1,0,3,16777222,'2022-01-19 08:40:57',NULL,1048585,3),(24,1,0,3,16777223,'2022-01-19 08:40:57',NULL,1048585,3),(25,1,4,2,16777217,'2022-01-19 08:40:57',NULL,1048585,3),(27,1,5,2,16777217,'2022-01-19 08:40:57',NULL,1048585,3),(29,1,0,2,16777243,'2022-01-19 08:40:57',NULL,1048585,3),(30,1,0,2,16777245,'2022-01-19 08:40:57',NULL,1048585,3),(34,1,0,3,16777222,'2022-01-19 08:41:28',NULL,1048585,4),(35,1,0,3,16777223,'2022-01-19 08:41:28',NULL,1048585,4),(36,1,4,2,16777217,'2022-01-19 08:41:28',NULL,1048585,4),(38,1,5,2,16777217,'2022-01-19 08:41:29',NULL,1048585,4),(40,1,0,2,16777243,'2022-01-19 08:41:29',NULL,1048585,4),(41,1,0,2,16777245,'2022-01-19 08:41:29',NULL,1048585,4),(44,1,0,3,16777222,'2022-01-19 08:42:01',NULL,1048585,5),(45,1,0,3,16777223,'2022-01-19 08:42:01',NULL,1048585,5),(46,1,4,2,16777217,'2022-01-19 08:42:01',NULL,1048585,5),(48,1,5,2,16777217,'2022-01-19 08:42:01',NULL,1048585,5),(50,1,0,2,16777243,'2022-01-19 08:42:01',NULL,1048585,5),(51,1,0,2,16777245,'2022-01-19 08:42:01',NULL,1048585,5),(54,1,0,3,16777222,'2022-01-19 08:42:33',NULL,1048585,6),(55,1,0,3,16777223,'2022-01-19 08:42:33',NULL,1048585,6),(56,1,4,2,16777217,'2022-01-19 08:42:33',NULL,1048585,6),(58,1,5,2,16777217,'2022-01-19 08:42:33',NULL,1048585,6),(60,1,0,2,16777243,'2022-01-19 08:42:33',NULL,1048585,6),(61,1,0,2,16777245,'2022-01-19 08:42:33',NULL,1048585,6),(65,1,0,3,16777222,'2022-01-19 08:43:08',NULL,1048585,7),(66,1,0,3,16777223,'2022-01-19 08:43:08',NULL,1048585,7),(67,1,4,2,16777217,'2022-01-19 08:43:08',NULL,1048585,7),(69,1,5,2,16777217,'2022-01-19 08:43:08',NULL,1048585,7),(71,1,0,2,16777243,'2022-01-19 08:43:08',NULL,1048585,7),(72,1,0,2,16777245,'2022-01-19 08:43:08',NULL,1048585,7),(76,1,0,3,16777222,'2022-01-19 08:43:39',NULL,1048585,8),(77,1,0,3,16777223,'2022-01-19 08:43:39',NULL,1048585,8),(78,1,4,2,16777217,'2022-01-19 08:43:39',NULL,1048585,8),(80,1,5,2,16777217,'2022-01-19 08:43:39',NULL,1048585,8),(82,1,0,2,16777243,'2022-01-19 08:43:39',NULL,1048585,8),(83,1,0,2,16777245,'2022-01-19 08:43:39',NULL,1048585,8),(86,1,0,3,16777222,'2022-01-19 08:44:12',NULL,1048585,9),(87,1,0,3,16777223,'2022-01-19 08:44:12',NULL,1048585,9),(88,1,4,2,16777217,'2022-01-19 08:44:12',NULL,1048585,9),(90,1,5,2,16777217,'2022-01-19 08:44:12',NULL,1048585,9),(92,1,0,2,16777243,'2022-01-19 08:44:12',NULL,1048585,9),(93,1,0,2,16777245,'2022-01-19 08:44:12',NULL,1048585,9),(96,1,0,3,16777222,'2022-01-19 08:44:44',NULL,1048585,10),(97,1,0,3,16777223,'2022-01-19 08:44:44',NULL,1048585,10),(98,1,4,2,16777217,'2022-01-19 08:44:44',NULL,1048585,10),(100,1,5,2,16777217,'2022-01-19 08:44:44',NULL,1048585,10),(102,1,0,2,16777243,'2022-01-19 08:44:44',NULL,1048585,10),(103,1,0,2,16777245,'2022-01-19 08:44:44',NULL,1048585,10),(107,1,0,3,16777222,'2022-01-19 08:45:19',NULL,1048585,11),(108,1,0,3,16777223,'2022-01-19 08:45:19',NULL,1048585,11),(109,1,4,2,16777217,'2022-01-19 08:45:19',NULL,1048585,11),(111,1,5,2,16777217,'2022-01-19 08:45:19',NULL,1048585,11),(113,1,0,2,16777243,'2022-01-19 08:45:19',NULL,1048585,11),(114,1,0,2,16777245,'2022-01-19 08:45:19',NULL,1048585,11),(118,1,0,3,16777222,'2022-01-19 08:45:53',NULL,1048585,12),(119,1,0,3,16777223,'2022-01-19 08:45:53',NULL,1048585,12),(120,1,4,2,16777217,'2022-01-19 08:45:53',NULL,1048585,12),(122,1,5,2,16777217,'2022-01-19 08:45:53',NULL,1048585,12),(124,1,0,2,16777243,'2022-01-19 08:45:54',NULL,1048585,12),(125,1,0,2,16777245,'2022-01-19 08:45:54',NULL,1048585,12),(128,1,0,3,16777222,'2022-01-19 08:46:27',NULL,1048585,13),(129,1,0,3,16777223,'2022-01-19 08:46:27',NULL,1048585,13),(130,1,4,2,16777217,'2022-01-19 08:46:27',NULL,1048585,13),(132,1,5,2,16777217,'2022-01-19 08:46:27',NULL,1048585,13),(134,1,0,2,16777243,'2022-01-19 08:46:27',NULL,1048585,13),(135,1,0,2,16777245,'2022-01-19 08:46:27',NULL,1048585,13),(138,1,0,3,16777222,'2022-01-19 08:47:01',NULL,1048585,14),(139,1,0,3,16777223,'2022-01-19 08:47:01',NULL,1048585,14),(140,1,4,2,16777217,'2022-01-19 08:47:01',NULL,1048585,14),(142,1,5,2,16777217,'2022-01-19 08:47:01',NULL,1048585,14),(144,1,0,2,16777243,'2022-01-19 08:47:01',NULL,1048585,14),(145,1,0,2,16777245,'2022-01-19 08:47:01',NULL,1048585,14),(148,1,0,3,16777222,'2022-01-19 08:47:33',NULL,1048585,15),(149,1,0,3,16777223,'2022-01-19 08:47:33',NULL,1048585,15),(150,1,4,2,16777217,'2022-01-19 08:47:33',NULL,1048585,15),(152,1,5,2,16777217,'2022-01-19 08:47:33',NULL,1048585,15),(154,1,0,2,16777243,'2022-01-19 08:47:33',NULL,1048585,15),(155,1,0,2,16777245,'2022-01-19 08:47:33',NULL,1048585,15),(158,1,0,3,16777222,'2022-01-19 08:48:06',NULL,1048585,16),(159,1,0,3,16777223,'2022-01-19 08:48:06',NULL,1048585,16),(160,1,4,2,16777217,'2022-01-19 08:48:06',NULL,1048585,16),(162,1,5,2,16777217,'2022-01-19 08:48:06',NULL,1048585,16),(164,1,0,2,16777243,'2022-01-19 08:48:06',NULL,1048585,16),(165,1,0,2,16777245,'2022-01-19 08:48:06',NULL,1048585,16),(168,1,0,3,16777222,'2022-01-19 08:48:40',NULL,1048585,17),(169,1,0,3,16777223,'2022-01-19 08:48:40',NULL,1048585,17),(170,1,4,2,16777217,'2022-01-19 08:48:40',NULL,1048585,17),(172,1,5,2,16777217,'2022-01-19 08:48:40',NULL,1048585,17),(174,1,0,2,16777243,'2022-01-19 08:48:40',NULL,1048585,17),(175,1,0,2,16777245,'2022-01-19 08:48:40',NULL,1048585,17),(178,1,0,3,16777222,'2022-01-19 08:49:13',NULL,1048585,18),(179,1,0,3,16777223,'2022-01-19 08:49:13',NULL,1048585,18),(180,1,4,2,16777217,'2022-01-19 08:49:13',NULL,1048585,18),(182,1,5,2,16777217,'2022-01-19 08:49:13',NULL,1048585,18),(184,1,0,2,16777243,'2022-01-19 08:49:13',NULL,1048585,18),(185,1,0,2,16777245,'2022-01-19 08:49:13',NULL,1048585,18),(188,1,0,3,16777222,'2022-01-19 08:49:44',NULL,1048585,19),(189,1,0,3,16777223,'2022-01-19 08:49:44',NULL,1048585,19),(190,1,4,2,16777217,'2022-01-19 08:49:44',NULL,1048585,19),(192,1,5,2,16777217,'2022-01-19 08:49:44',NULL,1048585,19),(194,1,0,2,16777243,'2022-01-19 08:49:44',NULL,1048585,19),(195,1,0,2,16777245,'2022-01-19 08:49:44',NULL,1048585,19),(197,0,3,1,3,'2022-01-19 08:49:51',NULL,0,0);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','61e7cdce5c661','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object');
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
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',1,0.00,'',0,''),(2,'en_US',2,'PDF',2,0.00,'',0,''),(3,'en_US',3,'PDF',3,0.00,'',0,''),(4,'en_US',4,'PDF',4,0.00,'',0,''),(5,'en_US',5,'PDF',5,0.00,'',0,''),(6,'en_US',6,'PDF',6,0.00,'',0,''),(7,'en_US',7,'PDF',7,0.00,'',0,''),(8,'en_US',8,'PDF',8,0.00,'',0,''),(9,'en_US',9,'PDF',9,0.00,'',0,''),(10,'en_US',10,'PDF',10,0.00,'',0,''),(11,'en_US',11,'PDF',11,0.00,'',0,''),(12,'en_US',12,'PDF',12,0.00,'',0,''),(13,'en_US',13,'PDF',13,0.00,'',0,''),(14,'en_US',14,'PDF',14,0.00,'',0,''),(15,'en_US',15,'PDF',15,0.00,'',0,''),(16,'en_US',16,'PDF',16,0.00,'',0,''),(17,'en_US',17,'PDF',17,0.00,'',0,''),(18,'en_US',18,'PDF',18,0.00,'',0,''),(19,'en_US',19,'PDF',19,0.00,'',0,'');
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'','licenseUrl',''),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2022'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'fr_CA','abstract',''),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'','copyrightYear','2022'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'','copyrightYear','2022'),(4,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(4,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Genetic transformation of forest trees'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'','copyrightYear','2022'),(6,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Developing efficacy beliefs in the classroom'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2022'),(7,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Traditions and Trends in the Study of the Commons'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'','copyrightYear','2022'),(8,'en_US','abstract','<p>None.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'','copyrightYear','2022'),(9,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'','copyrightYear','2022'),(10,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'','copyrightYear','2022'),(11,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Learning Sustainable Design through Service'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'','copyrightYear','2022'),(12,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'','copyrightYear','2022'),(13,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'','copyrightYear','2022'),(15,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Yam diseases and its management in Nigeria'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'','copyrightYear','2022'),(16,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'','copyrightYear','2022'),(17,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2022'),(18,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'','copyrightYear','2022'),(19,'en_US','abstract','<p>None.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Finocchiaro: Arguments About Arguments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title','');
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
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2022-01-19 08:39:54',1,1,1,1,NULL,1),(2,0,'2022-01-19','2022-01-19 08:40:27',2,1,2,3,NULL,1),(3,0,'2022-01-19','2022-01-19 08:41:04',3,1,3,3,NULL,1),(4,0,'2022-01-19','2022-01-19 08:41:35',5,1,4,3,NULL,1),(5,0,'2022-01-19','2022-01-19 08:42:08',6,1,5,3,NULL,1),(6,0,'2022-01-19','2022-01-19 08:42:39',7,1,6,3,NULL,1),(7,0,'2022-01-19','2022-01-19 08:43:16',8,1,7,3,NULL,1),(8,0,'2022-01-19','2022-01-19 08:43:46',10,1,8,3,NULL,1),(9,0,'2022-01-19','2022-01-19 08:44:18',11,1,9,3,NULL,1),(10,0,'2022-01-19','2022-01-19 08:44:50',12,1,10,3,NULL,1),(11,0,'2022-01-19','2022-01-19 08:45:26',13,1,11,3,NULL,1),(12,0,'2022-01-19','2022-01-19 08:46:00',15,1,12,3,NULL,1),(13,0,'2022-01-19','2022-01-19 08:46:34',16,1,13,3,NULL,1),(14,0,'2022-01-19','2022-01-19 08:47:08',17,1,14,3,NULL,1),(15,0,'2022-01-19','2022-01-19 08:47:40',18,1,15,3,NULL,1),(16,0,'2022-01-19','2022-01-19 08:48:13',19,1,16,3,NULL,1),(17,0,'2022-01-19','2022-01-19 08:48:47',20,1,17,3,NULL,1),(18,0,'2022-01-19','2022-01-19 08:49:19',21,1,18,3,NULL,1),(19,0,'2022-01-19','2022-01-19 08:49:51',22,1,19,3,NULL,1);
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.StatisticsReport','2022-01-19 08:37:21'),('plugins.generic.usageStats.UsageStatsLoader','2022-01-19 08:37:21');
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
INSERT INTO `section_settings` VALUES (1,'','path','preprints','string'),(1,'en_US','abbrev','PRE','string'),(1,'en_US','description','','string'),(1,'en_US','identifyType','','string'),(1,'en_US','policy','','string'),(1,'en_US','title','Preprints','string'),(1,'fr_CA','abbrev','','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','identifyType','','string'),(1,'fr_CA','policy','','string'),(1,'fr_CA','title','','string');
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
INSERT INTO `server_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','copySubmissionAckAddress','',NULL),(1,'','copySubmissionAckPrimaryContact','0',NULL),(1,'','country','IS',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"http://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously posted.\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par un autre serveur. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\"},{\"order\":2,\"content\":\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\"},{\"order\":3,\"content\":\"Lorsque possible, les URL des références ont été fournies.\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]',NULL);
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
INSERT INTO `sessions` VALUES ('0snlfrkjlh16m3tc09dd1o8bac',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642582162,1642582191,0,'csrf|a:2:{s:9:\"timestamp\";i:1642582191;s:5:\"token\";s:32:\"74ead5dc23b56f5b02a4691124c3a531\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('1edsmje11fseghb1tsg473qaf4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581629,1642581664,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581664;s:5:\"token\";s:32:\"e231309236d247c5a1bba734c22687eb\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('27l69s5436hdi096av7r4vgnp9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581892,1642581927,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581927;s:5:\"token\";s:32:\"c111301346faca7b03318fafec2ec765\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2etatllhg3jlkjai3irhusd0ov',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581546,1642581570,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1642581570;s:5:\"token\";s:32:\"629bc32d64bbcd0a2b590c8427124b2e\";}','localhost'),('2scv5r4hu4ppohigmum596kjjf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581730,1642581759,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581759;s:5:\"token\";s:32:\"ade96321c895ab2ec897572cef8d8be6\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('39k14biofm3hd2fr36ne4t4ocl',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642582095,1642582128,0,'csrf|a:2:{s:9:\"timestamp\";i:1642582128;s:5:\"token\";s:32:\"cc66a68acf1aa1975a3eb4e163db66ab\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3g8declpjmkjbavk1pj8qo1n21',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581697,1642581729,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581729;s:5:\"token\";s:32:\"14756bf427e765b6019176eb62c0fc23\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3km84ji6a3634gn9eehiimn8p5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581860,1642581891,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581891;s:5:\"token\";s:32:\"dcffeff49851d5cfe01677744db27081\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('6k7c495dkdccd9h3pn7kqqm2rd',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581962,1642581994,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581994;s:5:\"token\";s:32:\"47a22ec95c82b1935eeb5462190ef6f8\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('8b1lsjduuc98n4qpka10ba9muf',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581468,1642581473,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1642581473;s:5:\"token\";s:32:\"2addeebf2a1d434d3d8cf903a082de58\";}','localhost'),('8s641rcjbqrfq2iiv1q5m57uoc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581484,1642581537,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1642581537;s:5:\"token\";s:32:\"c3218fe4c9e76d90d501e06f32aacc22\";}','localhost'),('8usbe41cf0qcgmksh34nj2gja5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581438,1642581438,0,'','localhost'),('c6akiqdptlodosploea745aj3i',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581996,1642582029,0,'csrf|a:2:{s:9:\"timestamp\";i:1642582029;s:5:\"token\";s:32:\"249330b91495348d35acbab2c4ca227f\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('dem1dslstcp5jbon6iiurg8jc6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642582062,1642582093,0,'csrf|a:2:{s:9:\"timestamp\";i:1642582093;s:5:\"token\";s:32:\"e087d67904b6e8717f7a4102f389424a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('flqc9pibgmo1n98j9ib5a9edph',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581441,1642581454,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1642581454;s:5:\"token\";s:32:\"b3b2aa542bd83ff72387850bd1b4702d\";}','localhost'),('h9lqmhd4n144chnh3bcd4id30n',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581928,1642581961,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581961;s:5:\"token\";s:32:\"17a5c61aa624b0bf6257f12a98a4398a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('i2r2s0g7lbh2o2a3bb2imillb5',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581454,1642581468,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1642581468;s:5:\"token\";s:32:\"5b3adc6d49376f49a82bf2a28cf11814\";}','localhost'),('ju2d4dck4pp8krrfkihmo1d6ej',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581572,1642581595,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581595;s:5:\"token\";s:32:\"e6aea751874a42b4359468018d48c796\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('kgjqnd5afvpdq9chbge4ck7029',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642582030,1642582061,0,'csrf|a:2:{s:9:\"timestamp\";i:1642582061;s:5:\"token\";s:32:\"aa9198c545dd4a1ba63ed3ebb5146280\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('lirtq1i6uoa9o1v00f5veufs5f',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581474,1642581482,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1642581482;s:5:\"token\";s:32:\"30bf181cfe508cc79a5d0577f1b74bdc\";}','localhost'),('o1qldna6a6c915r3qu9u4r0iac',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581666,1642581696,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581696;s:5:\"token\";s:32:\"81a3c06f2e37f3f2f9873d7f752b5a41\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('qg8c03ver53ut7c899o0cpnhn0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642582129,1642582160,0,'csrf|a:2:{s:9:\"timestamp\";i:1642582160;s:5:\"token\";s:32:\"2b68c77f49041c91dec64eba054ee964\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('r0tp3s44asbifjerqqhle23m88',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581828,1642581859,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581859;s:5:\"token\";s:32:\"0b509b7aa23177aee69717b6a4286fe5\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ri2fc9s05f72rei16pnk39vhc9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581597,1642581628,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581628;s:5:\"token\";s:32:\"5b5319adad7285ac756702b9c2c0864b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('tiurt92b18vcp5mi36c0tqgbm7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581761,1642581796,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581796;s:5:\"token\";s:32:\"ff6dbeadc8d1bd1d201a3d74e4d586de\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ui181s8ioacsdg162qrjh57icr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581798,1642581826,0,'csrf|a:2:{s:9:\"timestamp\";i:1642581826;s:5:\"token\";s:32:\"12a579bd215fc7951fd67014c6a6a230\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('vilvm0295hdne6cn42v931gj1h',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1642581539,1642581546,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1642581546;s:5:\"token\";s:32:\"6008480a8db02d677dc18627bd802623\";}','localhost');
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
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2022-01-19 08:39:38',0,1),(2,1,3,4,'2022-01-19 08:39:55',0,1),(3,1,3,5,'2022-01-19 08:39:55',0,1),(4,2,4,8,'2022-01-19 08:40:04',0,1),(5,2,3,4,'2022-01-19 08:40:21',0,1),(6,2,3,5,'2022-01-19 08:40:21',0,1),(7,3,4,9,'2022-01-19 08:40:36',0,1),(8,3,3,4,'2022-01-19 08:40:57',0,1),(9,3,3,5,'2022-01-19 08:40:57',0,1),(10,4,4,10,'2022-01-19 08:41:13',0,1),(11,4,3,4,'2022-01-19 08:41:28',0,1),(12,4,3,5,'2022-01-19 08:41:28',0,1),(13,5,4,11,'2022-01-19 08:41:44',0,1),(14,5,3,4,'2022-01-19 08:42:01',0,1),(15,5,3,5,'2022-01-19 08:42:01',0,1),(16,6,4,12,'2022-01-19 08:42:17',0,1),(17,6,3,4,'2022-01-19 08:42:33',0,1),(18,6,3,5,'2022-01-19 08:42:33',0,1),(19,7,4,13,'2022-01-19 08:42:48',0,1),(20,7,3,4,'2022-01-19 08:43:08',0,1),(21,7,3,5,'2022-01-19 08:43:08',0,1),(22,8,4,14,'2022-01-19 08:43:24',0,1),(23,8,3,4,'2022-01-19 08:43:39',0,1),(24,8,3,5,'2022-01-19 08:43:39',0,1),(25,9,4,15,'2022-01-19 08:43:55',0,1),(26,9,3,4,'2022-01-19 08:44:12',0,1),(27,9,3,5,'2022-01-19 08:44:12',0,1),(28,10,4,16,'2022-01-19 08:44:27',0,1),(29,10,3,4,'2022-01-19 08:44:44',0,1),(30,10,3,5,'2022-01-19 08:44:44',0,1),(31,11,4,17,'2022-01-19 08:44:59',0,1),(32,11,3,4,'2022-01-19 08:45:19',0,1),(33,11,3,5,'2022-01-19 08:45:19',0,1),(34,12,4,18,'2022-01-19 08:45:36',0,1),(35,12,3,4,'2022-01-19 08:45:53',0,1),(36,12,3,5,'2022-01-19 08:45:53',0,1),(37,13,4,19,'2022-01-19 08:46:09',0,1),(38,13,3,4,'2022-01-19 08:46:27',0,1),(39,13,3,5,'2022-01-19 08:46:27',0,1),(40,14,4,20,'2022-01-19 08:46:43',0,1),(41,14,3,4,'2022-01-19 08:47:01',0,1),(42,14,3,5,'2022-01-19 08:47:01',0,1),(43,15,4,21,'2022-01-19 08:47:17',0,1),(44,15,3,4,'2022-01-19 08:47:33',0,1),(45,15,3,5,'2022-01-19 08:47:33',0,1),(46,16,4,22,'2022-01-19 08:47:49',0,1),(47,16,3,4,'2022-01-19 08:48:06',0,1),(48,16,3,5,'2022-01-19 08:48:06',0,1),(49,17,4,23,'2022-01-19 08:48:22',0,1),(50,17,3,4,'2022-01-19 08:48:40',0,1),(51,17,3,5,'2022-01-19 08:48:40',0,1),(52,18,4,24,'2022-01-19 08:48:57',0,1),(53,18,3,4,'2022-01-19 08:49:13',0,1),(54,18,3,5,'2022-01-19 08:49:13',0,1),(55,19,4,25,'2022-01-19 08:49:29',0,1),(56,19,3,4,'2022-01-19 08:49:44',0,1),(57,19,3,5,'2022-01-19 08:49:44',0,1);
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
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:39:48','2022-01-19 08:39:50',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:40:13','2022-01-19 08:40:16',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:40:45','2022-01-19 08:40:48',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:41:22','2022-01-19 08:41:25',10,521,4),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:41:53','2022-01-19 08:41:56',11,521,5),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:42:27','2022-01-19 08:42:29',12,521,6),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:42:57','2022-01-19 08:43:00',13,521,7),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:43:34','2022-01-19 08:43:36',14,521,8),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:44:04','2022-01-19 08:44:07',15,521,9),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:44:37','2022-01-19 08:44:39',16,521,10),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:45:09','2022-01-19 08:45:12',17,521,11),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:45:46','2022-01-19 08:45:48',18,521,12),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:46:19','2022-01-19 08:46:21',19,521,13),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:46:53','2022-01-19 08:46:55',20,521,14),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:47:27','2022-01-19 08:47:29',21,521,15),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:47:59','2022-01-19 08:48:01',22,521,16),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:48:32','2022-01-19 08:48:34',23,521,17),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:49:06','2022-01-19 08:49:09',24,521,18),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2022-01-19 08:49:38','2022-01-19 08:49:41',25,521,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=956 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (525,'11-'),(666,'21st'),(350,'aalborg'),(798,'abattoir'),(837,'abnormal'),(434,'academic'),(533,'accepted'),(399,'accompanying'),(717,'achieving'),(477,'acid'),(550,'acids'),(253,'action'),(937,'actor'),(930,'actors'),(386,'added'),(431,'address'),(481,'adipose'),(132,'administered'),(362,'administration'),(752,'adopted'),(753,'advocated'),(826,'affected'),(28,'affects'),(794,'african'),(936,'agree'),(859,'aid'),(470,'aim'),(417,'al-khafaji'),(70,'alberta'),(144,'alexandria'),(655,'analyses'),(39,'analysis'),(508,'analyzed'),(506,'animals'),(730,'anthracnose'),(902,'antibiotics'),(873,'antimicrobial'),(586,'antonio'),(616,'appears'),(153,'applications'),(361,'applied'),(563,'aquifer'),(16,'archival'),(650,'areas'),(169,'argument'),(955,'arguments'),(771,'ash'),(471,'assess'),(555,'assessed'),(611,'assessments'),(662,'atlantic'),(18,'attitude'),(461,'australian'),(860,'authorities'),(413,'authority'),(353,'availability'),(486,'averaging'),(502,'backfat'),(168,'background'),(720,'baiyewu'),(785,'barcelona'),(672,'barriers'),(485,'barrows'),(567,'barton'),(414,'based'),(407,'basin'),(372,'basins'),(674,'basis'),(610,'bearings'),(797,'beef'),(102,'began'),(181,'beliefs'),(696,'belonging'),(34,'benchmark'),(48,'benefit'),(600,'blanco'),(4,'bologna'),(54,'brazil'),(412,'brazos'),(822,'breeds'),(625,'buda'),(810,'bulls'),(463,'butyrate'),(523,'c18'),(527,'c20'),(104,'called'),(791,'cameroon'),(98,'canada'),(383,'capabilities'),(313,'cape'),(824,'carcass'),(805,'carcasses'),(554,'carefully'),(1,'carlo'),(687,'carried'),(661,'case'),(910,'cases'),(828,'category'),(5,'catherine'),(789,'cattle'),(793,'central'),(667,'century'),(614,'cfs'),(456,'challenges'),(636,'change'),(443,'chapter'),(804,'characteristics'),(215,'children'),(53,'china'),(777,'chips'),(460,'christopher'),(524,'cis'),(220,'citizens'),(256,'citizenship'),(188,'claim'),(177,'claims'),(84,'classroom'),(909,'clinical'),(704,'close'),(510,'close-'),(663,'coast'),(893,'coli'),(877,'coliforms'),(291,'colleagues'),(504,'collected'),(589,'collection'),(939,'collective'),(935,'collectively'),(59,'collectivistic'),(210,'college'),(202,'com-mitments'),(726,'combating'),(182,'commitments'),(192,'common'),(265,'commons'),(43,'communication'),(698,'communities'),(681,'community'),(12,'comparative'),(929,'compare'),(37,'compared'),(49,'comparisons'),(196,'competencies'),(32,'compiled'),(402,'complete'),(855,'completely'),(380,'complex'),(509,'composition'),(74,'computer'),(906,'concentration'),(584,'concept'),(328,'conclusive'),(852,'condemned'),(394,'condensed'),(351,'condensing'),(569,'conditions'),(230,'conducted'),(218,'confident'),(329,'conflicting'),(918,'conjugative'),(645,'connection'),(561,'connectivity'),(944,'consensus'),(736,'considered'),(55,'consistent'),(191,'consists'),(535,'consortium'),(14,'construct'),(408,'contained'),(290,'contemporary'),(515,'content'),(65,'context'),(652,'continual'),(221,'continue'),(344,'continuous'),(683,'contributing'),(948,'contributors'),(865,'control'),(453,'coordinated'),(107,'core'),(2,'corino'),(211,'cork'),(339,'corporate'),(694,'council'),(31,'countries'),(710,'country'),(108,'courses'),(283,'coward'),(835,'cows'),(242,'cps'),(68,'craig'),(33,'create'),(239,'creative'),(599,'creek'),(170,'critique'),(755,'crop'),(778,'cubes'),(763,'cultivars'),(64,'cultural'),(27,'culture'),(699,'cultures'),(953,'cuny'),(101,'curriculum'),(163,'dana'),(657,'daniel'),(17,'data'),(395,'dataset'),(377,'datasets'),(271,'decades1'),(931,'decide'),(945,'decision'),(251,'decision-making'),(382,'decision-support'),(343,'decisions'),(173,'deep'),(690,'defining'),(25,'degree'),(691,'delivering'),(649,'demands'),(93,'demonstrate'),(685,'describes'),(422,'design'),(659,'designing'),(761,'destruction'),(742,'devastating'),(411,'develop'),(384,'developed'),(212,'developing'),(120,'development'),(303,'developments'),(142,'diaga'),(546,'dietary'),(491,'diets'),(542,'differed'),(903,'difference'),(203,'difficult'),(942,'difficulty'),(143,'diouf'),(458,'directions'),(174,'disagreement'),(274,'disciplines'),(635,'discontinuity'),(152,'discussed'),(692,'discussions'),(735,'disease'),(723,'diseases'),(603,'dissipated'),(272,'distinguished'),(849,'distress'),(342,'distribution'),(206,'diverge'),(670,'diversity'),(585,'divide'),(333,'dividend'),(317,'dividends'),(208,'domatilia'),(580,'downstream'),(597,'drainage'),(634,'dramatic'),(861,'draw'),(568,'drought'),(609,'droughts'),(740,'dry'),(536,'dry-cured'),(856,'due'),(638,'dynamic'),(331,'economists'),(526,'ecosenoic'),(839,'ectoparasites'),(747,'edible'),(87,'education'),(562,'edwards'),(67,'effect'),(45,'effectiveness'),(248,'effects'),(213,'efficacy'),(44,'efficiency'),(712,'egalitarianism'),(257,'elinor'),(669,'embracing'),(436,'emerging'),(695,'emphasises'),(319,'empirical'),(140,'employed'),(20,'employees'),(919,'encoding'),(838,'encountered'),(577,'endangered'),(370,'endeavors'),(154,'engineering'),(440,'engineers'),(237,'enhance'),(389,'enhanced'),(254,'enhancing'),(845,'enlarged'),(886,'enterobacteriacea'),(424,'environmental'),(928,'environments'),(214,'equip'),(15,'equivalence'),(892,'escherichia'),(583,'established'),(706,'ethnic'),(707,'ethno-linguistic'),(348,'evaluation'),(320,'evidence'),(24,'examine'),(136,'examined'),(680,'examines'),(66,'exerts'),(51,'exhibited'),(457,'exist'),(77,'existing'),(594,'exists'),(368,'expanding'),(266,'expe-'),(442,'experiences'),(160,'expression'),(620,'extended'),(622,'extensive'),(304,'fabio'),(8,'facets'),(38,'factor'),(41,'factors'),(888,'faeces'),(430,'failed'),(757,'fallowing'),(474,'fat'),(840,'fatigue'),(497,'fats'),(476,'fatty'),(385,'features'),(499,'fed'),(728,'field'),(889,'fifteen'),(483,'fifty-four'),(775,'finally'),(330,'financial'),(341,'financing'),(190,'find'),(57,'findings'),(954,'finocchiaro'),(326,'firm'),(608,'flow'),(615,'flowing'),(406,'flows'),(854,'flukes'),(355,'focus'),(176,'fogelin'),(171,'fogelins'),(187,'fogelin’s'),(556,'food'),(147,'forest'),(772,'found'),(180,'framework'),(260,'frank'),(184,'fruitfully'),(819,'fulani'),(345,'function'),(773,'fungal'),(842,'fungal-like'),(324,'future'),(676,'gender'),(787,'general'),(159,'genes'),(145,'genetic'),(668,'genuinely'),(769,'gins'),(127,'goal'),(950,'goverance'),(158,'governing'),(96,'government'),(94,'grade'),(628,'gradient'),(637,'gradients'),(223,'graduation'),(593,'groundwater'),(592,'groundwater-level'),(916,'group'),(388,'growing'),(269,'growth'),(818,'gudali'),(334,'guidance'),(813,'guinea'),(537,'ham'),(194,'hand'),(307,'hansen'),(759,'healthy'),(479,'heavy'),(814,'high'),(61,'higher'),(513,'highest'),(713,'highlights'),(139,'hired'),(122,'hiring'),(881,'hospital'),(887,'human'),(642,'hydraulic'),(591,'hydrogeologic'),(560,'hydrologic'),(605,'hydrologically'),(445,'identification'),(891,'identified'),(579,'immediately'),(398,'impacts'),(115,'implement'),(100,'implementation'),(934,'implemented'),(79,'implications'),(714,'importance'),(864,'improve'),(464,'improves'),(155,'improving'),(702,'include'),(410,'included'),(754,'includes'),(648,'increased'),(547,'increases'),(539,'index'),(259,'indiana'),(697,'individual'),(36,'individually'),(58,'individuals'),(762,'infected'),(774,'infection'),(880,'infections'),(472,'influence'),(617,'influenced'),(641,'influences'),(105,'information'),(219,'informed'),(106,'infused'),(532,'ing'),(644,'inherent'),(905,'inhibitory'),(90,'initiatives'),(392,'input'),(926,'institutions'),(236,'instruction'),(433,'integrates'),(141,'integrating'),(82,'integration'),(302,'intellectual'),(689,'intention'),(660,'intercultural'),(684,'interculturality'),(296,'interest'),(178,'interlocutors'),(452,'internships'),(347,'intuitive'),(166,'investigating'),(340,'investment'),(337,'investors'),(250,'involve'),(705,'involvement'),(444,'involves'),(530,'iodine'),(883,'iran'),(72,'irvine'),(882,'isfahan'),(490,'isoenergetic'),(878,'isolated'),(890,'isolates'),(86,'issue'),(801,'january'),(9,'job'),(311,'john'),(117,'jurisdictions'),(871,'karbasizaed'),(416,'karim'),(895,'kelebsiella'),(224,'key'),(216,'knowledge'),(559,'kumiega'),(6,'kwantes'),(624,'kyle'),(262,'laerhoven'),(841,'lameness'),(675,'language'),(379,'large'),(429,'largely'),(800,'largest'),(718,'lasting'),(540,'layers'),(252,'leads'),(227,'learn'),(222,'learners'),(113,'learning'),(450,'led'),(459,'leo'),(844,'lesions'),(95,'level'),(529,'levels'),(438,'leveraged'),(455,'limitations'),(528,'linoleic'),(522,'linolenic'),(558,'lise'),(318,'literature'),(780,'live'),(853,'liver'),(767,'locally'),(275,'long'),(473,'long-term'),(604,'longer'),(807,'longissimus'),(284,'los'),(738,'losses'),(627,'low'),(519,'lowest'),(858,'lungs'),(846,'lymph'),(286,'mackenzie'),(768,'made'),(494,'maize'),(85,'major'),(279,'managed'),(335,'management'),(99,'mandated'),(802,'march'),(565,'marcos'),(419,'margaret'),(71,'mark'),(743,'marked'),(829,'markedly'),(746,'marketable'),(488,'matched'),(760,'material'),(821,'mbororo'),(244,'means'),(831,'meat'),(157,'mechanisms'),(126,'meet'),(727,'menace'),(665,'met'),(874,'metal'),(911,'metals'),(393,'methodology'),(907,'mic'),(289,'mid-1980s'),(711,'militate'),(904,'minimal'),(280,'mismanaged'),(198,'mistakenly'),(409,'model'),(358,'modeling'),(354,'models'),(415,'modifying'),(653,'monitoring'),(520,'monounsaturated'),(69,'montgomerie'),(781,'months'),(420,'morse'),(733,'mosaic'),(245,'motivate'),(255,'motivation'),(521,'mufa'),(925,'multi-level'),(921,'multidrug-resistance'),(679,'multiethnic'),(678,'multilingual'),(22,'multinational'),(901,'multiple'),(312,'mwandenga'),(721,'nairobi'),(26,'national'),(35,'nations'),(29,'nature'),(378,'necessarily'),(651,'necessitates'),(927,'networked'),(138,'newly'),(664,'nicaragua'),(724,'nigeria'),(11,'nine-nation'),(847,'nodes'),(850,'nodular'),(631,'non-drought'),(602,'normal'),(633,'north'),(879,'nosocomial'),(349,'novak'),(613,'numerical'),(226,'nurturing'),(786,'nutrition'),(551,'nutritional'),(867,'observed'),(327,'offer'),(495,'oil'),(598,'onion'),(183,'order'),(23,'organization'),(42,'organizational'),(448,'organizations'),(851,'organs'),(812,'origin'),(401,'original'),(258,'ostrom'),(671,'overcome'),(305,'paglieri'),(128,'paper'),(811,'parameters'),(534,'parma'),(200,'part'),(228,'participate'),(686,'participatory'),(447,'partner'),(270,'past'),(656,'patricia'),(917,'pattern'),(884,'patterns'),(715,'pedagogy'),(673,'people'),(205,'people’s'),(898,'percent'),(465,'performance'),(468,'period'),(621,'periods'),(364,'permit'),(375,'permits'),(47,'personal'),(914,'persons'),(946,'perverse'),(164,'phillips'),(480,'pig'),(467,'piglets'),(512,'pigs'),(308,'pinto'),(282,'places'),(575,'plan'),(367,'planning'),(758,'planting'),(162,'plants'),(876,'plasmid'),(896,'pneumoniae'),(80,'policy'),(517,'polyunsaturated'),(299,'pool'),(647,'population'),(748,'portions'),(247,'positive'),(900,'possess'),(336,'potential'),(629,'potentiometric'),(708,'power'),(332,'practical'),(81,'practice'),(803,'pre-slaughter'),(823,'predominant'),(836,'pregnant'),(441,'present'),(233,'presented'),(725,'presents'),(866,'prevent'),(56,'previous'),(571,'primary'),(426,'principles'),(195,'pro-cedural'),(240,'problem'),(941,'problematic'),(201,'procedural'),(776,'processing'),(817,'production'),(189,'productive'),(119,'professional'),(478,'profile'),(885,'profiles'),(590,'program'),(862,'programmes'),(151,'progress'),(451,'project-based'),(446,'projects'),(868,'promote'),(716,'promoting'),(643,'properties'),(301,'property'),(548,'proportion'),(325,'prospects'),(576,'protect'),(381,'provide'),(97,'province'),(89,'provincial'),(133,'public'),(518,'pufa'),(623,'pumping'),(947,'punishing'),(185,'pursue'),(552,'quality'),(745,'quantity'),(581,'questions'),(582,'raised'),(719,'rana'),(487,'randomized'),(496,'rapeseed'),(646,'rapid'),(135,'rate'),(943,'reaching'),(827,'rearing'),(309,'reason'),(150,'recent'),(618,'recharge'),(310,'reclaimed'),(806,'recorded'),(920,'recovered'),(820,'red'),(744,'reduction'),(750,'reductions'),(511,'reflected'),(374,'reflects'),(186,'refute'),(731,'regarded'),(295,'region'),(365,'regional'),(297,'regions'),(709,'relations'),(915,'relationship'),(346,'rely'),(894,'remaining'),(400,'removed'),(60,'report'),(809,'represent'),(792,'representative'),(405,'represents'),(137,'require'),(114,'required'),(76,'requirements'),(62,'research'),(288,'researchers'),(397,'reservoir'),(376,'reservoirs'),(875,'resistance'),(764,'resistant'),(300,'resource'),(278,'resources'),(111,'respect'),(848,'respiratory'),(134,'response'),(30,'responses'),(607,'result'),(531,'result-'),(130,'results'),(40,'revealed'),(149,'review'),(285,'reyes'),(267,'rienced'),(363,'rights'),(371,'river'),(175,'robert'),(225,'role'),(306,'rome'),(783,'rosanna'),(784,'rossi'),(741,'rot'),(756,'rotation'),(360,'routinely'),(949,'ruled'),(796,'safety'),(503,'samples'),(564,'san'),(932,'sanction'),(938,'sanctioned'),(940,'sanctioning'),(933,'sanctions'),(10,'satisfaction'),(52,'satisfied'),(514,'saturated'),(815,'savannah'),(273,'scholars'),(116,'school'),(293,'sec-'),(557,'security'),(587,'segments'),(396,'selected'),(217,'self-belief'),(238,'self-efficacy'),(924,'self-organization'),(606,'separated'),(103,'september'),(570,'serves'),(423,'service'),(432,'service-learning'),(403,'set'),(435,'setting'),(897,'seventy'),(737,'severe'),(516,'sfa'),(179,'share'),(167,'shared'),(338,'shareholding'),(779,'shelf'),(545,'show'),(833,'showed'),(234,'showing'),(246,'shown'),(626,'shows'),(323,'signal'),(321,'signaling'),(315,'signalling'),(912,'significant'),(543,'significantly'),(832,'similar'),(390,'simplifying'),(391,'simulation'),(612,'simulations'),(21,'single'),(788,'situation'),(75,'skill'),(91,'skills'),(843,'skin'),(501,'slaughter'),(790,'slaughtered'),(500,'slaughtering'),(632,'slopes'),(231,'social'),(229,'society'),(462,'sodium'),(209,'sokoloff'),(241,'solving'),(574,'source'),(573,'south-central'),(578,'species'),(277,'specific'),(109,'specifies'),(732,'spread'),(566,'springs'),(688,'staff'),(123,'standards'),(418,'stanford'),(373,'state'),(366,'statewide'),(729,'storage'),(751,'stored'),(899,'strains'),(121,'strategies'),(235,'strategy'),(404,'streamflows'),(863,'strengthen'),(640,'structural'),(50,'structures'),(449,'student'),(92,'students'),(276,'studied'),(232,'studies'),(13,'study'),(795,'sub-region'),(541,'subcutaneous'),(268,'substantial'),(454,'successful'),(63,'suggest'),(322,'suggests'),(129,'summarizes'),(498,'supplement-'),(475,'supplementation'),(492,'supplemented'),(572,'supply'),(46,'support'),(197,'supporters'),(701,'supporting'),(596,'surface'),(19,'survey'),(425,'sustainability'),(421,'sustainable'),(359,'system'),(356,'systems'),(677,'takes'),(493,'tallow'),(243,'taught'),(439,'teach'),(78,'teachers'),(125,'teachers’'),(553,'technological'),(83,'technology'),(112,'technology”'),(765,'tecto'),(872,'tehran'),(131,'telephone'),(505,'ten'),(357,'texas'),(316,'theory'),(172,'thesis'),(766,'thiabendazole'),(808,'thoracis'),(700,'time'),(281,'times'),(482,'tissue'),(88,'today'),(913,'tolerant'),(437,'tool'),(193,'topic'),(428,'topics'),(165,'toronto'),(294,'tors'),(834,'toughest'),(314,'town'),(869,'trade'),(263,'traditions'),(146,'transformation'),(816,'transhumance'),(507,'treatment'),(544,'treatments'),(148,'trees'),(654,'trend'),(264,'trends'),(857,'tuberculosis'),(749,'tubers'),(118,'turning'),(387,'types'),(156,'understanding'),(3,'university'),(703,'university’s'),(639,'unknown'),(538,'unsaturation'),(124,'upgrade'),(204,'uphold'),(682,'uraccan'),(870,'vajiheh'),(922,'valerie'),(249,'valuable'),(908,'values'),(261,'van'),(630,'variation'),(830,'varied'),(369,'variety'),(595,'vicinity'),(73,'victoria'),(199,'view'),(734,'virus'),(427,'vital'),(619,'vulnerable'),(693,'wales'),(352,'water'),(588,'water-level'),(466,'weaned'),(469,'weaning'),(825,'weight'),(489,'weights'),(601,'wet'),(484,'white'),(207,'widely'),(923,'williamson'),(7,'windsor'),(287,'wittfogel'),(658,'wolverhampton'),(770,'wood'),(952,'woods'),(161,'woody'),(292,'work'),(298,'world'),(722,'yam'),(739,'yams'),(799,'yaoundé'),(782,'year'),(951,'zita'),(110,'“expected'),(549,'“healthy”');
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(9,3,2),(17,3,2),(17,3,6),(25,3,3),(33,3,2),(41,3,2),(49,3,3),(49,3,8),(57,3,2),(65,3,2),(73,3,3),(81,3,3),(81,3,7),(89,3,4),(97,3,2),(105,3,2),(107,3,28),(107,3,37),(107,3,80),(113,3,2),(121,3,3),(129,3,2),(137,3,2),(1,4,3),(9,5,0),(9,6,1),(9,7,3),(137,7,3),(10,8,0),(10,9,1),(11,9,14),(11,9,70),(10,10,2),(11,10,15),(11,10,60),(11,10,71),(10,11,3),(10,12,4),(10,13,5),(50,13,2),(51,13,0),(91,13,1),(99,13,43),(106,13,4),(107,13,18),(10,14,6),(11,14,43),(10,15,7),(11,15,44),(11,16,0),(11,17,1),(99,17,39),(99,17,47),(99,17,64),(99,17,127),(99,17,203),(123,17,110),(11,18,2),(11,19,3),(13,19,1),(19,19,62),(21,19,4),(11,20,4),(11,20,48),(13,20,0),(11,21,5),(11,22,6),(11,23,7),(11,24,8),(11,25,9),(99,25,176),(11,26,10),(11,26,64),(19,26,7),(21,26,6),(89,26,3),(11,27,11),(107,27,15),(109,27,8),(11,28,12),(11,29,13),(11,29,69),(99,29,157),(11,30,16),(11,31,17),(11,32,18),(11,33,19),(11,34,20),(11,35,21),(11,35,57),(11,36,22),(139,36,3),(11,37,23),(131,37,15),(131,37,36),(11,38,24),(11,38,38),(11,39,25),(99,39,45),(99,39,63),(11,40,26),(11,41,27),(107,41,61),(11,42,28),(11,42,30),(11,42,33),(11,42,40),(11,43,29),(11,43,41),(19,43,27),(11,44,31),(11,45,32),(11,46,34),(19,46,80),(43,46,49),(11,47,35),(11,47,45),(11,48,36),(11,48,46),(11,49,37),(11,50,39),(11,51,42),(11,52,47),(11,52,50),(11,53,49),(11,54,51),(11,55,52),(131,55,62),(11,56,53),(11,57,54),(11,57,62),(43,57,27),(11,58,55),(11,59,56),(11,60,58),(11,61,59),(91,61,96),(11,62,61),(43,62,26),(43,62,40),(107,62,35),(107,62,81),(123,62,1),(11,63,63),(35,63,33),(99,63,98),(11,64,65),(11,65,66),(43,65,31),(11,66,67),(11,67,68),(91,67,87),(17,68,0),(17,69,1),(17,70,3),(19,70,18),(19,70,38),(19,70,68),(21,70,5),(17,71,4),(17,72,5),(17,73,7),(18,74,0),(19,74,54),(19,74,72),(21,74,2),(18,75,1),(18,76,2),(18,77,3),(67,77,25),(18,78,4),(19,78,40),(19,78,79),(19,78,84),(18,79,5),(43,79,65),(67,79,17),(99,79,87),(18,80,6),(67,80,16),(67,80,22),(18,81,7),(19,82,0),(19,83,1),(19,83,10),(19,83,28),(21,83,1),(19,84,2),(42,84,3),(43,84,70),(19,85,3),(43,85,0),(99,85,9),(99,85,85),(19,86,4),(67,86,14),(19,87,5),(43,87,2),(45,87,0),(83,87,8),(85,87,2),(107,87,7),(19,88,6),(19,89,8),(21,89,7),(19,90,9),(19,91,11),(19,91,55),(19,91,73),(21,91,3),(43,91,6),(19,92,12),(19,92,34),(107,92,39),(19,93,13),(19,94,14),(19,95,15),(99,95,164),(99,95,195),(19,96,16),(19,97,17),(19,97,67),(19,98,19),(19,99,20),(19,100,21),(19,101,22),(19,101,29),(19,101,43),(106,101,2),(107,101,43),(107,101,53),(107,101,65),(19,102,23),(19,103,24),(19,104,25),(19,105,26),(19,106,30),(19,107,31),(19,108,32),(19,109,33),(19,110,35),(19,111,36),(19,112,37),(19,113,39),(43,113,38),(43,113,50),(43,113,56),(82,113,0),(85,113,4),(19,114,41),(34,114,3),(35,114,19),(35,114,41),(19,115,42),(19,116,44),(19,116,65),(19,116,74),(43,116,24),(19,117,45),(19,117,66),(19,117,75),(19,118,46),(19,119,47),(21,119,8),(19,120,48),(21,120,9),(51,120,6),(83,120,3),(85,120,0),(107,120,31),(107,120,63),(19,121,49),(19,121,81),(107,121,44),(115,121,5),(115,121,50),(19,122,50),(19,123,51),(19,124,52),(19,125,53),(19,126,56),(19,127,57),(43,127,1),(19,128,58),(43,128,15),(19,129,59),(19,130,60),(91,130,112),(131,130,82),(19,131,61),(19,132,63),(19,133,64),(19,134,69),(99,134,165),(19,135,70),(19,136,71),(19,137,76),(19,138,77),(19,139,78),(19,140,82),(19,140,83),(115,140,6),(21,141,0),(25,142,0),(25,143,1),(25,144,2),(26,145,0),(27,145,3),(27,145,9),(26,146,1),(27,146,4),(107,146,92),(109,146,12),(26,147,2),(27,147,5),(27,147,12),(26,148,3),(27,148,6),(27,148,13),(27,149,0),(66,149,3),(115,149,0),(27,150,1),(67,150,8),(27,151,2),(27,152,7),(43,152,71),(83,152,58),(27,153,8),(75,153,42),(75,153,44),(27,154,10),(83,154,7),(85,154,1),(27,155,11),(91,155,135),(27,156,14),(107,156,51),(27,157,15),(27,158,16),(27,159,17),(27,160,18),(27,161,19),(27,162,20),(33,163,0),(33,164,1),(33,165,3),(34,166,0),(35,166,16),(34,167,1),(35,167,17),(35,167,29),(35,167,38),(34,168,2),(35,168,6),(35,168,18),(35,168,23),(35,168,42),(34,169,4),(35,169,12),(35,169,21),(35,169,44),(34,170,5),(34,171,6),(34,172,7),(34,173,8),(34,174,9),(35,175,0),(35,176,1),(35,176,34),(35,177,2),(35,178,3),(35,179,4),(35,180,5),(43,180,58),(35,181,7),(35,181,26),(35,181,39),(35,181,50),(42,181,2),(43,181,20),(35,182,8),(35,182,31),(35,183,9),(43,183,21),(35,184,10),(35,185,11),(35,186,13),(35,187,14),(35,188,15),(35,189,20),(35,189,43),(35,190,22),(35,191,24),(35,192,25),(53,192,0),(53,192,3),(123,192,48),(123,192,82),(35,193,27),(35,193,53),(35,194,28),(35,194,54),(35,195,30),(35,196,32),(35,197,35),(35,198,36),(35,199,37),(35,200,40),(43,200,39),(35,201,45),(35,202,46),(35,203,47),(35,204,48),(35,205,49),(35,206,51),(35,207,52),(115,207,16),(41,208,0),(41,209,1),(41,210,3),(41,211,4),(42,212,0),(75,212,56),(99,212,11),(42,213,1),(43,213,19),(43,214,3),(43,215,4),(43,215,46),(43,215,60),(43,216,5),(43,217,7),(43,218,8),(43,219,9),(51,219,32),(43,220,10),(43,220,11),(43,221,12),(107,221,10),(43,222,13),(43,223,14),(43,224,16),(43,225,17),(43,226,18),(43,227,22),(43,227,69),(43,228,23),(43,229,25),(43,230,28),(99,230,44),(43,231,29),(43,231,63),(83,231,14),(107,231,91),(109,231,11),(43,232,30),(43,233,32),(75,233,55),(115,233,13),(43,234,33),(43,235,34),(43,236,35),(43,237,36),(43,238,37),(43,238,55),(43,238,67),(43,239,41),(43,240,42),(43,241,43),(43,242,44),(43,242,52),(43,243,45),(43,244,47),(43,245,48),(43,246,51),(43,247,53),(43,248,54),(75,248,79),(91,248,138),(43,249,57),(43,250,59),(43,251,61),(43,252,62),(43,253,64),(43,254,66),(43,255,68),(45,256,1),(49,257,0),(49,258,1),(49,259,2),(49,259,7),(49,260,4),(49,261,5),(49,262,6),(50,263,0),(50,264,1),(50,265,3),(51,265,1),(51,265,28),(51,266,2),(51,267,3),(51,268,4),(51,269,5),(90,269,3),(99,269,185),(51,270,7),(99,270,79),(99,270,101),(51,271,8),(51,272,9),(51,273,10),(51,273,34),(51,274,11),(51,274,35),(51,275,12),(51,276,13),(51,276,26),(51,277,14),(51,277,27),(74,277,5),(51,278,15),(51,279,16),(51,280,17),(51,281,18),(51,282,19),(51,283,20),(51,284,21),(51,285,22),(51,286,23),(51,287,24),(51,288,25),(51,289,29),(51,290,30),(51,291,31),(51,292,33),(51,293,36),(51,294,37),(51,295,38),(107,295,25),(107,295,76),(131,295,88),(51,296,39),(139,296,36),(51,297,40),(51,298,41),(83,298,38),(53,299,1),(53,300,2),(53,301,4),(53,302,5),(53,303,6),(57,304,0),(57,305,1),(57,306,3),(58,307,0),(58,308,1),(58,309,2),(58,310,3),(65,311,0),(73,311,0),(65,312,1),(65,313,3),(97,313,3),(65,314,4),(97,314,4),(66,315,0),(66,316,1),(67,316,1),(66,317,2),(67,317,3),(66,318,4),(66,319,5),(67,319,9),(66,320,6),(67,320,10),(67,320,13),(67,321,0),(67,322,2),(99,322,67),(67,323,4),(67,324,5),(83,324,24),(83,324,59),(99,324,204),(67,325,6),(67,326,7),(67,327,11),(67,328,12),(67,329,15),(67,330,18),(67,331,19),(67,332,20),(67,333,21),(67,333,37),(67,334,23),(67,335,24),(67,335,36),(74,335,7),(75,335,20),(75,335,52),(99,335,89),(114,335,2),(115,335,4),(115,335,49),(67,336,26),(99,336,76),(131,336,85),(67,337,27),(67,338,28),(67,339,29),(67,340,30),(67,341,31),(67,342,32),(67,343,33),(67,343,38),(139,343,16),(139,343,35),(67,344,34),(67,345,35),(67,346,39),(67,347,40),(67,348,41),(73,349,1),(73,350,2),(74,351,0),(74,352,1),(74,352,6),(75,352,1),(75,352,8),(75,352,19),(75,352,25),(75,352,51),(75,352,64),(75,352,80),(75,352,106),(77,352,0),(99,352,4),(99,352,163),(99,352,187),(101,352,0),(74,353,2),(75,353,2),(75,353,107),(99,353,90),(74,354,3),(74,355,4),(75,355,50),(74,356,8),(75,356,53),(75,357,0),(75,357,105),(99,357,7),(75,358,3),(75,358,18),(75,358,35),(75,358,38),(75,358,108),(75,359,4),(75,359,11),(75,359,36),(75,359,61),(75,359,78),(75,359,102),(75,359,109),(123,359,50),(123,359,62),(75,360,5),(75,361,6),(75,361,94),(75,362,7),(75,363,9),(75,363,65),(75,363,81),(75,364,10),(75,365,12),(123,365,127),(75,366,13),(75,367,14),(75,368,15),(83,368,61),(75,369,16),(75,370,17),(75,371,21),(75,371,82),(75,371,99),(75,371,112),(99,371,58),(99,371,116),(75,372,22),(75,373,23),(75,374,24),(75,374,62),(75,375,26),(75,376,27),(75,376,67),(75,377,28),(75,377,49),(75,378,29),(75,379,30),(91,379,15),(75,380,31),(75,381,32),(99,381,202),(123,381,2),(75,382,33),(75,383,34),(75,384,37),(75,384,74),(75,385,39),(75,386,40),(75,387,41),(75,388,43),(75,389,45),(75,390,46),(75,391,47),(75,392,48),(75,392,88),(75,393,54),(75,393,93),(75,394,57),(75,394,91),(75,394,96),(75,395,58),(75,395,71),(75,395,89),(75,395,92),(75,395,110),(75,396,59),(75,396,77),(123,396,32),(75,397,60),(75,397,101),(75,398,63),(75,399,66),(75,400,68),(75,401,69),(75,401,85),(75,402,70),(75,402,86),(75,403,72),(99,403,128),(75,404,73),(75,405,75),(75,406,76),(75,407,83),(75,407,113),(75,408,84),(75,409,87),(75,409,97),(83,409,27),(83,409,39),(83,409,53),(83,409,62),(99,409,97),(107,409,46),(107,409,49),(75,410,90),(75,411,95),(75,412,98),(75,412,111),(75,413,100),(75,414,103),(83,414,32),(75,415,104),(81,416,0),(81,417,1),(81,418,2),(81,418,6),(83,418,34),(81,419,4),(81,420,5),(82,421,1),(83,421,2),(83,421,22),(83,421,30),(83,421,37),(82,422,2),(83,422,23),(83,422,31),(83,422,48),(82,423,3),(83,423,15),(85,423,3),(83,424,0),(83,425,1),(85,425,5),(83,426,4),(83,427,5),(83,428,6),(83,429,9),(83,430,10),(83,431,11),(99,431,36),(83,432,12),(83,432,28),(83,433,13),(83,434,16),(83,435,17),(139,435,1),(139,435,6),(83,436,18),(83,437,19),(83,438,20),(83,439,21),(83,439,29),(83,440,25),(83,440,36),(83,441,26),(83,442,33),(83,443,35),(83,444,40),(83,445,41),(83,446,42),(83,447,43),(83,447,51),(83,448,44),(83,448,52),(83,449,45),(83,450,46),(83,451,47),(83,452,49),(83,453,50),(83,454,54),(83,455,55),(83,456,56),(107,456,0),(83,457,57),(107,457,11),(83,458,60),(89,459,0),(89,460,1),(89,461,2),(90,462,0),(90,463,1),(90,464,2),(90,465,4),(90,466,5),(90,467,6),(90,468,7),(115,468,96),(90,469,8),(91,470,0),(123,470,0),(123,470,115),(91,471,2),(91,472,3),(99,472,175),(122,472,0),(91,473,4),(91,473,114),(122,473,1),(91,474,5),(91,474,134),(91,474,141),(123,474,70),(91,475,6),(91,475,116),(91,475,125),(91,476,7),(91,476,42),(91,476,48),(91,476,58),(91,476,66),(91,476,71),(91,476,118),(91,476,131),(122,476,5),(91,477,8),(91,477,43),(91,477,49),(91,477,59),(91,477,67),(91,477,72),(91,477,79),(91,477,84),(91,477,89),(91,477,119),(122,477,6),(91,478,9),(91,478,120),(130,478,5),(131,478,65),(91,479,10),(91,479,121),(122,479,8),(130,479,1),(131,479,1),(131,479,51),(131,479,58),(131,479,74),(91,480,11),(91,480,122),(91,480,133),(91,481,12),(91,481,123),(91,482,13),(91,482,108),(91,482,124),(91,483,14),(91,484,16),(123,484,52),(91,485,17),(91,486,18),(91,487,19),(91,488,20),(91,489,21),(91,490,22),(91,491,23),(91,492,24),(91,492,51),(91,493,25),(91,494,26),(91,495,27),(91,495,29),(91,495,127),(91,496,28),(91,496,126),(91,497,30),(91,497,52),(91,497,117),(122,497,4),(91,498,31),(91,499,32),(91,499,55),(91,499,62),(91,499,75),(91,500,33),(91,501,34),(123,501,30),(91,502,35),(91,502,45),(91,502,53),(91,502,92),(91,502,107),(122,502,10),(91,503,36),(91,504,37),(99,504,65),(91,505,38),(91,506,39),(91,507,40),(91,507,86),(91,508,41),(91,509,44),(91,509,50),(122,509,7),(123,509,38),(91,510,46),(91,511,47),(91,512,54),(93,512,0),(122,512,9),(91,513,56),(91,513,63),(91,513,76),(91,514,57),(91,515,60),(91,515,64),(91,515,74),(91,515,77),(123,515,71),(91,516,61),(91,517,65),(91,518,68),(91,519,69),(91,520,70),(91,521,73),(91,522,78),(91,523,80),(91,523,97),(91,524,81),(91,525,82),(91,526,83),(91,527,85),(91,528,88),(91,529,90),(91,529,95),(99,529,139),(99,529,152),(91,530,91),(91,531,93),(91,532,94),(91,533,98),(91,534,99),(91,535,100),(91,536,101),(91,537,102),(91,538,103),(91,539,104),(91,540,105),(91,541,106),(91,542,109),(91,543,110),(99,543,149),(91,544,111),(91,545,113),(91,546,115),(122,546,3),(91,547,128),(115,547,93),(91,548,129),(91,549,130),(91,550,132),(91,551,136),(91,552,137),(91,552,140),(123,552,12),(123,552,36),(123,552,69),(91,553,139),(91,554,142),(91,555,143),(93,556,1),(125,556,1),(93,557,2),(125,557,2),(97,558,0),(97,559,1),(98,560,0),(99,560,25),(99,560,61),(99,560,177),(98,561,1),(98,562,2),(99,562,0),(99,562,32),(99,562,92),(98,563,3),(99,563,1),(99,563,33),(99,563,93),(99,563,173),(98,564,4),(99,564,18),(99,564,27),(99,564,80),(99,564,102),(99,564,134),(99,564,179),(99,564,198),(98,565,5),(99,565,19),(99,565,81),(99,565,103),(99,565,135),(99,565,180),(99,565,199),(98,566,6),(98,566,8),(99,566,10),(99,566,20),(99,566,30),(99,566,82),(99,566,84),(99,566,105),(99,566,136),(99,566,145),(99,566,182),(99,566,200),(98,567,7),(99,567,29),(99,567,83),(99,567,104),(99,567,144),(99,567,181),(98,568,9),(99,568,34),(99,568,66),(99,568,106),(99,568,140),(99,568,153),(98,569,10),(99,569,35),(99,569,62),(99,569,107),(123,569,23),(123,569,84),(99,570,2),(107,570,72),(99,571,3),(99,572,5),(123,572,121),(99,573,6),(99,574,8),(99,574,156),(99,575,12),(99,576,13),(115,576,81),(99,577,14),(99,578,15),(99,579,16),(99,580,17),(99,581,21),(99,581,37),(99,582,22),(99,583,23),(99,584,24),(99,585,26),(99,585,49),(99,585,54),(99,585,69),(99,585,109),(99,586,28),(99,587,31),(99,587,74),(99,588,38),(99,589,40),(99,590,41),(99,590,197),(99,591,42),(99,591,205),(99,592,46),(99,593,48),(99,593,68),(99,593,77),(99,593,91),(99,593,108),(99,593,194),(99,594,50),(99,595,51),(99,595,124),(99,596,52),(99,596,133),(99,596,147),(99,597,53),(99,598,55),(99,598,113),(99,599,56),(99,599,114),(99,600,57),(99,600,115),(99,601,59),(99,602,60),(99,603,70),(99,604,71),(99,605,72),(99,606,73),(99,607,75),(99,608,78),(99,609,86),(99,610,88),(99,611,94),(99,612,95),(99,613,96),(99,614,99),(99,615,100),(99,616,110),(99,616,117),(99,617,111),(99,618,112),(99,618,121),(99,619,118),(99,620,119),(99,621,120),(99,621,142),(99,621,155),(99,622,122),(99,623,123),(99,624,125),(99,624,137),(99,624,143),(99,624,166),(99,624,189),(99,625,126),(99,625,190),(99,625,201),(99,626,129),(99,627,130),(123,627,72),(99,628,131),(99,629,132),(99,629,146),(99,629,160),(99,630,138),(99,631,141),(99,631,154),(99,632,148),(99,633,150),(99,634,151),(99,635,158),(99,635,174),(99,636,159),(99,637,161),(99,638,162),(99,639,167),(99,640,168),(99,641,169),(99,642,170),(99,643,171),(99,644,172),(99,645,178),(99,646,183),(99,647,184),(99,648,186),(99,649,188),(99,650,191),(99,651,192),(99,652,193),(99,653,196),(99,654,206),(99,655,207),(105,656,0),(105,657,1),(105,658,3),(106,659,0),(106,660,1),(107,660,42),(107,660,64),(106,661,3),(107,661,17),(106,662,5),(107,662,20),(106,663,6),(107,663,21),(106,664,7),(107,664,22),(107,665,1),(107,666,2),(109,666,0),(107,667,3),(109,667,1),(107,668,4),(107,669,5),(107,670,6),(109,670,2),(107,671,8),(107,672,9),(107,673,12),(107,674,13),(107,674,47),(107,674,86),(107,675,14),(109,675,7),(107,676,16),(109,676,9),(107,677,19),(107,678,23),(109,678,3),(107,679,24),(109,679,4),(107,680,26),(107,681,27),(107,681,50),(107,682,29),(107,683,30),(107,684,32),(107,684,88),(107,685,33),(107,686,34),(107,686,84),(109,686,5),(107,687,36),(123,687,41),(107,688,38),(107,689,40),(107,690,41),(107,691,45),(107,692,48),(107,693,52),(107,694,54),(107,695,55),(107,696,56),(107,697,57),(139,697,30),(107,698,58),(107,698,71),(107,699,59),(107,700,60),(107,701,62),(107,702,66),(107,703,67),(107,704,68),(107,705,69),(107,706,70),(107,707,73),(107,708,74),(107,709,75),(107,710,77),(107,711,78),(107,712,79),(109,712,10),(107,713,82),(107,714,83),(107,715,85),(109,715,6),(107,716,87),(107,717,89),(107,718,90),(113,719,0),(113,720,1),(113,721,3),(114,722,0),(115,722,3),(115,722,20),(115,722,34),(115,722,82),(115,722,89),(114,723,1),(115,723,2),(115,723,12),(115,723,19),(115,723,33),(115,723,55),(115,723,70),(123,723,125),(114,724,3),(115,724,9),(115,725,1),(115,726,7),(115,726,53),(115,727,8),(115,728,10),(115,728,18),(115,728,54),(115,729,11),(115,729,32),(115,729,69),(115,729,79),(115,729,86),(115,730,14),(115,731,15),(115,732,17),(115,733,21),(115,734,22),(115,735,23),(115,736,24),(115,736,30),(123,736,19),(115,737,25),(115,737,46),(115,738,26),(115,739,27),(115,739,37),(115,739,48),(115,740,28),(115,740,35),(115,740,75),(115,741,29),(115,741,36),(115,742,31),(115,743,38),(115,744,39),(115,745,40),(115,746,41),(115,747,42),(115,748,43),(115,749,44),(115,749,83),(115,749,90),(115,750,45),(115,751,47),(115,752,51),(115,753,52),(115,754,56),(115,755,57),(115,755,65),(115,756,58),(115,757,59),(115,758,60),(115,759,61),(131,759,12),(131,759,38),(131,759,60),(115,760,62),(115,761,63),(115,762,64),(115,763,66),(115,763,68),(115,764,67),(115,765,71),(115,766,72),(115,767,73),(115,768,74),(139,768,23),(115,769,76),(115,770,77),(115,771,78),(115,772,80),(115,773,84),(115,774,85),(131,774,87),(115,775,87),(115,776,88),(115,777,91),(115,778,92),(115,779,94),(115,780,95),(115,781,97),(115,782,98),(123,782,67),(121,783,0),(121,784,1),(121,785,2),(122,786,2),(123,787,3),(123,788,4),(123,789,5),(123,789,25),(123,789,43),(123,789,63),(123,789,117),(125,789,0),(123,790,6),(123,790,35),(123,790,80),(123,791,7),(123,791,18),(123,792,8),(123,793,9),(123,794,10),(123,795,11),(123,796,13),(123,797,14),(123,797,120),(123,798,15),(123,799,16),(123,800,17),(123,801,20),(123,802,21),(123,803,22),(123,804,24),(123,805,26),(123,805,31),(123,805,99),(123,806,27),(123,807,28),(123,807,39),(123,808,29),(123,808,40),(123,809,33),(123,810,34),(123,811,37),(123,812,42),(123,813,44),(123,814,45),(139,814,28),(123,815,46),(123,816,47),(123,817,49),(123,817,118),(123,818,51),(123,818,75),(123,819,53),(123,820,54),(123,821,55),(123,822,56),(123,822,74),(123,823,57),(123,824,58),(123,825,59),(123,826,60),(123,826,108),(123,827,61),(123,828,64),(123,829,65),(123,830,66),(123,831,68),(123,831,78),(123,832,73),(123,833,76),(123,834,77),(123,835,79),(123,836,81),(123,837,83),(123,838,85),(123,839,86),(123,840,87),(123,841,88),(123,842,89),(123,843,90),(123,844,91),(123,844,98),(123,845,92),(123,846,93),(123,847,94),(123,848,95),(123,849,96),(123,850,97),(123,851,100),(123,852,101),(123,852,105),(123,853,102),(123,854,103),(123,855,104),(123,856,106),(139,856,18),(123,857,107),(123,858,109),(123,859,111),(123,860,112),(123,861,113),(123,862,114),(123,863,116),(123,864,119),(123,865,122),(123,866,123),(123,867,124),(123,868,126),(123,869,128),(129,870,0),(129,871,1),(129,872,3),(130,873,0),(131,873,0),(131,873,67),(130,874,2),(131,874,2),(131,874,59),(130,875,3),(131,875,3),(131,875,34),(131,875,68),(131,875,73),(130,876,4),(131,876,5),(131,876,64),(131,876,71),(130,877,6),(131,877,7),(131,877,84),(130,878,7),(131,878,9),(131,878,29),(131,878,55),(131,878,79),(130,879,8),(131,879,10),(131,879,18),(131,879,30),(131,879,80),(131,879,86),(130,880,9),(131,880,11),(131,880,19),(131,880,31),(131,880,81),(130,881,10),(131,881,56),(130,882,11),(130,883,12),(131,884,4),(131,885,6),(131,886,8),(131,887,13),(131,887,39),(131,888,14),(131,888,40),(131,888,50),(131,889,16),(131,890,17),(131,891,20),(131,892,21),(131,893,22),(131,894,23),(131,895,24),(131,896,25),(131,897,26),(131,898,27),(131,899,28),(131,899,37),(131,899,47),(131,899,54),(131,899,78),(131,900,32),(131,901,33),(131,902,35),(131,902,76),(131,903,41),(131,904,42),(131,905,43),(131,906,44),(131,907,45),(131,908,46),(131,909,48),(131,910,49),(131,911,52),(131,911,75),(131,912,53),(131,913,57),(131,914,61),(131,915,63),(131,916,66),(139,916,37),(131,917,69),(131,918,70),(131,919,72),(131,920,77),(131,921,83),(137,922,0),(137,923,1),(138,924,0),(141,924,0),(138,925,1),(141,925,1),(138,926,2),(141,926,2),(138,927,3),(138,928,4),(139,929,0),(139,930,2),(139,930,9),(139,930,31),(139,931,4),(139,932,5),(139,933,7),(139,934,8),(139,935,10),(139,935,24),(139,936,11),(139,937,12),(139,938,13),(139,939,14),(139,939,33),(139,940,15),(139,940,26),(139,940,34),(139,941,17),(139,942,19),(139,943,20),(139,944,21),(139,945,22),(139,946,25),(139,947,27),(139,948,29),(139,949,32),(141,950,3),(145,951,0),(145,952,1),(145,953,2),(146,954,0),(146,955,1),(146,955,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,1,1,0),(2,1,2,0),(3,1,4,0),(4,1,16,0),(5,1,17,0),(6,1,8,0),(7,1,32,0),(8,1,64,0),(9,2,1,0),(10,2,2,0),(11,2,4,0),(12,2,16,0),(13,2,17,0),(14,2,8,0),(15,2,32,0),(16,2,64,0),(17,3,1,0),(18,3,2,0),(19,3,4,0),(20,3,16,0),(21,3,17,0),(22,3,8,0),(23,3,32,0),(24,3,64,0),(25,4,1,0),(26,4,2,0),(27,4,4,0),(28,4,16,0),(29,4,17,0),(30,4,8,0),(31,4,32,0),(32,4,64,0),(33,5,1,0),(34,5,2,0),(35,5,4,0),(36,5,16,0),(37,5,17,0),(38,5,8,0),(39,5,32,0),(40,5,64,0),(41,6,1,0),(42,6,2,0),(43,6,4,0),(44,6,16,0),(45,6,17,0),(46,6,8,0),(47,6,32,0),(48,6,64,0),(49,7,1,0),(50,7,2,0),(51,7,4,0),(52,7,16,0),(53,7,17,0),(54,7,8,0),(55,7,32,0),(56,7,64,0),(57,8,1,0),(58,8,2,0),(59,8,4,0),(60,8,16,0),(61,8,17,0),(62,8,8,0),(63,8,32,0),(64,8,64,0),(65,9,1,0),(66,9,2,0),(67,9,4,0),(68,9,16,0),(69,9,17,0),(70,9,8,0),(71,9,32,0),(72,9,64,0),(73,10,1,0),(74,10,2,0),(75,10,4,0),(76,10,16,0),(77,10,17,0),(78,10,8,0),(79,10,32,0),(80,10,64,0),(81,11,1,0),(82,11,2,0),(83,11,4,0),(84,11,16,0),(85,11,17,0),(86,11,8,0),(87,11,32,0),(88,11,64,0),(89,12,1,0),(90,12,2,0),(91,12,4,0),(92,12,16,0),(93,12,17,0),(94,12,8,0),(95,12,32,0),(96,12,64,0),(97,13,1,0),(98,13,2,0),(99,13,4,0),(100,13,16,0),(101,13,17,0),(102,13,8,0),(103,13,32,0),(104,13,64,0),(105,14,1,0),(106,14,2,0),(107,14,4,0),(108,14,16,0),(109,14,17,0),(110,14,8,0),(111,14,32,0),(112,14,64,0),(113,15,1,0),(114,15,2,0),(115,15,4,0),(116,15,16,0),(117,15,17,0),(118,15,8,0),(119,15,32,0),(120,15,64,0),(121,16,1,0),(122,16,2,0),(123,16,4,0),(124,16,16,0),(125,16,17,0),(126,16,8,0),(127,16,32,0),(128,16,64,0),(129,17,1,0),(130,17,2,0),(131,17,4,0),(132,17,16,0),(133,17,17,0),(134,17,8,0),(135,17,32,0),(136,17,64,0),(137,18,1,0),(138,18,2,0),(139,18,4,0),(140,18,16,0),(141,18,17,0),(142,18,8,0),(143,18,32,0),(144,18,64,0),(145,19,1,0),(146,19,2,0),(147,19,4,0),(148,19,16,0),(149,19,17,0),(150,19,8,0),(151,19,32,0),(152,19,64,0);
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
INSERT INTO `submissions` VALUES (1,1,1,'2022-01-19 08:39:55','2022-01-19 08:39:55','2022-01-19 08:39:55',5,'en_US',1,0,0),(2,1,2,'2022-01-19 08:40:27','2022-01-19 08:40:21','2022-01-19 08:40:27',5,'en_US',3,0,0),(3,1,3,'2022-01-19 08:41:04','2022-01-19 08:40:57','2022-01-19 08:41:04',5,'en_US',3,0,0),(4,1,4,'2022-01-19 08:41:35','2022-01-19 08:41:28','2022-01-19 08:41:35',5,'en_US',3,0,0),(5,1,5,'2022-01-19 08:42:08','2022-01-19 08:42:01','2022-01-19 08:42:08',5,'en_US',3,0,0),(6,1,6,'2022-01-19 08:42:39','2022-01-19 08:42:33','2022-01-19 08:42:39',5,'en_US',3,0,0),(7,1,7,'2022-01-19 08:43:16','2022-01-19 08:43:08','2022-01-19 08:43:16',5,'en_US',3,0,0),(8,1,8,'2022-01-19 08:43:46','2022-01-19 08:43:39','2022-01-19 08:43:46',5,'en_US',3,0,0),(9,1,9,'2022-01-19 08:44:18','2022-01-19 08:44:12','2022-01-19 08:44:18',5,'en_US',3,0,0),(10,1,10,'2022-01-19 08:44:50','2022-01-19 08:44:44','2022-01-19 08:44:50',5,'en_US',3,0,0),(11,1,11,'2022-01-19 08:45:26','2022-01-19 08:45:19','2022-01-19 08:45:26',5,'en_US',3,0,0),(12,1,12,'2022-01-19 08:46:00','2022-01-19 08:45:53','2022-01-19 08:46:00',5,'en_US',3,0,0),(13,1,13,'2022-01-19 08:46:34','2022-01-19 08:46:27','2022-01-19 08:46:34',5,'en_US',3,0,0),(14,1,14,'2022-01-19 08:47:08','2022-01-19 08:47:01','2022-01-19 08:47:08',5,'en_US',3,0,0),(15,1,15,'2022-01-19 08:47:40','2022-01-19 08:47:33','2022-01-19 08:47:40',5,'en_US',3,0,0),(16,1,16,'2022-01-19 08:48:13','2022-01-19 08:48:06','2022-01-19 08:48:13',5,'en_US',3,0,0),(17,1,17,'2022-01-19 08:48:47','2022-01-19 08:48:40','2022-01-19 08:48:47',5,'en_US',3,0,0),(18,1,18,'2022-01-19 08:49:19','2022-01-19 08:49:13','2022-01-19 08:49:19',5,'en_US',3,0,0),(19,1,19,'2022-01-19 08:49:51','2022-01-19 08:49:44','2022-01-19 08:49:51',5,'en_US',3,0,0);
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
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PSM','string'),(2,'en_US','name','Preprint Server manager','string'),(2,'fr_CA','abbrev','##default.groups.abbrev.manager##','string'),(2,'fr_CA','name','##default.groups.name.manager##','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(3,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(3,'en_US','abbrev','MOD','string'),(3,'en_US','name','Moderator','string'),(3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##','string'),(3,'fr_CA','name','##default.groups.name.sectionEditor##','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(4,'','nameLocaleKey','default.groups.name.author','string'),(4,'en_US','abbrev','AU','string'),(4,'en_US','name','Author','string'),(4,'fr_CA','abbrev','AU','string'),(4,'fr_CA','name','Auteur-e','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(5,'','nameLocaleKey','default.groups.name.reader','string'),(5,'en_US','abbrev','Read','string'),(5,'en_US','name','Reader','string'),(5,'fr_CA','abbrev','Lect','string'),(5,'fr_CA','name','Lecteur-trice','string');
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName','admin'),(1,'en_US','givenName','admin'),(2,'','orcid',''),(2,'en_US','affiliation','Universidad Nacional Autónoma de México'),(2,'en_US','biography',''),(2,'en_US','familyName','Vaca'),(2,'en_US','givenName','Ramiro'),(2,'en_US','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en_US','affiliation','University of Melbourne'),(3,'en_US','biography',''),(3,'en_US','familyName','Barnes'),(3,'en_US','givenName','Daniel'),(3,'en_US','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en_US','affiliation','University of Chicago'),(4,'en_US','biography',''),(4,'en_US','familyName','Buskins'),(4,'en_US','givenName','David'),(4,'en_US','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en_US','affiliation','University of Toronto'),(5,'en_US','biography',''),(5,'en_US','familyName','Berardo'),(5,'en_US','givenName','Stephanie'),(5,'en_US','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en_US','affiliation','Kyoto University'),(6,'en_US','biography',''),(6,'en_US','familyName','Inoue'),(6,'en_US','givenName','Minoti'),(6,'en_US','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','signature',''),(7,'en_US','affiliation','University of Bologna'),(7,'en_US','familyName','Corino'),(7,'en_US','givenName','Carlo'),(8,'en_US','affiliation','University of Windsor'),(8,'en_US','familyName','Kwantes'),(8,'en_US','givenName','Catherine'),(9,'en_US','affiliation','University of Alberta'),(9,'en_US','familyName','Montgomerie'),(9,'en_US','givenName','Craig'),(10,'en_US','affiliation','Alexandria University'),(10,'en_US','familyName','Diouf'),(10,'en_US','givenName','Diaga'),(11,'en_US','affiliation','University of Toronto'),(11,'en_US','familyName','Phillips'),(11,'en_US','givenName','Dana'),(12,'en_US','affiliation','University College Cork'),(12,'en_US','familyName','Sokoloff'),(12,'en_US','givenName','Domatilia'),(13,'en_US','affiliation','Indiana University'),(13,'en_US','familyName','Ostrom'),(13,'en_US','givenName','Elinor'),(14,'en_US','affiliation','University of Rome'),(14,'en_US','familyName','Paglieri'),(14,'en_US','givenName','Fabio'),(15,'en_US','affiliation','University of Cape Town'),(15,'en_US','familyName','Mwandenga'),(15,'en_US','givenName','John'),(16,'en_US','affiliation','Aalborg University'),(16,'en_US','familyName','Novak'),(16,'en_US','givenName','John'),(17,'en_US','affiliation','Stanford University'),(17,'en_US','familyName','Al-Khafaji'),(17,'en_US','givenName','Karim'),(18,'en_US','affiliation','Australian National University'),(18,'en_US','familyName','Christopher'),(18,'en_US','givenName','Leo'),(19,'en_US','affiliation','University of Cape Town'),(19,'en_US','familyName','Kumiega'),(19,'en_US','givenName','Lise'),(20,'en_US','affiliation','University of Wolverhampton'),(20,'en_US','familyName','Daniel'),(20,'en_US','givenName','Patricia'),(21,'en_US','affiliation','University of Nairobi'),(21,'en_US','familyName','Baiyewu'),(21,'en_US','givenName','Rana'),(22,'en_US','affiliation','Barcelona University'),(22,'en_US','familyName','Rossi'),(22,'en_US','givenName','Rosanna'),(23,'en_US','affiliation','University of Tehran'),(23,'en_US','familyName','Karbasizaed'),(23,'en_US','givenName','Vajiheh'),(24,'en_US','affiliation','University of Windsor'),(24,'en_US','familyName','Williamson'),(24,'en_US','givenName','Valerie'),(25,'en_US','affiliation','CUNY'),(25,'en_US','familyName','Woods'),(25,'en_US','givenName','Zita');
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$ZoTFGNhq/iySn7vDCgGqauiKArGwYPtnIuLTPnwtZG2vLhp/OfEPu','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-01-19 08:37:18',NULL,'2022-01-19 08:39:06',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$6lV7t7hdG6.7Hv3UMdUms.2rydhXtfkRBNEXNm4fkS8TpBgqAVPca','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-01-19 08:38:13',NULL,'2022-01-19 08:38:55',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$x2YhtLXK7HEoeEqk8qRUO.FmP3FiMsGcNkLRGx0egkhf2IbPJaEMW','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-01-19 08:38:20',NULL,'2022-01-19 08:49:45',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$wHrHx0HPGN8UJIPAN57SHOTiIDpkwEKpH3sb77gFENA59u5XzfNR6','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-01-19 08:38:29',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$Pw7cppmZOUL0K0YBVVwsKeXfaPaw7uqoM5COnhgv3u7NRmTgyxBrK','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-01-19 08:38:39',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$AyhvbDD6dNApw1gfdm07yeH9RtYQmCW7Ub1XjvoMEqh3UaDQ1LdFy','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-01-19 08:38:48',NULL,NULL,0,0,NULL,0,NULL,1),(7,'ccorino','$2y$10$nXWd6oqpaSqe58QEJB3vNOqI2H999EyP0nHDoCIY6dOpVyr2Zw5iy','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-01-19 08:39:34',NULL,'2022-01-19 08:39:35',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$FvzIQ6HBT3PferyJoxnuM.olbam4GyPLs3qXYlq7uJhVN8mfBZmMq','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-01-19 08:40:00',NULL,'2022-01-19 08:40:00',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$R93uNd.xHI8/f5YrJLCkueVs/Ssqe9Xj9zKDR.PvjWgbHaGclnhz2','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-01-19 08:40:32',NULL,'2022-01-19 08:40:32',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$VIiOOCkM9KEtGn2h.aLZ3./GYYl8KB9nrSjElpI.sUNWfwnJmjeU6','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG',NULL,NULL,NULL,'2022-01-19 08:41:09',NULL,'2022-01-19 08:41:09',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$PpAcS3Kki8feppJrm4GxBO3iJF6gPkQ8nQrYtVV4wnYeZDrwzktIG','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-01-19 08:41:40',NULL,'2022-01-19 08:41:40',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$mM9kFKq55imXux23zLkehuLn6a6nQtFSseeITb4ecWdrSmvTxjvPu','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE',NULL,NULL,NULL,'2022-01-19 08:42:13',NULL,'2022-01-19 08:42:14',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$BIxq0tcRGLwHuXUALW59GOEUKcvAyEGF16DXxtgBn1bODEDGHq6vy','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-01-19 08:42:44',NULL,'2022-01-19 08:42:44',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$0VGR4nt3pa2LeYAwdghpP.DgyLtNtlhcE327pxzJZkcNxtrQ.96gG','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2022-01-19 08:43:21',NULL,'2022-01-19 08:43:21',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$KukxtjpJTFe1loUBkFtvC.Bpk.I5Wr8xerNaOyNcVC29ffGYoUyu2','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-01-19 08:43:51',NULL,'2022-01-19 08:43:51',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$TT8uP0VDXylLLMnSKpsNB.IhYfalvEIveV5M9Q7WuK29phYmZOM5q','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK',NULL,NULL,NULL,'2022-01-19 08:44:24',NULL,'2022-01-19 08:44:24',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$V5vLLYWvPTp27w7I9iYyxOxCV3CP7HzMeJAvjDzvQJ7vwYSQUKJiO','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-01-19 08:44:56',NULL,'2022-01-19 08:44:56',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$VMU9aD3D0dSxCi8Rr.Vuaupv4//y5Rvq7rrilUQneKcILEAnb04Pu','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU',NULL,NULL,NULL,'2022-01-19 08:45:32',NULL,'2022-01-19 08:45:32',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$lFEEvmZYwYx97xHbmVQi1.NBO.mh18rqqptEt7mZ5HP3WBOlL6dcy','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2022-01-19 08:46:06',NULL,'2022-01-19 08:46:06',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$.QHIipUBCZ88dS/cy5bazePsRjIUF9mWO168UM8V480/ulvEVSAX.','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB',NULL,NULL,NULL,'2022-01-19 08:46:40',NULL,'2022-01-19 08:46:40',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$74pp4HLz3RYWlus9WD7bK.kktsWwRK0mMXIHGoEFIxyVQNdBlNzZK','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE',NULL,NULL,NULL,'2022-01-19 08:47:14',NULL,'2022-01-19 08:47:14',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$bVKS.fWFXMzc/xMtFIG60OWrsLvv3o34lykuNKaam0372Gu5UJp.K','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES',NULL,NULL,NULL,'2022-01-19 08:47:46',NULL,'2022-01-19 08:47:46',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$etddQhz5FuEWP1azBvor0utabtOeNVqnSyGQRe3Mg29.9OfI9uD7K','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR',NULL,NULL,NULL,'2022-01-19 08:48:19',NULL,'2022-01-19 08:48:19',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$3vs.K37q7t/RiKLYxGHPHetMtpT7K1YcINv3h8z8j9vH9mGNLoBEK','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-01-19 08:48:53',NULL,'2022-01-19 08:48:53',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$qfyuALSrAN1CIRm/7FhwmO0dRdXgbAUtl2UDEaXOlKdnzpAAKvpHK','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-01-19 08:49:25',NULL,'2022-01-19 08:49:25',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-01-19 08:37:18',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2022-01-19 08:37:18',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,1,3,0,'2022-01-19 08:37:18',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2022-01-19 08:37:18',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.generic','crossrefDeposit','CrossrefDepositPlugin',1,0),(1,1,0,0,'2022-01-19 08:37:18',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,2,0,0,'2022-01-19 08:37:18',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.generic','usageEvent','',0,0),(1,0,1,0,'2022-01-19 08:37:18',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.generic','tinymce','\\APP\\plugins\\generic\\tinymce\\TinyMCEPlugin',1,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,1,0,0,'2022-01-19 08:37:18',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2022-01-19 08:37:18',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2022-01-19 08:37:15',1,'core','ops','',0,1),(2,2,0,0,'2022-01-19 08:37:33',1,'plugins.importexport','crossref','',0,0);
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

-- Dump completed on 2022-01-19  8:49:52
