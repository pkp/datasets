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
  KEY `announcement_settings_announcement_id` (`announcement_id`)
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
  KEY `announcement_type_settings_type_id` (`type_id`)
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
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
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
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
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
INSERT INTO `author_settings` VALUES (1,'','country','IT'),(1,'en_US','affiliation','University of Bologna'),(1,'en_US','familyName','Corino'),(1,'en_US','givenName','Carlo'),(2,'','country','CA'),(2,'en_US','affiliation','University of Windsor'),(2,'en_US','familyName','Kwantes'),(2,'en_US','givenName','Catherine'),(3,'','country','FI'),(3,'','orcid',''),(3,'','url',''),(3,'en_US','affiliation','Academy of Finland'),(3,'en_US','biography',''),(3,'en_US','familyName','Kekkonen'),(3,'en_US','givenName','Urho'),(3,'en_US','preferredPublicName',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(4,'','country','CA'),(4,'en_US','affiliation','University of Alberta'),(4,'en_US','familyName','Montgomerie'),(4,'en_US','givenName','Craig'),(5,'','country','CA'),(5,'','orcid',''),(5,'','url',''),(5,'en_US','affiliation','University of Victoria'),(5,'en_US','biography',''),(5,'en_US','familyName','Irvine'),(5,'en_US','givenName','Mark'),(5,'en_US','preferredPublicName',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(6,'','country','CA'),(6,'en_US','affiliation','University of Alberta'),(6,'en_US','familyName','Montgomerie'),(6,'en_US','givenName','Craig'),(7,'','country','CA'),(7,'','orcid',''),(7,'','url',''),(7,'en_US','affiliation','University of Victoria'),(7,'en_US','biography',''),(7,'en_US','familyName','Irvine'),(7,'en_US','givenName','Mark'),(7,'en_US','preferredPublicName',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(8,'','country','EG'),(8,'en_US','affiliation','Alexandria University'),(8,'en_US','familyName','Diouf'),(8,'en_US','givenName','Diaga'),(9,'','country','CA'),(9,'en_US','affiliation','University of Toronto'),(9,'en_US','familyName','Phillips'),(9,'en_US','givenName','Dana'),(10,'','country','IE'),(10,'en_US','affiliation','University College Cork'),(10,'en_US','familyName','Sokoloff'),(10,'en_US','givenName','Domatilia'),(11,'','country','US'),(11,'en_US','affiliation','Indiana University'),(11,'en_US','familyName','Ostrom'),(11,'en_US','givenName','Elinor'),(12,'','country','US'),(12,'','orcid',''),(12,'','url',''),(12,'en_US','affiliation','Indiana University'),(12,'en_US','biography',''),(12,'en_US','familyName','van Laerhoven'),(12,'en_US','givenName','Frank'),(12,'en_US','preferredPublicName',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(13,'','country','IT'),(13,'en_US','affiliation','University of Rome'),(13,'en_US','familyName','Paglieri'),(13,'en_US','givenName','Fabio'),(14,'','country','ZA'),(14,'en_US','affiliation','University of Cape Town'),(14,'en_US','familyName','Mwandenga'),(14,'en_US','givenName','John'),(15,'','country','DK'),(15,'en_US','affiliation','Aalborg University'),(15,'en_US','familyName','Novak'),(15,'en_US','givenName','John'),(16,'','country','US'),(16,'en_US','affiliation','Stanford University'),(16,'en_US','familyName','Al-Khafaji'),(16,'en_US','givenName','Karim'),(17,'','country','US'),(17,'','orcid',''),(17,'','url',''),(17,'en_US','affiliation','Stanford University'),(17,'en_US','biography',''),(17,'en_US','familyName','Morse'),(17,'en_US','givenName','Margaret'),(17,'en_US','preferredPublicName',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(18,'','country','AU'),(18,'en_US','affiliation','Australian National University'),(18,'en_US','familyName','Christopher'),(18,'en_US','givenName','Leo'),(19,'','country','ZA'),(19,'en_US','affiliation','University of Cape Town'),(19,'en_US','familyName','Kumiega'),(19,'en_US','givenName','Lise'),(20,'','country','GB'),(20,'en_US','affiliation','University of Wolverhampton'),(20,'en_US','familyName','Daniel'),(20,'en_US','givenName','Patricia'),(21,'','country','KE'),(21,'en_US','affiliation','University of Nairobi'),(21,'en_US','familyName','Baiyewu'),(21,'en_US','givenName','Rana'),(22,'','country','ES'),(22,'en_US','affiliation','Barcelona University'),(22,'en_US','familyName','Rossi'),(22,'en_US','givenName','Rosanna'),(23,'','country','IR'),(23,'en_US','affiliation','University of Tehran'),(23,'en_US','familyName','Karbasizaed'),(23,'en_US','givenName','Vajiheh'),(24,'','country','CA'),(24,'en_US','affiliation','University of Windsor'),(24,'en_US','familyName','Williamson'),(24,'en_US','givenName','Valerie'),(25,'','country','US'),(25,'en_US','affiliation','CUNY'),(25,'en_US','familyName','Woods'),(25,'en_US','givenName','Zita');
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
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,0.00,4),(2,'ckwantes@mailinator.com',1,2,0.00,4),(3,'ukk@mailinator.com',1,2,1.00,4),(4,'cmontgomerie@mailinator.com',1,3,0.00,4),(5,'mirvine@mailinator.com',1,3,1.00,4),(6,'cmontgomerie@mailinator.com',1,4,0.00,4),(7,'mirvine@mailinator.com',1,4,1.00,4),(8,'ddiouf@mailinator.com',1,5,0.00,4),(9,'dphillips@mailinator.com',1,6,0.00,4),(10,'dsokoloff@mailinator.com',1,7,0.00,4),(11,'eostrom@mailinator.com',1,8,0.00,4),(12,'fvanlaerhoven@mailinator.com',1,8,1.00,4),(13,'fpaglieri@mailinator.com',1,9,0.00,4),(14,'jmwandenga@mailinator.com',1,10,0.00,4),(15,'jnovak@mailinator.com',1,11,0.00,4),(16,'kalkhafaji@mailinator.com',1,12,0.00,4),(17,'mmorse@mailinator.com',1,12,1.00,4),(18,'lchristopher@mailinator.com',1,13,0.00,4),(19,'lkumiega@mailinator.com',1,14,0.00,4),(20,'pdaniel@mailinator.com',1,15,0.00,4),(21,'rbaiyewu@mailinator.com',1,16,0.00,4),(22,'rrossi@mailinator.com',1,17,0.00,4),(23,'vkarbasizaed@mailinator.com',1,18,0.00,4),(24,'vwilliamson@mailinator.com',1,19,0.00,4),(25,'zwoods@mailinator.com',1,20,0.00,4);
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
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Moderator Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the moderator declines his submission initially.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('POSTED_ACK','en_US','Preprint Posted Acknowledgement','{$authorName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$contextName}.<br />\n<br />\nPreprint URL: {$publicationUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when the preprint is posted online on the server.'),('PUBLISH_NOTIFY','en_US','New Preprint Posted','Readers:<br />\n<br />\n{$contextName} has just posted its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$contextName} vient d\'être publiée à l\'adresse suivante : {$contextUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$editorialContactSignature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\n<br />\n{$canAuthorPublish}\"<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$authorName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$contextName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$contextName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName},<br />\n<br />\nVous avez créé un compte avec {$contextName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.');
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
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2022-03-08 00:52:43',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2022-03-08 00:52:52',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2022-03-08 00:52:52',1342177288,'submission.event.fileRevised',0),(4,515,1,7,'2022-03-08 00:52:54',1342177296,'submission.event.fileEdited',0),(5,1048585,1,7,'2022-03-08 00:52:54',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2022-03-08 00:52:58',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,7,'2022-03-08 00:52:59',268435457,'submission.event.submissionSubmitted',0),(8,1048585,2,8,'2022-03-08 00:53:06',268435458,'submission.event.general.metadataUpdated',0),(9,515,2,8,'2022-03-08 00:53:15',1342177281,'submission.event.fileUploaded',0),(10,1048585,2,8,'2022-03-08 00:53:15',1342177288,'submission.event.fileRevised',0),(11,515,2,8,'2022-03-08 00:53:17',1342177296,'submission.event.fileEdited',0),(12,1048585,2,8,'2022-03-08 00:53:17',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2022-03-08 00:53:22',268435458,'submission.event.general.metadataUpdated',0),(14,1048585,2,8,'2022-03-08 00:53:23',268435457,'submission.event.submissionSubmitted',0),(15,1048585,2,8,'2022-03-08 00:53:27',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,8,'2022-03-08 00:53:40',268435458,'submission.event.general.metadataUpdated',0),(17,1048585,2,3,'2022-03-08 00:53:45',268435462,'publication.event.published',0),(18,1048585,3,9,'2022-03-08 00:53:52',268435458,'submission.event.general.metadataUpdated',0),(19,515,3,9,'2022-03-08 00:54:01',1342177281,'submission.event.fileUploaded',0),(20,1048585,3,9,'2022-03-08 00:54:01',1342177288,'submission.event.fileRevised',0),(21,515,3,9,'2022-03-08 00:54:04',1342177296,'submission.event.fileEdited',0),(22,1048585,3,9,'2022-03-08 00:54:04',1342177296,'submission.event.fileEdited',0),(23,1048585,3,9,'2022-03-08 00:54:13',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,3,9,'2022-03-08 00:54:14',268435457,'submission.event.submissionSubmitted',0),(25,1048585,3,3,'2022-03-08 00:54:20',268435462,'publication.event.published',0),(26,1048585,3,3,'2022-03-08 00:54:26',268435463,'publication.event.unpublished',0),(27,1048585,3,3,'2022-03-08 00:54:29',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,3,3,'2022-03-08 00:54:32',268435462,'publication.event.published',0),(29,1048585,3,3,'2022-03-08 00:54:35',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,3,3,'2022-03-08 00:54:35',268435464,'publication.event.versionCreated',0),(31,1048585,3,3,'2022-03-08 00:54:39',268435458,'submission.event.general.metadataUpdated',0),(32,1048585,3,3,'2022-03-08 00:54:42',268435462,'publication.event.versionPublished',0),(33,1048585,4,10,'2022-03-08 00:54:50',268435458,'submission.event.general.metadataUpdated',0),(34,515,4,10,'2022-03-08 00:54:59',1342177281,'submission.event.fileUploaded',0),(35,1048585,4,10,'2022-03-08 00:54:59',1342177288,'submission.event.fileRevised',0),(36,515,4,10,'2022-03-08 00:55:01',1342177296,'submission.event.fileEdited',0),(37,1048585,4,10,'2022-03-08 00:55:01',1342177296,'submission.event.fileEdited',0),(38,1048585,4,10,'2022-03-08 00:55:04',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,4,10,'2022-03-08 00:55:05',268435457,'submission.event.submissionSubmitted',0),(40,1048585,4,3,'2022-03-08 00:55:11',268435462,'publication.event.published',0),(41,1048585,5,11,'2022-03-08 00:55:18',268435458,'submission.event.general.metadataUpdated',0),(42,515,5,11,'2022-03-08 00:55:27',1342177281,'submission.event.fileUploaded',0),(43,1048585,5,11,'2022-03-08 00:55:27',1342177288,'submission.event.fileRevised',0),(44,515,5,11,'2022-03-08 00:55:30',1342177296,'submission.event.fileEdited',0),(45,1048585,5,11,'2022-03-08 00:55:30',1342177296,'submission.event.fileEdited',0),(46,1048585,5,11,'2022-03-08 00:55:35',268435458,'submission.event.general.metadataUpdated',0),(47,1048585,5,11,'2022-03-08 00:55:36',268435457,'submission.event.submissionSubmitted',0),(48,1048585,5,3,'2022-03-08 00:55:41',268435462,'publication.event.published',0),(49,1048585,6,12,'2022-03-08 00:55:50',268435458,'submission.event.general.metadataUpdated',0),(50,515,6,12,'2022-03-08 00:55:59',1342177281,'submission.event.fileUploaded',0),(51,1048585,6,12,'2022-03-08 00:55:59',1342177288,'submission.event.fileRevised',0),(52,515,6,12,'2022-03-08 00:56:01',1342177296,'submission.event.fileEdited',0),(53,1048585,6,12,'2022-03-08 00:56:01',1342177296,'submission.event.fileEdited',0),(54,1048585,6,12,'2022-03-08 00:56:05',268435458,'submission.event.general.metadataUpdated',0),(55,1048585,6,12,'2022-03-08 00:56:05',268435457,'submission.event.submissionSubmitted',0),(56,1048585,6,3,'2022-03-08 00:56:11',268435462,'publication.event.published',0),(57,1048585,7,13,'2022-03-08 00:56:18',268435458,'submission.event.general.metadataUpdated',0),(58,515,7,13,'2022-03-08 00:56:27',1342177281,'submission.event.fileUploaded',0),(59,1048585,7,13,'2022-03-08 00:56:27',1342177288,'submission.event.fileRevised',0),(60,515,7,13,'2022-03-08 00:56:30',1342177296,'submission.event.fileEdited',0),(61,1048585,7,13,'2022-03-08 00:56:30',1342177296,'submission.event.fileEdited',0),(62,1048585,7,13,'2022-03-08 00:56:37',268435458,'submission.event.general.metadataUpdated',0),(63,1048585,7,13,'2022-03-08 00:56:38',268435457,'submission.event.submissionSubmitted',0),(64,1048585,7,3,'2022-03-08 00:56:44',268435462,'publication.event.published',0),(65,1048585,8,14,'2022-03-08 00:56:51',268435458,'submission.event.general.metadataUpdated',0),(66,515,8,14,'2022-03-08 00:57:00',1342177281,'submission.event.fileUploaded',0),(67,1048585,8,14,'2022-03-08 00:57:00',1342177288,'submission.event.fileRevised',0),(68,515,8,14,'2022-03-08 00:57:02',1342177296,'submission.event.fileEdited',0),(69,1048585,8,14,'2022-03-08 00:57:02',1342177296,'submission.event.fileEdited',0),(70,1048585,8,14,'2022-03-08 00:57:05',268435458,'submission.event.general.metadataUpdated',0),(71,1048585,8,14,'2022-03-08 00:57:06',268435457,'submission.event.submissionSubmitted',0),(72,1048585,8,3,'2022-03-08 00:57:12',268435462,'publication.event.published',0),(73,1048585,9,15,'2022-03-08 00:57:19',268435458,'submission.event.general.metadataUpdated',0),(74,515,9,15,'2022-03-08 00:57:28',1342177281,'submission.event.fileUploaded',0),(75,1048585,9,15,'2022-03-08 00:57:28',1342177288,'submission.event.fileRevised',0),(76,515,9,15,'2022-03-08 00:57:31',1342177296,'submission.event.fileEdited',0),(77,1048585,9,15,'2022-03-08 00:57:31',1342177296,'submission.event.fileEdited',0),(78,1048585,9,15,'2022-03-08 00:57:35',268435458,'submission.event.general.metadataUpdated',0),(79,1048585,9,15,'2022-03-08 00:57:36',268435457,'submission.event.submissionSubmitted',0),(80,1048585,9,3,'2022-03-08 00:57:42',268435462,'publication.event.published',0),(81,1048585,10,16,'2022-03-08 00:57:48',268435458,'submission.event.general.metadataUpdated',0),(82,515,10,16,'2022-03-08 00:57:57',1342177281,'submission.event.fileUploaded',0),(83,1048585,10,16,'2022-03-08 00:57:57',1342177288,'submission.event.fileRevised',0),(84,515,10,16,'2022-03-08 00:58:00',1342177296,'submission.event.fileEdited',0),(85,1048585,10,16,'2022-03-08 00:58:00',1342177296,'submission.event.fileEdited',0),(86,1048585,10,16,'2022-03-08 00:58:04',268435458,'submission.event.general.metadataUpdated',0),(87,1048585,10,16,'2022-03-08 00:58:05',268435457,'submission.event.submissionSubmitted',0),(88,1048585,10,3,'2022-03-08 00:58:11',268435462,'publication.event.published',0),(89,1048585,11,17,'2022-03-08 00:58:28',268435458,'submission.event.general.metadataUpdated',0),(90,515,11,17,'2022-03-08 00:58:37',1342177281,'submission.event.fileUploaded',0),(91,1048585,11,17,'2022-03-08 00:58:37',1342177288,'submission.event.fileRevised',0),(92,515,11,17,'2022-03-08 00:58:40',1342177296,'submission.event.fileEdited',0),(93,1048585,11,17,'2022-03-08 00:58:40',1342177296,'submission.event.fileEdited',0),(94,1048585,11,17,'2022-03-08 00:58:47',268435458,'submission.event.general.metadataUpdated',0),(95,1048585,11,17,'2022-03-08 00:58:48',268435457,'submission.event.submissionSubmitted',0),(96,1048585,11,3,'2022-03-08 00:58:54',268435462,'publication.event.published',0),(97,1048585,12,18,'2022-03-08 00:59:02',268435458,'submission.event.general.metadataUpdated',0),(98,515,12,18,'2022-03-08 00:59:11',1342177281,'submission.event.fileUploaded',0),(99,1048585,12,18,'2022-03-08 00:59:11',1342177288,'submission.event.fileRevised',0),(100,515,12,18,'2022-03-08 00:59:13',1342177296,'submission.event.fileEdited',0),(101,1048585,12,18,'2022-03-08 00:59:13',1342177296,'submission.event.fileEdited',0),(102,1048585,12,18,'2022-03-08 00:59:18',268435458,'submission.event.general.metadataUpdated',0),(103,1048585,12,18,'2022-03-08 00:59:19',268435457,'submission.event.submissionSubmitted',0),(104,1048585,12,3,'2022-03-08 00:59:25',268435462,'publication.event.published',0),(105,1048585,13,19,'2022-03-08 00:59:32',268435458,'submission.event.general.metadataUpdated',0),(106,515,13,19,'2022-03-08 00:59:41',1342177281,'submission.event.fileUploaded',0),(107,1048585,13,19,'2022-03-08 00:59:41',1342177288,'submission.event.fileRevised',0),(108,515,13,19,'2022-03-08 00:59:44',1342177296,'submission.event.fileEdited',0),(109,1048585,13,19,'2022-03-08 00:59:44',1342177296,'submission.event.fileEdited',0),(110,1048585,13,19,'2022-03-08 00:59:49',268435458,'submission.event.general.metadataUpdated',0),(111,1048585,13,19,'2022-03-08 00:59:50',268435457,'submission.event.submissionSubmitted',0),(112,1048585,13,3,'2022-03-08 00:59:55',268435462,'publication.event.published',0),(113,1048585,14,20,'2022-03-08 01:00:02',268435458,'submission.event.general.metadataUpdated',0),(114,515,14,20,'2022-03-08 01:00:11',1342177281,'submission.event.fileUploaded',0),(115,1048585,14,20,'2022-03-08 01:00:11',1342177288,'submission.event.fileRevised',0),(116,515,14,20,'2022-03-08 01:00:14',1342177296,'submission.event.fileEdited',0),(117,1048585,14,20,'2022-03-08 01:00:14',1342177296,'submission.event.fileEdited',0),(118,1048585,14,20,'2022-03-08 01:00:18',268435458,'submission.event.general.metadataUpdated',0),(119,1048585,14,20,'2022-03-08 01:00:19',268435457,'submission.event.submissionSubmitted',0),(120,1048585,14,3,'2022-03-08 01:00:25',268435462,'publication.event.published',0),(121,1048585,15,21,'2022-03-08 01:00:32',268435458,'submission.event.general.metadataUpdated',0),(122,515,15,21,'2022-03-08 01:00:41',1342177281,'submission.event.fileUploaded',0),(123,1048585,15,21,'2022-03-08 01:00:41',1342177288,'submission.event.fileRevised',0),(124,515,15,21,'2022-03-08 01:00:44',1342177296,'submission.event.fileEdited',0),(125,1048585,15,21,'2022-03-08 01:00:44',1342177296,'submission.event.fileEdited',0),(126,1048585,15,21,'2022-03-08 01:00:47',268435458,'submission.event.general.metadataUpdated',0),(127,1048585,15,21,'2022-03-08 01:00:48',268435457,'submission.event.submissionSubmitted',0),(128,1048585,15,3,'2022-03-08 01:00:54',268435462,'publication.event.published',0),(129,1048585,16,22,'2022-03-08 01:01:01',268435458,'submission.event.general.metadataUpdated',0),(130,515,16,22,'2022-03-08 01:01:10',1342177281,'submission.event.fileUploaded',0),(131,1048585,16,22,'2022-03-08 01:01:10',1342177288,'submission.event.fileRevised',0),(132,515,16,22,'2022-03-08 01:01:13',1342177296,'submission.event.fileEdited',0),(133,1048585,16,22,'2022-03-08 01:01:13',1342177296,'submission.event.fileEdited',0),(134,1048585,16,22,'2022-03-08 01:01:17',268435458,'submission.event.general.metadataUpdated',0),(135,1048585,16,22,'2022-03-08 01:01:18',268435457,'submission.event.submissionSubmitted',0),(136,1048585,16,3,'2022-03-08 01:01:24',268435462,'publication.event.published',0),(137,1048585,17,23,'2022-03-08 01:01:33',268435458,'submission.event.general.metadataUpdated',0),(138,515,17,23,'2022-03-08 01:01:42',1342177281,'submission.event.fileUploaded',0),(139,1048585,17,23,'2022-03-08 01:01:42',1342177288,'submission.event.fileRevised',0),(140,515,17,23,'2022-03-08 01:01:45',1342177296,'submission.event.fileEdited',0),(141,1048585,17,23,'2022-03-08 01:01:45',1342177296,'submission.event.fileEdited',0),(142,1048585,17,23,'2022-03-08 01:01:50',268435458,'submission.event.general.metadataUpdated',0),(143,1048585,17,23,'2022-03-08 01:01:50',268435457,'submission.event.submissionSubmitted',0),(144,1048585,17,3,'2022-03-08 01:01:56',268435462,'publication.event.published',0),(145,1048585,18,24,'2022-03-08 01:02:04',268435458,'submission.event.general.metadataUpdated',0),(146,515,18,24,'2022-03-08 01:02:13',1342177281,'submission.event.fileUploaded',0),(147,1048585,18,24,'2022-03-08 01:02:13',1342177288,'submission.event.fileRevised',0),(148,515,18,24,'2022-03-08 01:02:15',1342177296,'submission.event.fileEdited',0),(149,1048585,18,24,'2022-03-08 01:02:15',1342177296,'submission.event.fileEdited',0),(150,1048585,18,24,'2022-03-08 01:02:19',268435458,'submission.event.general.metadataUpdated',0),(151,1048585,18,24,'2022-03-08 01:02:20',268435457,'submission.event.submissionSubmitted',0),(152,1048585,18,3,'2022-03-08 01:02:26',268435462,'publication.event.published',0),(153,1048585,19,25,'2022-03-08 01:02:34',268435458,'submission.event.general.metadataUpdated',0),(154,515,19,25,'2022-03-08 01:02:43',1342177281,'submission.event.fileUploaded',0),(155,1048585,19,25,'2022-03-08 01:02:43',1342177288,'submission.event.fileRevised',0),(156,515,19,25,'2022-03-08 01:02:45',1342177296,'submission.event.fileEdited',0),(157,1048585,19,25,'2022-03-08 01:02:45',1342177296,'submission.event.fileEdited',0),(158,1048585,19,25,'2022-03-08 01:02:49',268435458,'submission.event.general.metadataUpdated',0),(159,1048585,19,25,'2022-03-08 01:02:50',268435457,'submission.event.submissionSubmitted',0),(160,1048585,19,3,'2022-03-08 01:02:55',268435462,'publication.event.published',0);
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
INSERT INTO `files` VALUES (1,'journals/1/articles/1/6226a8e46d5ee.pdf','application/pdf'),(2,'journals/1/articles/2/6226a8fb4a42e.pdf','application/pdf'),(3,'journals/1/articles/3/6226a929e7d11.pdf','application/pdf'),(4,'journals/1/articles/4/6226a9634b49f.pdf','application/pdf'),(5,'journals/1/articles/5/6226a97fa68a3.pdf','application/pdf'),(6,'journals/1/articles/6/6226a99f941d3.pdf','application/pdf'),(7,'journals/1/articles/7/6226a9bba4662.pdf','application/pdf'),(8,'journals/1/articles/8/6226a9dc17b12.pdf','application/pdf'),(9,'journals/1/articles/9/6226a9f8e899a.pdf','application/pdf'),(10,'journals/1/articles/10/6226aa15e9f22.pdf','application/pdf'),(11,'journals/1/articles/11/6226aa3dcd266.pdf','application/pdf'),(12,'journals/1/articles/12/6226aa5f557a6.pdf','application/pdf'),(13,'journals/1/articles/13/6226aa7dd3b64.pdf','application/pdf'),(14,'journals/1/articles/14/6226aa9bca4de.pdf','application/pdf'),(15,'journals/1/articles/15/6226aab9bd9fa.pdf','application/pdf'),(16,'journals/1/articles/16/6226aad6a768c.pdf','application/pdf'),(17,'journals/1/articles/17/6226aaf6c5193.pdf','application/pdf'),(18,'journals/1/articles/18/6226ab154a3d6.pdf','application/pdf'),(19,'journals/1/articles/19/6226ab3387219.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
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
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"http://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously posted.\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par un autre serveur. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\"},{\"order\":2,\"content\":\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\"},{\"order\":3,\"content\":\"Lorsque possible, les URL des références ont été fournies.\"},{\"order\":4,\"content\":\"##default.contextSettings.checklist.submissionAppearance##\"},{\"order\":5,\"content\":\"##default.contextSettings.checklist.bibliographicRequirements##\"}]',NULL);
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
  `enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2022-03-08 00:52:59',NULL,1048585,1),(4,1,0,3,16777223,'2022-03-08 00:52:59',NULL,1048585,1),(5,1,5,2,16777217,'2022-03-08 00:52:59',NULL,1048585,1),(7,1,4,2,16777217,'2022-03-08 00:52:59',NULL,1048585,1),(9,1,0,2,16777243,'2022-03-08 00:52:59',NULL,1048585,1),(10,1,0,2,16777245,'2022-03-08 00:52:59',NULL,1048585,1),(12,1,0,3,16777222,'2022-03-08 00:53:23',NULL,1048585,2),(13,1,0,3,16777223,'2022-03-08 00:53:23',NULL,1048585,2),(14,1,5,2,16777217,'2022-03-08 00:53:23',NULL,1048585,2),(16,1,4,2,16777217,'2022-03-08 00:53:23',NULL,1048585,2),(18,1,0,2,16777243,'2022-03-08 00:53:23',NULL,1048585,2),(19,1,0,2,16777245,'2022-03-08 00:53:23',NULL,1048585,2),(24,1,0,3,16777222,'2022-03-08 00:54:14',NULL,1048585,3),(25,1,0,3,16777223,'2022-03-08 00:54:14',NULL,1048585,3),(26,1,5,2,16777217,'2022-03-08 00:54:14',NULL,1048585,3),(28,1,4,2,16777217,'2022-03-08 00:54:14',NULL,1048585,3),(30,1,0,2,16777243,'2022-03-08 00:54:14',NULL,1048585,3),(31,1,0,2,16777245,'2022-03-08 00:54:14',NULL,1048585,3),(36,1,9,3,16777259,'2022-03-08 00:54:35',NULL,1048585,3),(38,1,5,3,16777259,'2022-03-08 00:54:35',NULL,1048585,3),(40,1,4,3,16777259,'2022-03-08 00:54:35',NULL,1048585,3),(42,1,0,3,16777222,'2022-03-08 00:55:05',NULL,1048585,4),(43,1,0,3,16777223,'2022-03-08 00:55:05',NULL,1048585,4),(44,1,5,2,16777217,'2022-03-08 00:55:05',NULL,1048585,4),(46,1,4,2,16777217,'2022-03-08 00:55:05',NULL,1048585,4),(48,1,0,2,16777243,'2022-03-08 00:55:05',NULL,1048585,4),(49,1,0,2,16777245,'2022-03-08 00:55:05',NULL,1048585,4),(52,1,0,3,16777222,'2022-03-08 00:55:36',NULL,1048585,5),(53,1,0,3,16777223,'2022-03-08 00:55:36',NULL,1048585,5),(54,1,5,2,16777217,'2022-03-08 00:55:36',NULL,1048585,5),(56,1,4,2,16777217,'2022-03-08 00:55:36',NULL,1048585,5),(58,1,0,2,16777243,'2022-03-08 00:55:36',NULL,1048585,5),(59,1,0,2,16777245,'2022-03-08 00:55:36',NULL,1048585,5),(62,1,0,3,16777222,'2022-03-08 00:56:05',NULL,1048585,6),(63,1,0,3,16777223,'2022-03-08 00:56:05',NULL,1048585,6),(64,1,5,2,16777217,'2022-03-08 00:56:05',NULL,1048585,6),(66,1,4,2,16777217,'2022-03-08 00:56:05',NULL,1048585,6),(68,1,0,2,16777243,'2022-03-08 00:56:05',NULL,1048585,6),(69,1,0,2,16777245,'2022-03-08 00:56:05',NULL,1048585,6),(73,1,0,3,16777222,'2022-03-08 00:56:38',NULL,1048585,7),(74,1,0,3,16777223,'2022-03-08 00:56:38',NULL,1048585,7),(75,1,5,2,16777217,'2022-03-08 00:56:38',NULL,1048585,7),(77,1,4,2,16777217,'2022-03-08 00:56:38',NULL,1048585,7),(79,1,0,2,16777243,'2022-03-08 00:56:38',NULL,1048585,7),(80,1,0,2,16777245,'2022-03-08 00:56:38',NULL,1048585,7),(84,1,0,3,16777222,'2022-03-08 00:57:06',NULL,1048585,8),(85,1,0,3,16777223,'2022-03-08 00:57:06',NULL,1048585,8),(86,1,5,2,16777217,'2022-03-08 00:57:06',NULL,1048585,8),(88,1,4,2,16777217,'2022-03-08 00:57:06',NULL,1048585,8),(90,1,0,2,16777243,'2022-03-08 00:57:06',NULL,1048585,8),(91,1,0,2,16777245,'2022-03-08 00:57:06',NULL,1048585,8),(94,1,0,3,16777222,'2022-03-08 00:57:36',NULL,1048585,9),(95,1,0,3,16777223,'2022-03-08 00:57:36',NULL,1048585,9),(96,1,5,2,16777217,'2022-03-08 00:57:36',NULL,1048585,9),(98,1,4,2,16777217,'2022-03-08 00:57:36',NULL,1048585,9),(100,1,0,2,16777243,'2022-03-08 00:57:36',NULL,1048585,9),(101,1,0,2,16777245,'2022-03-08 00:57:36',NULL,1048585,9),(104,1,0,3,16777222,'2022-03-08 00:58:05',NULL,1048585,10),(105,1,0,3,16777223,'2022-03-08 00:58:05',NULL,1048585,10),(106,1,5,2,16777217,'2022-03-08 00:58:05',NULL,1048585,10),(108,1,4,2,16777217,'2022-03-08 00:58:05',NULL,1048585,10),(110,1,0,2,16777243,'2022-03-08 00:58:05',NULL,1048585,10),(111,1,0,2,16777245,'2022-03-08 00:58:05',NULL,1048585,10),(115,1,0,3,16777222,'2022-03-08 00:58:48',NULL,1048585,11),(116,1,0,3,16777223,'2022-03-08 00:58:48',NULL,1048585,11),(117,1,5,2,16777217,'2022-03-08 00:58:48',NULL,1048585,11),(119,1,4,2,16777217,'2022-03-08 00:58:48',NULL,1048585,11),(121,1,0,2,16777243,'2022-03-08 00:58:48',NULL,1048585,11),(122,1,0,2,16777245,'2022-03-08 00:58:48',NULL,1048585,11),(126,1,0,3,16777222,'2022-03-08 00:59:19',NULL,1048585,12),(127,1,0,3,16777223,'2022-03-08 00:59:19',NULL,1048585,12),(128,1,5,2,16777217,'2022-03-08 00:59:19',NULL,1048585,12),(130,1,4,2,16777217,'2022-03-08 00:59:19',NULL,1048585,12),(132,1,0,2,16777243,'2022-03-08 00:59:19',NULL,1048585,12),(133,1,0,2,16777245,'2022-03-08 00:59:19',NULL,1048585,12),(136,1,0,3,16777222,'2022-03-08 00:59:49',NULL,1048585,13),(137,1,0,3,16777223,'2022-03-08 00:59:49',NULL,1048585,13),(138,1,5,2,16777217,'2022-03-08 00:59:49',NULL,1048585,13),(140,1,4,2,16777217,'2022-03-08 00:59:49',NULL,1048585,13),(142,1,0,2,16777243,'2022-03-08 00:59:50',NULL,1048585,13),(143,1,0,2,16777245,'2022-03-08 00:59:50',NULL,1048585,13),(146,1,0,3,16777222,'2022-03-08 01:00:19',NULL,1048585,14),(147,1,0,3,16777223,'2022-03-08 01:00:19',NULL,1048585,14),(148,1,5,2,16777217,'2022-03-08 01:00:19',NULL,1048585,14),(150,1,4,2,16777217,'2022-03-08 01:00:19',NULL,1048585,14),(152,1,0,2,16777243,'2022-03-08 01:00:19',NULL,1048585,14),(153,1,0,2,16777245,'2022-03-08 01:00:19',NULL,1048585,14),(156,1,0,3,16777222,'2022-03-08 01:00:48',NULL,1048585,15),(157,1,0,3,16777223,'2022-03-08 01:00:48',NULL,1048585,15),(158,1,5,2,16777217,'2022-03-08 01:00:48',NULL,1048585,15),(160,1,4,2,16777217,'2022-03-08 01:00:48',NULL,1048585,15),(162,1,0,2,16777243,'2022-03-08 01:00:48',NULL,1048585,15),(163,1,0,2,16777245,'2022-03-08 01:00:48',NULL,1048585,15),(166,1,0,3,16777222,'2022-03-08 01:01:18',NULL,1048585,16),(167,1,0,3,16777223,'2022-03-08 01:01:18',NULL,1048585,16),(168,1,5,2,16777217,'2022-03-08 01:01:18',NULL,1048585,16),(170,1,4,2,16777217,'2022-03-08 01:01:18',NULL,1048585,16),(172,1,0,2,16777243,'2022-03-08 01:01:18',NULL,1048585,16),(173,1,0,2,16777245,'2022-03-08 01:01:18',NULL,1048585,16),(176,1,0,3,16777222,'2022-03-08 01:01:50',NULL,1048585,17),(177,1,0,3,16777223,'2022-03-08 01:01:50',NULL,1048585,17),(178,1,5,2,16777217,'2022-03-08 01:01:50',NULL,1048585,17),(180,1,4,2,16777217,'2022-03-08 01:01:50',NULL,1048585,17),(182,1,0,2,16777243,'2022-03-08 01:01:50',NULL,1048585,17),(183,1,0,2,16777245,'2022-03-08 01:01:50',NULL,1048585,17),(186,1,0,3,16777222,'2022-03-08 01:02:19',NULL,1048585,18),(187,1,0,3,16777223,'2022-03-08 01:02:19',NULL,1048585,18),(188,1,5,2,16777217,'2022-03-08 01:02:19',NULL,1048585,18),(190,1,4,2,16777217,'2022-03-08 01:02:20',NULL,1048585,18),(192,1,0,2,16777243,'2022-03-08 01:02:20',NULL,1048585,18),(193,1,0,2,16777245,'2022-03-08 01:02:20',NULL,1048585,18),(196,1,0,3,16777222,'2022-03-08 01:02:49',NULL,1048585,19),(197,1,0,3,16777223,'2022-03-08 01:02:49',NULL,1048585,19),(198,1,5,2,16777217,'2022-03-08 01:02:49',NULL,1048585,19),(200,1,4,2,16777217,'2022-03-08 01:02:49',NULL,1048585,19),(202,1,0,2,16777243,'2022-03-08 01:02:50',NULL,1048585,19),(203,1,0,2,16777245,'2022-03-08 01:02:50',NULL,1048585,19),(205,0,3,1,3,'2022-03-08 01:02:55',NULL,0,0);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','6226a8633c3d7','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object');
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
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'','copyrightYear','2022'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','subtitle','A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'en_US','title','The Facets Of Job Satisfaction'),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'','categoryIds','[]'),(3,'','copyrightYear','2022'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'','copyrightYear','2022'),(4,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(4,'en_US','copyrightHolder','Craig Montgomerie'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Genetic transformation of forest trees'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'','copyrightYear','2022'),(6,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'','copyrightYear','2022'),(7,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Developing efficacy beliefs in the classroom'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'','copyrightYear','2022'),(8,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Traditions and Trends in the Study of the Commons'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'','copyrightYear','2022'),(9,'en_US','abstract','<p>None.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'','copyrightYear','2022'),(10,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'','copyrightYear','2022'),(11,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'','copyrightYear','2022'),(12,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Learning Sustainable Design through Service'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'','copyrightYear','2022'),(13,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'','copyrightYear','2022'),(15,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'','copyrightYear','2022'),(16,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Yam diseases and its management in Nigeria'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'','copyrightYear','2022'),(17,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','[]'),(18,'','copyrightYear','2022'),(18,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','[]'),(19,'','copyrightYear','2022'),(19,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title',''),(20,'','categoryIds','[]'),(20,'','copyrightYear','2022'),(20,'en_US','abstract','<p>None.</p>'),(20,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(20,'en_US','prefix',''),(20,'en_US','subtitle',''),(20,'en_US','title','Finocchiaro: Arguments About Arguments'),(20,'fr_CA','abstract',''),(20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(20,'fr_CA','prefix',''),(20,'fr_CA','subtitle',''),(20,'fr_CA','title','');
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
  `locale` varchar(14) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2022-03-08 00:52:58',NULL,1,1,1,1,NULL,1),(2,0,'2022-03-08','2022-03-08 00:53:45',NULL,2,1,2,3,NULL,1),(3,0,'2022-03-08','2022-03-08 00:54:32',NULL,4,1,3,3,NULL,1),(4,0,'2022-03-08','2022-03-08 00:54:42',NULL,6,1,3,3,NULL,2),(5,0,'2022-03-08','2022-03-08 00:55:11',NULL,8,1,4,3,NULL,1),(6,0,'2022-03-08','2022-03-08 00:55:41',NULL,9,1,5,3,NULL,1),(7,0,'2022-03-08','2022-03-08 00:56:11',NULL,10,1,6,3,NULL,1),(8,0,'2022-03-08','2022-03-08 00:56:44',NULL,11,1,7,3,NULL,1),(9,0,'2022-03-08','2022-03-08 00:57:12',NULL,13,1,8,3,NULL,1),(10,0,'2022-03-08','2022-03-08 00:57:41',NULL,14,1,9,3,NULL,1),(11,0,'2022-03-08','2022-03-08 00:58:11',NULL,15,1,10,3,NULL,1),(12,0,'2022-03-08','2022-03-08 00:58:54',NULL,16,1,11,3,NULL,1),(13,0,'2022-03-08','2022-03-08 00:59:25',NULL,18,1,12,3,NULL,1),(14,0,'2022-03-08','2022-03-08 00:59:55',NULL,19,1,13,3,NULL,1),(15,0,'2022-03-08','2022-03-08 01:00:24',NULL,20,1,14,3,NULL,1),(16,0,'2022-03-08','2022-03-08 01:00:54',NULL,21,1,15,3,NULL,1),(17,0,'2022-03-08','2022-03-08 01:01:24',NULL,22,1,16,3,NULL,1),(18,0,'2022-03-08','2022-03-08 01:01:56',NULL,23,1,17,3,NULL,1),(19,0,'2022-03-08','2022-03-08 01:02:26',NULL,24,1,18,3,NULL,1),(20,0,'2022-03-08','2022-03-08 01:02:55',NULL,25,1,19,3,NULL,1);
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
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.StatisticsReport','2022-03-08 00:50:31'),('plugins.generic.usageStats.UsageStatsLoader','2022-03-08 00:50:31');
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
  `journal_id` bigint(20) NOT NULL,
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
  KEY `sections_journal_id` (`journal_id`)
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
INSERT INTO `sessions` VALUES ('0qds7nnm30ro1p2qd9ka0vbm7h',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700630,1646700642,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646700642;s:5:\"token\";s:32:\"4151be0aacd46a609edfc0b1cf37a9d6\";}','localhost'),('2jqqn0p189q71hsoissevkfg4l',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701063,1646701092,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701092;s:5:\"token\";s:32:\"7873fe2deb37abc20124443c5c13e97b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3pngmkpneh0itqt6ntv20aoul3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701318,1646701347,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701347;s:5:\"token\";s:32:\"64aec4147f10b08fd38ab97d867a9637\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('4tu7jrap65jqlpb5s09vt10d4n',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700673,1646700722,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1646700722;s:5:\"token\";s:32:\"2dbf2b4a465a67be58473e1e1addc56c\";}','localhost'),('878f3ef3oe9iuo6fhg2tpqsn4u',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701103,1646701135,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701135;s:5:\"token\";s:32:\"519acc4c32be9b50754f5211835e07a7\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('8cb9214mnjb0nt653aq67askj0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700973,1646701004,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701004;s:5:\"token\";s:32:\"1662c8357ab87fefc06c1e1b49167aaf\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('8ev55a1r1gjt2id1vmfj4kr3oo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700628,1646700628,0,'','localhost'),('9ec764h8ft1pur02sol5gapao0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700945,1646700972,0,'csrf|a:2:{s:9:\"timestamp\";i:1646700972;s:5:\"token\";s:32:\"adc2f48c0582bc091a93881741c4e1a9\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('bg2757botclq4kcmlcksta626h',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700658,1646700663,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646700663;s:5:\"token\";s:32:\"d3a2ba4b7ba772dccb1ca238f0e94f4f\";}','localhost'),('c19co8idhl6tau55m4bhg2n80j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700781,1646700822,0,'csrf|a:2:{s:9:\"timestamp\";i:1646700821;s:5:\"token\";s:32:\"78122386e8136674fdbc497fced55b0e\";}username|s:8:\"ckwantes\";','localhost'),('df3ptqu71m0j3mb9sk8tqtknfh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701288,1646701317,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701317;s:5:\"token\";s:32:\"c8f825e86123f698bda5f588f6a1c9a9\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('dffcm5jpjketbk4nuekhq31e64',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700827,1646700883,0,'csrf|a:2:{s:9:\"timestamp\";i:1646700883;s:5:\"token\";s:32:\"d5224dd35e5d87976621c3dfecef4cd8\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ekee53b3bpmdjfkhqopn72bblt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701256,1646701284,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701284;s:5:\"token\";s:32:\"c3cce63059f9192af70c078996a17eec\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('hh0qtal56qvl1stjs38utu08eb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700913,1646700941,0,'csrf|a:2:{s:9:\"timestamp\";i:1646700941;s:5:\"token\";s:32:\"183cadd56d1b4b67be6def5b65fdec3a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('jppreevthgsirfmcvvmkv2plb6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701227,1646701254,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701254;s:5:\"token\";s:32:\"5d61d8fd3184591f9faa1d80a39d28bc\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('keb0kjn2686gbfgl05gbj8r1dq',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700664,1646700671,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646700671;s:5:\"token\";s:32:\"3484d907a0ef086f634fec3490bd94db\";}','localhost'),('kmi69b10skbufme9f5rafdso5l',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700643,1646700658,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646700658;s:5:\"token\";s:32:\"2d10223740fd218511e0e4bd32f07a62\";}','localhost'),('lgmvejcu8k7ep1v2uimefssh2s',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701136,1646701165,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701165;s:5:\"token\";s:32:\"237e5d4f6ebed00addf34d70dd812575\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('nnmpcgjglgcrmlk2tqiihe91n3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700822,1646700825,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1646700825;s:5:\"token\";s:32:\"8a3ee6956e1de07b6bd0894dc9e25342\";}','localhost'),('no3m26j6scbt1ho091krne6pv9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700885,1646700912,0,'csrf|a:2:{s:9:\"timestamp\";i:1646700912;s:5:\"token\";s:32:\"3c3ae5365fcb8dbe5684a5fe340ca93e\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('o90bb5msec9jsteg9vevf7tvt9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701167,1646701195,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701195;s:5:\"token\";s:32:\"93338d3d872f955f32dde8d9ad13bbe0\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('p4o23gru7f9tngde7civv0jb1m',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700724,1646700730,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646700730;s:5:\"token\";s:32:\"48306fb23b65af05f7ada7bbb1293cef\";}','localhost'),('p56tgcshed8c7htcgvdm6rbchr',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700757,1646700779,0,'csrf|a:2:{s:9:\"timestamp\";i:1646700779;s:5:\"token\";s:32:\"b4d8b624cc45d7beb71460b6cdb58de9\";}username|s:7:\"ccorino\";userId|i:7;','localhost'),('r1akc56s1td9aklns15skj7a89',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701197,1646701225,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701225;s:5:\"token\";s:32:\"9bc1756341e2456fcc3fb11bf8035aed\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('sj17ka9js4hf3lsujrurcr6kua',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701349,1646701376,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701376;s:5:\"token\";s:32:\"a61d7fd96909e867d5b7e959c953c3a5\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('uj15foh49qm63e6et6ga4rvaoo',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646700730,1646700756,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646700756;s:5:\"token\";s:32:\"14341b925c8df8f43965442aff061b8c\";}','localhost'),('vnjeij6j81lftf18gfdp7sur8d',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701034,1646701061,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701061;s:5:\"token\";s:32:\"c465a09b259d6e356d99339d28ec06d6\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('vtjjnmebq12p7dogudokeo8jrb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646701005,1646701032,0,'csrf|a:2:{s:9:\"timestamp\";i:1646701033;s:5:\"token\";s:32:\"ed15569fefb17b561ddf1698f27d5e32\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2022-03-08 00:52:43',0,1),(2,1,3,5,'2022-03-08 00:52:59',0,1),(3,1,3,4,'2022-03-08 00:52:59',0,1),(4,2,4,8,'2022-03-08 00:53:06',0,1),(5,2,3,5,'2022-03-08 00:53:23',0,1),(6,2,3,4,'2022-03-08 00:53:23',0,1),(7,3,4,9,'2022-03-08 00:53:52',0,1),(8,3,3,5,'2022-03-08 00:54:14',0,1),(9,3,3,4,'2022-03-08 00:54:14',0,1),(10,4,4,10,'2022-03-08 00:54:50',0,1),(11,4,3,5,'2022-03-08 00:55:05',0,1),(12,4,3,4,'2022-03-08 00:55:05',0,1),(13,5,4,11,'2022-03-08 00:55:18',0,1),(14,5,3,5,'2022-03-08 00:55:35',0,1),(15,5,3,4,'2022-03-08 00:55:35',0,1),(16,6,4,12,'2022-03-08 00:55:50',0,1),(17,6,3,5,'2022-03-08 00:56:05',0,1),(18,6,3,4,'2022-03-08 00:56:05',0,1),(19,7,4,13,'2022-03-08 00:56:18',0,1),(20,7,3,5,'2022-03-08 00:56:38',0,1),(21,7,3,4,'2022-03-08 00:56:38',0,1),(22,8,4,14,'2022-03-08 00:56:51',0,1),(23,8,3,5,'2022-03-08 00:57:06',0,1),(24,8,3,4,'2022-03-08 00:57:06',0,1),(25,9,4,15,'2022-03-08 00:57:19',0,1),(26,9,3,5,'2022-03-08 00:57:35',0,1),(27,9,3,4,'2022-03-08 00:57:36',0,1),(28,10,4,16,'2022-03-08 00:57:48',0,1),(29,10,3,5,'2022-03-08 00:58:05',0,1),(30,10,3,4,'2022-03-08 00:58:05',0,1),(31,11,4,17,'2022-03-08 00:58:28',0,1),(32,11,3,5,'2022-03-08 00:58:48',0,1),(33,11,3,4,'2022-03-08 00:58:48',0,1),(34,12,4,18,'2022-03-08 00:59:02',0,1),(35,12,3,5,'2022-03-08 00:59:19',0,1),(36,12,3,4,'2022-03-08 00:59:19',0,1),(37,13,4,19,'2022-03-08 00:59:32',0,1),(38,13,3,5,'2022-03-08 00:59:49',0,1),(39,13,3,4,'2022-03-08 00:59:49',0,1),(40,14,4,20,'2022-03-08 01:00:02',0,1),(41,14,3,5,'2022-03-08 01:00:19',0,1),(42,14,3,4,'2022-03-08 01:00:19',0,1),(43,15,4,21,'2022-03-08 01:00:32',0,1),(44,15,3,5,'2022-03-08 01:00:48',0,1),(45,15,3,4,'2022-03-08 01:00:48',0,1),(46,16,4,22,'2022-03-08 01:01:01',0,1),(47,16,3,5,'2022-03-08 01:01:18',0,1),(48,16,3,4,'2022-03-08 01:01:18',0,1),(49,17,4,23,'2022-03-08 01:01:33',0,1),(50,17,3,5,'2022-03-08 01:01:50',0,1),(51,17,3,4,'2022-03-08 01:01:50',0,1),(52,18,4,24,'2022-03-08 01:02:04',0,1),(53,18,3,5,'2022-03-08 01:02:19',0,1),(54,18,3,4,'2022-03-08 01:02:19',0,1),(55,19,4,25,'2022-03-08 01:02:34',0,1),(56,19,3,5,'2022-03-08 01:02:49',0,1),(57,19,3,4,'2022-03-08 01:02:49',0,1);
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
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:52:52','2022-03-08 00:52:54',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:53:15','2022-03-08 00:53:17',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:54:01','2022-03-08 00:54:04',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:54:59','2022-03-08 00:55:01',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:55:27','2022-03-08 00:55:30',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:55:59','2022-03-08 00:56:01',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:56:27','2022-03-08 00:56:30',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:57:00','2022-03-08 00:57:02',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:57:28','2022-03-08 00:57:31',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:57:57','2022-03-08 00:58:00',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:58:37','2022-03-08 00:58:40',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:59:11','2022-03-08 00:59:13',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2022-03-08 00:59:41','2022-03-08 00:59:44',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2022-03-08 01:00:11','2022-03-08 01:00:14',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2022-03-08 01:00:41','2022-03-08 01:00:44',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2022-03-08 01:01:10','2022-03-08 01:01:13',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2022-03-08 01:01:42','2022-03-08 01:01:45',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2022-03-08 01:02:13','2022-03-08 01:02:15',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2022-03-08 01:02:43','2022-03-08 01:02:45',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (526,'11-'),(667,'21st'),(351,'aalborg'),(799,'abattoir'),(838,'abnormal'),(435,'academic'),(7,'academy'),(534,'accepted'),(400,'accompanying'),(718,'achieving'),(478,'acid'),(551,'acids'),(254,'action'),(938,'actor'),(931,'actors'),(387,'added'),(432,'address'),(482,'adipose'),(133,'administered'),(363,'administration'),(753,'adopted'),(754,'advocated'),(827,'affected'),(29,'affects'),(795,'african'),(937,'agree'),(860,'aid'),(471,'aim'),(418,'al-khafaji'),(71,'alberta'),(145,'alexandria'),(656,'analyses'),(40,'analysis'),(509,'analyzed'),(507,'animals'),(731,'anthracnose'),(903,'antibiotics'),(874,'antimicrobial'),(587,'antonio'),(617,'appears'),(154,'applications'),(362,'applied'),(564,'aquifer'),(17,'archival'),(651,'areas'),(170,'argument'),(956,'arguments'),(772,'ash'),(472,'assess'),(556,'assessed'),(612,'assessments'),(663,'atlantic'),(19,'attitude'),(462,'australian'),(861,'authorities'),(414,'authority'),(354,'availability'),(487,'averaging'),(503,'backfat'),(169,'background'),(721,'baiyewu'),(786,'barcelona'),(673,'barriers'),(486,'barrows'),(568,'barton'),(415,'based'),(408,'basin'),(373,'basins'),(675,'basis'),(611,'bearings'),(798,'beef'),(103,'began'),(182,'beliefs'),(697,'belonging'),(35,'benchmark'),(49,'benefit'),(601,'blanco'),(55,'brazil'),(413,'brazos'),(823,'breeds'),(626,'buda'),(811,'bulls'),(464,'butyrate'),(524,'c18'),(528,'c20'),(105,'called'),(792,'cameroon'),(99,'canada'),(384,'capabilities'),(314,'cape'),(825,'carcass'),(806,'carcasses'),(555,'carefully'),(688,'carried'),(662,'case'),(911,'cases'),(829,'category'),(1,'catherine'),(790,'cattle'),(794,'central'),(668,'century'),(615,'cfs'),(457,'challenges'),(637,'change'),(444,'chapter'),(805,'characteristics'),(216,'children'),(54,'china'),(778,'chips'),(461,'christopher'),(525,'cis'),(221,'citizens'),(257,'citizenship'),(189,'claim'),(178,'claims'),(85,'classroom'),(910,'clinical'),(705,'close'),(511,'close-'),(664,'coast'),(894,'coli'),(878,'coliforms'),(292,'colleagues'),(505,'collected'),(590,'collection'),(940,'collective'),(936,'collectively'),(60,'collectivistic'),(211,'college'),(203,'com-mitments'),(727,'combating'),(183,'commitments'),(193,'common'),(266,'commons'),(44,'communication'),(699,'communities'),(682,'community'),(13,'comparative'),(930,'compare'),(38,'compared'),(50,'comparisons'),(197,'competencies'),(33,'compiled'),(403,'complete'),(856,'completely'),(381,'complex'),(510,'composition'),(75,'computer'),(907,'concentration'),(585,'concept'),(329,'conclusive'),(853,'condemned'),(395,'condensed'),(352,'condensing'),(570,'conditions'),(231,'conducted'),(219,'confident'),(330,'conflicting'),(919,'conjugative'),(646,'connection'),(562,'connectivity'),(945,'consensus'),(737,'considered'),(56,'consistent'),(192,'consists'),(536,'consortium'),(15,'construct'),(409,'contained'),(291,'contemporary'),(516,'content'),(66,'context'),(653,'continual'),(222,'continue'),(345,'continuous'),(684,'contributing'),(949,'contributors'),(866,'control'),(454,'coordinated'),(108,'core'),(212,'cork'),(340,'corporate'),(695,'council'),(32,'countries'),(711,'country'),(109,'courses'),(284,'coward'),(836,'cows'),(243,'cps'),(69,'craig'),(34,'create'),(240,'creative'),(600,'creek'),(171,'critique'),(756,'crop'),(779,'cubes'),(764,'cultivars'),(65,'cultural'),(28,'culture'),(700,'cultures'),(954,'cuny'),(102,'curriculum'),(164,'dana'),(658,'daniel'),(18,'data'),(396,'dataset'),(378,'datasets'),(272,'decades1'),(932,'decide'),(946,'decision'),(252,'decision-making'),(383,'decision-support'),(344,'decisions'),(174,'deep'),(691,'defining'),(26,'degree'),(692,'delivering'),(650,'demands'),(94,'demonstrate'),(686,'describes'),(423,'design'),(660,'designing'),(762,'destruction'),(743,'devastating'),(412,'develop'),(385,'developed'),(213,'developing'),(121,'development'),(304,'developments'),(143,'diaga'),(547,'dietary'),(492,'diets'),(543,'differed'),(904,'difference'),(204,'difficult'),(943,'difficulty'),(144,'diouf'),(459,'directions'),(175,'disagreement'),(275,'disciplines'),(636,'discontinuity'),(153,'discussed'),(693,'discussions'),(736,'disease'),(724,'diseases'),(604,'dissipated'),(273,'distinguished'),(850,'distress'),(343,'distribution'),(207,'diverge'),(671,'diversity'),(586,'divide'),(334,'dividend'),(318,'dividends'),(209,'domatilia'),(581,'downstream'),(598,'drainage'),(635,'dramatic'),(862,'draw'),(569,'drought'),(610,'droughts'),(741,'dry'),(537,'dry-cured'),(857,'due'),(639,'dynamic'),(332,'economists'),(527,'ecosenoic'),(840,'ectoparasites'),(748,'edible'),(88,'education'),(563,'edwards'),(68,'effect'),(46,'effectiveness'),(249,'effects'),(214,'efficacy'),(45,'efficiency'),(713,'egalitarianism'),(258,'elinor'),(670,'embracing'),(437,'emerging'),(696,'emphasises'),(320,'empirical'),(141,'employed'),(21,'employees'),(920,'encoding'),(839,'encountered'),(578,'endangered'),(371,'endeavors'),(155,'engineering'),(441,'engineers'),(238,'enhance'),(390,'enhanced'),(255,'enhancing'),(846,'enlarged'),(887,'enterobacteriacea'),(425,'environmental'),(929,'environments'),(215,'equip'),(16,'equivalence'),(893,'escherichia'),(584,'established'),(707,'ethnic'),(708,'ethno-linguistic'),(349,'evaluation'),(321,'evidence'),(25,'examine'),(137,'examined'),(681,'examines'),(67,'exerts'),(52,'exhibited'),(458,'exist'),(78,'existing'),(595,'exists'),(369,'expanding'),(267,'expe-'),(443,'experiences'),(161,'expression'),(621,'extended'),(623,'extensive'),(305,'fabio'),(9,'facets'),(39,'factor'),(42,'factors'),(889,'faeces'),(431,'failed'),(758,'fallowing'),(475,'fat'),(841,'fatigue'),(498,'fats'),(477,'fatty'),(386,'features'),(500,'fed'),(729,'field'),(890,'fifteen'),(484,'fifty-four'),(776,'finally'),(331,'financial'),(342,'financing'),(191,'find'),(58,'findings'),(8,'finland'),(955,'finocchiaro'),(327,'firm'),(609,'flow'),(616,'flowing'),(407,'flows'),(855,'flukes'),(356,'focus'),(177,'fogelin'),(172,'fogelins'),(188,'fogelin’s'),(557,'food'),(148,'forest'),(773,'found'),(181,'framework'),(261,'frank'),(185,'fruitfully'),(820,'fulani'),(346,'function'),(774,'fungal'),(843,'fungal-like'),(325,'future'),(677,'gender'),(788,'general'),(160,'genes'),(146,'genetic'),(669,'genuinely'),(770,'gins'),(128,'goal'),(951,'goverance'),(159,'governing'),(97,'government'),(95,'grade'),(629,'gradient'),(638,'gradients'),(224,'graduation'),(594,'groundwater'),(593,'groundwater-level'),(917,'group'),(389,'growing'),(270,'growth'),(819,'gudali'),(335,'guidance'),(814,'guinea'),(538,'ham'),(195,'hand'),(308,'hansen'),(760,'healthy'),(480,'heavy'),(815,'high'),(62,'higher'),(514,'highest'),(714,'highlights'),(140,'hired'),(123,'hiring'),(882,'hospital'),(888,'human'),(643,'hydraulic'),(592,'hydrogeologic'),(561,'hydrologic'),(606,'hydrologically'),(446,'identification'),(892,'identified'),(580,'immediately'),(399,'impacts'),(116,'implement'),(101,'implementation'),(935,'implemented'),(80,'implications'),(715,'importance'),(865,'improve'),(465,'improves'),(156,'improving'),(703,'include'),(411,'included'),(755,'includes'),(649,'increased'),(548,'increases'),(540,'index'),(260,'indiana'),(698,'individual'),(37,'individually'),(59,'individuals'),(763,'infected'),(775,'infection'),(881,'infections'),(473,'influence'),(618,'influenced'),(642,'influences'),(106,'information'),(220,'informed'),(107,'infused'),(533,'ing'),(645,'inherent'),(906,'inhibitory'),(91,'initiatives'),(393,'input'),(927,'institutions'),(237,'instruction'),(434,'integrates'),(142,'integrating'),(83,'integration'),(303,'intellectual'),(690,'intention'),(661,'intercultural'),(685,'interculturality'),(297,'interest'),(179,'interlocutors'),(453,'internships'),(348,'intuitive'),(167,'investigating'),(341,'investment'),(338,'investors'),(251,'involve'),(706,'involvement'),(445,'involves'),(531,'iodine'),(884,'iran'),(73,'irvine'),(883,'isfahan'),(491,'isoenergetic'),(879,'isolated'),(891,'isolates'),(87,'issue'),(802,'january'),(10,'job'),(312,'john'),(118,'jurisdictions'),(872,'karbasizaed'),(417,'karim'),(6,'kekkonen'),(896,'kelebsiella'),(225,'key'),(217,'knowledge'),(560,'kumiega'),(2,'kwantes'),(625,'kyle'),(263,'laerhoven'),(842,'lameness'),(676,'language'),(380,'large'),(430,'largely'),(801,'largest'),(719,'lasting'),(541,'layers'),(253,'leads'),(228,'learn'),(223,'learners'),(114,'learning'),(451,'led'),(460,'leo'),(845,'lesions'),(96,'level'),(530,'levels'),(439,'leveraged'),(456,'limitations'),(529,'linoleic'),(523,'linolenic'),(559,'lise'),(319,'literature'),(781,'live'),(854,'liver'),(768,'locally'),(276,'long'),(474,'long-term'),(605,'longer'),(808,'longissimus'),(285,'los'),(739,'losses'),(628,'low'),(520,'lowest'),(859,'lungs'),(847,'lymph'),(287,'mackenzie'),(769,'made'),(495,'maize'),(86,'major'),(280,'managed'),(336,'management'),(100,'mandated'),(803,'march'),(566,'marcos'),(420,'margaret'),(72,'mark'),(744,'marked'),(830,'markedly'),(747,'marketable'),(489,'matched'),(761,'material'),(822,'mbororo'),(245,'means'),(832,'meat'),(158,'mechanisms'),(127,'meet'),(728,'menace'),(666,'met'),(875,'metal'),(912,'metals'),(394,'methodology'),(908,'mic'),(290,'mid-1980s'),(712,'militate'),(905,'minimal'),(281,'mismanaged'),(199,'mistakenly'),(410,'model'),(359,'modeling'),(355,'models'),(416,'modifying'),(654,'monitoring'),(521,'monounsaturated'),(70,'montgomerie'),(782,'months'),(421,'morse'),(734,'mosaic'),(246,'motivate'),(256,'motivation'),(522,'mufa'),(926,'multi-level'),(922,'multidrug-resistance'),(680,'multiethnic'),(679,'multilingual'),(23,'multinational'),(902,'multiple'),(313,'mwandenga'),(722,'nairobi'),(27,'national'),(36,'nations'),(30,'nature'),(379,'necessarily'),(652,'necessitates'),(928,'networked'),(139,'newly'),(665,'nicaragua'),(725,'nigeria'),(12,'nine-nation'),(848,'nodes'),(851,'nodular'),(632,'non-drought'),(603,'normal'),(634,'north'),(880,'nosocomial'),(350,'novak'),(614,'numerical'),(227,'nurturing'),(787,'nutrition'),(552,'nutritional'),(868,'observed'),(328,'offer'),(496,'oil'),(599,'onion'),(184,'order'),(24,'organization'),(43,'organizational'),(449,'organizations'),(852,'organs'),(813,'origin'),(402,'original'),(259,'ostrom'),(672,'overcome'),(306,'paglieri'),(129,'paper'),(812,'parameters'),(535,'parma'),(201,'part'),(229,'participate'),(687,'participatory'),(448,'partner'),(271,'past'),(657,'patricia'),(918,'pattern'),(885,'patterns'),(716,'pedagogy'),(674,'people'),(206,'people’s'),(899,'percent'),(466,'performance'),(469,'period'),(622,'periods'),(365,'permit'),(376,'permits'),(48,'personal'),(915,'persons'),(947,'perverse'),(165,'phillips'),(481,'pig'),(468,'piglets'),(513,'pigs'),(309,'pinto'),(283,'places'),(576,'plan'),(368,'planning'),(759,'planting'),(163,'plants'),(877,'plasmid'),(897,'pneumoniae'),(81,'policy'),(518,'polyunsaturated'),(300,'pool'),(648,'population'),(749,'portions'),(248,'positive'),(901,'possess'),(337,'potential'),(630,'potentiometric'),(709,'power'),(333,'practical'),(82,'practice'),(804,'pre-slaughter'),(824,'predominant'),(837,'pregnant'),(442,'present'),(234,'presented'),(726,'presents'),(867,'prevent'),(57,'previous'),(572,'primary'),(427,'principles'),(196,'pro-cedural'),(241,'problem'),(942,'problematic'),(202,'procedural'),(777,'processing'),(818,'production'),(190,'productive'),(120,'professional'),(479,'profile'),(886,'profiles'),(591,'program'),(863,'programmes'),(152,'progress'),(452,'project-based'),(447,'projects'),(869,'promote'),(717,'promoting'),(644,'properties'),(302,'property'),(549,'proportion'),(326,'prospects'),(577,'protect'),(382,'provide'),(98,'province'),(90,'provincial'),(134,'public'),(519,'pufa'),(624,'pumping'),(948,'punishing'),(186,'pursue'),(553,'quality'),(746,'quantity'),(582,'questions'),(583,'raised'),(720,'rana'),(488,'randomized'),(497,'rapeseed'),(647,'rapid'),(136,'rate'),(944,'reaching'),(828,'rearing'),(310,'reason'),(151,'recent'),(619,'recharge'),(311,'reclaimed'),(807,'recorded'),(921,'recovered'),(821,'red'),(745,'reduction'),(751,'reductions'),(512,'reflected'),(375,'reflects'),(187,'refute'),(732,'regarded'),(296,'region'),(366,'regional'),(298,'regions'),(710,'relations'),(916,'relationship'),(347,'rely'),(895,'remaining'),(401,'removed'),(61,'report'),(810,'represent'),(793,'representative'),(406,'represents'),(138,'require'),(115,'required'),(77,'requirements'),(63,'research'),(289,'researchers'),(398,'reservoir'),(377,'reservoirs'),(876,'resistance'),(765,'resistant'),(301,'resource'),(279,'resources'),(112,'respect'),(849,'respiratory'),(135,'response'),(31,'responses'),(608,'result'),(532,'result-'),(131,'results'),(41,'revealed'),(150,'review'),(286,'reyes'),(268,'rienced'),(364,'rights'),(372,'river'),(176,'robert'),(226,'role'),(307,'rome'),(784,'rosanna'),(785,'rossi'),(742,'rot'),(757,'rotation'),(361,'routinely'),(950,'ruled'),(797,'safety'),(504,'samples'),(565,'san'),(933,'sanction'),(939,'sanctioned'),(941,'sanctioning'),(934,'sanctions'),(11,'satisfaction'),(53,'satisfied'),(515,'saturated'),(816,'savannah'),(274,'scholars'),(117,'school'),(294,'sec-'),(558,'security'),(588,'segments'),(397,'selected'),(218,'self-belief'),(239,'self-efficacy'),(925,'self-organization'),(607,'separated'),(104,'september'),(571,'serves'),(424,'service'),(433,'service-learning'),(404,'set'),(436,'setting'),(898,'seventy'),(738,'severe'),(517,'sfa'),(180,'share'),(168,'shared'),(339,'shareholding'),(780,'shelf'),(546,'show'),(834,'showed'),(235,'showing'),(247,'shown'),(627,'shows'),(324,'signal'),(322,'signaling'),(316,'signalling'),(913,'significant'),(544,'significantly'),(833,'similar'),(391,'simplifying'),(392,'simulation'),(613,'simulations'),(22,'single'),(789,'situation'),(76,'skill'),(92,'skills'),(844,'skin'),(502,'slaughter'),(791,'slaughtered'),(501,'slaughtering'),(633,'slopes'),(232,'social'),(230,'society'),(463,'sodium'),(210,'sokoloff'),(242,'solving'),(575,'source'),(574,'south-central'),(579,'species'),(278,'specific'),(110,'specifies'),(733,'spread'),(567,'springs'),(689,'staff'),(124,'standards'),(419,'stanford'),(374,'state'),(367,'statewide'),(730,'storage'),(752,'stored'),(900,'strains'),(122,'strategies'),(236,'strategy'),(405,'streamflows'),(864,'strengthen'),(641,'structural'),(51,'structures'),(450,'student'),(93,'students'),(277,'studied'),(233,'studies'),(14,'study'),(796,'sub-region'),(542,'subcutaneous'),(269,'substantial'),(455,'successful'),(64,'suggest'),(323,'suggests'),(130,'summarizes'),(499,'supplement-'),(476,'supplementation'),(493,'supplemented'),(573,'supply'),(47,'support'),(198,'supporters'),(702,'supporting'),(597,'surface'),(20,'survey'),(426,'sustainability'),(422,'sustainable'),(360,'system'),(357,'systems'),(678,'takes'),(494,'tallow'),(244,'taught'),(440,'teach'),(79,'teachers'),(126,'teachers’'),(554,'technological'),(84,'technology'),(113,'technology”'),(766,'tecto'),(873,'tehran'),(132,'telephone'),(506,'ten'),(358,'texas'),(317,'theory'),(173,'thesis'),(767,'thiabendazole'),(809,'thoracis'),(701,'time'),(282,'times'),(483,'tissue'),(89,'today'),(914,'tolerant'),(438,'tool'),(194,'topic'),(429,'topics'),(166,'toronto'),(295,'tors'),(835,'toughest'),(315,'town'),(870,'trade'),(264,'traditions'),(147,'transformation'),(817,'transhumance'),(508,'treatment'),(545,'treatments'),(149,'trees'),(655,'trend'),(265,'trends'),(858,'tuberculosis'),(750,'tubers'),(119,'turning'),(388,'types'),(157,'understanding'),(3,'university'),(704,'university’s'),(640,'unknown'),(539,'unsaturation'),(125,'upgrade'),(205,'uphold'),(683,'uraccan'),(5,'urho'),(871,'vajiheh'),(923,'valerie'),(250,'valuable'),(909,'values'),(262,'van'),(631,'variation'),(831,'varied'),(370,'variety'),(596,'vicinity'),(74,'victoria'),(200,'view'),(735,'virus'),(428,'vital'),(620,'vulnerable'),(694,'wales'),(353,'water'),(589,'water-level'),(467,'weaned'),(470,'weaning'),(826,'weight'),(490,'weights'),(602,'wet'),(485,'white'),(208,'widely'),(924,'williamson'),(4,'windsor'),(288,'wittfogel'),(659,'wolverhampton'),(771,'wood'),(953,'woods'),(162,'woody'),(293,'work'),(299,'world'),(723,'yam'),(740,'yams'),(800,'yaoundé'),(783,'year'),(952,'zita'),(111,'“expected'),(550,'“healthy”');
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(17,3,2),(17,3,6),(25,3,3),(33,3,2),(41,3,2),(49,3,3),(49,3,8),(57,3,2),(65,3,2),(73,3,3),(81,3,3),(81,3,7),(89,3,4),(97,3,2),(105,3,2),(107,3,28),(107,3,37),(107,3,80),(113,3,2),(121,3,3),(129,3,2),(137,3,2),(1,4,3),(137,4,3),(1,5,4),(1,6,5),(1,7,6),(1,8,7),(2,9,0),(2,10,1),(3,10,14),(3,10,70),(2,11,2),(3,11,15),(3,11,60),(3,11,71),(2,12,3),(2,13,4),(2,14,5),(50,14,2),(51,14,0),(91,14,1),(99,14,43),(106,14,4),(107,14,18),(2,15,6),(3,15,43),(2,16,7),(3,16,44),(3,17,0),(3,18,1),(99,18,39),(99,18,47),(99,18,64),(99,18,127),(99,18,203),(123,18,110),(3,19,2),(3,20,3),(5,20,1),(19,20,62),(21,20,4),(3,21,4),(3,21,48),(5,21,0),(21,21,10),(3,22,5),(3,23,6),(5,23,2),(3,24,7),(3,25,8),(3,26,9),(99,26,176),(3,27,10),(3,27,64),(19,27,7),(21,27,6),(89,27,3),(3,28,11),(107,28,15),(109,28,8),(3,29,12),(3,30,13),(3,30,69),(99,30,157),(3,31,16),(3,32,17),(3,33,18),(3,34,19),(3,35,20),(3,36,21),(3,36,57),(3,37,22),(139,37,3),(3,38,23),(131,38,15),(131,38,36),(3,39,24),(3,39,38),(3,40,25),(99,40,45),(99,40,63),(3,41,26),(3,42,27),(107,42,61),(3,43,28),(3,43,30),(3,43,33),(3,43,40),(3,44,29),(3,44,41),(19,44,27),(3,45,31),(3,46,32),(3,47,34),(19,47,80),(43,47,49),(3,48,35),(3,48,45),(3,49,36),(3,49,46),(3,50,37),(3,51,39),(3,52,42),(3,53,47),(3,53,50),(3,54,49),(3,55,51),(3,56,52),(131,56,62),(3,57,53),(3,58,54),(3,58,62),(43,58,27),(3,59,55),(3,60,56),(3,61,58),(3,62,59),(91,62,96),(3,63,61),(43,63,26),(43,63,40),(107,63,35),(107,63,81),(123,63,1),(3,64,63),(35,64,33),(99,64,98),(3,65,65),(3,66,66),(43,66,31),(3,67,67),(3,68,68),(91,68,87),(17,69,0),(17,70,1),(17,71,3),(19,71,18),(19,71,38),(19,71,68),(21,71,5),(17,72,4),(17,73,5),(17,74,7),(18,75,0),(19,75,54),(19,75,72),(21,75,2),(18,76,1),(18,77,2),(18,78,3),(67,78,25),(18,79,4),(19,79,40),(19,79,79),(19,79,84),(18,80,5),(43,80,65),(67,80,17),(99,80,87),(18,81,6),(67,81,16),(67,81,22),(18,82,7),(19,83,0),(19,84,1),(19,84,10),(19,84,28),(21,84,1),(19,85,2),(42,85,3),(43,85,70),(19,86,3),(43,86,0),(99,86,9),(99,86,85),(19,87,4),(67,87,14),(19,88,5),(43,88,2),(45,88,0),(83,88,8),(85,88,2),(107,88,7),(19,89,6),(19,90,8),(21,90,7),(19,91,9),(19,92,11),(19,92,55),(19,92,73),(21,92,3),(43,92,6),(19,93,12),(19,93,34),(107,93,39),(19,94,13),(19,95,14),(19,96,15),(99,96,164),(99,96,195),(19,97,16),(19,98,17),(19,98,67),(19,99,19),(19,100,20),(19,101,21),(19,102,22),(19,102,29),(19,102,43),(106,102,2),(107,102,43),(107,102,53),(107,102,65),(19,103,23),(19,104,24),(19,105,25),(19,106,26),(19,107,30),(19,108,31),(19,109,32),(19,110,33),(19,111,35),(19,112,36),(19,113,37),(19,114,39),(43,114,38),(43,114,50),(43,114,56),(82,114,0),(85,114,4),(19,115,41),(34,115,3),(35,115,19),(35,115,41),(19,116,42),(19,117,44),(19,117,65),(19,117,74),(43,117,24),(19,118,45),(19,118,66),(19,118,75),(19,119,46),(19,120,47),(21,120,8),(19,121,48),(21,121,9),(51,121,6),(83,121,3),(85,121,0),(107,121,31),(107,121,63),(19,122,49),(19,122,81),(107,122,44),(115,122,5),(115,122,50),(19,123,50),(19,124,51),(19,125,52),(19,126,53),(19,127,56),(19,128,57),(43,128,1),(19,129,58),(43,129,15),(19,130,59),(19,131,60),(91,131,112),(131,131,82),(19,132,61),(19,133,63),(19,134,64),(19,135,69),(99,135,165),(19,136,70),(19,137,71),(19,138,76),(19,139,77),(19,140,78),(19,141,82),(19,141,83),(115,141,6),(21,142,0),(25,143,0),(25,144,1),(25,145,2),(26,146,0),(27,146,3),(27,146,9),(26,147,1),(27,147,4),(107,147,92),(109,147,12),(26,148,2),(27,148,5),(27,148,12),(26,149,3),(27,149,6),(27,149,13),(27,150,0),(66,150,3),(115,150,0),(27,151,1),(67,151,8),(27,152,2),(27,153,7),(43,153,71),(83,153,58),(27,154,8),(75,154,42),(75,154,44),(27,155,10),(83,155,7),(85,155,1),(27,156,11),(91,156,135),(27,157,14),(107,157,51),(27,158,15),(27,159,16),(27,160,17),(27,161,18),(27,162,19),(27,163,20),(33,164,0),(33,165,1),(33,166,3),(34,167,0),(35,167,16),(34,168,1),(35,168,17),(35,168,29),(35,168,38),(34,169,2),(35,169,6),(35,169,18),(35,169,23),(35,169,42),(34,170,4),(35,170,12),(35,170,21),(35,170,44),(34,171,5),(34,172,6),(34,173,7),(34,174,8),(34,175,9),(35,176,0),(35,177,1),(35,177,34),(35,178,2),(35,179,3),(35,180,4),(35,181,5),(43,181,58),(35,182,7),(35,182,26),(35,182,39),(35,182,50),(42,182,2),(43,182,20),(35,183,8),(35,183,31),(35,184,9),(43,184,21),(35,185,10),(35,186,11),(35,187,13),(35,188,14),(35,189,15),(35,190,20),(35,190,43),(35,191,22),(35,192,24),(35,193,25),(53,193,0),(53,193,3),(123,193,48),(123,193,82),(35,194,27),(35,194,53),(35,195,28),(35,195,54),(35,196,30),(35,197,32),(35,198,35),(35,199,36),(35,200,37),(35,201,40),(43,201,39),(35,202,45),(35,203,46),(35,204,47),(35,205,48),(35,206,49),(35,207,51),(35,208,52),(115,208,16),(41,209,0),(41,210,1),(41,211,3),(41,212,4),(42,213,0),(75,213,56),(99,213,11),(42,214,1),(43,214,19),(43,215,3),(43,216,4),(43,216,46),(43,216,60),(43,217,5),(43,218,7),(43,219,8),(43,220,9),(51,220,32),(43,221,10),(43,221,11),(43,222,12),(107,222,10),(43,223,13),(43,224,14),(43,225,16),(43,226,17),(43,227,18),(43,228,22),(43,228,69),(43,229,23),(43,230,25),(43,231,28),(99,231,44),(43,232,29),(43,232,63),(83,232,14),(107,232,91),(109,232,11),(43,233,30),(43,234,32),(75,234,55),(115,234,13),(43,235,33),(43,236,34),(43,237,35),(43,238,36),(43,239,37),(43,239,55),(43,239,67),(43,240,41),(43,241,42),(43,242,43),(43,243,44),(43,243,52),(43,244,45),(43,245,47),(43,246,48),(43,247,51),(43,248,53),(43,249,54),(75,249,79),(91,249,138),(43,250,57),(43,251,59),(43,252,61),(43,253,62),(43,254,64),(43,255,66),(43,256,68),(45,257,1),(49,258,0),(49,259,1),(49,260,2),(49,260,7),(49,261,4),(49,262,5),(49,263,6),(50,264,0),(50,265,1),(50,266,3),(51,266,1),(51,266,28),(51,267,2),(51,268,3),(51,269,4),(51,270,5),(90,270,3),(99,270,185),(51,271,7),(99,271,79),(99,271,101),(51,272,8),(51,273,9),(51,274,10),(51,274,34),(51,275,11),(51,275,35),(51,276,12),(51,277,13),(51,277,26),(51,278,14),(51,278,27),(74,278,5),(51,279,15),(51,280,16),(51,281,17),(51,282,18),(51,283,19),(51,284,20),(51,285,21),(51,286,22),(51,287,23),(51,288,24),(51,289,25),(51,290,29),(51,291,30),(51,292,31),(51,293,33),(51,294,36),(51,295,37),(51,296,38),(107,296,25),(107,296,76),(131,296,88),(51,297,39),(139,297,36),(51,298,40),(51,299,41),(83,299,38),(53,300,1),(53,301,2),(53,302,4),(53,303,5),(53,304,6),(57,305,0),(57,306,1),(57,307,3),(58,308,0),(58,309,1),(58,310,2),(58,311,3),(65,312,0),(73,312,0),(65,313,1),(65,314,3),(97,314,3),(65,315,4),(97,315,4),(66,316,0),(66,317,1),(67,317,1),(66,318,2),(67,318,3),(66,319,4),(66,320,5),(67,320,9),(66,321,6),(67,321,10),(67,321,13),(67,322,0),(67,323,2),(99,323,67),(67,324,4),(67,325,5),(83,325,24),(83,325,59),(99,325,204),(67,326,6),(67,327,7),(67,328,11),(67,329,12),(67,330,15),(67,331,18),(67,332,19),(67,333,20),(67,334,21),(67,334,37),(67,335,23),(67,336,24),(67,336,36),(74,336,7),(75,336,20),(75,336,52),(99,336,89),(114,336,2),(115,336,4),(115,336,49),(67,337,26),(99,337,76),(131,337,85),(67,338,27),(67,339,28),(67,340,29),(67,341,30),(67,342,31),(67,343,32),(67,344,33),(67,344,38),(139,344,16),(139,344,35),(67,345,34),(67,346,35),(67,347,39),(67,348,40),(67,349,41),(73,350,1),(73,351,2),(74,352,0),(74,353,1),(74,353,6),(75,353,1),(75,353,8),(75,353,19),(75,353,25),(75,353,51),(75,353,64),(75,353,80),(75,353,106),(77,353,0),(99,353,4),(99,353,163),(99,353,187),(101,353,0),(74,354,2),(75,354,2),(75,354,107),(99,354,90),(74,355,3),(74,356,4),(75,356,50),(74,357,8),(75,357,53),(75,358,0),(75,358,105),(99,358,7),(75,359,3),(75,359,18),(75,359,35),(75,359,38),(75,359,108),(75,360,4),(75,360,11),(75,360,36),(75,360,61),(75,360,78),(75,360,102),(75,360,109),(123,360,50),(123,360,62),(75,361,5),(75,362,6),(75,362,94),(75,363,7),(75,364,9),(75,364,65),(75,364,81),(75,365,10),(75,366,12),(123,366,127),(75,367,13),(75,368,14),(75,369,15),(83,369,61),(75,370,16),(75,371,17),(75,372,21),(75,372,82),(75,372,99),(75,372,112),(99,372,58),(99,372,116),(75,373,22),(75,374,23),(75,375,24),(75,375,62),(75,376,26),(75,377,27),(75,377,67),(75,378,28),(75,378,49),(75,379,29),(75,380,30),(91,380,15),(75,381,31),(75,382,32),(99,382,202),(123,382,2),(75,383,33),(75,384,34),(75,385,37),(75,385,74),(75,386,39),(75,387,40),(75,388,41),(75,389,43),(75,390,45),(75,391,46),(75,392,47),(75,393,48),(75,393,88),(75,394,54),(75,394,93),(75,395,57),(75,395,91),(75,395,96),(75,396,58),(75,396,71),(75,396,89),(75,396,92),(75,396,110),(75,397,59),(75,397,77),(123,397,32),(75,398,60),(75,398,101),(75,399,63),(75,400,66),(75,401,68),(75,402,69),(75,402,85),(75,403,70),(75,403,86),(75,404,72),(99,404,128),(75,405,73),(75,406,75),(75,407,76),(75,408,83),(75,408,113),(75,409,84),(75,410,87),(75,410,97),(83,410,27),(83,410,39),(83,410,53),(83,410,62),(99,410,97),(107,410,46),(107,410,49),(75,411,90),(75,412,95),(75,413,98),(75,413,111),(75,414,100),(75,415,103),(83,415,32),(75,416,104),(81,417,0),(81,418,1),(81,419,2),(81,419,6),(83,419,34),(81,420,4),(81,421,5),(82,422,1),(83,422,2),(83,422,22),(83,422,30),(83,422,37),(82,423,2),(83,423,23),(83,423,31),(83,423,48),(82,424,3),(83,424,15),(85,424,3),(83,425,0),(83,426,1),(85,426,5),(83,427,4),(83,428,5),(83,429,6),(83,430,9),(83,431,10),(83,432,11),(99,432,36),(83,433,12),(83,433,28),(83,434,13),(83,435,16),(83,436,17),(139,436,1),(139,436,6),(83,437,18),(83,438,19),(83,439,20),(83,440,21),(83,440,29),(83,441,25),(83,441,36),(83,442,26),(83,443,33),(83,444,35),(83,445,40),(83,446,41),(83,447,42),(83,448,43),(83,448,51),(83,449,44),(83,449,52),(83,450,45),(83,451,46),(83,452,47),(83,453,49),(83,454,50),(83,455,54),(83,456,55),(83,457,56),(107,457,0),(83,458,57),(107,458,11),(83,459,60),(89,460,0),(89,461,1),(89,462,2),(90,463,0),(90,464,1),(90,465,2),(90,466,4),(90,467,5),(90,468,6),(90,469,7),(115,469,96),(90,470,8),(91,471,0),(123,471,0),(123,471,115),(91,472,2),(91,473,3),(99,473,175),(122,473,0),(91,474,4),(91,474,114),(122,474,1),(91,475,5),(91,475,134),(91,475,141),(123,475,70),(91,476,6),(91,476,116),(91,476,125),(91,477,7),(91,477,42),(91,477,48),(91,477,58),(91,477,66),(91,477,71),(91,477,118),(91,477,131),(122,477,5),(91,478,8),(91,478,43),(91,478,49),(91,478,59),(91,478,67),(91,478,72),(91,478,79),(91,478,84),(91,478,89),(91,478,119),(122,478,6),(91,479,9),(91,479,120),(130,479,5),(131,479,65),(91,480,10),(91,480,121),(122,480,8),(130,480,1),(131,480,1),(131,480,51),(131,480,58),(131,480,74),(91,481,11),(91,481,122),(91,481,133),(91,482,12),(91,482,123),(91,483,13),(91,483,108),(91,483,124),(91,484,14),(91,485,16),(123,485,52),(91,486,17),(91,487,18),(91,488,19),(91,489,20),(91,490,21),(91,491,22),(91,492,23),(91,493,24),(91,493,51),(91,494,25),(91,495,26),(91,496,27),(91,496,29),(91,496,127),(91,497,28),(91,497,126),(91,498,30),(91,498,52),(91,498,117),(122,498,4),(91,499,31),(91,500,32),(91,500,55),(91,500,62),(91,500,75),(91,501,33),(91,502,34),(123,502,30),(91,503,35),(91,503,45),(91,503,53),(91,503,92),(91,503,107),(122,503,10),(91,504,36),(91,505,37),(99,505,65),(91,506,38),(91,507,39),(91,508,40),(91,508,86),(91,509,41),(91,510,44),(91,510,50),(122,510,7),(123,510,38),(91,511,46),(91,512,47),(91,513,54),(93,513,0),(122,513,9),(91,514,56),(91,514,63),(91,514,76),(91,515,57),(91,516,60),(91,516,64),(91,516,74),(91,516,77),(123,516,71),(91,517,61),(91,518,65),(91,519,68),(91,520,69),(91,521,70),(91,522,73),(91,523,78),(91,524,80),(91,524,97),(91,525,81),(91,526,82),(91,527,83),(91,528,85),(91,529,88),(91,530,90),(91,530,95),(99,530,139),(99,530,152),(91,531,91),(91,532,93),(91,533,94),(91,534,98),(91,535,99),(91,536,100),(91,537,101),(91,538,102),(91,539,103),(91,540,104),(91,541,105),(91,542,106),(91,543,109),(91,544,110),(99,544,149),(91,545,111),(91,546,113),(91,547,115),(122,547,3),(91,548,128),(115,548,93),(91,549,129),(91,550,130),(91,551,132),(91,552,136),(91,553,137),(91,553,140),(123,553,12),(123,553,36),(123,553,69),(91,554,139),(91,555,142),(91,556,143),(93,557,1),(125,557,1),(93,558,2),(125,558,2),(97,559,0),(97,560,1),(98,561,0),(99,561,25),(99,561,61),(99,561,177),(98,562,1),(98,563,2),(99,563,0),(99,563,32),(99,563,92),(98,564,3),(99,564,1),(99,564,33),(99,564,93),(99,564,173),(98,565,4),(99,565,18),(99,565,27),(99,565,80),(99,565,102),(99,565,134),(99,565,179),(99,565,198),(98,566,5),(99,566,19),(99,566,81),(99,566,103),(99,566,135),(99,566,180),(99,566,199),(98,567,6),(98,567,8),(99,567,10),(99,567,20),(99,567,30),(99,567,82),(99,567,84),(99,567,105),(99,567,136),(99,567,145),(99,567,182),(99,567,200),(98,568,7),(99,568,29),(99,568,83),(99,568,104),(99,568,144),(99,568,181),(98,569,9),(99,569,34),(99,569,66),(99,569,106),(99,569,140),(99,569,153),(98,570,10),(99,570,35),(99,570,62),(99,570,107),(123,570,23),(123,570,84),(99,571,2),(107,571,72),(99,572,3),(99,573,5),(123,573,121),(99,574,6),(99,575,8),(99,575,156),(99,576,12),(99,577,13),(115,577,81),(99,578,14),(99,579,15),(99,580,16),(99,581,17),(99,582,21),(99,582,37),(99,583,22),(99,584,23),(99,585,24),(99,586,26),(99,586,49),(99,586,54),(99,586,69),(99,586,109),(99,587,28),(99,588,31),(99,588,74),(99,589,38),(99,590,40),(99,591,41),(99,591,197),(99,592,42),(99,592,205),(99,593,46),(99,594,48),(99,594,68),(99,594,77),(99,594,91),(99,594,108),(99,594,194),(99,595,50),(99,596,51),(99,596,124),(99,597,52),(99,597,133),(99,597,147),(99,598,53),(99,599,55),(99,599,113),(99,600,56),(99,600,114),(99,601,57),(99,601,115),(99,602,59),(99,603,60),(99,604,70),(99,605,71),(99,606,72),(99,607,73),(99,608,75),(99,609,78),(99,610,86),(99,611,88),(99,612,94),(99,613,95),(99,614,96),(99,615,99),(99,616,100),(99,617,110),(99,617,117),(99,618,111),(99,619,112),(99,619,121),(99,620,118),(99,621,119),(99,622,120),(99,622,142),(99,622,155),(99,623,122),(99,624,123),(99,625,125),(99,625,137),(99,625,143),(99,625,166),(99,625,189),(99,626,126),(99,626,190),(99,626,201),(99,627,129),(99,628,130),(123,628,72),(99,629,131),(99,630,132),(99,630,146),(99,630,160),(99,631,138),(99,632,141),(99,632,154),(99,633,148),(99,634,150),(99,635,151),(99,636,158),(99,636,174),(99,637,159),(99,638,161),(99,639,162),(99,640,167),(99,641,168),(99,642,169),(99,643,170),(99,644,171),(99,645,172),(99,646,178),(99,647,183),(99,648,184),(99,649,186),(99,650,188),(99,651,191),(99,652,192),(99,653,193),(99,654,196),(99,655,206),(99,656,207),(105,657,0),(105,658,1),(105,659,3),(106,660,0),(106,661,1),(107,661,42),(107,661,64),(106,662,3),(107,662,17),(106,663,5),(107,663,20),(106,664,6),(107,664,21),(106,665,7),(107,665,22),(107,666,1),(107,667,2),(109,667,0),(107,668,3),(109,668,1),(107,669,4),(107,670,5),(107,671,6),(109,671,2),(107,672,8),(107,673,9),(107,674,12),(107,675,13),(107,675,47),(107,675,86),(107,676,14),(109,676,7),(107,677,16),(109,677,9),(107,678,19),(107,679,23),(109,679,3),(107,680,24),(109,680,4),(107,681,26),(107,682,27),(107,682,50),(107,683,29),(107,684,30),(107,685,32),(107,685,88),(107,686,33),(107,687,34),(107,687,84),(109,687,5),(107,688,36),(123,688,41),(107,689,38),(107,690,40),(107,691,41),(107,692,45),(107,693,48),(107,694,52),(107,695,54),(107,696,55),(107,697,56),(107,698,57),(139,698,30),(107,699,58),(107,699,71),(107,700,59),(107,701,60),(107,702,62),(107,703,66),(107,704,67),(107,705,68),(107,706,69),(107,707,70),(107,708,73),(107,709,74),(107,710,75),(107,711,77),(107,712,78),(107,713,79),(109,713,10),(107,714,82),(107,715,83),(107,716,85),(109,716,6),(107,717,87),(107,718,89),(107,719,90),(113,720,0),(113,721,1),(113,722,3),(114,723,0),(115,723,3),(115,723,20),(115,723,34),(115,723,82),(115,723,89),(114,724,1),(115,724,2),(115,724,12),(115,724,19),(115,724,33),(115,724,55),(115,724,70),(123,724,125),(114,725,3),(115,725,9),(115,726,1),(115,727,7),(115,727,53),(115,728,8),(115,729,10),(115,729,18),(115,729,54),(115,730,11),(115,730,32),(115,730,69),(115,730,79),(115,730,86),(115,731,14),(115,732,15),(115,733,17),(115,734,21),(115,735,22),(115,736,23),(115,737,24),(115,737,30),(123,737,19),(115,738,25),(115,738,46),(115,739,26),(115,740,27),(115,740,37),(115,740,48),(115,741,28),(115,741,35),(115,741,75),(115,742,29),(115,742,36),(115,743,31),(115,744,38),(115,745,39),(115,746,40),(115,747,41),(115,748,42),(115,749,43),(115,750,44),(115,750,83),(115,750,90),(115,751,45),(115,752,47),(115,753,51),(115,754,52),(115,755,56),(115,756,57),(115,756,65),(115,757,58),(115,758,59),(115,759,60),(115,760,61),(131,760,12),(131,760,38),(131,760,60),(115,761,62),(115,762,63),(115,763,64),(115,764,66),(115,764,68),(115,765,67),(115,766,71),(115,767,72),(115,768,73),(115,769,74),(139,769,23),(115,770,76),(115,771,77),(115,772,78),(115,773,80),(115,774,84),(115,775,85),(131,775,87),(115,776,87),(115,777,88),(115,778,91),(115,779,92),(115,780,94),(115,781,95),(115,782,97),(115,783,98),(123,783,67),(121,784,0),(121,785,1),(121,786,2),(122,787,2),(123,788,3),(123,789,4),(123,790,5),(123,790,25),(123,790,43),(123,790,63),(123,790,117),(125,790,0),(123,791,6),(123,791,35),(123,791,80),(123,792,7),(123,792,18),(123,793,8),(123,794,9),(123,795,10),(123,796,11),(123,797,13),(123,798,14),(123,798,120),(123,799,15),(123,800,16),(123,801,17),(123,802,20),(123,803,21),(123,804,22),(123,805,24),(123,806,26),(123,806,31),(123,806,99),(123,807,27),(123,808,28),(123,808,39),(123,809,29),(123,809,40),(123,810,33),(123,811,34),(123,812,37),(123,813,42),(123,814,44),(123,815,45),(139,815,28),(123,816,46),(123,817,47),(123,818,49),(123,818,118),(123,819,51),(123,819,75),(123,820,53),(123,821,54),(123,822,55),(123,823,56),(123,823,74),(123,824,57),(123,825,58),(123,826,59),(123,827,60),(123,827,108),(123,828,61),(123,829,64),(123,830,65),(123,831,66),(123,832,68),(123,832,78),(123,833,73),(123,834,76),(123,835,77),(123,836,79),(123,837,81),(123,838,83),(123,839,85),(123,840,86),(123,841,87),(123,842,88),(123,843,89),(123,844,90),(123,845,91),(123,845,98),(123,846,92),(123,847,93),(123,848,94),(123,849,95),(123,850,96),(123,851,97),(123,852,100),(123,853,101),(123,853,105),(123,854,102),(123,855,103),(123,856,104),(123,857,106),(139,857,18),(123,858,107),(123,859,109),(123,860,111),(123,861,112),(123,862,113),(123,863,114),(123,864,116),(123,865,119),(123,866,122),(123,867,123),(123,868,124),(123,869,126),(123,870,128),(129,871,0),(129,872,1),(129,873,3),(130,874,0),(131,874,0),(131,874,67),(130,875,2),(131,875,2),(131,875,59),(130,876,3),(131,876,3),(131,876,34),(131,876,68),(131,876,73),(130,877,4),(131,877,5),(131,877,64),(131,877,71),(130,878,6),(131,878,7),(131,878,84),(130,879,7),(131,879,9),(131,879,29),(131,879,55),(131,879,79),(130,880,8),(131,880,10),(131,880,18),(131,880,30),(131,880,80),(131,880,86),(130,881,9),(131,881,11),(131,881,19),(131,881,31),(131,881,81),(130,882,10),(131,882,56),(130,883,11),(130,884,12),(131,885,4),(131,886,6),(131,887,8),(131,888,13),(131,888,39),(131,889,14),(131,889,40),(131,889,50),(131,890,16),(131,891,17),(131,892,20),(131,893,21),(131,894,22),(131,895,23),(131,896,24),(131,897,25),(131,898,26),(131,899,27),(131,900,28),(131,900,37),(131,900,47),(131,900,54),(131,900,78),(131,901,32),(131,902,33),(131,903,35),(131,903,76),(131,904,41),(131,905,42),(131,906,43),(131,907,44),(131,908,45),(131,909,46),(131,910,48),(131,911,49),(131,912,52),(131,912,75),(131,913,53),(131,914,57),(131,915,61),(131,916,63),(131,917,66),(139,917,37),(131,918,69),(131,919,70),(131,920,72),(131,921,77),(131,922,83),(137,923,0),(137,924,1),(138,925,0),(141,925,0),(138,926,1),(141,926,1),(138,927,2),(141,927,2),(138,928,3),(138,929,4),(139,930,0),(139,931,2),(139,931,9),(139,931,31),(139,932,4),(139,933,5),(139,934,7),(139,935,8),(139,936,10),(139,936,24),(139,937,11),(139,938,12),(139,939,13),(139,940,14),(139,940,33),(139,941,15),(139,941,26),(139,941,34),(139,942,17),(139,943,19),(139,944,20),(139,945,21),(139,946,22),(139,947,25),(139,948,27),(139,949,29),(139,950,32),(141,951,3),(145,952,0),(145,953,1),(145,954,2),(146,955,0),(146,956,1),(146,956,2);
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
INSERT INTO `submission_search_objects` VALUES (1,2,1,0),(2,2,2,0),(3,2,4,0),(4,2,16,0),(5,2,17,0),(6,2,8,0),(7,2,32,0),(8,2,64,0),(17,3,1,0),(18,3,2,0),(19,3,4,0),(20,3,16,0),(21,3,17,0),(22,3,8,0),(23,3,32,0),(24,3,64,0),(25,4,1,0),(26,4,2,0),(27,4,4,0),(28,4,16,0),(29,4,17,0),(30,4,8,0),(31,4,32,0),(32,4,64,0),(33,5,1,0),(34,5,2,0),(35,5,4,0),(36,5,16,0),(37,5,17,0),(38,5,8,0),(39,5,32,0),(40,5,64,0),(41,6,1,0),(42,6,2,0),(43,6,4,0),(44,6,16,0),(45,6,17,0),(46,6,8,0),(47,6,32,0),(48,6,64,0),(49,7,1,0),(50,7,2,0),(51,7,4,0),(52,7,16,0),(53,7,17,0),(54,7,8,0),(55,7,32,0),(56,7,64,0),(57,8,1,0),(58,8,2,0),(59,8,4,0),(60,8,16,0),(61,8,17,0),(62,8,8,0),(63,8,32,0),(64,8,64,0),(65,9,1,0),(66,9,2,0),(67,9,4,0),(68,9,16,0),(69,9,17,0),(70,9,8,0),(71,9,32,0),(72,9,64,0),(73,10,1,0),(74,10,2,0),(75,10,4,0),(76,10,16,0),(77,10,17,0),(78,10,8,0),(79,10,32,0),(80,10,64,0),(81,11,1,0),(82,11,2,0),(83,11,4,0),(84,11,16,0),(85,11,17,0),(86,11,8,0),(87,11,32,0),(88,11,64,0),(89,12,1,0),(90,12,2,0),(91,12,4,0),(92,12,16,0),(93,12,17,0),(94,12,8,0),(95,12,32,0),(96,12,64,0),(97,13,1,0),(98,13,2,0),(99,13,4,0),(100,13,16,0),(101,13,17,0),(102,13,8,0),(103,13,32,0),(104,13,64,0),(105,14,1,0),(106,14,2,0),(107,14,4,0),(108,14,16,0),(109,14,17,0),(110,14,8,0),(111,14,32,0),(112,14,64,0),(113,15,1,0),(114,15,2,0),(115,15,4,0),(116,15,16,0),(117,15,17,0),(118,15,8,0),(119,15,32,0),(120,15,64,0),(121,16,1,0),(122,16,2,0),(123,16,4,0),(124,16,16,0),(125,16,17,0),(126,16,8,0),(127,16,32,0),(128,16,64,0),(129,17,1,0),(130,17,2,0),(131,17,4,0),(132,17,16,0),(133,17,17,0),(134,17,8,0),(135,17,32,0),(136,17,64,0),(137,18,1,0),(138,18,2,0),(139,18,4,0),(140,18,16,0),(141,18,17,0),(142,18,8,0),(143,18,32,0),(144,18,64,0),(145,19,1,0),(146,19,2,0),(147,19,4,0),(148,19,16,0),(149,19,17,0),(150,19,8,0),(151,19,32,0),(152,19,64,0);
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
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `submissions` VALUES (1,1,1,'2022-03-08 00:52:59','2022-03-08 00:52:59','2022-03-08 00:52:59',5,'en_US',1,0,0),(2,1,2,'2022-03-08 00:53:45','2022-03-08 00:53:23','2022-03-08 00:53:23',5,'en_US',3,0,0),(3,1,4,'2022-03-08 00:54:42','2022-03-08 00:54:14','2022-03-08 00:54:14',5,'en_US',3,0,0),(4,1,5,'2022-03-08 00:55:11','2022-03-08 00:55:05','2022-03-08 00:55:05',5,'en_US',3,0,0),(5,1,6,'2022-03-08 00:55:41','2022-03-08 00:55:35','2022-03-08 00:55:35',5,'en_US',3,0,0),(6,1,7,'2022-03-08 00:56:11','2022-03-08 00:56:05','2022-03-08 00:56:05',5,'en_US',3,0,0),(7,1,8,'2022-03-08 00:56:44','2022-03-08 00:56:38','2022-03-08 00:56:38',5,'en_US',3,0,0),(8,1,9,'2022-03-08 00:57:12','2022-03-08 00:57:06','2022-03-08 00:57:06',5,'en_US',3,0,0),(9,1,10,'2022-03-08 00:57:42','2022-03-08 00:57:35','2022-03-08 00:57:35',5,'en_US',3,0,0),(10,1,11,'2022-03-08 00:58:11','2022-03-08 00:58:05','2022-03-08 00:58:05',5,'en_US',3,0,0),(11,1,12,'2022-03-08 00:58:54','2022-03-08 00:58:48','2022-03-08 00:58:48',5,'en_US',3,0,0),(12,1,13,'2022-03-08 00:59:25','2022-03-08 00:59:19','2022-03-08 00:59:19',5,'en_US',3,0,0),(13,1,14,'2022-03-08 00:59:55','2022-03-08 00:59:49','2022-03-08 00:59:49',5,'en_US',3,0,0),(14,1,15,'2022-03-08 01:00:25','2022-03-08 01:00:19','2022-03-08 01:00:19',5,'en_US',3,0,0),(15,1,16,'2022-03-08 01:00:54','2022-03-08 01:00:48','2022-03-08 01:00:48',5,'en_US',3,0,0),(16,1,17,'2022-03-08 01:01:24','2022-03-08 01:01:18','2022-03-08 01:01:18',5,'en_US',3,0,0),(17,1,18,'2022-03-08 01:01:56','2022-03-08 01:01:50','2022-03-08 01:01:50',5,'en_US',3,0,0),(18,1,19,'2022-03-08 01:02:26','2022-03-08 01:02:19','2022-03-08 01:02:19',5,'en_US',3,0,0),(19,1,20,'2022-03-08 01:02:55','2022-03-08 01:02:49','2022-03-08 01:02:49',5,'en_US',3,0,0);
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
  `setting_type` varchar(6) NOT NULL,
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName',0,0,'admin','string'),(1,'en_US','givenName',0,0,'admin','string'),(2,'','orcid',0,0,'','string'),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México','string'),(2,'en_US','biography',0,0,'','string'),(2,'en_US','familyName',0,0,'Vaca','string'),(2,'en_US','givenName',0,0,'Ramiro','string'),(2,'en_US','preferredPublicName',0,0,'','string'),(2,'en_US','signature',0,0,'','string'),(2,'fr_CA','affiliation',0,0,'','string'),(2,'fr_CA','biography',0,0,'','string'),(2,'fr_CA','familyName',0,0,'','string'),(2,'fr_CA','givenName',0,0,'','string'),(2,'fr_CA','preferredPublicName',0,0,'','string'),(2,'fr_CA','signature',0,0,'','string'),(3,'','orcid',0,0,'','string'),(3,'en_US','affiliation',0,0,'University of Melbourne','string'),(3,'en_US','biography',0,0,'','string'),(3,'en_US','familyName',0,0,'Barnes','string'),(3,'en_US','givenName',0,0,'Daniel','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'fr_CA','affiliation',0,0,'','string'),(3,'fr_CA','biography',0,0,'','string'),(3,'fr_CA','familyName',0,0,'','string'),(3,'fr_CA','givenName',0,0,'','string'),(3,'fr_CA','preferredPublicName',0,0,'','string'),(3,'fr_CA','signature',0,0,'','string'),(4,'','orcid',0,0,'','string'),(4,'en_US','affiliation',0,0,'University of Chicago','string'),(4,'en_US','biography',0,0,'','string'),(4,'en_US','familyName',0,0,'Buskins','string'),(4,'en_US','givenName',0,0,'David','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'fr_CA','affiliation',0,0,'','string'),(4,'fr_CA','biography',0,0,'','string'),(4,'fr_CA','familyName',0,0,'','string'),(4,'fr_CA','givenName',0,0,'','string'),(4,'fr_CA','preferredPublicName',0,0,'','string'),(4,'fr_CA','signature',0,0,'','string'),(5,'','orcid',0,0,'','string'),(5,'en_US','affiliation',0,0,'University of Toronto','string'),(5,'en_US','biography',0,0,'','string'),(5,'en_US','familyName',0,0,'Berardo','string'),(5,'en_US','givenName',0,0,'Stephanie','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'fr_CA','affiliation',0,0,'','string'),(5,'fr_CA','biography',0,0,'','string'),(5,'fr_CA','familyName',0,0,'','string'),(5,'fr_CA','givenName',0,0,'','string'),(5,'fr_CA','preferredPublicName',0,0,'','string'),(5,'fr_CA','signature',0,0,'','string'),(6,'','orcid',0,0,'','string'),(6,'en_US','affiliation',0,0,'Kyoto University','string'),(6,'en_US','biography',0,0,'','string'),(6,'en_US','familyName',0,0,'Inoue','string'),(6,'en_US','givenName',0,0,'Minoti','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'fr_CA','affiliation',0,0,'','string'),(6,'fr_CA','biography',0,0,'','string'),(6,'fr_CA','familyName',0,0,'','string'),(6,'fr_CA','givenName',0,0,'','string'),(6,'fr_CA','preferredPublicName',0,0,'','string'),(6,'fr_CA','signature',0,0,'','string'),(7,'en_US','affiliation',0,0,'University of Bologna','string'),(7,'en_US','familyName',0,0,'Corino','string'),(7,'en_US','givenName',0,0,'Carlo','string'),(8,'en_US','affiliation',0,0,'University of Windsor','string'),(8,'en_US','familyName',0,0,'Kwantes','string'),(8,'en_US','givenName',0,0,'Catherine','string'),(9,'en_US','affiliation',0,0,'University of Alberta','string'),(9,'en_US','familyName',0,0,'Montgomerie','string'),(9,'en_US','givenName',0,0,'Craig','string'),(10,'en_US','affiliation',0,0,'Alexandria University','string'),(10,'en_US','familyName',0,0,'Diouf','string'),(10,'en_US','givenName',0,0,'Diaga','string'),(11,'en_US','affiliation',0,0,'University of Toronto','string'),(11,'en_US','familyName',0,0,'Phillips','string'),(11,'en_US','givenName',0,0,'Dana','string'),(12,'en_US','affiliation',0,0,'University College Cork','string'),(12,'en_US','familyName',0,0,'Sokoloff','string'),(12,'en_US','givenName',0,0,'Domatilia','string'),(13,'en_US','affiliation',0,0,'Indiana University','string'),(13,'en_US','familyName',0,0,'Ostrom','string'),(13,'en_US','givenName',0,0,'Elinor','string'),(14,'en_US','affiliation',0,0,'University of Rome','string'),(14,'en_US','familyName',0,0,'Paglieri','string'),(14,'en_US','givenName',0,0,'Fabio','string'),(15,'en_US','affiliation',0,0,'University of Cape Town','string'),(15,'en_US','familyName',0,0,'Mwandenga','string'),(15,'en_US','givenName',0,0,'John','string'),(16,'en_US','affiliation',0,0,'Aalborg University','string'),(16,'en_US','familyName',0,0,'Novak','string'),(16,'en_US','givenName',0,0,'John','string'),(17,'en_US','affiliation',0,0,'Stanford University','string'),(17,'en_US','familyName',0,0,'Al-Khafaji','string'),(17,'en_US','givenName',0,0,'Karim','string'),(18,'en_US','affiliation',0,0,'Australian National University','string'),(18,'en_US','familyName',0,0,'Christopher','string'),(18,'en_US','givenName',0,0,'Leo','string'),(19,'en_US','affiliation',0,0,'University of Cape Town','string'),(19,'en_US','familyName',0,0,'Kumiega','string'),(19,'en_US','givenName',0,0,'Lise','string'),(20,'en_US','affiliation',0,0,'University of Wolverhampton','string'),(20,'en_US','familyName',0,0,'Daniel','string'),(20,'en_US','givenName',0,0,'Patricia','string'),(21,'en_US','affiliation',0,0,'University of Nairobi','string'),(21,'en_US','familyName',0,0,'Baiyewu','string'),(21,'en_US','givenName',0,0,'Rana','string'),(22,'en_US','affiliation',0,0,'Barcelona University','string'),(22,'en_US','familyName',0,0,'Rossi','string'),(22,'en_US','givenName',0,0,'Rosanna','string'),(23,'en_US','affiliation',0,0,'University of Tehran','string'),(23,'en_US','familyName',0,0,'Karbasizaed','string'),(23,'en_US','givenName',0,0,'Vajiheh','string'),(24,'en_US','affiliation',0,0,'University of Windsor','string'),(24,'en_US','familyName',0,0,'Williamson','string'),(24,'en_US','givenName',0,0,'Valerie','string'),(25,'en_US','affiliation',0,0,'CUNY','string'),(25,'en_US','familyName',0,0,'Woods','string'),(25,'en_US','givenName',0,0,'Zita','string');
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
  `date_last_login` datetime NOT NULL,
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$n01mkUaOKQgDibDhXRx4S.b0NV943s5FnUbPVVvjjGcpF9whzJdKu','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2022-03-08 00:50:28',NULL,'2022-03-08 00:52:10',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$8H9y46hkxygoGav1npFkPe/x6Lk03mXlu58AI/6J8zrdR4dr4oCum','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2022-03-08 00:51:20',NULL,'2022-03-08 00:52:01',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$FEFGD7SX.kcc2wOmIqppMewgCU9Y0FmCsnLMf1j/0IHQ7dJtuef96','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2022-03-08 00:51:27',NULL,'2022-03-08 01:02:50',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$ynOV.miuQf4lK697CGfUIembeiXf5XllpFdaw8XUEkBJQCmfzfhGu','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-03-08 00:51:34',NULL,'2022-03-08 00:51:34',0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$KD3YzZAtZoHqBYaw6OOAHeWFK5ED.QR35DC8vlQ6Hv5uclo6QT90e','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-03-08 00:51:43',NULL,'2022-03-08 00:51:43',0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$t7W0NOsm1zZ6y./V44vgv.Ym0RdPDqjZydlNpAs4nYXgmj1dDvfsu','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2022-03-08 00:51:52',NULL,'2022-03-08 00:51:52',0,0,NULL,0,NULL,1),(7,'ccorino','$2y$10$EvfuE17QB3NgLwO7/hrc3eIMIDlRTFDBUQ873tau.zexQsNl/Z.ze','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2022-03-08 00:52:40',NULL,'2022-03-08 00:52:40',0,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$8mM6RKoUgIvkPajFybsg1OWWjZPWW45RCtjQscZz48KVJ1V8ZWYAm','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-08 00:53:04',NULL,'2022-03-08 00:53:04',0,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$6kC.vpqtlcRseGPISl7JU.qQ12qi3qF.BGQsHXbcQLnD6OTujOT4a','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-08 00:53:50',NULL,'2022-03-08 00:53:50',0,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$94F0YpJrVl0ZD/PGCnUIEOmACQm6NECL0mzCbgnYI.2SaaGEYYVbG','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','',NULL,NULL,'2022-03-08 00:54:47',NULL,'2022-03-08 00:54:47',0,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$m9/JAE1cFm/8SR/G2IHUkudQvm.OtgCfRJEcNZsRXEMX6G1Hq9va2','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-08 00:55:15',NULL,'2022-03-08 00:55:15',0,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$JhES/fWa6vdawrPs.tUXVuOu0eJufeBcTuBhQYAMybUHAPZx2t56m','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','',NULL,NULL,'2022-03-08 00:55:48',NULL,'2022-03-08 00:55:48',0,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$DaxSBJ9Cl6PUJ8kB/dnlA.aLpB7U01oQb6a3LpcMr.K89mkghNFve','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-03-08 00:56:15',NULL,'2022-03-08 00:56:15',0,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$cS6.2ri5wfagQNlOQ1b5HOZdmCKuOW8qbaWxAf/66WzC5gNJjEkie','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2022-03-08 00:56:48',NULL,'2022-03-08 00:56:48',0,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$qMB3NK9QlAL2WukQ6SKh8O7RFj2Po9Cw2fSOKv78wRrejBvppoSkK','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2022-03-08 00:57:17',NULL,'2022-03-08 00:57:17',0,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$2FVynWtFSrDvgXncXUkYfuoVBRiM6VOFx6nytqCfuGClJmEhs3.Ty','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','',NULL,NULL,'2022-03-08 00:57:46',NULL,'2022-03-08 00:57:46',0,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$3vo/Au7/fLsCtUQix9LMbu9bksrzEnsMjMcIZkQhX0osk8mV6EAJ6','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-03-08 00:58:26',NULL,'2022-03-08 00:58:26',0,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$Eh5lo32oAoBIAlX6ynMn5uOB0eR5x71jZvO.Ngvc/Wghc5pbawvBS','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','',NULL,NULL,'2022-03-08 00:58:59',NULL,'2022-03-08 00:58:59',0,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$onnaqqVzzb5CxXOk3LvnvOg5PX5i6QD6yA9DB6R.7pb/KLkMh0ING','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2022-03-08 00:59:30',NULL,'2022-03-08 00:59:30',0,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$09N0GRbHEJRAhj6pky3JrOoCuALqR6WMCy37q54L3iVJt7eIKYntm','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','',NULL,NULL,'2022-03-08 01:00:00',NULL,'2022-03-08 01:00:00',0,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$S0njQk/vuc4ka1C2k7P2teftEBFpZWJic0qjs3/Vn7BG3DDs.d0.O','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','',NULL,NULL,'2022-03-08 01:00:30',NULL,'2022-03-08 01:00:30',0,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$chxfNfePIcxcyNJ5tr0pm.4lQSWaFNcMa5hVLqQHMeCWSzDBpuhIC','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','',NULL,NULL,'2022-03-08 01:00:59',NULL,'2022-03-08 01:00:59',0,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$0EjERLPo2A51yxF4doMR1eXWv2piKzs0o0SB49nxtBIYtCdqu/2ui','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','',NULL,NULL,'2022-03-08 01:01:31',NULL,'2022-03-08 01:01:31',0,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$w.5tK58dW3DAFn51Aj9AWeY7FoXCVyKcLwrvsV7rdpaTTl3zZNNEy','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-08 01:02:01',NULL,'2022-03-08 01:02:01',0,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$ViAQa6K34PW7fI5KA/23guyW0Rwzo0DYVaJ4iWDuO.9CzZ67uV9qu','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-03-08 01:02:31',NULL,'2022-03-08 01:02:32',0,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-03-08 00:50:28',1,'plugins.metadata','dc11','',0,0),(1,0,1,0,'2022-03-08 00:50:28',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,2,0,0,'2022-03-08 00:50:28',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.generic','crossrefDeposit','CrossrefDepositPlugin',1,0),(1,2,0,0,'2022-03-08 00:50:28',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,1,0,'2022-03-08 00:50:28',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,1,3,1,'2022-03-08 00:50:28',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,1,0,0,'2022-03-08 00:50:28',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.generic','usageEvent','',0,0),(2,2,0,0,'2022-03-08 00:50:28',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,1,0,0,'2022-03-08 00:50:28',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2022-03-08 00:50:28',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,3,0,10,'2022-03-08 00:50:25',1,'core','ops','',0,1);
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

-- Dump completed on 2022-03-08  1:02:57
