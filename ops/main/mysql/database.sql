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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL,NULL),(7,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(8,'SUBMISSION_ACK',1,1,NULL,65536,5),(9,'POSTED_ACK',1,1,NULL,65536,5),(10,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,5),(11,'EDITOR_ASSIGN',1,1,16,16,5),(12,'EDITOR_DECISION_ACCEPT',0,1,16,65536,5),(13,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,5),(14,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(15,'ANNOUNCEMENT',0,1,16,1048576,NULL),(16,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(17,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Moderator Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the moderator declines his submission initially.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}<hr />{$unsubscribeLink}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('POSTED_ACK','en_US','Preprint Posted Acknowledgement','{$authorName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$contextName}.<br />\n<br />\nPreprint URL: {$publicationUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.'),('PUBLISH_NOTIFY','en_US','New Preprint Posted','Readers:<br />\n<br />\n{$contextName} has just posted its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$contextName} vient d\'être publiée à l\'adresse suivante : {$contextUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$editorialContactSignature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$authorName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$contextName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$contextName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName},<br />\n<br />\nVous avez créé un compte avec {$contextName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.');
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
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2021-11-22 20:40:57',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2021-11-22 20:41:07',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2021-11-22 20:41:07',1342177288,'submission.event.fileRevised',0),(4,515,1,7,'2021-11-22 20:41:10',1342177296,'submission.event.fileEdited',0),(5,1048585,1,7,'2021-11-22 20:41:10',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2021-11-22 20:41:14',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,7,'2021-11-22 20:41:15',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2021-11-22 20:41:24',268435458,'submission.event.general.metadataUpdated',0),(9,515,2,8,'2021-11-22 20:41:34',1342177281,'submission.event.fileUploaded',0),(10,1048585,2,8,'2021-11-22 20:41:34',1342177288,'submission.event.fileRevised',0),(11,515,2,8,'2021-11-22 20:41:37',1342177296,'submission.event.fileEdited',0),(12,1048585,2,8,'2021-11-22 20:41:37',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2021-11-22 20:41:42',268435458,'submission.event.general.metadataUpdated',0),(14,1048585,2,8,'2021-11-22 20:41:43',268435457,'submission.event.submissionSubmitted',0),(15,1048585,2,3,'2021-11-22 20:41:51',268435462,'publication.event.published',0),(16,1048585,3,9,'2021-11-22 20:42:00',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,9,'2021-11-22 20:42:10',1342177281,'submission.event.fileUploaded',0),(18,1048585,3,9,'2021-11-22 20:42:10',1342177288,'submission.event.fileRevised',0),(19,515,3,9,'2021-11-22 20:42:13',1342177296,'submission.event.fileEdited',0),(20,1048585,3,9,'2021-11-22 20:42:13',1342177296,'submission.event.fileEdited',0),(21,1048585,3,9,'2021-11-22 20:42:22',268435458,'submission.event.general.metadataUpdated',0),(22,1048585,3,9,'2021-11-22 20:42:24',268435457,'submission.event.submissionSubmitted',0),(23,1048585,3,3,'2021-11-22 20:42:32',268435462,'publication.event.published',0),(24,1048585,4,10,'2021-11-22 20:42:42',268435458,'submission.event.general.metadataUpdated',0),(25,515,4,10,'2021-11-22 20:42:52',1342177281,'submission.event.fileUploaded',0),(26,1048585,4,10,'2021-11-22 20:42:52',1342177288,'submission.event.fileRevised',0),(27,515,4,10,'2021-11-22 20:42:55',1342177296,'submission.event.fileEdited',0),(28,1048585,4,10,'2021-11-22 20:42:55',1342177296,'submission.event.fileEdited',0),(29,1048585,4,10,'2021-11-22 20:42:58',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,4,10,'2021-11-22 20:43:00',268435457,'submission.event.submissionSubmitted',0),(31,1048585,4,3,'2021-11-22 20:43:09',268435462,'publication.event.published',0),(32,1048585,5,11,'2021-11-22 20:43:19',268435458,'submission.event.general.metadataUpdated',0),(33,515,5,11,'2021-11-22 20:43:29',1342177281,'submission.event.fileUploaded',0),(34,1048585,5,11,'2021-11-22 20:43:29',1342177288,'submission.event.fileRevised',0),(35,515,5,11,'2021-11-22 20:43:31',1342177296,'submission.event.fileEdited',0),(36,1048585,5,11,'2021-11-22 20:43:31',1342177296,'submission.event.fileEdited',0),(37,1048585,5,11,'2021-11-22 20:43:36',268435458,'submission.event.general.metadataUpdated',0),(38,1048585,5,11,'2021-11-22 20:43:38',268435457,'submission.event.submissionSubmitted',0),(39,1048585,5,3,'2021-11-22 20:43:46',268435462,'publication.event.published',0),(40,1048585,6,12,'2021-11-22 20:43:56',268435458,'submission.event.general.metadataUpdated',0),(41,515,6,12,'2021-11-22 20:44:06',1342177281,'submission.event.fileUploaded',0),(42,1048585,6,12,'2021-11-22 20:44:06',1342177288,'submission.event.fileRevised',0),(43,515,6,12,'2021-11-22 20:44:09',1342177296,'submission.event.fileEdited',0),(44,1048585,6,12,'2021-11-22 20:44:09',1342177296,'submission.event.fileEdited',0),(45,1048585,6,12,'2021-11-22 20:44:12',268435458,'submission.event.general.metadataUpdated',0),(46,1048585,6,12,'2021-11-22 20:44:14',268435457,'submission.event.submissionSubmitted',0),(47,1048585,6,3,'2021-11-22 20:44:22',268435462,'publication.event.published',0),(48,1048585,7,13,'2021-11-22 20:44:31',268435458,'submission.event.general.metadataUpdated',0),(49,515,7,13,'2021-11-22 20:44:42',1342177281,'submission.event.fileUploaded',0),(50,1048585,7,13,'2021-11-22 20:44:42',1342177288,'submission.event.fileRevised',0),(51,515,7,13,'2021-11-22 20:44:44',1342177296,'submission.event.fileEdited',0),(52,1048585,7,13,'2021-11-22 20:44:44',1342177296,'submission.event.fileEdited',0),(53,1048585,7,13,'2021-11-22 20:44:53',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,7,13,'2021-11-22 20:44:55',268435457,'submission.event.submissionSubmitted',0),(55,1048585,7,3,'2021-11-22 20:45:04',268435462,'publication.event.published',0),(56,1048585,8,14,'2021-11-22 20:45:15',268435458,'submission.event.general.metadataUpdated',0),(57,515,8,14,'2021-11-22 20:45:26',1342177281,'submission.event.fileUploaded',0),(58,1048585,8,14,'2021-11-22 20:45:26',1342177288,'submission.event.fileRevised',0),(59,515,8,14,'2021-11-22 20:45:28',1342177296,'submission.event.fileEdited',0),(60,1048585,8,14,'2021-11-22 20:45:28',1342177296,'submission.event.fileEdited',0),(61,1048585,8,14,'2021-11-22 20:45:32',268435458,'submission.event.general.metadataUpdated',0),(62,1048585,8,14,'2021-11-22 20:45:33',268435457,'submission.event.submissionSubmitted',0),(63,1048585,8,3,'2021-11-22 20:45:42',268435462,'publication.event.published',0),(64,1048585,9,15,'2021-11-22 20:45:52',268435458,'submission.event.general.metadataUpdated',0),(65,515,9,15,'2021-11-22 20:46:02',1342177281,'submission.event.fileUploaded',0),(66,1048585,9,15,'2021-11-22 20:46:02',1342177288,'submission.event.fileRevised',0),(67,515,9,15,'2021-11-22 20:46:05',1342177296,'submission.event.fileEdited',0),(68,1048585,9,15,'2021-11-22 20:46:05',1342177296,'submission.event.fileEdited',0),(69,1048585,9,15,'2021-11-22 20:46:09',268435458,'submission.event.general.metadataUpdated',0),(70,1048585,9,15,'2021-11-22 20:46:11',268435457,'submission.event.submissionSubmitted',0),(71,1048585,9,3,'2021-11-22 20:46:19',268435462,'publication.event.published',0),(72,1048585,10,16,'2021-11-22 20:46:29',268435458,'submission.event.general.metadataUpdated',0),(73,515,10,16,'2021-11-22 20:46:39',1342177281,'submission.event.fileUploaded',0),(74,1048585,10,16,'2021-11-22 20:46:39',1342177288,'submission.event.fileRevised',0),(75,515,10,16,'2021-11-22 20:46:42',1342177296,'submission.event.fileEdited',0),(76,1048585,10,16,'2021-11-22 20:46:42',1342177296,'submission.event.fileEdited',0),(77,1048585,10,16,'2021-11-22 20:46:46',268435458,'submission.event.general.metadataUpdated',0),(78,1048585,10,16,'2021-11-22 20:46:47',268435457,'submission.event.submissionSubmitted',0),(79,1048585,10,3,'2021-11-22 20:46:56',268435462,'publication.event.published',0),(80,1048585,11,17,'2021-11-22 20:47:06',268435458,'submission.event.general.metadataUpdated',0),(81,515,11,17,'2021-11-22 20:47:17',1342177281,'submission.event.fileUploaded',0),(82,1048585,11,17,'2021-11-22 20:47:17',1342177288,'submission.event.fileRevised',0),(83,515,11,17,'2021-11-22 20:47:19',1342177296,'submission.event.fileEdited',0),(84,1048585,11,17,'2021-11-22 20:47:19',1342177296,'submission.event.fileEdited',0),(85,1048585,11,17,'2021-11-22 20:47:26',268435458,'submission.event.general.metadataUpdated',0),(86,1048585,11,17,'2021-11-22 20:47:28',268435457,'submission.event.submissionSubmitted',0),(87,1048585,11,3,'2021-11-22 20:47:37',268435462,'publication.event.published',0),(88,1048585,12,18,'2021-11-22 20:47:49',268435458,'submission.event.general.metadataUpdated',0),(89,515,12,18,'2021-11-22 20:47:59',1342177281,'submission.event.fileUploaded',0),(90,1048585,12,18,'2021-11-22 20:47:59',1342177288,'submission.event.fileRevised',0),(91,515,12,18,'2021-11-22 20:48:01',1342177296,'submission.event.fileEdited',0),(92,1048585,12,18,'2021-11-22 20:48:01',1342177296,'submission.event.fileEdited',0),(93,1048585,12,18,'2021-11-22 20:48:06',268435458,'submission.event.general.metadataUpdated',0),(94,1048585,12,18,'2021-11-22 20:48:07',268435457,'submission.event.submissionSubmitted',0),(95,1048585,12,3,'2021-11-22 20:48:16',268435462,'publication.event.published',0),(96,1048585,13,19,'2021-11-22 20:48:27',268435458,'submission.event.general.metadataUpdated',0),(97,515,13,19,'2021-11-22 20:48:37',1342177281,'submission.event.fileUploaded',0),(98,1048585,13,19,'2021-11-22 20:48:37',1342177288,'submission.event.fileRevised',0),(99,515,13,19,'2021-11-22 20:48:39',1342177296,'submission.event.fileEdited',0),(100,1048585,13,19,'2021-11-22 20:48:39',1342177296,'submission.event.fileEdited',0),(101,1048585,13,19,'2021-11-22 20:48:46',268435458,'submission.event.general.metadataUpdated',0),(102,1048585,13,19,'2021-11-22 20:48:47',268435457,'submission.event.submissionSubmitted',0),(103,1048585,13,3,'2021-11-22 20:48:56',268435462,'publication.event.published',0),(104,1048585,14,20,'2021-11-22 20:49:08',268435458,'submission.event.general.metadataUpdated',0),(105,515,14,20,'2021-11-22 20:49:18',1342177281,'submission.event.fileUploaded',0),(106,1048585,14,20,'2021-11-22 20:49:18',1342177288,'submission.event.fileRevised',0),(107,515,14,20,'2021-11-22 20:49:20',1342177296,'submission.event.fileEdited',0),(108,1048585,14,20,'2021-11-22 20:49:20',1342177296,'submission.event.fileEdited',0),(109,1048585,14,20,'2021-11-22 20:49:25',268435458,'submission.event.general.metadataUpdated',0),(110,1048585,14,20,'2021-11-22 20:49:26',268435457,'submission.event.submissionSubmitted',0),(111,1048585,14,3,'2021-11-22 20:49:35',268435462,'publication.event.published',0),(112,1048585,15,21,'2021-11-22 20:49:47',268435458,'submission.event.general.metadataUpdated',0),(113,515,15,21,'2021-11-22 20:49:57',1342177281,'submission.event.fileUploaded',0),(114,1048585,15,21,'2021-11-22 20:49:57',1342177288,'submission.event.fileRevised',0),(115,515,15,21,'2021-11-22 20:49:59',1342177296,'submission.event.fileEdited',0),(116,1048585,15,21,'2021-11-22 20:49:59',1342177296,'submission.event.fileEdited',0),(117,1048585,15,21,'2021-11-22 20:50:03',268435458,'submission.event.general.metadataUpdated',0),(118,1048585,15,21,'2021-11-22 20:50:04',268435457,'submission.event.submissionSubmitted',0),(119,1048585,15,3,'2021-11-22 20:50:13',268435462,'publication.event.published',0),(120,1048585,16,22,'2021-11-22 20:50:25',268435458,'submission.event.general.metadataUpdated',0),(121,515,16,22,'2021-11-22 20:50:35',1342177281,'submission.event.fileUploaded',0),(122,1048585,16,22,'2021-11-22 20:50:35',1342177288,'submission.event.fileRevised',0),(123,515,16,22,'2021-11-22 20:50:37',1342177296,'submission.event.fileEdited',0),(124,1048585,16,22,'2021-11-22 20:50:37',1342177296,'submission.event.fileEdited',0),(125,1048585,16,22,'2021-11-22 20:50:44',268435458,'submission.event.general.metadataUpdated',0),(126,1048585,16,22,'2021-11-22 20:50:46',268435457,'submission.event.submissionSubmitted',0),(127,1048585,16,3,'2021-11-22 20:50:56',268435462,'publication.event.published',0),(128,1048585,17,23,'2021-11-22 20:51:07',268435458,'submission.event.general.metadataUpdated',0),(129,515,17,23,'2021-11-22 20:51:17',1342177281,'submission.event.fileUploaded',0),(130,1048585,17,23,'2021-11-22 20:51:17',1342177288,'submission.event.fileRevised',0),(131,515,17,23,'2021-11-22 20:51:19',1342177296,'submission.event.fileEdited',0),(132,1048585,17,23,'2021-11-22 20:51:19',1342177296,'submission.event.fileEdited',0),(133,1048585,17,23,'2021-11-22 20:51:25',268435458,'submission.event.general.metadataUpdated',0),(134,1048585,17,23,'2021-11-22 20:51:26',268435457,'submission.event.submissionSubmitted',0),(135,1048585,17,3,'2021-11-22 20:51:35',268435462,'publication.event.published',0),(136,1048585,18,24,'2021-11-22 20:51:46',268435458,'submission.event.general.metadataUpdated',0),(137,515,18,24,'2021-11-22 20:51:56',1342177281,'submission.event.fileUploaded',0),(138,1048585,18,24,'2021-11-22 20:51:56',1342177288,'submission.event.fileRevised',0),(139,515,18,24,'2021-11-22 20:51:59',1342177296,'submission.event.fileEdited',0),(140,1048585,18,24,'2021-11-22 20:51:59',1342177296,'submission.event.fileEdited',0),(141,1048585,18,24,'2021-11-22 20:52:03',268435458,'submission.event.general.metadataUpdated',0),(142,1048585,18,24,'2021-11-22 20:52:04',268435457,'submission.event.submissionSubmitted',0),(143,1048585,18,3,'2021-11-22 20:52:13',268435462,'publication.event.published',0),(144,1048585,19,25,'2021-11-22 20:52:23',268435458,'submission.event.general.metadataUpdated',0),(145,515,19,25,'2021-11-22 20:52:34',1342177281,'submission.event.fileUploaded',0),(146,1048585,19,25,'2021-11-22 20:52:34',1342177288,'submission.event.fileRevised',0),(147,515,19,25,'2021-11-22 20:52:36',1342177296,'submission.event.fileEdited',0),(148,1048585,19,25,'2021-11-22 20:52:36',1342177296,'submission.event.fileEdited',0),(149,1048585,19,25,'2021-11-22 20:52:39',268435458,'submission.event.general.metadataUpdated',0),(150,1048585,19,25,'2021-11-22 20:52:41',268435457,'submission.event.submissionSubmitted',0),(151,1048585,19,3,'2021-11-22 20:52:50',268435462,'publication.event.published',0);
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
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/619c0063a53fd.pdf','application/pdf'),(2,'contexts/1/submissions/2/619c007ea45ea.pdf','application/pdf'),(3,'contexts/1/submissions/3/619c00a2e968e.pdf','application/pdf'),(4,'contexts/1/submissions/4/619c00cca5689.pdf','application/pdf'),(5,'contexts/1/submissions/5/619c00f17762b.pdf','application/pdf'),(6,'contexts/1/submissions/6/619c0116e2764.pdf','application/pdf'),(7,'contexts/1/submissions/7/619c013a22b4c.pdf','application/pdf'),(8,'contexts/1/submissions/8/619c01661fdd0.pdf','application/pdf'),(9,'contexts/1/submissions/9/619c018ac7320.pdf','application/pdf'),(10,'contexts/1/submissions/10/619c01afeb963.pdf','application/pdf'),(11,'contexts/1/submissions/11/619c01d50aa70.pdf','application/pdf'),(12,'contexts/1/submissions/12/619c01ff74e5d.pdf','application/pdf'),(13,'contexts/1/submissions/13/619c02256f53e.pdf','application/pdf'),(14,'contexts/1/submissions/14/619c024e25d09.pdf','application/pdf'),(15,'contexts/1/submissions/15/619c02752fe92.pdf','application/pdf'),(16,'contexts/1/submissions/16/619c029b74880.pdf','application/pdf'),(17,'contexts/1/submissions/17/619c02c587e82.pdf','application/pdf'),(18,'contexts/1/submissions/18/619c02ec9ee21.pdf','application/pdf'),(19,'contexts/1/submissions/19/619c031203040.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(PREPRINT)'),(2,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(6,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile[]'),(8,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.preprint.PreprintGalley','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.preprint.PreprintGalley[]'),(10,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(11,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(12,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2021-11-22 20:41:15',NULL,1048585,1),(4,1,0,3,16777223,'2021-11-22 20:41:15',NULL,1048585,1),(5,1,4,2,16777217,'2021-11-22 20:41:15',NULL,1048585,1),(7,1,5,2,16777217,'2021-11-22 20:41:15',NULL,1048585,1),(9,1,0,2,16777243,'2021-11-22 20:41:15',NULL,1048585,1),(10,1,0,2,16777245,'2021-11-22 20:41:15',NULL,1048585,1),(12,1,0,3,16777222,'2021-11-22 20:41:43',NULL,1048585,2),(13,1,0,3,16777223,'2021-11-22 20:41:43',NULL,1048585,2),(14,1,4,2,16777217,'2021-11-22 20:41:43',NULL,1048585,2),(16,1,5,2,16777217,'2021-11-22 20:41:43',NULL,1048585,2),(18,1,0,2,16777243,'2021-11-22 20:41:43',NULL,1048585,2),(19,1,0,2,16777245,'2021-11-22 20:41:43',NULL,1048585,2),(23,1,0,3,16777222,'2021-11-22 20:42:23',NULL,1048585,3),(24,1,0,3,16777223,'2021-11-22 20:42:23',NULL,1048585,3),(25,1,4,2,16777217,'2021-11-22 20:42:23',NULL,1048585,3),(27,1,5,2,16777217,'2021-11-22 20:42:23',NULL,1048585,3),(29,1,0,2,16777243,'2021-11-22 20:42:23',NULL,1048585,3),(30,1,0,2,16777245,'2021-11-22 20:42:23',NULL,1048585,3),(34,1,0,3,16777222,'2021-11-22 20:42:59',NULL,1048585,4),(35,1,0,3,16777223,'2021-11-22 20:42:59',NULL,1048585,4),(36,1,4,2,16777217,'2021-11-22 20:42:59',NULL,1048585,4),(38,1,5,2,16777217,'2021-11-22 20:42:59',NULL,1048585,4),(40,1,0,2,16777243,'2021-11-22 20:43:00',NULL,1048585,4),(41,1,0,2,16777245,'2021-11-22 20:43:00',NULL,1048585,4),(44,1,0,3,16777222,'2021-11-22 20:43:37',NULL,1048585,5),(45,1,0,3,16777223,'2021-11-22 20:43:37',NULL,1048585,5),(46,1,4,2,16777217,'2021-11-22 20:43:37',NULL,1048585,5),(48,1,5,2,16777217,'2021-11-22 20:43:37',NULL,1048585,5),(50,1,0,2,16777243,'2021-11-22 20:43:38',NULL,1048585,5),(51,1,0,2,16777245,'2021-11-22 20:43:38',NULL,1048585,5),(54,1,0,3,16777222,'2021-11-22 20:44:13',NULL,1048585,6),(55,1,0,3,16777223,'2021-11-22 20:44:13',NULL,1048585,6),(56,1,4,2,16777217,'2021-11-22 20:44:13',NULL,1048585,6),(58,1,5,2,16777217,'2021-11-22 20:44:13',NULL,1048585,6),(60,1,0,2,16777243,'2021-11-22 20:44:13',NULL,1048585,6),(61,1,0,2,16777245,'2021-11-22 20:44:13',NULL,1048585,6),(65,1,0,3,16777222,'2021-11-22 20:44:54',NULL,1048585,7),(66,1,0,3,16777223,'2021-11-22 20:44:54',NULL,1048585,7),(67,1,4,2,16777217,'2021-11-22 20:44:54',NULL,1048585,7),(69,1,5,2,16777217,'2021-11-22 20:44:54',NULL,1048585,7),(71,1,0,2,16777243,'2021-11-22 20:44:55',NULL,1048585,7),(72,1,0,2,16777245,'2021-11-22 20:44:55',NULL,1048585,7),(76,1,0,3,16777222,'2021-11-22 20:45:33',NULL,1048585,8),(77,1,0,3,16777223,'2021-11-22 20:45:33',NULL,1048585,8),(78,1,4,2,16777217,'2021-11-22 20:45:33',NULL,1048585,8),(80,1,5,2,16777217,'2021-11-22 20:45:33',NULL,1048585,8),(82,1,0,2,16777243,'2021-11-22 20:45:33',NULL,1048585,8),(83,1,0,2,16777245,'2021-11-22 20:45:33',NULL,1048585,8),(86,1,0,3,16777222,'2021-11-22 20:46:10',NULL,1048585,9),(87,1,0,3,16777223,'2021-11-22 20:46:10',NULL,1048585,9),(88,1,4,2,16777217,'2021-11-22 20:46:10',NULL,1048585,9),(90,1,5,2,16777217,'2021-11-22 20:46:10',NULL,1048585,9),(92,1,0,2,16777243,'2021-11-22 20:46:10',NULL,1048585,9),(93,1,0,2,16777245,'2021-11-22 20:46:10',NULL,1048585,9),(96,1,0,3,16777222,'2021-11-22 20:46:47',NULL,1048585,10),(97,1,0,3,16777223,'2021-11-22 20:46:47',NULL,1048585,10),(98,1,4,2,16777217,'2021-11-22 20:46:47',NULL,1048585,10),(100,1,5,2,16777217,'2021-11-22 20:46:47',NULL,1048585,10),(102,1,0,2,16777243,'2021-11-22 20:46:47',NULL,1048585,10),(103,1,0,2,16777245,'2021-11-22 20:46:47',NULL,1048585,10),(107,1,0,3,16777222,'2021-11-22 20:47:27',NULL,1048585,11),(108,1,0,3,16777223,'2021-11-22 20:47:27',NULL,1048585,11),(109,1,4,2,16777217,'2021-11-22 20:47:27',NULL,1048585,11),(111,1,5,2,16777217,'2021-11-22 20:47:28',NULL,1048585,11),(113,1,0,2,16777243,'2021-11-22 20:47:28',NULL,1048585,11),(114,1,0,2,16777245,'2021-11-22 20:47:28',NULL,1048585,11),(118,1,0,3,16777222,'2021-11-22 20:48:07',NULL,1048585,12),(119,1,0,3,16777223,'2021-11-22 20:48:07',NULL,1048585,12),(120,1,4,2,16777217,'2021-11-22 20:48:07',NULL,1048585,12),(122,1,5,2,16777217,'2021-11-22 20:48:07',NULL,1048585,12),(124,1,0,2,16777243,'2021-11-22 20:48:07',NULL,1048585,12),(125,1,0,2,16777245,'2021-11-22 20:48:07',NULL,1048585,12),(128,1,0,3,16777222,'2021-11-22 20:48:47',NULL,1048585,13),(129,1,0,3,16777223,'2021-11-22 20:48:47',NULL,1048585,13),(130,1,4,2,16777217,'2021-11-22 20:48:47',NULL,1048585,13),(132,1,5,2,16777217,'2021-11-22 20:48:47',NULL,1048585,13),(134,1,0,2,16777243,'2021-11-22 20:48:47',NULL,1048585,13),(135,1,0,2,16777245,'2021-11-22 20:48:47',NULL,1048585,13),(138,1,0,3,16777222,'2021-11-22 20:49:26',NULL,1048585,14),(139,1,0,3,16777223,'2021-11-22 20:49:26',NULL,1048585,14),(140,1,4,2,16777217,'2021-11-22 20:49:26',NULL,1048585,14),(142,1,5,2,16777217,'2021-11-22 20:49:26',NULL,1048585,14),(144,1,0,2,16777243,'2021-11-22 20:49:26',NULL,1048585,14),(145,1,0,2,16777245,'2021-11-22 20:49:26',NULL,1048585,14),(148,1,0,3,16777222,'2021-11-22 20:50:04',NULL,1048585,15),(149,1,0,3,16777223,'2021-11-22 20:50:04',NULL,1048585,15),(150,1,4,2,16777217,'2021-11-22 20:50:04',NULL,1048585,15),(152,1,5,2,16777217,'2021-11-22 20:50:04',NULL,1048585,15),(154,1,0,2,16777243,'2021-11-22 20:50:04',NULL,1048585,15),(155,1,0,2,16777245,'2021-11-22 20:50:04',NULL,1048585,15),(158,1,0,3,16777222,'2021-11-22 20:50:45',NULL,1048585,16),(159,1,0,3,16777223,'2021-11-22 20:50:45',NULL,1048585,16),(160,1,4,2,16777217,'2021-11-22 20:50:45',NULL,1048585,16),(162,1,5,2,16777217,'2021-11-22 20:50:45',NULL,1048585,16),(164,1,0,2,16777243,'2021-11-22 20:50:45',NULL,1048585,16),(165,1,0,2,16777245,'2021-11-22 20:50:45',NULL,1048585,16),(168,1,0,3,16777222,'2021-11-22 20:51:26',NULL,1048585,17),(169,1,0,3,16777223,'2021-11-22 20:51:26',NULL,1048585,17),(170,1,4,2,16777217,'2021-11-22 20:51:26',NULL,1048585,17),(172,1,5,2,16777217,'2021-11-22 20:51:26',NULL,1048585,17),(174,1,0,2,16777243,'2021-11-22 20:51:26',NULL,1048585,17),(175,1,0,2,16777245,'2021-11-22 20:51:26',NULL,1048585,17),(178,1,0,3,16777222,'2021-11-22 20:52:04',NULL,1048585,18),(179,1,0,3,16777223,'2021-11-22 20:52:04',NULL,1048585,18),(180,1,4,2,16777217,'2021-11-22 20:52:04',NULL,1048585,18),(182,1,5,2,16777217,'2021-11-22 20:52:04',NULL,1048585,18),(184,1,0,2,16777243,'2021-11-22 20:52:04',NULL,1048585,18),(185,1,0,2,16777245,'2021-11-22 20:52:04',NULL,1048585,18),(188,1,0,3,16777222,'2021-11-22 20:52:40',NULL,1048585,19),(189,1,0,3,16777223,'2021-11-22 20:52:40',NULL,1048585,19),(190,1,4,2,16777217,'2021-11-22 20:52:40',NULL,1048585,19),(192,1,5,2,16777217,'2021-11-22 20:52:41',NULL,1048585,19),(194,1,0,2,16777243,'2021-11-22 20:52:41',NULL,1048585,19),(195,1,0,2,16777245,'2021-11-22 20:52:41',NULL,1048585,19),(197,0,3,1,3,'2021-11-22 20:52:50',NULL,0,0);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','619bffc6d3df2','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object');
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'','licenseUrl',''),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2021'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'fr_CA','abstract',''),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'','copyrightYear','2021'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'','copyrightYear','2021'),(4,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(4,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Genetic transformation of forest trees'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2021'),(5,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'','copyrightYear','2021'),(6,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Developing efficacy beliefs in the classroom'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2021'),(7,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Traditions and Trends in the Study of the Commons'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'','copyrightYear','2021'),(8,'en_US','abstract','<p>None.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'','copyrightYear','2021'),(9,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'','copyrightYear','2021'),(10,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'','copyrightYear','2021'),(11,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Learning Sustainable Design through Service'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'','copyrightYear','2021'),(12,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'','copyrightYear','2021'),(13,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2021'),(14,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'','copyrightYear','2021'),(15,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Yam diseases and its management in Nigeria'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'','copyrightYear','2021'),(16,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'','copyrightYear','2021'),(17,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2021'),(18,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'','copyrightYear','2021'),(19,'en_US','abstract','<p>None.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Finocchiaro: Arguments About Arguments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title','');
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
INSERT INTO `publications` VALUES (1,0,NULL,'2021-11-22 20:41:14',1,1,1,1,NULL,1),(2,0,'2021-11-22','2021-11-22 20:41:51',2,1,2,3,NULL,1),(3,0,'2021-11-22','2021-11-22 20:42:32',3,1,3,3,NULL,1),(4,0,'2021-11-22','2021-11-22 20:43:09',5,1,4,3,NULL,1),(5,0,'2021-11-22','2021-11-22 20:43:46',6,1,5,3,NULL,1),(6,0,'2021-11-22','2021-11-22 20:44:22',7,1,6,3,NULL,1),(7,0,'2021-11-22','2021-11-22 20:45:04',8,1,7,3,NULL,1),(8,0,'2021-11-22','2021-11-22 20:45:42',10,1,8,3,NULL,1),(9,0,'2021-11-22','2021-11-22 20:46:19',11,1,9,3,NULL,1),(10,0,'2021-11-22','2021-11-22 20:46:56',12,1,10,3,NULL,1),(11,0,'2021-11-22','2021-11-22 20:47:37',13,1,11,3,NULL,1),(12,0,'2021-11-22','2021-11-22 20:48:16',15,1,12,3,NULL,1),(13,0,'2021-11-22','2021-11-22 20:48:56',16,1,13,3,NULL,1),(14,0,'2021-11-22','2021-11-22 20:49:34',17,1,14,3,NULL,1),(15,0,'2021-11-22','2021-11-22 20:50:13',18,1,15,3,NULL,1),(16,0,'2021-11-22','2021-11-22 20:50:55',19,1,16,3,NULL,1),(17,0,'2021-11-22','2021-11-22 20:51:35',20,1,17,3,NULL,1),(18,0,'2021-11-22','2021-11-22 20:52:13',21,1,18,3,NULL,1),(19,0,'2021-11-22','2021-11-22 20:52:50',22,1,19,3,NULL,1);
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.StatisticsReport','2021-11-22 20:38:16'),('plugins.generic.usageStats.UsageStatsLoader','2021-11-22 20:38:16');
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
INSERT INTO `sessions` VALUES ('0a4ctdf0bt1ols1evlop37itqi',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613495,1637613510,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1637613510;s:5:\"token\";s:32:\"303bf57de0e93769e9cfd6fab6c9a145\";}','localhost'),('0eg63tiube176jbvaog7neivgs',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614335,1637614371,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614371;s:5:\"token\";s:32:\"8f6da6cd1d0f8d47f018859c144cb4a1\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('36u2hg1b4eif7fbcrq1n0es31v',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614215,1637614255,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614255;s:5:\"token\";s:32:\"4522c68a8d3e857cd0f60bbf00bbfa27\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('4u7insflvg5k0foe72ql9e1vfh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614138,1637614174,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614174;s:5:\"token\";s:32:\"f0473b1b6754ada984dc8836b66da346\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('6meiak13f9pu7stdo0hgcqaek4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614257,1637614295,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614295;s:5:\"token\";s:32:\"96f86ab0862a5c23eb4761b5a7abfe85\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('a6erdq74ftsbr9drkc4u6kto8b',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613713,1637613753,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613753;s:5:\"token\";s:32:\"247e1b5e624f65eed8ab11ceb5992252\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('b6nfm34pp1ooag08gelsj8nr4q',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613981,1637614016,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614016;s:5:\"token\";s:32:\"c1db2340840ef215b2001b5b2b06780f\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('bl0rviesbhbl0mg7boprcj6034',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613530,1637613538,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1637613538;s:5:\"token\";s:32:\"d6b07c65232ee2a2b550b46a0c3f140e\";}','localhost'),('cdiknidseg4n459i0tonchd12k',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613943,1637613979,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613979;s:5:\"token\";s:32:\"ce6cbff1f83eeed9b4042d99272625a3\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ch9s12j3dkqfmittarj8vbj28r',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613510,1637613530,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1637613530;s:5:\"token\";s:32:\"427c40ed7559c06a2cd8127c799d4184\";}','localhost'),('dgd2v6go68kd8a30g2eer8j609',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614098,1637614136,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614136;s:5:\"token\";s:32:\"c8ca1f1b79c28ed11b01187189804fda\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('farg9vn3vcp0k0va7n5md9t314',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613491,1637613491,0,'','localhost'),('fl7tuco9hp6dd1ofjgi5k44g98',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613677,1637613711,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613711;s:5:\"token\";s:32:\"7d8895593cc39d779e3c04d385e9bd2c\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('gg8r0a9os9o8onpl4gnhl2pcaa',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613649,1637613676,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613675;s:5:\"token\";s:32:\"892c5bbb725175457a914f0370fc4fb6\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('ipucnn7gd70jlp4rebegddoana',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613828,1637613862,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613862;s:5:\"token\";s:32:\"d51750a9591be82204ae7aa2524433b8\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('jlco2b1gn2q11a01cdgjs763jj',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613621,1637613648,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1637613647;s:5:\"token\";s:32:\"29a0d2a723364721284ece77d75754e4\";}','localhost'),('joo21enp8ii4ar1a1g5pmga9lb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613791,1637613826,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613826;s:5:\"token\";s:32:\"182c88fd8adf63b01efa7457ef02a81e\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('m2umjee0c1e0d57lg85c5oorf8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613907,1637613941,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613941;s:5:\"token\";s:32:\"f98a8ce0f89ad50d388ca39e96f446ad\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('mvatmqj0embftlnkaeakui0ul2',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613614,1637613621,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1637613621;s:5:\"token\";s:32:\"cd5646f7c854ec795ef4f79d0fa4ba83\";}','localhost'),('njml5pa8mluiucf2bvv1mkg5e4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614059,1637614096,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614096;s:5:\"token\";s:32:\"61f56e263f09667b41d4441905d1fd66\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('pgp08oq42j0sah86h7bcqqur6i',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614018,1637614057,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614057;s:5:\"token\";s:32:\"5bb4396d0b4ae13bfae27d86c4d5f46d\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('poh35mtmk34supu19md4hq4oc4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613755,1637613789,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613789;s:5:\"token\";s:32:\"ef82feb841008fdb14497d21e157ef20\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('rjvas49kj371u94v9s2f6m1nrq',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614177,1637614213,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614213;s:5:\"token\";s:32:\"18f02847c6e6135e66780119d760294d\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('tgp5hn6d9jhj9he5smqg8kikri',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613539,1637613548,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1637613548;s:5:\"token\";s:32:\"761bbc14bbb99921fca20fdd586d4ca8\";}','localhost'),('u5sa642ve87unnpt6gndvc5gpn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613552,1637613612,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1637613611;s:5:\"token\";s:32:\"e6a00f2159a9e40faa4546d0a516f8bb\";}','localhost'),('us17o7n73seegbbeh5hr8orgo4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637613864,1637613904,0,'csrf|a:2:{s:9:\"timestamp\";i:1637613904;s:5:\"token\";s:32:\"235165e32e64d7d8380e9e0028cfc371\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('v7mq37pfommfd4ibt5fvpakm24',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/96.0.4664.45 Safari/537.36',1637614297,1637614333,0,'csrf|a:2:{s:9:\"timestamp\";i:1637614333;s:5:\"token\";s:32:\"8e74ba3309e32cee0978e35a149badd0\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2021-11-22 20:40:57',0,1),(2,1,3,4,'2021-11-22 20:41:15',0,1),(3,1,3,5,'2021-11-22 20:41:15',0,1),(4,2,4,8,'2021-11-22 20:41:24',0,1),(5,2,3,4,'2021-11-22 20:41:43',0,1),(6,2,3,5,'2021-11-22 20:41:43',0,1),(7,3,4,9,'2021-11-22 20:42:00',0,1),(8,3,3,4,'2021-11-22 20:42:23',0,1),(9,3,3,5,'2021-11-22 20:42:23',0,1),(10,4,4,10,'2021-11-22 20:42:42',0,1),(11,4,3,4,'2021-11-22 20:42:59',0,1),(12,4,3,5,'2021-11-22 20:42:59',0,1),(13,5,4,11,'2021-11-22 20:43:19',0,1),(14,5,3,4,'2021-11-22 20:43:37',0,1),(15,5,3,5,'2021-11-22 20:43:37',0,1),(16,6,4,12,'2021-11-22 20:43:56',0,1),(17,6,3,4,'2021-11-22 20:44:13',0,1),(18,6,3,5,'2021-11-22 20:44:13',0,1),(19,7,4,13,'2021-11-22 20:44:31',0,1),(20,7,3,4,'2021-11-22 20:44:54',0,1),(21,7,3,5,'2021-11-22 20:44:54',0,1),(22,8,4,14,'2021-11-22 20:45:15',0,1),(23,8,3,4,'2021-11-22 20:45:33',0,1),(24,8,3,5,'2021-11-22 20:45:33',0,1),(25,9,4,15,'2021-11-22 20:45:52',0,1),(26,9,3,4,'2021-11-22 20:46:10',0,1),(27,9,3,5,'2021-11-22 20:46:10',0,1),(28,10,4,16,'2021-11-22 20:46:29',0,1),(29,10,3,4,'2021-11-22 20:46:47',0,1),(30,10,3,5,'2021-11-22 20:46:47',0,1),(31,11,4,17,'2021-11-22 20:47:07',0,1),(32,11,3,4,'2021-11-22 20:47:27',0,1),(33,11,3,5,'2021-11-22 20:47:27',0,1),(34,12,4,18,'2021-11-22 20:47:49',0,1),(35,12,3,4,'2021-11-22 20:48:07',0,1),(36,12,3,5,'2021-11-22 20:48:07',0,1),(37,13,4,19,'2021-11-22 20:48:27',0,1),(38,13,3,4,'2021-11-22 20:48:47',0,1),(39,13,3,5,'2021-11-22 20:48:47',0,1),(40,14,4,20,'2021-11-22 20:49:08',0,1),(41,14,3,4,'2021-11-22 20:49:26',0,1),(42,14,3,5,'2021-11-22 20:49:26',0,1),(43,15,4,21,'2021-11-22 20:49:47',0,1),(44,15,3,4,'2021-11-22 20:50:04',0,1),(45,15,3,5,'2021-11-22 20:50:04',0,1),(46,16,4,22,'2021-11-22 20:50:25',0,1),(47,16,3,4,'2021-11-22 20:50:45',0,1),(48,16,3,5,'2021-11-22 20:50:45',0,1),(49,17,4,23,'2021-11-22 20:51:07',0,1),(50,17,3,4,'2021-11-22 20:51:26',0,1),(51,17,3,5,'2021-11-22 20:51:26',0,1),(52,18,4,24,'2021-11-22 20:51:46',0,1),(53,18,3,4,'2021-11-22 20:52:04',0,1),(54,18,3,5,'2021-11-22 20:52:04',0,1),(55,19,4,25,'2021-11-22 20:52:23',0,1),(56,19,3,4,'2021-11-22 20:52:40',0,1),(57,19,3,5,'2021-11-22 20:52:40',0,1);
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
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:41:07','2021-11-22 20:41:10',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:41:34','2021-11-22 20:41:37',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:42:10','2021-11-22 20:42:13',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:42:52','2021-11-22 20:42:55',10,521,4),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:43:29','2021-11-22 20:43:31',11,521,5),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:44:06','2021-11-22 20:44:09',12,521,6),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:44:42','2021-11-22 20:44:44',13,521,7),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:45:26','2021-11-22 20:45:28',14,521,8),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:46:02','2021-11-22 20:46:05',15,521,9),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:46:39','2021-11-22 20:46:42',16,521,10),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:47:17','2021-11-22 20:47:19',17,521,11),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:47:59','2021-11-22 20:48:01',18,521,12),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:48:37','2021-11-22 20:48:39',19,521,13),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:49:18','2021-11-22 20:49:20',20,521,14),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:49:57','2021-11-22 20:49:59',21,521,15),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:50:35','2021-11-22 20:50:37',22,521,16),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:51:17','2021-11-22 20:51:19',23,521,17),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:51:56','2021-11-22 20:51:59',24,521,18),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2021-11-22 20:52:34','2021-11-22 20:52:36',25,521,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (522,'11-'),(663,'21st'),(347,'aalborg'),(795,'abattoir'),(834,'abnormal'),(431,'academic'),(530,'accepted'),(396,'accompanying'),(714,'achieving'),(474,'acid'),(547,'acids'),(250,'action'),(934,'actor'),(927,'actors'),(383,'added'),(428,'address'),(478,'adipose'),(129,'administered'),(359,'administration'),(749,'adopted'),(750,'advocated'),(823,'affected'),(25,'affects'),(791,'african'),(933,'agree'),(856,'aid'),(467,'aim'),(414,'al-khafaji'),(67,'alberta'),(141,'alexandria'),(652,'analyses'),(36,'analysis'),(505,'analyzed'),(503,'animals'),(727,'anthracnose'),(899,'antibiotics'),(870,'antimicrobial'),(583,'antonio'),(613,'appears'),(150,'applications'),(358,'applied'),(560,'aquifer'),(13,'archival'),(647,'areas'),(166,'argument'),(952,'arguments'),(768,'ash'),(468,'assess'),(552,'assessed'),(608,'assessments'),(659,'atlantic'),(15,'attitude'),(458,'australian'),(857,'authorities'),(410,'authority'),(350,'availability'),(483,'averaging'),(499,'backfat'),(165,'background'),(717,'baiyewu'),(782,'barcelona'),(669,'barriers'),(482,'barrows'),(564,'barton'),(411,'based'),(404,'basin'),(369,'basins'),(671,'basis'),(607,'bearings'),(794,'beef'),(99,'began'),(178,'beliefs'),(693,'belonging'),(31,'benchmark'),(45,'benefit'),(597,'blanco'),(51,'brazil'),(409,'brazos'),(819,'breeds'),(622,'buda'),(807,'bulls'),(460,'butyrate'),(520,'c18'),(524,'c20'),(101,'called'),(788,'cameroon'),(95,'canada'),(380,'capabilities'),(310,'cape'),(821,'carcass'),(802,'carcasses'),(551,'carefully'),(684,'carried'),(658,'case'),(907,'cases'),(825,'category'),(1,'catherine'),(786,'cattle'),(790,'central'),(664,'century'),(611,'cfs'),(453,'challenges'),(633,'change'),(440,'chapter'),(801,'characteristics'),(212,'children'),(50,'china'),(774,'chips'),(457,'christopher'),(521,'cis'),(217,'citizens'),(253,'citizenship'),(185,'claim'),(174,'claims'),(81,'classroom'),(906,'clinical'),(701,'close'),(507,'close-'),(660,'coast'),(890,'coli'),(874,'coliforms'),(288,'colleagues'),(501,'collected'),(586,'collection'),(936,'collective'),(932,'collectively'),(56,'collectivistic'),(207,'college'),(199,'com-mitments'),(723,'combating'),(179,'commitments'),(189,'common'),(262,'commons'),(40,'communication'),(695,'communities'),(678,'community'),(9,'comparative'),(926,'compare'),(34,'compared'),(46,'comparisons'),(193,'competencies'),(29,'compiled'),(399,'complete'),(852,'completely'),(377,'complex'),(506,'composition'),(71,'computer'),(903,'concentration'),(581,'concept'),(325,'conclusive'),(849,'condemned'),(391,'condensed'),(348,'condensing'),(566,'conditions'),(227,'conducted'),(215,'confident'),(326,'conflicting'),(915,'conjugative'),(642,'connection'),(558,'connectivity'),(941,'consensus'),(733,'considered'),(52,'consistent'),(188,'consists'),(532,'consortium'),(11,'construct'),(405,'contained'),(287,'contemporary'),(512,'content'),(62,'context'),(649,'continual'),(218,'continue'),(341,'continuous'),(680,'contributing'),(945,'contributors'),(862,'control'),(450,'coordinated'),(104,'core'),(208,'cork'),(336,'corporate'),(691,'council'),(28,'countries'),(707,'country'),(105,'courses'),(280,'coward'),(832,'cows'),(239,'cps'),(65,'craig'),(30,'create'),(236,'creative'),(596,'creek'),(167,'critique'),(752,'crop'),(775,'cubes'),(760,'cultivars'),(61,'cultural'),(24,'culture'),(696,'cultures'),(950,'cuny'),(98,'curriculum'),(160,'dana'),(654,'daniel'),(14,'data'),(392,'dataset'),(374,'datasets'),(268,'decades1'),(928,'decide'),(942,'decision'),(248,'decision-making'),(379,'decision-support'),(340,'decisions'),(170,'deep'),(687,'defining'),(22,'degree'),(688,'delivering'),(646,'demands'),(90,'demonstrate'),(682,'describes'),(419,'design'),(656,'designing'),(758,'destruction'),(739,'devastating'),(408,'develop'),(381,'developed'),(209,'developing'),(117,'development'),(300,'developments'),(139,'diaga'),(543,'dietary'),(488,'diets'),(539,'differed'),(900,'difference'),(200,'difficult'),(939,'difficulty'),(140,'diouf'),(455,'directions'),(171,'disagreement'),(271,'disciplines'),(632,'discontinuity'),(149,'discussed'),(689,'discussions'),(732,'disease'),(720,'diseases'),(600,'dissipated'),(269,'distinguished'),(846,'distress'),(339,'distribution'),(203,'diverge'),(667,'diversity'),(582,'divide'),(330,'dividend'),(314,'dividends'),(205,'domatilia'),(577,'downstream'),(594,'drainage'),(631,'dramatic'),(858,'draw'),(565,'drought'),(606,'droughts'),(737,'dry'),(533,'dry-cured'),(853,'due'),(635,'dynamic'),(328,'economists'),(523,'ecosenoic'),(836,'ectoparasites'),(744,'edible'),(84,'education'),(559,'edwards'),(64,'effect'),(42,'effectiveness'),(245,'effects'),(210,'efficacy'),(41,'efficiency'),(709,'egalitarianism'),(254,'elinor'),(666,'embracing'),(433,'emerging'),(692,'emphasises'),(316,'empirical'),(137,'employed'),(17,'employees'),(916,'encoding'),(835,'encountered'),(574,'endangered'),(367,'endeavors'),(151,'engineering'),(437,'engineers'),(234,'enhance'),(386,'enhanced'),(251,'enhancing'),(842,'enlarged'),(883,'enterobacteriacea'),(421,'environmental'),(925,'environments'),(211,'equip'),(12,'equivalence'),(889,'escherichia'),(580,'established'),(703,'ethnic'),(704,'ethno-linguistic'),(345,'evaluation'),(317,'evidence'),(21,'examine'),(133,'examined'),(677,'examines'),(63,'exerts'),(48,'exhibited'),(454,'exist'),(74,'existing'),(591,'exists'),(365,'expanding'),(263,'expe-'),(439,'experiences'),(157,'expression'),(617,'extended'),(619,'extensive'),(301,'fabio'),(5,'facets'),(35,'factor'),(38,'factors'),(885,'faeces'),(427,'failed'),(754,'fallowing'),(471,'fat'),(837,'fatigue'),(494,'fats'),(473,'fatty'),(382,'features'),(496,'fed'),(725,'field'),(886,'fifteen'),(480,'fifty-four'),(772,'finally'),(327,'financial'),(338,'financing'),(187,'find'),(54,'findings'),(951,'finocchiaro'),(323,'firm'),(605,'flow'),(612,'flowing'),(403,'flows'),(851,'flukes'),(352,'focus'),(173,'fogelin'),(168,'fogelins'),(184,'fogelin’s'),(553,'food'),(144,'forest'),(769,'found'),(177,'framework'),(257,'frank'),(181,'fruitfully'),(816,'fulani'),(342,'function'),(770,'fungal'),(839,'fungal-like'),(321,'future'),(673,'gender'),(784,'general'),(156,'genes'),(142,'genetic'),(665,'genuinely'),(766,'gins'),(124,'goal'),(947,'goverance'),(155,'governing'),(93,'government'),(91,'grade'),(625,'gradient'),(634,'gradients'),(220,'graduation'),(590,'groundwater'),(589,'groundwater-level'),(913,'group'),(385,'growing'),(266,'growth'),(815,'gudali'),(331,'guidance'),(810,'guinea'),(534,'ham'),(191,'hand'),(304,'hansen'),(756,'healthy'),(476,'heavy'),(811,'high'),(58,'higher'),(510,'highest'),(710,'highlights'),(136,'hired'),(119,'hiring'),(878,'hospital'),(884,'human'),(639,'hydraulic'),(588,'hydrogeologic'),(557,'hydrologic'),(602,'hydrologically'),(442,'identification'),(888,'identified'),(576,'immediately'),(395,'impacts'),(112,'implement'),(97,'implementation'),(931,'implemented'),(76,'implications'),(711,'importance'),(861,'improve'),(461,'improves'),(152,'improving'),(699,'include'),(407,'included'),(751,'includes'),(645,'increased'),(544,'increases'),(536,'index'),(256,'indiana'),(694,'individual'),(33,'individually'),(55,'individuals'),(759,'infected'),(771,'infection'),(877,'infections'),(469,'influence'),(614,'influenced'),(638,'influences'),(102,'information'),(216,'informed'),(103,'infused'),(529,'ing'),(641,'inherent'),(902,'inhibitory'),(87,'initiatives'),(389,'input'),(923,'institutions'),(233,'instruction'),(430,'integrates'),(138,'integrating'),(79,'integration'),(299,'intellectual'),(686,'intention'),(657,'intercultural'),(681,'interculturality'),(293,'interest'),(175,'interlocutors'),(449,'internships'),(344,'intuitive'),(163,'investigating'),(337,'investment'),(334,'investors'),(247,'involve'),(702,'involvement'),(441,'involves'),(527,'iodine'),(880,'iran'),(69,'irvine'),(879,'isfahan'),(487,'isoenergetic'),(875,'isolated'),(887,'isolates'),(83,'issue'),(798,'january'),(6,'job'),(308,'john'),(114,'jurisdictions'),(868,'karbasizaed'),(413,'karim'),(892,'kelebsiella'),(221,'key'),(213,'knowledge'),(556,'kumiega'),(2,'kwantes'),(621,'kyle'),(259,'laerhoven'),(838,'lameness'),(672,'language'),(376,'large'),(426,'largely'),(797,'largest'),(715,'lasting'),(537,'layers'),(249,'leads'),(224,'learn'),(219,'learners'),(110,'learning'),(447,'led'),(456,'leo'),(841,'lesions'),(92,'level'),(526,'levels'),(435,'leveraged'),(452,'limitations'),(525,'linoleic'),(519,'linolenic'),(555,'lise'),(315,'literature'),(777,'live'),(850,'liver'),(764,'locally'),(272,'long'),(470,'long-term'),(601,'longer'),(804,'longissimus'),(281,'los'),(735,'losses'),(624,'low'),(516,'lowest'),(855,'lungs'),(843,'lymph'),(283,'mackenzie'),(765,'made'),(491,'maize'),(82,'major'),(276,'managed'),(332,'management'),(96,'mandated'),(799,'march'),(562,'marcos'),(416,'margaret'),(68,'mark'),(740,'marked'),(826,'markedly'),(743,'marketable'),(485,'matched'),(757,'material'),(818,'mbororo'),(241,'means'),(828,'meat'),(154,'mechanisms'),(123,'meet'),(724,'menace'),(662,'met'),(871,'metal'),(908,'metals'),(390,'methodology'),(904,'mic'),(286,'mid-1980s'),(708,'militate'),(901,'minimal'),(277,'mismanaged'),(195,'mistakenly'),(406,'model'),(355,'modeling'),(351,'models'),(412,'modifying'),(650,'monitoring'),(517,'monounsaturated'),(66,'montgomerie'),(778,'months'),(417,'morse'),(730,'mosaic'),(242,'motivate'),(252,'motivation'),(518,'mufa'),(922,'multi-level'),(918,'multidrug-resistance'),(676,'multiethnic'),(675,'multilingual'),(19,'multinational'),(898,'multiple'),(309,'mwandenga'),(718,'nairobi'),(23,'national'),(32,'nations'),(26,'nature'),(375,'necessarily'),(648,'necessitates'),(924,'networked'),(135,'newly'),(661,'nicaragua'),(721,'nigeria'),(8,'nine-nation'),(844,'nodes'),(847,'nodular'),(628,'non-drought'),(599,'normal'),(630,'north'),(876,'nosocomial'),(346,'novak'),(610,'numerical'),(223,'nurturing'),(783,'nutrition'),(548,'nutritional'),(864,'observed'),(324,'offer'),(492,'oil'),(595,'onion'),(180,'order'),(20,'organization'),(39,'organizational'),(445,'organizations'),(848,'organs'),(809,'origin'),(398,'original'),(255,'ostrom'),(668,'overcome'),(302,'paglieri'),(125,'paper'),(808,'parameters'),(531,'parma'),(197,'part'),(225,'participate'),(683,'participatory'),(444,'partner'),(267,'past'),(653,'patricia'),(914,'pattern'),(881,'patterns'),(712,'pedagogy'),(670,'people'),(202,'people’s'),(895,'percent'),(462,'performance'),(465,'period'),(618,'periods'),(361,'permit'),(372,'permits'),(44,'personal'),(911,'persons'),(943,'perverse'),(161,'phillips'),(477,'pig'),(464,'piglets'),(509,'pigs'),(305,'pinto'),(279,'places'),(572,'plan'),(364,'planning'),(755,'planting'),(159,'plants'),(873,'plasmid'),(893,'pneumoniae'),(77,'policy'),(514,'polyunsaturated'),(296,'pool'),(644,'population'),(745,'portions'),(244,'positive'),(897,'possess'),(333,'potential'),(626,'potentiometric'),(705,'power'),(329,'practical'),(78,'practice'),(800,'pre-slaughter'),(820,'predominant'),(833,'pregnant'),(438,'present'),(230,'presented'),(722,'presents'),(863,'prevent'),(53,'previous'),(568,'primary'),(423,'principles'),(192,'pro-cedural'),(237,'problem'),(938,'problematic'),(198,'procedural'),(773,'processing'),(814,'production'),(186,'productive'),(116,'professional'),(475,'profile'),(882,'profiles'),(587,'program'),(859,'programmes'),(148,'progress'),(448,'project-based'),(443,'projects'),(865,'promote'),(713,'promoting'),(640,'properties'),(298,'property'),(545,'proportion'),(322,'prospects'),(573,'protect'),(378,'provide'),(94,'province'),(86,'provincial'),(130,'public'),(515,'pufa'),(620,'pumping'),(944,'punishing'),(182,'pursue'),(549,'quality'),(742,'quantity'),(578,'questions'),(579,'raised'),(716,'rana'),(484,'randomized'),(493,'rapeseed'),(643,'rapid'),(132,'rate'),(940,'reaching'),(824,'rearing'),(306,'reason'),(147,'recent'),(615,'recharge'),(307,'reclaimed'),(803,'recorded'),(917,'recovered'),(817,'red'),(741,'reduction'),(747,'reductions'),(508,'reflected'),(371,'reflects'),(183,'refute'),(728,'regarded'),(292,'region'),(362,'regional'),(294,'regions'),(706,'relations'),(912,'relationship'),(343,'rely'),(891,'remaining'),(397,'removed'),(57,'report'),(806,'represent'),(789,'representative'),(402,'represents'),(134,'require'),(111,'required'),(73,'requirements'),(59,'research'),(285,'researchers'),(394,'reservoir'),(373,'reservoirs'),(872,'resistance'),(761,'resistant'),(297,'resource'),(275,'resources'),(108,'respect'),(845,'respiratory'),(131,'response'),(27,'responses'),(604,'result'),(528,'result-'),(127,'results'),(37,'revealed'),(146,'review'),(282,'reyes'),(264,'rienced'),(360,'rights'),(368,'river'),(172,'robert'),(222,'role'),(303,'rome'),(780,'rosanna'),(781,'rossi'),(738,'rot'),(753,'rotation'),(357,'routinely'),(946,'ruled'),(793,'safety'),(500,'samples'),(561,'san'),(929,'sanction'),(935,'sanctioned'),(937,'sanctioning'),(930,'sanctions'),(7,'satisfaction'),(49,'satisfied'),(511,'saturated'),(812,'savannah'),(270,'scholars'),(113,'school'),(290,'sec-'),(554,'security'),(584,'segments'),(393,'selected'),(214,'self-belief'),(235,'self-efficacy'),(921,'self-organization'),(603,'separated'),(100,'september'),(567,'serves'),(420,'service'),(429,'service-learning'),(400,'set'),(432,'setting'),(894,'seventy'),(734,'severe'),(513,'sfa'),(176,'share'),(164,'shared'),(335,'shareholding'),(776,'shelf'),(542,'show'),(830,'showed'),(231,'showing'),(243,'shown'),(623,'shows'),(320,'signal'),(318,'signaling'),(312,'signalling'),(909,'significant'),(540,'significantly'),(829,'similar'),(387,'simplifying'),(388,'simulation'),(609,'simulations'),(18,'single'),(785,'situation'),(72,'skill'),(88,'skills'),(840,'skin'),(498,'slaughter'),(787,'slaughtered'),(497,'slaughtering'),(629,'slopes'),(228,'social'),(226,'society'),(459,'sodium'),(206,'sokoloff'),(238,'solving'),(571,'source'),(570,'south-central'),(575,'species'),(274,'specific'),(106,'specifies'),(729,'spread'),(563,'springs'),(685,'staff'),(120,'standards'),(415,'stanford'),(370,'state'),(363,'statewide'),(726,'storage'),(748,'stored'),(896,'strains'),(118,'strategies'),(232,'strategy'),(401,'streamflows'),(860,'strengthen'),(637,'structural'),(47,'structures'),(446,'student'),(89,'students'),(273,'studied'),(229,'studies'),(10,'study'),(792,'sub-region'),(538,'subcutaneous'),(265,'substantial'),(451,'successful'),(60,'suggest'),(319,'suggests'),(126,'summarizes'),(495,'supplement-'),(472,'supplementation'),(489,'supplemented'),(569,'supply'),(43,'support'),(194,'supporters'),(698,'supporting'),(593,'surface'),(16,'survey'),(422,'sustainability'),(418,'sustainable'),(356,'system'),(353,'systems'),(674,'takes'),(490,'tallow'),(240,'taught'),(436,'teach'),(75,'teachers'),(122,'teachers’'),(550,'technological'),(80,'technology'),(109,'technology”'),(762,'tecto'),(869,'tehran'),(128,'telephone'),(502,'ten'),(354,'texas'),(313,'theory'),(169,'thesis'),(763,'thiabendazole'),(805,'thoracis'),(697,'time'),(278,'times'),(479,'tissue'),(85,'today'),(910,'tolerant'),(434,'tool'),(190,'topic'),(425,'topics'),(162,'toronto'),(291,'tors'),(831,'toughest'),(311,'town'),(866,'trade'),(260,'traditions'),(143,'transformation'),(813,'transhumance'),(504,'treatment'),(541,'treatments'),(145,'trees'),(651,'trend'),(261,'trends'),(854,'tuberculosis'),(746,'tubers'),(115,'turning'),(384,'types'),(153,'understanding'),(3,'university'),(700,'university’s'),(636,'unknown'),(535,'unsaturation'),(121,'upgrade'),(201,'uphold'),(679,'uraccan'),(867,'vajiheh'),(919,'valerie'),(246,'valuable'),(905,'values'),(258,'van'),(627,'variation'),(827,'varied'),(366,'variety'),(592,'vicinity'),(70,'victoria'),(196,'view'),(731,'virus'),(424,'vital'),(616,'vulnerable'),(690,'wales'),(349,'water'),(585,'water-level'),(463,'weaned'),(466,'weaning'),(822,'weight'),(486,'weights'),(598,'wet'),(481,'white'),(204,'widely'),(920,'williamson'),(4,'windsor'),(284,'wittfogel'),(655,'wolverhampton'),(767,'wood'),(949,'woods'),(158,'woody'),(289,'work'),(295,'world'),(719,'yam'),(736,'yams'),(796,'yaoundé'),(779,'year'),(948,'zita'),(107,'“expected'),(546,'“healthy”');
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(9,3,2),(9,3,6),(17,3,3),(25,3,2),(33,3,2),(41,3,3),(41,3,8),(49,3,2),(57,3,2),(65,3,3),(73,3,3),(73,3,7),(81,3,4),(89,3,2),(97,3,2),(99,3,28),(99,3,37),(99,3,80),(105,3,2),(113,3,3),(121,3,2),(129,3,2),(1,4,3),(129,4,3),(2,5,0),(2,6,1),(3,6,14),(3,6,70),(2,7,2),(3,7,15),(3,7,60),(3,7,71),(2,8,3),(2,9,4),(2,10,5),(42,10,2),(43,10,0),(83,10,1),(91,10,43),(98,10,4),(99,10,18),(2,11,6),(3,11,43),(2,12,7),(3,12,44),(3,13,0),(3,14,1),(91,14,39),(91,14,47),(91,14,64),(91,14,127),(91,14,203),(115,14,110),(3,15,2),(3,16,3),(5,16,1),(11,16,62),(13,16,4),(3,17,4),(3,17,48),(5,17,0),(3,18,5),(3,19,6),(3,20,7),(3,21,8),(3,22,9),(91,22,176),(3,23,10),(3,23,64),(11,23,7),(13,23,6),(81,23,3),(3,24,11),(99,24,15),(101,24,8),(3,25,12),(3,26,13),(3,26,69),(91,26,157),(3,27,16),(3,28,17),(3,29,18),(3,30,19),(3,31,20),(3,32,21),(3,32,57),(3,33,22),(131,33,3),(3,34,23),(123,34,15),(123,34,36),(3,35,24),(3,35,38),(3,36,25),(91,36,45),(91,36,63),(3,37,26),(3,38,27),(99,38,61),(3,39,28),(3,39,30),(3,39,33),(3,39,40),(3,40,29),(3,40,41),(11,40,27),(3,41,31),(3,42,32),(3,43,34),(11,43,80),(35,43,49),(3,44,35),(3,44,45),(3,45,36),(3,45,46),(3,46,37),(3,47,39),(3,48,42),(3,49,47),(3,49,50),(3,50,49),(3,51,51),(3,52,52),(123,52,62),(3,53,53),(3,54,54),(3,54,62),(35,54,27),(3,55,55),(3,56,56),(3,57,58),(3,58,59),(83,58,96),(3,59,61),(35,59,26),(35,59,40),(99,59,35),(99,59,81),(115,59,1),(3,60,63),(27,60,33),(91,60,98),(3,61,65),(3,62,66),(35,62,31),(3,63,67),(3,64,68),(83,64,87),(9,65,0),(9,66,1),(9,67,3),(11,67,18),(11,67,38),(11,67,68),(13,67,5),(9,68,4),(9,69,5),(9,70,7),(10,71,0),(11,71,54),(11,71,72),(13,71,2),(10,72,1),(10,73,2),(10,74,3),(59,74,25),(10,75,4),(11,75,40),(11,75,79),(11,75,84),(10,76,5),(35,76,65),(59,76,17),(91,76,87),(10,77,6),(59,77,16),(59,77,22),(10,78,7),(11,79,0),(11,80,1),(11,80,10),(11,80,28),(13,80,1),(11,81,2),(34,81,3),(35,81,70),(11,82,3),(35,82,0),(91,82,9),(91,82,85),(11,83,4),(59,83,14),(11,84,5),(35,84,2),(37,84,0),(75,84,8),(77,84,2),(99,84,7),(11,85,6),(11,86,8),(13,86,7),(11,87,9),(11,88,11),(11,88,55),(11,88,73),(13,88,3),(35,88,6),(11,89,12),(11,89,34),(99,89,39),(11,90,13),(11,91,14),(11,92,15),(91,92,164),(91,92,195),(11,93,16),(11,94,17),(11,94,67),(11,95,19),(11,96,20),(11,97,21),(11,98,22),(11,98,29),(11,98,43),(98,98,2),(99,98,43),(99,98,53),(99,98,65),(11,99,23),(11,100,24),(11,101,25),(11,102,26),(11,103,30),(11,104,31),(11,105,32),(11,106,33),(11,107,35),(11,108,36),(11,109,37),(11,110,39),(35,110,38),(35,110,50),(35,110,56),(74,110,0),(77,110,4),(11,111,41),(26,111,3),(27,111,19),(27,111,41),(11,112,42),(11,113,44),(11,113,65),(11,113,74),(35,113,24),(11,114,45),(11,114,66),(11,114,75),(11,115,46),(11,116,47),(13,116,8),(11,117,48),(13,117,9),(43,117,6),(75,117,3),(77,117,0),(99,117,31),(99,117,63),(11,118,49),(11,118,81),(99,118,44),(107,118,5),(107,118,50),(11,119,50),(11,120,51),(11,121,52),(11,122,53),(11,123,56),(11,124,57),(35,124,1),(11,125,58),(35,125,15),(11,126,59),(11,127,60),(83,127,112),(123,127,82),(11,128,61),(11,129,63),(11,130,64),(11,131,69),(91,131,165),(11,132,70),(11,133,71),(11,134,76),(11,135,77),(11,136,78),(11,137,82),(11,137,83),(107,137,6),(13,138,0),(17,139,0),(17,140,1),(17,141,2),(18,142,0),(19,142,3),(19,142,9),(18,143,1),(19,143,4),(99,143,92),(101,143,12),(18,144,2),(19,144,5),(19,144,12),(18,145,3),(19,145,6),(19,145,13),(19,146,0),(58,146,3),(107,146,0),(19,147,1),(59,147,8),(19,148,2),(19,149,7),(35,149,71),(75,149,58),(19,150,8),(67,150,42),(67,150,44),(19,151,10),(75,151,7),(77,151,1),(19,152,11),(83,152,135),(19,153,14),(99,153,51),(19,154,15),(19,155,16),(19,156,17),(19,157,18),(19,158,19),(19,159,20),(25,160,0),(25,161,1),(25,162,3),(26,163,0),(27,163,16),(26,164,1),(27,164,17),(27,164,29),(27,164,38),(26,165,2),(27,165,6),(27,165,18),(27,165,23),(27,165,42),(26,166,4),(27,166,12),(27,166,21),(27,166,44),(26,167,5),(26,168,6),(26,169,7),(26,170,8),(26,171,9),(27,172,0),(27,173,1),(27,173,34),(27,174,2),(27,175,3),(27,176,4),(27,177,5),(35,177,58),(27,178,7),(27,178,26),(27,178,39),(27,178,50),(34,178,2),(35,178,20),(27,179,8),(27,179,31),(27,180,9),(35,180,21),(27,181,10),(27,182,11),(27,183,13),(27,184,14),(27,185,15),(27,186,20),(27,186,43),(27,187,22),(27,188,24),(27,189,25),(45,189,0),(45,189,3),(115,189,48),(115,189,82),(27,190,27),(27,190,53),(27,191,28),(27,191,54),(27,192,30),(27,193,32),(27,194,35),(27,195,36),(27,196,37),(27,197,40),(35,197,39),(27,198,45),(27,199,46),(27,200,47),(27,201,48),(27,202,49),(27,203,51),(27,204,52),(107,204,16),(33,205,0),(33,206,1),(33,207,3),(33,208,4),(34,209,0),(67,209,56),(91,209,11),(34,210,1),(35,210,19),(35,211,3),(35,212,4),(35,212,46),(35,212,60),(35,213,5),(35,214,7),(35,215,8),(35,216,9),(43,216,32),(35,217,10),(35,217,11),(35,218,12),(99,218,10),(35,219,13),(35,220,14),(35,221,16),(35,222,17),(35,223,18),(35,224,22),(35,224,69),(35,225,23),(35,226,25),(35,227,28),(91,227,44),(35,228,29),(35,228,63),(75,228,14),(99,228,91),(101,228,11),(35,229,30),(35,230,32),(67,230,55),(107,230,13),(35,231,33),(35,232,34),(35,233,35),(35,234,36),(35,235,37),(35,235,55),(35,235,67),(35,236,41),(35,237,42),(35,238,43),(35,239,44),(35,239,52),(35,240,45),(35,241,47),(35,242,48),(35,243,51),(35,244,53),(35,245,54),(67,245,79),(83,245,138),(35,246,57),(35,247,59),(35,248,61),(35,249,62),(35,250,64),(35,251,66),(35,252,68),(37,253,1),(41,254,0),(41,255,1),(41,256,2),(41,256,7),(41,257,4),(41,258,5),(41,259,6),(42,260,0),(42,261,1),(42,262,3),(43,262,1),(43,262,28),(43,263,2),(43,264,3),(43,265,4),(43,266,5),(82,266,3),(91,266,185),(43,267,7),(91,267,79),(91,267,101),(43,268,8),(43,269,9),(43,270,10),(43,270,34),(43,271,11),(43,271,35),(43,272,12),(43,273,13),(43,273,26),(43,274,14),(43,274,27),(66,274,5),(43,275,15),(43,276,16),(43,277,17),(43,278,18),(43,279,19),(43,280,20),(43,281,21),(43,282,22),(43,283,23),(43,284,24),(43,285,25),(43,286,29),(43,287,30),(43,288,31),(43,289,33),(43,290,36),(43,291,37),(43,292,38),(99,292,25),(99,292,76),(123,292,88),(43,293,39),(131,293,36),(43,294,40),(43,295,41),(75,295,38),(45,296,1),(45,297,2),(45,298,4),(45,299,5),(45,300,6),(49,301,0),(49,302,1),(49,303,3),(50,304,0),(50,305,1),(50,306,2),(50,307,3),(57,308,0),(65,308,0),(57,309,1),(57,310,3),(89,310,3),(57,311,4),(89,311,4),(58,312,0),(58,313,1),(59,313,1),(58,314,2),(59,314,3),(58,315,4),(58,316,5),(59,316,9),(58,317,6),(59,317,10),(59,317,13),(59,318,0),(59,319,2),(91,319,67),(59,320,4),(59,321,5),(75,321,24),(75,321,59),(91,321,204),(59,322,6),(59,323,7),(59,324,11),(59,325,12),(59,326,15),(59,327,18),(59,328,19),(59,329,20),(59,330,21),(59,330,37),(59,331,23),(59,332,24),(59,332,36),(66,332,7),(67,332,20),(67,332,52),(91,332,89),(106,332,2),(107,332,4),(107,332,49),(59,333,26),(91,333,76),(123,333,85),(59,334,27),(59,335,28),(59,336,29),(59,337,30),(59,338,31),(59,339,32),(59,340,33),(59,340,38),(131,340,16),(131,340,35),(59,341,34),(59,342,35),(59,343,39),(59,344,40),(59,345,41),(65,346,1),(65,347,2),(66,348,0),(66,349,1),(66,349,6),(67,349,1),(67,349,8),(67,349,19),(67,349,25),(67,349,51),(67,349,64),(67,349,80),(67,349,106),(69,349,0),(91,349,4),(91,349,163),(91,349,187),(93,349,0),(66,350,2),(67,350,2),(67,350,107),(91,350,90),(66,351,3),(66,352,4),(67,352,50),(66,353,8),(67,353,53),(67,354,0),(67,354,105),(91,354,7),(67,355,3),(67,355,18),(67,355,35),(67,355,38),(67,355,108),(67,356,4),(67,356,11),(67,356,36),(67,356,61),(67,356,78),(67,356,102),(67,356,109),(115,356,50),(115,356,62),(67,357,5),(67,358,6),(67,358,94),(67,359,7),(67,360,9),(67,360,65),(67,360,81),(67,361,10),(67,362,12),(115,362,127),(67,363,13),(67,364,14),(67,365,15),(75,365,61),(67,366,16),(67,367,17),(67,368,21),(67,368,82),(67,368,99),(67,368,112),(91,368,58),(91,368,116),(67,369,22),(67,370,23),(67,371,24),(67,371,62),(67,372,26),(67,373,27),(67,373,67),(67,374,28),(67,374,49),(67,375,29),(67,376,30),(83,376,15),(67,377,31),(67,378,32),(91,378,202),(115,378,2),(67,379,33),(67,380,34),(67,381,37),(67,381,74),(67,382,39),(67,383,40),(67,384,41),(67,385,43),(67,386,45),(67,387,46),(67,388,47),(67,389,48),(67,389,88),(67,390,54),(67,390,93),(67,391,57),(67,391,91),(67,391,96),(67,392,58),(67,392,71),(67,392,89),(67,392,92),(67,392,110),(67,393,59),(67,393,77),(115,393,32),(67,394,60),(67,394,101),(67,395,63),(67,396,66),(67,397,68),(67,398,69),(67,398,85),(67,399,70),(67,399,86),(67,400,72),(91,400,128),(67,401,73),(67,402,75),(67,403,76),(67,404,83),(67,404,113),(67,405,84),(67,406,87),(67,406,97),(75,406,27),(75,406,39),(75,406,53),(75,406,62),(91,406,97),(99,406,46),(99,406,49),(67,407,90),(67,408,95),(67,409,98),(67,409,111),(67,410,100),(67,411,103),(75,411,32),(67,412,104),(73,413,0),(73,414,1),(73,415,2),(73,415,6),(75,415,34),(73,416,4),(73,417,5),(74,418,1),(75,418,2),(75,418,22),(75,418,30),(75,418,37),(74,419,2),(75,419,23),(75,419,31),(75,419,48),(74,420,3),(75,420,15),(77,420,3),(75,421,0),(75,422,1),(77,422,5),(75,423,4),(75,424,5),(75,425,6),(75,426,9),(75,427,10),(75,428,11),(91,428,36),(75,429,12),(75,429,28),(75,430,13),(75,431,16),(75,432,17),(131,432,1),(131,432,6),(75,433,18),(75,434,19),(75,435,20),(75,436,21),(75,436,29),(75,437,25),(75,437,36),(75,438,26),(75,439,33),(75,440,35),(75,441,40),(75,442,41),(75,443,42),(75,444,43),(75,444,51),(75,445,44),(75,445,52),(75,446,45),(75,447,46),(75,448,47),(75,449,49),(75,450,50),(75,451,54),(75,452,55),(75,453,56),(99,453,0),(75,454,57),(99,454,11),(75,455,60),(81,456,0),(81,457,1),(81,458,2),(82,459,0),(82,460,1),(82,461,2),(82,462,4),(82,463,5),(82,464,6),(82,465,7),(107,465,96),(82,466,8),(83,467,0),(115,467,0),(115,467,115),(83,468,2),(83,469,3),(91,469,175),(114,469,0),(83,470,4),(83,470,114),(114,470,1),(83,471,5),(83,471,134),(83,471,141),(115,471,70),(83,472,6),(83,472,116),(83,472,125),(83,473,7),(83,473,42),(83,473,48),(83,473,58),(83,473,66),(83,473,71),(83,473,118),(83,473,131),(114,473,5),(83,474,8),(83,474,43),(83,474,49),(83,474,59),(83,474,67),(83,474,72),(83,474,79),(83,474,84),(83,474,89),(83,474,119),(114,474,6),(83,475,9),(83,475,120),(122,475,5),(123,475,65),(83,476,10),(83,476,121),(114,476,8),(122,476,1),(123,476,1),(123,476,51),(123,476,58),(123,476,74),(83,477,11),(83,477,122),(83,477,133),(83,478,12),(83,478,123),(83,479,13),(83,479,108),(83,479,124),(83,480,14),(83,481,16),(115,481,52),(83,482,17),(83,483,18),(83,484,19),(83,485,20),(83,486,21),(83,487,22),(83,488,23),(83,489,24),(83,489,51),(83,490,25),(83,491,26),(83,492,27),(83,492,29),(83,492,127),(83,493,28),(83,493,126),(83,494,30),(83,494,52),(83,494,117),(114,494,4),(83,495,31),(83,496,32),(83,496,55),(83,496,62),(83,496,75),(83,497,33),(83,498,34),(115,498,30),(83,499,35),(83,499,45),(83,499,53),(83,499,92),(83,499,107),(114,499,10),(83,500,36),(83,501,37),(91,501,65),(83,502,38),(83,503,39),(83,504,40),(83,504,86),(83,505,41),(83,506,44),(83,506,50),(114,506,7),(115,506,38),(83,507,46),(83,508,47),(83,509,54),(85,509,0),(114,509,9),(83,510,56),(83,510,63),(83,510,76),(83,511,57),(83,512,60),(83,512,64),(83,512,74),(83,512,77),(115,512,71),(83,513,61),(83,514,65),(83,515,68),(83,516,69),(83,517,70),(83,518,73),(83,519,78),(83,520,80),(83,520,97),(83,521,81),(83,522,82),(83,523,83),(83,524,85),(83,525,88),(83,526,90),(83,526,95),(91,526,139),(91,526,152),(83,527,91),(83,528,93),(83,529,94),(83,530,98),(83,531,99),(83,532,100),(83,533,101),(83,534,102),(83,535,103),(83,536,104),(83,537,105),(83,538,106),(83,539,109),(83,540,110),(91,540,149),(83,541,111),(83,542,113),(83,543,115),(114,543,3),(83,544,128),(107,544,93),(83,545,129),(83,546,130),(83,547,132),(83,548,136),(83,549,137),(83,549,140),(115,549,12),(115,549,36),(115,549,69),(83,550,139),(83,551,142),(83,552,143),(85,553,1),(117,553,1),(85,554,2),(117,554,2),(89,555,0),(89,556,1),(90,557,0),(91,557,25),(91,557,61),(91,557,177),(90,558,1),(90,559,2),(91,559,0),(91,559,32),(91,559,92),(90,560,3),(91,560,1),(91,560,33),(91,560,93),(91,560,173),(90,561,4),(91,561,18),(91,561,27),(91,561,80),(91,561,102),(91,561,134),(91,561,179),(91,561,198),(90,562,5),(91,562,19),(91,562,81),(91,562,103),(91,562,135),(91,562,180),(91,562,199),(90,563,6),(90,563,8),(91,563,10),(91,563,20),(91,563,30),(91,563,82),(91,563,84),(91,563,105),(91,563,136),(91,563,145),(91,563,182),(91,563,200),(90,564,7),(91,564,29),(91,564,83),(91,564,104),(91,564,144),(91,564,181),(90,565,9),(91,565,34),(91,565,66),(91,565,106),(91,565,140),(91,565,153),(90,566,10),(91,566,35),(91,566,62),(91,566,107),(115,566,23),(115,566,84),(91,567,2),(99,567,72),(91,568,3),(91,569,5),(115,569,121),(91,570,6),(91,571,8),(91,571,156),(91,572,12),(91,573,13),(107,573,81),(91,574,14),(91,575,15),(91,576,16),(91,577,17),(91,578,21),(91,578,37),(91,579,22),(91,580,23),(91,581,24),(91,582,26),(91,582,49),(91,582,54),(91,582,69),(91,582,109),(91,583,28),(91,584,31),(91,584,74),(91,585,38),(91,586,40),(91,587,41),(91,587,197),(91,588,42),(91,588,205),(91,589,46),(91,590,48),(91,590,68),(91,590,77),(91,590,91),(91,590,108),(91,590,194),(91,591,50),(91,592,51),(91,592,124),(91,593,52),(91,593,133),(91,593,147),(91,594,53),(91,595,55),(91,595,113),(91,596,56),(91,596,114),(91,597,57),(91,597,115),(91,598,59),(91,599,60),(91,600,70),(91,601,71),(91,602,72),(91,603,73),(91,604,75),(91,605,78),(91,606,86),(91,607,88),(91,608,94),(91,609,95),(91,610,96),(91,611,99),(91,612,100),(91,613,110),(91,613,117),(91,614,111),(91,615,112),(91,615,121),(91,616,118),(91,617,119),(91,618,120),(91,618,142),(91,618,155),(91,619,122),(91,620,123),(91,621,125),(91,621,137),(91,621,143),(91,621,166),(91,621,189),(91,622,126),(91,622,190),(91,622,201),(91,623,129),(91,624,130),(115,624,72),(91,625,131),(91,626,132),(91,626,146),(91,626,160),(91,627,138),(91,628,141),(91,628,154),(91,629,148),(91,630,150),(91,631,151),(91,632,158),(91,632,174),(91,633,159),(91,634,161),(91,635,162),(91,636,167),(91,637,168),(91,638,169),(91,639,170),(91,640,171),(91,641,172),(91,642,178),(91,643,183),(91,644,184),(91,645,186),(91,646,188),(91,647,191),(91,648,192),(91,649,193),(91,650,196),(91,651,206),(91,652,207),(97,653,0),(97,654,1),(97,655,3),(98,656,0),(98,657,1),(99,657,42),(99,657,64),(98,658,3),(99,658,17),(98,659,5),(99,659,20),(98,660,6),(99,660,21),(98,661,7),(99,661,22),(99,662,1),(99,663,2),(101,663,0),(99,664,3),(101,664,1),(99,665,4),(99,666,5),(99,667,6),(101,667,2),(99,668,8),(99,669,9),(99,670,12),(99,671,13),(99,671,47),(99,671,86),(99,672,14),(101,672,7),(99,673,16),(101,673,9),(99,674,19),(99,675,23),(101,675,3),(99,676,24),(101,676,4),(99,677,26),(99,678,27),(99,678,50),(99,679,29),(99,680,30),(99,681,32),(99,681,88),(99,682,33),(99,683,34),(99,683,84),(101,683,5),(99,684,36),(115,684,41),(99,685,38),(99,686,40),(99,687,41),(99,688,45),(99,689,48),(99,690,52),(99,691,54),(99,692,55),(99,693,56),(99,694,57),(131,694,30),(99,695,58),(99,695,71),(99,696,59),(99,697,60),(99,698,62),(99,699,66),(99,700,67),(99,701,68),(99,702,69),(99,703,70),(99,704,73),(99,705,74),(99,706,75),(99,707,77),(99,708,78),(99,709,79),(101,709,10),(99,710,82),(99,711,83),(99,712,85),(101,712,6),(99,713,87),(99,714,89),(99,715,90),(105,716,0),(105,717,1),(105,718,3),(106,719,0),(107,719,3),(107,719,20),(107,719,34),(107,719,82),(107,719,89),(106,720,1),(107,720,2),(107,720,12),(107,720,19),(107,720,33),(107,720,55),(107,720,70),(115,720,125),(106,721,3),(107,721,9),(107,722,1),(107,723,7),(107,723,53),(107,724,8),(107,725,10),(107,725,18),(107,725,54),(107,726,11),(107,726,32),(107,726,69),(107,726,79),(107,726,86),(107,727,14),(107,728,15),(107,729,17),(107,730,21),(107,731,22),(107,732,23),(107,733,24),(107,733,30),(115,733,19),(107,734,25),(107,734,46),(107,735,26),(107,736,27),(107,736,37),(107,736,48),(107,737,28),(107,737,35),(107,737,75),(107,738,29),(107,738,36),(107,739,31),(107,740,38),(107,741,39),(107,742,40),(107,743,41),(107,744,42),(107,745,43),(107,746,44),(107,746,83),(107,746,90),(107,747,45),(107,748,47),(107,749,51),(107,750,52),(107,751,56),(107,752,57),(107,752,65),(107,753,58),(107,754,59),(107,755,60),(107,756,61),(123,756,12),(123,756,38),(123,756,60),(107,757,62),(107,758,63),(107,759,64),(107,760,66),(107,760,68),(107,761,67),(107,762,71),(107,763,72),(107,764,73),(107,765,74),(131,765,23),(107,766,76),(107,767,77),(107,768,78),(107,769,80),(107,770,84),(107,771,85),(123,771,87),(107,772,87),(107,773,88),(107,774,91),(107,775,92),(107,776,94),(107,777,95),(107,778,97),(107,779,98),(115,779,67),(113,780,0),(113,781,1),(113,782,2),(114,783,2),(115,784,3),(115,785,4),(115,786,5),(115,786,25),(115,786,43),(115,786,63),(115,786,117),(117,786,0),(115,787,6),(115,787,35),(115,787,80),(115,788,7),(115,788,18),(115,789,8),(115,790,9),(115,791,10),(115,792,11),(115,793,13),(115,794,14),(115,794,120),(115,795,15),(115,796,16),(115,797,17),(115,798,20),(115,799,21),(115,800,22),(115,801,24),(115,802,26),(115,802,31),(115,802,99),(115,803,27),(115,804,28),(115,804,39),(115,805,29),(115,805,40),(115,806,33),(115,807,34),(115,808,37),(115,809,42),(115,810,44),(115,811,45),(131,811,28),(115,812,46),(115,813,47),(115,814,49),(115,814,118),(115,815,51),(115,815,75),(115,816,53),(115,817,54),(115,818,55),(115,819,56),(115,819,74),(115,820,57),(115,821,58),(115,822,59),(115,823,60),(115,823,108),(115,824,61),(115,825,64),(115,826,65),(115,827,66),(115,828,68),(115,828,78),(115,829,73),(115,830,76),(115,831,77),(115,832,79),(115,833,81),(115,834,83),(115,835,85),(115,836,86),(115,837,87),(115,838,88),(115,839,89),(115,840,90),(115,841,91),(115,841,98),(115,842,92),(115,843,93),(115,844,94),(115,845,95),(115,846,96),(115,847,97),(115,848,100),(115,849,101),(115,849,105),(115,850,102),(115,851,103),(115,852,104),(115,853,106),(131,853,18),(115,854,107),(115,855,109),(115,856,111),(115,857,112),(115,858,113),(115,859,114),(115,860,116),(115,861,119),(115,862,122),(115,863,123),(115,864,124),(115,865,126),(115,866,128),(121,867,0),(121,868,1),(121,869,3),(122,870,0),(123,870,0),(123,870,67),(122,871,2),(123,871,2),(123,871,59),(122,872,3),(123,872,3),(123,872,34),(123,872,68),(123,872,73),(122,873,4),(123,873,5),(123,873,64),(123,873,71),(122,874,6),(123,874,7),(123,874,84),(122,875,7),(123,875,9),(123,875,29),(123,875,55),(123,875,79),(122,876,8),(123,876,10),(123,876,18),(123,876,30),(123,876,80),(123,876,86),(122,877,9),(123,877,11),(123,877,19),(123,877,31),(123,877,81),(122,878,10),(123,878,56),(122,879,11),(122,880,12),(123,881,4),(123,882,6),(123,883,8),(123,884,13),(123,884,39),(123,885,14),(123,885,40),(123,885,50),(123,886,16),(123,887,17),(123,888,20),(123,889,21),(123,890,22),(123,891,23),(123,892,24),(123,893,25),(123,894,26),(123,895,27),(123,896,28),(123,896,37),(123,896,47),(123,896,54),(123,896,78),(123,897,32),(123,898,33),(123,899,35),(123,899,76),(123,900,41),(123,901,42),(123,902,43),(123,903,44),(123,904,45),(123,905,46),(123,906,48),(123,907,49),(123,908,52),(123,908,75),(123,909,53),(123,910,57),(123,911,61),(123,912,63),(123,913,66),(131,913,37),(123,914,69),(123,915,70),(123,916,72),(123,917,77),(123,918,83),(129,919,0),(129,920,1),(130,921,0),(133,921,0),(130,922,1),(133,922,1),(130,923,2),(133,923,2),(130,924,3),(130,925,4),(131,926,0),(131,927,2),(131,927,9),(131,927,31),(131,928,4),(131,929,5),(131,930,7),(131,931,8),(131,932,10),(131,932,24),(131,933,11),(131,934,12),(131,935,13),(131,936,14),(131,936,33),(131,937,15),(131,937,26),(131,937,34),(131,938,17),(131,939,19),(131,940,20),(131,941,21),(131,942,22),(131,943,25),(131,944,27),(131,945,29),(131,946,32),(133,947,3),(137,948,0),(137,949,1),(137,950,2),(138,951,0),(138,952,1),(138,952,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,2,1,0),(2,2,2,0),(3,2,4,0),(4,2,16,0),(5,2,17,0),(6,2,8,0),(7,2,32,0),(8,2,64,0),(9,3,1,0),(10,3,2,0),(11,3,4,0),(12,3,16,0),(13,3,17,0),(14,3,8,0),(15,3,32,0),(16,3,64,0),(17,4,1,0),(18,4,2,0),(19,4,4,0),(20,4,16,0),(21,4,17,0),(22,4,8,0),(23,4,32,0),(24,4,64,0),(25,5,1,0),(26,5,2,0),(27,5,4,0),(28,5,16,0),(29,5,17,0),(30,5,8,0),(31,5,32,0),(32,5,64,0),(33,6,1,0),(34,6,2,0),(35,6,4,0),(36,6,16,0),(37,6,17,0),(38,6,8,0),(39,6,32,0),(40,6,64,0),(41,7,1,0),(42,7,2,0),(43,7,4,0),(44,7,16,0),(45,7,17,0),(46,7,8,0),(47,7,32,0),(48,7,64,0),(49,8,1,0),(50,8,2,0),(51,8,4,0),(52,8,16,0),(53,8,17,0),(54,8,8,0),(55,8,32,0),(56,8,64,0),(57,9,1,0),(58,9,2,0),(59,9,4,0),(60,9,16,0),(61,9,17,0),(62,9,8,0),(63,9,32,0),(64,9,64,0),(65,10,1,0),(66,10,2,0),(67,10,4,0),(68,10,16,0),(69,10,17,0),(70,10,8,0),(71,10,32,0),(72,10,64,0),(73,11,1,0),(74,11,2,0),(75,11,4,0),(76,11,16,0),(77,11,17,0),(78,11,8,0),(79,11,32,0),(80,11,64,0),(81,12,1,0),(82,12,2,0),(83,12,4,0),(84,12,16,0),(85,12,17,0),(86,12,8,0),(87,12,32,0),(88,12,64,0),(89,13,1,0),(90,13,2,0),(91,13,4,0),(92,13,16,0),(93,13,17,0),(94,13,8,0),(95,13,32,0),(96,13,64,0),(97,14,1,0),(98,14,2,0),(99,14,4,0),(100,14,16,0),(101,14,17,0),(102,14,8,0),(103,14,32,0),(104,14,64,0),(105,15,1,0),(106,15,2,0),(107,15,4,0),(108,15,16,0),(109,15,17,0),(110,15,8,0),(111,15,32,0),(112,15,64,0),(113,16,1,0),(114,16,2,0),(115,16,4,0),(116,16,16,0),(117,16,17,0),(118,16,8,0),(119,16,32,0),(120,16,64,0),(121,17,1,0),(122,17,2,0),(123,17,4,0),(124,17,16,0),(125,17,17,0),(126,17,8,0),(127,17,32,0),(128,17,64,0),(129,18,1,0),(130,18,2,0),(131,18,4,0),(132,18,16,0),(133,18,17,0),(134,18,8,0),(135,18,32,0),(136,18,64,0),(137,19,1,0),(138,19,2,0),(139,19,4,0),(140,19,16,0),(141,19,17,0),(142,19,8,0),(143,19,32,0),(144,19,64,0);
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
INSERT INTO `submissions` VALUES (1,1,1,'2021-11-22 20:41:15','2021-11-22 20:41:15','2021-11-22 20:41:15',5,'en_US',1,0,0),(2,1,2,'2021-11-22 20:41:51','2021-11-22 20:41:43','2021-11-22 20:41:51',5,'en_US',3,0,0),(3,1,3,'2021-11-22 20:42:32','2021-11-22 20:42:23','2021-11-22 20:42:32',5,'en_US',3,0,0),(4,1,4,'2021-11-22 20:43:09','2021-11-22 20:42:59','2021-11-22 20:43:09',5,'en_US',3,0,0),(5,1,5,'2021-11-22 20:43:46','2021-11-22 20:43:37','2021-11-22 20:43:46',5,'en_US',3,0,0),(6,1,6,'2021-11-22 20:44:22','2021-11-22 20:44:13','2021-11-22 20:44:22',5,'en_US',3,0,0),(7,1,7,'2021-11-22 20:45:04','2021-11-22 20:44:54','2021-11-22 20:45:04',5,'en_US',3,0,0),(8,1,8,'2021-11-22 20:45:42','2021-11-22 20:45:33','2021-11-22 20:45:42',5,'en_US',3,0,0),(9,1,9,'2021-11-22 20:46:19','2021-11-22 20:46:10','2021-11-22 20:46:19',5,'en_US',3,0,0),(10,1,10,'2021-11-22 20:46:56','2021-11-22 20:46:47','2021-11-22 20:46:56',5,'en_US',3,0,0),(11,1,11,'2021-11-22 20:47:37','2021-11-22 20:47:27','2021-11-22 20:47:37',5,'en_US',3,0,0),(12,1,12,'2021-11-22 20:48:16','2021-11-22 20:48:07','2021-11-22 20:48:16',5,'en_US',3,0,0),(13,1,13,'2021-11-22 20:48:56','2021-11-22 20:48:47','2021-11-22 20:48:56',5,'en_US',3,0,0),(14,1,14,'2021-11-22 20:49:35','2021-11-22 20:49:25','2021-11-22 20:49:35',5,'en_US',3,0,0),(15,1,15,'2021-11-22 20:50:13','2021-11-22 20:50:04','2021-11-22 20:50:13',5,'en_US',3,0,0),(16,1,16,'2021-11-22 20:50:56','2021-11-22 20:50:45','2021-11-22 20:50:56',5,'en_US',3,0,0),(17,1,17,'2021-11-22 20:51:35','2021-11-22 20:51:26','2021-11-22 20:51:35',5,'en_US',3,0,0),(18,1,18,'2021-11-22 20:52:13','2021-11-22 20:52:04','2021-11-22 20:52:13',5,'en_US',3,0,0),(19,1,19,'2021-11-22 20:52:50','2021-11-22 20:52:40','2021-11-22 20:52:50',5,'en_US',3,0,0);
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
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `setting_value` text,
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName',0,0,'admin'),(1,'en_US','givenName',0,0,'admin'),(2,'','orcid',0,0,''),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México'),(2,'en_US','biography',0,0,''),(2,'en_US','familyName',0,0,'Vaca'),(2,'en_US','givenName',0,0,'Ramiro'),(2,'en_US','signature',0,0,''),(2,'fr_CA','affiliation',0,0,''),(2,'fr_CA','biography',0,0,''),(2,'fr_CA','familyName',0,0,''),(2,'fr_CA','givenName',0,0,''),(2,'fr_CA','signature',0,0,''),(3,'','orcid',0,0,''),(3,'en_US','affiliation',0,0,'University of Melbourne'),(3,'en_US','biography',0,0,''),(3,'en_US','familyName',0,0,'Barnes'),(3,'en_US','givenName',0,0,'Daniel'),(3,'en_US','signature',0,0,''),(3,'fr_CA','affiliation',0,0,''),(3,'fr_CA','biography',0,0,''),(3,'fr_CA','familyName',0,0,''),(3,'fr_CA','givenName',0,0,''),(3,'fr_CA','signature',0,0,''),(4,'','orcid',0,0,''),(4,'en_US','affiliation',0,0,'University of Chicago'),(4,'en_US','biography',0,0,''),(4,'en_US','familyName',0,0,'Buskins'),(4,'en_US','givenName',0,0,'David'),(4,'en_US','signature',0,0,''),(4,'fr_CA','affiliation',0,0,''),(4,'fr_CA','biography',0,0,''),(4,'fr_CA','familyName',0,0,''),(4,'fr_CA','givenName',0,0,''),(4,'fr_CA','signature',0,0,''),(5,'','orcid',0,0,''),(5,'en_US','affiliation',0,0,'University of Toronto'),(5,'en_US','biography',0,0,''),(5,'en_US','familyName',0,0,'Berardo'),(5,'en_US','givenName',0,0,'Stephanie'),(5,'en_US','signature',0,0,''),(5,'fr_CA','affiliation',0,0,''),(5,'fr_CA','biography',0,0,''),(5,'fr_CA','familyName',0,0,''),(5,'fr_CA','givenName',0,0,''),(5,'fr_CA','signature',0,0,''),(6,'','orcid',0,0,''),(6,'en_US','affiliation',0,0,'Kyoto University'),(6,'en_US','biography',0,0,''),(6,'en_US','familyName',0,0,'Inoue'),(6,'en_US','givenName',0,0,'Minoti'),(6,'en_US','signature',0,0,''),(6,'fr_CA','affiliation',0,0,''),(6,'fr_CA','biography',0,0,''),(6,'fr_CA','familyName',0,0,''),(6,'fr_CA','givenName',0,0,''),(6,'fr_CA','signature',0,0,''),(7,'en_US','affiliation',0,0,'University of Bologna'),(7,'en_US','familyName',0,0,'Corino'),(7,'en_US','givenName',0,0,'Carlo'),(8,'en_US','affiliation',0,0,'University of Windsor'),(8,'en_US','familyName',0,0,'Kwantes'),(8,'en_US','givenName',0,0,'Catherine'),(9,'en_US','affiliation',0,0,'University of Alberta'),(9,'en_US','familyName',0,0,'Montgomerie'),(9,'en_US','givenName',0,0,'Craig'),(10,'en_US','affiliation',0,0,'Alexandria University'),(10,'en_US','familyName',0,0,'Diouf'),(10,'en_US','givenName',0,0,'Diaga'),(11,'en_US','affiliation',0,0,'University of Toronto'),(11,'en_US','familyName',0,0,'Phillips'),(11,'en_US','givenName',0,0,'Dana'),(12,'en_US','affiliation',0,0,'University College Cork'),(12,'en_US','familyName',0,0,'Sokoloff'),(12,'en_US','givenName',0,0,'Domatilia'),(13,'en_US','affiliation',0,0,'Indiana University'),(13,'en_US','familyName',0,0,'Ostrom'),(13,'en_US','givenName',0,0,'Elinor'),(14,'en_US','affiliation',0,0,'University of Rome'),(14,'en_US','familyName',0,0,'Paglieri'),(14,'en_US','givenName',0,0,'Fabio'),(15,'en_US','affiliation',0,0,'University of Cape Town'),(15,'en_US','familyName',0,0,'Mwandenga'),(15,'en_US','givenName',0,0,'John'),(16,'en_US','affiliation',0,0,'Aalborg University'),(16,'en_US','familyName',0,0,'Novak'),(16,'en_US','givenName',0,0,'John'),(17,'en_US','affiliation',0,0,'Stanford University'),(17,'en_US','familyName',0,0,'Al-Khafaji'),(17,'en_US','givenName',0,0,'Karim'),(18,'en_US','affiliation',0,0,'Australian National University'),(18,'en_US','familyName',0,0,'Christopher'),(18,'en_US','givenName',0,0,'Leo'),(19,'en_US','affiliation',0,0,'University of Cape Town'),(19,'en_US','familyName',0,0,'Kumiega'),(19,'en_US','givenName',0,0,'Lise'),(20,'en_US','affiliation',0,0,'University of Wolverhampton'),(20,'en_US','familyName',0,0,'Daniel'),(20,'en_US','givenName',0,0,'Patricia'),(21,'en_US','affiliation',0,0,'University of Nairobi'),(21,'en_US','familyName',0,0,'Baiyewu'),(21,'en_US','givenName',0,0,'Rana'),(22,'en_US','affiliation',0,0,'Barcelona University'),(22,'en_US','familyName',0,0,'Rossi'),(22,'en_US','givenName',0,0,'Rosanna'),(23,'en_US','affiliation',0,0,'University of Tehran'),(23,'en_US','familyName',0,0,'Karbasizaed'),(23,'en_US','givenName',0,0,'Vajiheh'),(24,'en_US','affiliation',0,0,'University of Windsor'),(24,'en_US','familyName',0,0,'Williamson'),(24,'en_US','givenName',0,0,'Valerie'),(25,'en_US','affiliation',0,0,'CUNY'),(25,'en_US','familyName',0,0,'Woods'),(25,'en_US','givenName',0,0,'Zita');
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$RkBTpXI2jFGzfySKoFjCxuU.W6EWrFwJoCbFwzA.jr6tyy9YWgUKy','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-22 20:38:10',NULL,'2021-11-22 20:40:21',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$OPJqDm5XzDgmcNuxnPJSguKlw7Ra9rdlP6Q8I4C8ZQTlySM4p/9ze','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2021-11-22 20:39:21',NULL,'2021-11-22 20:40:09',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$AvhQtZ9zyOr54/yWjhxdQ.izRmX1p22X2V7Cva2gKtQyFohGqrWWW','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2021-11-22 20:39:29',NULL,'2021-11-22 20:52:42',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$Jaeq5f2DL2PiJ/16nMp56eRbBz8ziippnXiiCP9mXpsTk8noEtRMK','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2021-11-22 20:39:37',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$hSY69g18KkshqnuwJhB/keREf1sh4H2Nv9JMxnefrclunEsGbA/G.','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2021-11-22 20:39:47',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$2iMfLE9AJC7yP2mrRIpPxeHUoySdKxj.Ji8UILr.Gyg7w.j550XeS','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2021-11-22 20:39:57',NULL,NULL,0,0,NULL,0,NULL,1),(7,'ccorino','$2y$10$Pi3waEgWEs5K9tak3/IM8eY70wr3bUsbMJaf.XuplJG2I1hEZ2ePi','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2021-11-22 20:40:52',NULL,'2021-11-22 20:40:53',NULL,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$1rJ121096UrXLpDVww5bpe7AhvCg67dhfgw5iJCCxa5IW2FWSmK0K','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2021-11-22 20:41:20',NULL,'2021-11-22 20:41:20',NULL,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$B27hUsNDlJb9aBFl74wVW.5BFaT.x8XPbtRKY7sUb5I7w8zStmSEK','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2021-11-22 20:41:56',NULL,'2021-11-22 20:41:56',NULL,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$j4LT3ayAZknpXe3qGn8nQOm/1A0YhRzS6d/tAMsvwm..Jyqwu.iP6','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG',NULL,NULL,NULL,'2021-11-22 20:42:38',NULL,'2021-11-22 20:42:38',NULL,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$XwLadvhOb9XfhWmjB3dmR.7kyC03U36gB05Y5J/EzoOexzGiyP5wW','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2021-11-22 20:43:15',NULL,'2021-11-22 20:43:15',NULL,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$jFex.QzV82s7bfnuaIaHieFuJUvXuUsf54hPfpZDv/omrtOoy8e3q','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE',NULL,NULL,NULL,'2021-11-22 20:43:52',NULL,'2021-11-22 20:43:52',NULL,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$tHte0mM7Kkjy5HmDlxVHz.cw5aySgHbvW8gpJwUS.aMZNx6I3Wfam','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2021-11-22 20:44:28',NULL,'2021-11-22 20:44:28',NULL,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$VzxaBh08dqH79oBli3qx9O8tiVnCKCWQedNDz4vx5D.1dq9oSpEzC','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT',NULL,NULL,NULL,'2021-11-22 20:45:11',NULL,'2021-11-22 20:45:11',NULL,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$C1usnLuDl8NF5H9vK/gZpe6Ju76LRQn50YcpWwazOGbVwaeTeJeF2','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2021-11-22 20:45:48',NULL,'2021-11-22 20:45:48',NULL,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$EtNJFfLeeo6W4j56P4/BBumY94fR9bu2s9d10G46/6gy33DGs4dLO','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK',NULL,NULL,NULL,'2021-11-22 20:46:25',NULL,'2021-11-22 20:46:26',NULL,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$oqKib/sTS4NKsRacgxC6COm9uVAzz8uDv0k96idhAsyVmMZYtIXWu','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2021-11-22 20:47:03',NULL,'2021-11-22 20:47:03',NULL,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$UKvBZ6K7UmT1s0Guy5igq.ol/94R3hDwKAnXuqFo4BYMuHYAMptzi','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU',NULL,NULL,NULL,'2021-11-22 20:47:45',NULL,'2021-11-22 20:47:45',NULL,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$w3Z.7FsWx7gUNmpOwzxT..0kG9Fs1J8QZKhWmkUjWnRkYVb1GeKNO','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA',NULL,NULL,NULL,'2021-11-22 20:48:23',NULL,'2021-11-22 20:48:23',NULL,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$kH7MfvPz5b9byBc/7qiX3OePirGZl/WSQdr8BS04qDnIz3S2avcfG','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB',NULL,NULL,NULL,'2021-11-22 20:49:04',NULL,'2021-11-22 20:49:04',NULL,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$npRZT2tefH08Zm.cizSRAeYqf/E7/aOyKOrU1kakS9auHu/6gKTQ2','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE',NULL,NULL,NULL,'2021-11-22 20:49:43',NULL,'2021-11-22 20:49:43',NULL,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$sOLgu4KzISj361UUcd0AsunhJBtGGqfRLavViXhRfHxl7HuM2nefy','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES',NULL,NULL,NULL,'2021-11-22 20:50:21',NULL,'2021-11-22 20:50:21',NULL,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$rmK41g9Y4hpwRmNNHLbHzOMwVgB8bOfCtpTTZcjLo9XC1OIE7QbuG','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR',NULL,NULL,NULL,'2021-11-22 20:51:03',NULL,'2021-11-22 20:51:03',NULL,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$vzf.qK4JHJKleajaWcnBPespE0GEYzO2PaznhAvyC5ouCoz9SPcPO','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2021-11-22 20:51:42',NULL,'2021-11-22 20:51:42',NULL,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$i1NvZ0xCChfBTlPTe.f71urPcrCdtze7YNbp1AKWLLB2.mCZkkKwC','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2021-11-22 20:52:20',NULL,'2021-11-22 20:52:20',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2021-11-22 20:38:10',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2021-11-22 20:38:10',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2021-11-22 20:38:10',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,1,0,0,'2021-11-22 20:38:10',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,2,0,0,'2021-11-22 20:38:10',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,1,0,'2021-11-22 20:38:10',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,1,3,0,'2021-11-22 20:38:10',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.generic','crossrefDeposit','CrossrefDepositPlugin',1,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,1,0,0,'2021-11-22 20:38:10',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2021-11-22 20:38:10',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,4,0,0,'2021-11-22 20:38:08',1,'core','ops','',0,1),(2,2,0,0,'2021-11-22 20:38:29',1,'plugins.importexport','crossref','',0,0);
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

-- Dump completed on 2021-11-22 20:52:51
