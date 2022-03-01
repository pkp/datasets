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
  `setting_type` varchar(6) NOT NULL,
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
  `assoc_type` smallint(6) DEFAULT NULL,
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
  `date_expire` datetime DEFAULT NULL,
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
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
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
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','IT',NULL),(1,'en_US','affiliation','University of Bologna',NULL),(1,'en_US','familyName','Corino',NULL),(1,'en_US','givenName','Carlo',NULL),(2,'','country','CA',NULL),(2,'en_US','affiliation','University of Windsor',NULL),(2,'en_US','familyName','Kwantes',NULL),(2,'en_US','givenName','Catherine',NULL),(3,'','country','CA',NULL),(3,'en_US','affiliation','University of Alberta',NULL),(3,'en_US','familyName','Montgomerie',NULL),(3,'en_US','givenName','Craig',NULL),(4,'','country','CA',NULL),(4,'','orcid','',NULL),(4,'','url','',NULL),(4,'en_US','affiliation','University of Victoria',NULL),(4,'en_US','biography','',NULL),(4,'en_US','familyName','Irvine',NULL),(4,'en_US','givenName','Mark',NULL),(4,'en_US','preferredPublicName','',NULL),(4,'fr_CA','affiliation','',NULL),(4,'fr_CA','biography','',NULL),(4,'fr_CA','familyName','',NULL),(4,'fr_CA','givenName','',NULL),(4,'fr_CA','preferredPublicName','',NULL),(5,'','country','EG',NULL),(5,'en_US','affiliation','Alexandria University',NULL),(5,'en_US','familyName','Diouf',NULL),(5,'en_US','givenName','Diaga',NULL),(6,'','country','CA',NULL),(6,'en_US','affiliation','University of Toronto',NULL),(6,'en_US','familyName','Phillips',NULL),(6,'en_US','givenName','Dana',NULL),(7,'','country','IE',NULL),(7,'en_US','affiliation','University College Cork',NULL),(7,'en_US','familyName','Sokoloff',NULL),(7,'en_US','givenName','Domatilia',NULL),(8,'','country','US',NULL),(8,'en_US','affiliation','Indiana University',NULL),(8,'en_US','familyName','Ostrom',NULL),(8,'en_US','givenName','Elinor',NULL),(9,'','country','US',NULL),(9,'','orcid','',NULL),(9,'','url','',NULL),(9,'en_US','affiliation','Indiana University',NULL),(9,'en_US','biography','',NULL),(9,'en_US','familyName','van Laerhoven',NULL),(9,'en_US','givenName','Frank',NULL),(9,'en_US','preferredPublicName','',NULL),(9,'fr_CA','affiliation','',NULL),(9,'fr_CA','biography','',NULL),(9,'fr_CA','familyName','',NULL),(9,'fr_CA','givenName','',NULL),(9,'fr_CA','preferredPublicName','',NULL),(10,'','country','IT',NULL),(10,'en_US','affiliation','University of Rome',NULL),(10,'en_US','familyName','Paglieri',NULL),(10,'en_US','givenName','Fabio',NULL),(11,'','country','ZA',NULL),(11,'en_US','affiliation','University of Cape Town',NULL),(11,'en_US','familyName','Mwandenga',NULL),(11,'en_US','givenName','John',NULL),(12,'','country','DK',NULL),(12,'en_US','affiliation','Aalborg University',NULL),(12,'en_US','familyName','Novak',NULL),(12,'en_US','givenName','John',NULL),(13,'','country','US',NULL),(13,'en_US','affiliation','Stanford University',NULL),(13,'en_US','familyName','Al-Khafaji',NULL),(13,'en_US','givenName','Karim',NULL),(14,'','country','US',NULL),(14,'','orcid','',NULL),(14,'','url','',NULL),(14,'en_US','affiliation','Stanford University',NULL),(14,'en_US','biography','',NULL),(14,'en_US','familyName','Morse',NULL),(14,'en_US','givenName','Margaret',NULL),(14,'en_US','preferredPublicName','',NULL),(14,'fr_CA','affiliation','',NULL),(14,'fr_CA','biography','',NULL),(14,'fr_CA','familyName','',NULL),(14,'fr_CA','givenName','',NULL),(14,'fr_CA','preferredPublicName','',NULL),(15,'','country','AU',NULL),(15,'en_US','affiliation','Australian National University',NULL),(15,'en_US','familyName','Christopher',NULL),(15,'en_US','givenName','Leo',NULL),(16,'','country','ZA',NULL),(16,'en_US','affiliation','University of Cape Town',NULL),(16,'en_US','familyName','Kumiega',NULL),(16,'en_US','givenName','Lise',NULL),(17,'','country','GB',NULL),(17,'en_US','affiliation','University of Wolverhampton',NULL),(17,'en_US','familyName','Daniel',NULL),(17,'en_US','givenName','Patricia',NULL),(18,'','country','KE',NULL),(18,'en_US','affiliation','University of Nairobi',NULL),(18,'en_US','familyName','Baiyewu',NULL),(18,'en_US','givenName','Rana',NULL),(19,'','country','ES',NULL),(19,'en_US','affiliation','Barcelona University',NULL),(19,'en_US','familyName','Rossi',NULL),(19,'en_US','givenName','Rosanna',NULL),(20,'','country','IR',NULL),(20,'en_US','affiliation','University of Tehran',NULL),(20,'en_US','familyName','Karbasizaed',NULL),(20,'en_US','givenName','Vajiheh',NULL),(21,'','country','CA',NULL),(21,'en_US','affiliation','University of Windsor',NULL),(21,'en_US','familyName','Williamson',NULL),(21,'en_US','givenName','Valerie',NULL),(22,'','country','US',NULL),(22,'en_US','affiliation','CUNY',NULL),(22,'en_US','familyName','Woods',NULL),(22,'en_US','givenName','Zita',NULL);
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
  `include_in_browse` tinyint(4) NOT NULL DEFAULT '1',
  `publication_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
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
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,NULL,0,4),(2,'ckwantes@mailinator.com',1,2,NULL,0,4),(3,'cmontgomerie@mailinator.com',1,3,NULL,0,4),(4,'mirvine@mailinator.com',1,3,NULL,1,4),(5,'ddiouf@mailinator.com',1,4,NULL,0,4),(6,'dphillips@mailinator.com',1,5,NULL,0,4),(7,'dsokoloff@mailinator.com',1,6,NULL,0,4),(8,'eostrom@mailinator.com',1,7,NULL,0,4),(9,'fvanlaerhoven@mailinator.com',1,7,NULL,1,4),(10,'fpaglieri@mailinator.com',1,8,NULL,0,4),(11,'jmwandenga@mailinator.com',1,9,NULL,0,4),(12,'jnovak@mailinator.com',1,10,NULL,0,4),(13,'kalkhafaji@mailinator.com',1,11,NULL,0,4),(14,'mmorse@mailinator.com',1,11,NULL,1,4),(15,'lchristopher@mailinator.com',1,12,NULL,0,4),(16,'lkumiega@mailinator.com',1,13,NULL,0,4),(17,'pdaniel@mailinator.com',1,14,NULL,0,4),(18,'rbaiyewu@mailinator.com',1,15,NULL,0,4),(19,'rrossi@mailinator.com',1,16,NULL,0,4),(20,'vkarbasizaed@mailinator.com',1,17,NULL,0,4),(21,'vwilliamson@mailinator.com',1,18,NULL,0,4),(22,'zwoods@mailinator.com',1,19,NULL,0,4);
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
  `setting_type` varchar(6) NOT NULL,
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
  `raw_citation` text,
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
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,2,6),(10,2,7),(11,3,1),(12,3,2),(13,3,3),(14,4,1),(15,4,2),(16,4,3),(17,4,4),(18,4,5),(19,4,6),(20,4,7),(21,4,8),(22,4,9),(23,4,10),(24,4,11),(25,4,12),(26,5,1),(27,5,2),(28,7,1),(29,7,2),(32,12,1),(33,12,2),(41,17,1),(42,17,2),(43,17,3),(44,17,4),(45,17,5),(46,17,6),(47,17,7),(50,32,1),(51,32,2),(55,37,1),(56,37,2),(57,37,3),(59,52,1),(64,57,1),(65,57,2),(66,57,3),(67,57,4),(70,62,1),(71,62,2),(73,67,1),(84,72,1),(85,72,2),(86,72,3),(87,72,4),(88,72,5),(89,72,6),(90,72,7),(91,72,8),(92,72,9),(93,72,10),(96,82,1),(97,82,2),(101,92,1),(102,92,2),(103,92,3);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','name','personal','string'),(2,'','name','corporate','string'),(3,'','name','conference','string'),(4,'','description','Author','string'),(4,'','name','aut','string'),(5,'','description','Contributor','string'),(5,'','name','ctb','string'),(6,'','description','Editor','string'),(6,'','name','edt','string'),(7,'','description','Illustrator','string'),(7,'','name','ill','string'),(8,'','description','Photographer','string'),(8,'','name','pht','string'),(9,'','description','Sponsor','string'),(9,'','name','spn','string'),(10,'','description','Translator','string'),(10,'','name','trl','string'),(11,'','name','multimedia','string'),(12,'','name','still image','string'),(13,'','name','text','string'),(14,'','name','article','string'),(15,'','name','book','string'),(16,'','name','conference publication','string'),(17,'','name','issue','string'),(18,'','name','journal','string'),(19,'','name','newspaper','string'),(20,'','name','picture','string'),(21,'','name','review','string'),(22,'','name','periodical','string'),(23,'','name','series','string'),(24,'','name','thesis','string'),(25,'','name','web site','string'),(26,'','name','electronic','string'),(27,'','name','print','string'),(28,'en_US','submissionKeyword','pigs','string'),(29,'en_US','submissionKeyword','food security','string'),(32,'en_US','submissionKeyword','employees','string'),(33,'en_US','submissionKeyword','survey','string'),(41,'en_US','submissionKeyword','Integrating Technology','string'),(42,'en_US','submissionKeyword','Computer Skills','string'),(43,'en_US','submissionKeyword','Survey','string'),(44,'en_US','submissionKeyword','Alberta','string'),(45,'en_US','submissionKeyword','National','string'),(46,'en_US','submissionKeyword','Provincial','string'),(47,'en_US','submissionKeyword','Professional Development','string'),(50,'en_US','submissionKeyword','education','string'),(51,'en_US','submissionKeyword','citizenship','string'),(55,'en_US','submissionKeyword','Common pool resource','string'),(56,'en_US','submissionKeyword','common property','string'),(57,'en_US','submissionKeyword','intellectual developments','string'),(59,'en_US','submissionKeyword','water','string'),(64,'en_US','submissionKeyword','Development','string'),(65,'en_US','submissionKeyword','engineering education','string'),(66,'en_US','submissionKeyword','service learning','string'),(67,'en_US','submissionKeyword','sustainability','string'),(70,'en_US','submissionKeyword','pigs','string'),(71,'en_US','submissionKeyword','food security','string'),(73,'en_US','submissionKeyword','water','string'),(84,'en_US','submissionKeyword','21st Century','string'),(85,'en_US','submissionKeyword','Diversity','string'),(86,'en_US','submissionKeyword','Multilingual','string'),(87,'en_US','submissionKeyword','Multiethnic','string'),(88,'en_US','submissionKeyword','Participatory Pedagogy','string'),(89,'en_US','submissionKeyword','Language','string'),(90,'en_US','submissionKeyword','Culture','string'),(91,'en_US','submissionKeyword','Gender','string'),(92,'en_US','submissionKeyword','Egalitarianism','string'),(93,'en_US','submissionKeyword','Social Transformation','string'),(96,'en_US','submissionKeyword','cattle','string'),(97,'en_US','submissionKeyword','food security','string'),(101,'en_US','submissionKeyword','Self-Organization','string'),(102,'en_US','submissionKeyword','Multi-Level Institutions','string'),(103,'en_US','submissionKeyword','Goverance','string');
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
INSERT INTO `controlled_vocabs` VALUES (6,'interest',0,0),(4,'mods34-genre-marcgt',0,0),(2,'mods34-name-role-roleTerms-marcrelator',0,0),(1,'mods34-name-types',0,0),(5,'mods34-physicalDescription-form-marcform',0,0),(3,'mods34-typeOfResource',0,0),(11,'submissionAgency',1048588,1),(16,'submissionAgency',1048588,2),(21,'submissionAgency',1048588,3),(26,'submissionAgency',1048588,4),(31,'submissionAgency',1048588,5),(36,'submissionAgency',1048588,6),(41,'submissionAgency',1048588,7),(46,'submissionAgency',1048588,8),(51,'submissionAgency',1048588,9),(56,'submissionAgency',1048588,10),(61,'submissionAgency',1048588,11),(66,'submissionAgency',1048588,12),(71,'submissionAgency',1048588,13),(76,'submissionAgency',1048588,14),(81,'submissionAgency',1048588,15),(86,'submissionAgency',1048588,16),(91,'submissionAgency',1048588,17),(96,'submissionAgency',1048588,18),(101,'submissionAgency',1048588,19),(9,'submissionDiscipline',1048588,1),(14,'submissionDiscipline',1048588,2),(19,'submissionDiscipline',1048588,3),(24,'submissionDiscipline',1048588,4),(29,'submissionDiscipline',1048588,5),(34,'submissionDiscipline',1048588,6),(39,'submissionDiscipline',1048588,7),(44,'submissionDiscipline',1048588,8),(49,'submissionDiscipline',1048588,9),(54,'submissionDiscipline',1048588,10),(59,'submissionDiscipline',1048588,11),(64,'submissionDiscipline',1048588,12),(69,'submissionDiscipline',1048588,13),(74,'submissionDiscipline',1048588,14),(79,'submissionDiscipline',1048588,15),(84,'submissionDiscipline',1048588,16),(89,'submissionDiscipline',1048588,17),(94,'submissionDiscipline',1048588,18),(99,'submissionDiscipline',1048588,19),(7,'submissionKeyword',1048588,1),(12,'submissionKeyword',1048588,2),(17,'submissionKeyword',1048588,3),(22,'submissionKeyword',1048588,4),(27,'submissionKeyword',1048588,5),(32,'submissionKeyword',1048588,6),(37,'submissionKeyword',1048588,7),(42,'submissionKeyword',1048588,8),(47,'submissionKeyword',1048588,9),(52,'submissionKeyword',1048588,10),(57,'submissionKeyword',1048588,11),(62,'submissionKeyword',1048588,12),(67,'submissionKeyword',1048588,13),(72,'submissionKeyword',1048588,14),(77,'submissionKeyword',1048588,15),(82,'submissionKeyword',1048588,16),(87,'submissionKeyword',1048588,17),(92,'submissionKeyword',1048588,18),(97,'submissionKeyword',1048588,19),(10,'submissionLanguage',1048588,1),(15,'submissionLanguage',1048588,2),(20,'submissionLanguage',1048588,3),(25,'submissionLanguage',1048588,4),(30,'submissionLanguage',1048588,5),(35,'submissionLanguage',1048588,6),(40,'submissionLanguage',1048588,7),(45,'submissionLanguage',1048588,8),(50,'submissionLanguage',1048588,9),(55,'submissionLanguage',1048588,10),(60,'submissionLanguage',1048588,11),(65,'submissionLanguage',1048588,12),(70,'submissionLanguage',1048588,13),(75,'submissionLanguage',1048588,14),(80,'submissionLanguage',1048588,15),(85,'submissionLanguage',1048588,16),(90,'submissionLanguage',1048588,17),(95,'submissionLanguage',1048588,18),(100,'submissionLanguage',1048588,19),(8,'submissionSubject',1048588,1),(13,'submissionSubject',1048588,2),(18,'submissionSubject',1048588,3),(23,'submissionSubject',1048588,4),(28,'submissionSubject',1048588,5),(33,'submissionSubject',1048588,6),(38,'submissionSubject',1048588,7),(43,'submissionSubject',1048588,8),(48,'submissionSubject',1048588,9),(53,'submissionSubject',1048588,10),(58,'submissionSubject',1048588,11),(63,'submissionSubject',1048588,12),(68,'submissionSubject',1048588,13),(73,'submissionSubject',1048588,14),(78,'submissionSubject',1048588,15),(83,'submissionSubject',1048588,16),(88,'submissionSubject',1048588,17),(93,'submissionSubject',1048588,18),(98,'submissionSubject',1048588,19);
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
  `setting_type` varchar(6) NOT NULL,
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
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
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
  `email_key` varchar(64) NOT NULL,
  `context_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
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
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL),(7,'PUBLISH_NOTIFY',0,1,NULL,NULL),(8,'SUBMISSION_ACK',1,1,NULL,65536),(9,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536),(10,'EDITOR_ASSIGN',1,1,16,16),(11,'EDITOR_DECISION_ACCEPT',0,1,16,65536),(12,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536),(13,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17),(14,'ANNOUNCEMENT',0,1,16,1048576),(15,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL),(16,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('EDITOR_ASSIGN','en_US','Moderator Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the screening process in your role as Moderator.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Moderator that the Manager has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the server site.'),('EDITOR_DECISION_ACCEPT','en_US','Moderator Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Manager or Moderator to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Moderator Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the moderator declines his submission initially.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un nouvel avis de {$siteTitle} :<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs-trices inscrits-es qui ont choisi de recevoir par courriel ce type d\'avis.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','fr_CA','Soumission ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$contextName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour récupérer les identifiants ORCID des auteurs-es.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','Demande d\'accès au dossier ORCID','{$authorName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$contextName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$contextName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Ce modèle de courriel est utilisé pour demander aux auteurs-es l\'accès à leur dossier ORCID.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the server.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe pour le site Web {$siteTitle} a été réinitialisé avec succès. Veuillez conserver votre nom d\'utilisateur-trice ainsi que votre mot de passe. Vous en aurez besoin pour chacune de vos interactions avec le serveur.\n<br />\n<br />\nVotre nom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e lorsqu\'il a réussi à réinitialiser son mot de passe en ayant suivi la procédure décrite dans le courriel « Confirmation de la réinitialisation du mot de passe ».'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à l\'utilisateur-trice inscrit-e qui nous signale avoir oublié son mot de passe ou qui est incapable d\'ouvrir une session. Il fournit le lien URL à cliquer pour pouvoir réinitialiser son mot de passe.'),('PUBLISH_NOTIFY','en_US','New Preprint Published','Readers:<br />\n<br />\n{$contextName} has just published its latest preprint at {$contextUrl}.\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Moderator\'s User Home. It notifies readers of a new preprint and invites them to visit the server at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Nouvelle prépublication publiée','Lecteurs-trices :<br />\n<br />\nLa plus récente prépublication de {$contextName} vient d\'être publiée à l\'adresse suivante : {$contextUrl}.\n<br />\nNous vous remercions de l\'intérêt que vous portez à notre travail,<br />\n{$editorialContactSignature}','Ce courriel est envoyé à tous et toutes les lecteurs-trices inscrits-es, via le lien « Aviser les utilisateurs-trices » sur la page d\'accueil du,de la rédacteur-trice. Il avise les lecteurs-trices d\'une nouvelle prépublication et les invite à visiter le serveur en cliquant sur l\'URL fourni.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}','Preprint Server activity for {$month}, {$year}'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. You can manage your submission by logging in to the server web site.<br />\\\n/>\n\"\n/>\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}\"','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the server.'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$authorName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » au serveur {$contextName}. Vous pourrez suivre le traitement de votre soumission en accédant au site Web du serveur .<br />\n','Ce courriel, lorsqu\'activé, est envoyé automatiquement à un-e auteur-e quand il ou elle a complété le processus de soumission d\'un manuscrit à la seveur. Il fournit les informations sur comment suivre la soumission à travers le processus éditorial, et remercie l\'auteur-e de sa soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this server as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OPS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$contextName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$contextName} pour la publication de vos travaux.<br />\n<br />\n{$editorialContactSignature}','Ce courriel, lorsque activé, est envoyé automatiquement aux autres auteur-e-s qui ne sont pas des utilisateurs-trices de OPS signalés-es comme effectuant la soumission.'),('USER_REGISTER','en_US','Server Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription au serveur','{$userFullName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$contextName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$username}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à utilisateur-trice nouvellement inscrit-e pour lui souhaiter la bienvenue au serveur et l\'informer de son nom d\'utilisateur-trice et de son mot de passe.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName},<br />\n<br />\nVous avez créé un compte avec {$contextName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un,une utilisateur-trice nouvellement inscrit-e pour valider son compte de courriel.');
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2022-03-01 01:15:17',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,7,'2022-03-01 01:15:24',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,7,'2022-03-01 01:15:27',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,7,'2022-03-01 01:15:30',268435458,'submission.event.general.metadataUpdated',0),(5,1048585,1,7,'2022-03-01 01:15:31',268435457,'submission.event.submissionSubmitted',0),(6,1048585,2,8,'2022-03-01 01:15:38',268435458,'submission.event.general.metadataUpdated',0),(7,515,2,8,'2022-03-01 01:15:46',1342177281,'submission.event.fileUploaded',0),(8,1048585,2,8,'2022-03-01 01:15:48',1342177281,'submission.event.fileUploaded',0),(9,1048585,2,8,'2022-03-01 01:15:51',268435458,'submission.event.general.metadataUpdated',0),(10,1048585,2,8,'2022-03-01 01:15:52',268435457,'submission.event.submissionSubmitted',0),(11,1048585,2,3,'2022-03-01 01:15:59',268435462,'publication.event.published',0),(12,1048585,3,9,'2022-03-01 01:16:06',268435458,'submission.event.general.metadataUpdated',0),(13,515,3,9,'2022-03-01 01:16:14',1342177281,'submission.event.fileUploaded',0),(14,1048585,3,9,'2022-03-01 01:16:16',1342177281,'submission.event.fileUploaded',0),(15,1048585,3,9,'2022-03-01 01:16:23',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,3,9,'2022-03-01 01:16:24',268435457,'submission.event.submissionSubmitted',0),(17,1048585,3,3,'2022-03-01 01:16:30',268435462,'publication.event.published',0),(18,1048585,4,10,'2022-03-01 01:16:37',268435458,'submission.event.general.metadataUpdated',0),(19,515,4,10,'2022-03-01 01:16:45',1342177281,'submission.event.fileUploaded',0),(20,1048585,4,10,'2022-03-01 01:16:47',1342177281,'submission.event.fileUploaded',0),(21,1048585,4,10,'2022-03-01 01:16:50',268435458,'submission.event.general.metadataUpdated',0),(22,1048585,4,10,'2022-03-01 01:16:51',268435457,'submission.event.submissionSubmitted',0),(23,1048585,4,3,'2022-03-01 01:16:57',268435462,'publication.event.published',0),(24,1048585,5,11,'2022-03-01 01:17:05',268435458,'submission.event.general.metadataUpdated',0),(25,515,5,11,'2022-03-01 01:17:13',1342177281,'submission.event.fileUploaded',0),(26,1048585,5,11,'2022-03-01 01:17:15',1342177281,'submission.event.fileUploaded',0),(27,1048585,5,11,'2022-03-01 01:17:19',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,5,11,'2022-03-01 01:17:20',268435457,'submission.event.submissionSubmitted',0),(29,1048585,5,3,'2022-03-01 01:17:25',268435462,'publication.event.published',0),(30,1048585,6,12,'2022-03-01 01:17:32',268435458,'submission.event.general.metadataUpdated',0),(31,515,6,12,'2022-03-01 01:17:40',1342177281,'submission.event.fileUploaded',0),(32,1048585,6,12,'2022-03-01 01:17:42',1342177281,'submission.event.fileUploaded',0),(33,1048585,6,12,'2022-03-01 01:17:45',268435458,'submission.event.general.metadataUpdated',0),(34,1048585,6,12,'2022-03-01 01:17:46',268435457,'submission.event.submissionSubmitted',0),(35,1048585,6,3,'2022-03-01 01:17:52',268435462,'publication.event.published',0),(36,1048585,7,13,'2022-03-01 01:17:59',268435458,'submission.event.general.metadataUpdated',0),(37,515,7,13,'2022-03-01 01:18:07',1342177281,'submission.event.fileUploaded',0),(38,1048585,7,13,'2022-03-01 01:18:09',1342177281,'submission.event.fileUploaded',0),(39,1048585,7,13,'2022-03-01 01:18:15',268435458,'submission.event.general.metadataUpdated',0),(40,1048585,7,13,'2022-03-01 01:18:16',268435457,'submission.event.submissionSubmitted',0),(41,1048585,7,3,'2022-03-01 01:18:22',268435462,'publication.event.published',0),(42,1048585,8,14,'2022-03-01 01:18:29',268435458,'submission.event.general.metadataUpdated',0),(43,515,8,14,'2022-03-01 01:18:37',1342177281,'submission.event.fileUploaded',0),(44,1048585,8,14,'2022-03-01 01:18:39',1342177281,'submission.event.fileUploaded',0),(45,1048585,8,14,'2022-03-01 01:18:42',268435458,'submission.event.general.metadataUpdated',0),(46,1048585,8,14,'2022-03-01 01:18:43',268435457,'submission.event.submissionSubmitted',0),(47,1048585,8,3,'2022-03-01 01:18:48',268435462,'publication.event.published',0),(48,1048585,9,15,'2022-03-01 01:18:55',268435458,'submission.event.general.metadataUpdated',0),(49,515,9,15,'2022-03-01 01:19:03',1342177281,'submission.event.fileUploaded',0),(50,1048585,9,15,'2022-03-01 01:19:05',1342177281,'submission.event.fileUploaded',0),(51,1048585,9,15,'2022-03-01 01:19:08',268435458,'submission.event.general.metadataUpdated',0),(52,1048585,9,15,'2022-03-01 01:19:09',268435457,'submission.event.submissionSubmitted',0),(53,1048585,9,3,'2022-03-01 01:19:15',268435462,'publication.event.published',0),(54,1048585,10,16,'2022-03-01 01:19:22',268435458,'submission.event.general.metadataUpdated',0),(55,515,10,16,'2022-03-01 01:19:30',1342177281,'submission.event.fileUploaded',0),(56,1048585,10,16,'2022-03-01 01:19:32',1342177281,'submission.event.fileUploaded',0),(57,1048585,10,16,'2022-03-01 01:19:35',268435458,'submission.event.general.metadataUpdated',0),(58,1048585,10,16,'2022-03-01 01:19:36',268435457,'submission.event.submissionSubmitted',0),(59,1048585,10,3,'2022-03-01 01:19:42',268435462,'publication.event.published',0),(60,1048585,11,17,'2022-03-01 01:19:48',268435458,'submission.event.general.metadataUpdated',0),(61,515,11,17,'2022-03-01 01:19:56',1342177281,'submission.event.fileUploaded',0),(62,1048585,11,17,'2022-03-01 01:19:59',1342177281,'submission.event.fileUploaded',0),(63,1048585,11,17,'2022-03-01 01:20:04',268435458,'submission.event.general.metadataUpdated',0),(64,1048585,11,17,'2022-03-01 01:20:05',268435457,'submission.event.submissionSubmitted',0),(65,1048585,11,3,'2022-03-01 01:20:12',268435462,'publication.event.published',0),(66,1048585,12,18,'2022-03-01 01:20:19',268435458,'submission.event.general.metadataUpdated',0),(67,515,12,18,'2022-03-01 01:20:26',1342177281,'submission.event.fileUploaded',0),(68,1048585,12,18,'2022-03-01 01:20:29',1342177281,'submission.event.fileUploaded',0),(69,1048585,12,18,'2022-03-01 01:20:32',268435458,'submission.event.general.metadataUpdated',0),(70,1048585,12,18,'2022-03-01 01:20:33',268435457,'submission.event.submissionSubmitted',0),(71,1048585,12,3,'2022-03-01 01:20:38',268435462,'publication.event.published',0),(72,1048585,13,19,'2022-03-01 01:20:45',268435458,'submission.event.general.metadataUpdated',0),(73,515,13,19,'2022-03-01 01:20:52',1342177281,'submission.event.fileUploaded',0),(74,1048585,13,19,'2022-03-01 01:20:55',1342177281,'submission.event.fileUploaded',0),(75,1048585,13,19,'2022-03-01 01:20:58',268435458,'submission.event.general.metadataUpdated',0),(76,1048585,13,19,'2022-03-01 01:20:59',268435457,'submission.event.submissionSubmitted',0),(77,1048585,13,3,'2022-03-01 01:21:05',268435462,'publication.event.published',0),(78,1048585,14,20,'2022-03-01 01:21:11',268435458,'submission.event.general.metadataUpdated',0),(79,515,14,20,'2022-03-01 01:21:19',1342177281,'submission.event.fileUploaded',0),(80,1048585,14,20,'2022-03-01 01:21:22',1342177281,'submission.event.fileUploaded',0),(81,1048585,14,20,'2022-03-01 01:21:25',268435458,'submission.event.general.metadataUpdated',0),(82,1048585,14,20,'2022-03-01 01:21:26',268435457,'submission.event.submissionSubmitted',0),(83,1048585,14,3,'2022-03-01 01:21:32',268435462,'publication.event.published',0),(84,1048585,15,21,'2022-03-01 01:21:39',268435458,'submission.event.general.metadataUpdated',0),(85,515,15,21,'2022-03-01 01:21:47',1342177281,'submission.event.fileUploaded',0),(86,1048585,15,21,'2022-03-01 01:21:49',1342177281,'submission.event.fileUploaded',0),(87,1048585,15,21,'2022-03-01 01:21:51',268435458,'submission.event.general.metadataUpdated',0),(88,1048585,15,21,'2022-03-01 01:21:52',268435457,'submission.event.submissionSubmitted',0),(89,1048585,15,3,'2022-03-01 01:21:59',268435462,'publication.event.published',0),(90,1048585,16,22,'2022-03-01 01:22:05',268435458,'submission.event.general.metadataUpdated',0),(91,515,16,22,'2022-03-01 01:22:13',1342177281,'submission.event.fileUploaded',0),(92,1048585,16,22,'2022-03-01 01:22:16',1342177281,'submission.event.fileUploaded',0),(93,1048585,16,22,'2022-03-01 01:22:19',268435458,'submission.event.general.metadataUpdated',0),(94,1048585,16,22,'2022-03-01 01:22:20',268435457,'submission.event.submissionSubmitted',0),(95,1048585,16,3,'2022-03-01 01:22:25',268435462,'publication.event.published',0),(96,1048585,17,23,'2022-03-01 01:22:33',268435458,'submission.event.general.metadataUpdated',0),(97,515,17,23,'2022-03-01 01:22:41',1342177281,'submission.event.fileUploaded',0),(98,1048585,17,23,'2022-03-01 01:22:43',1342177281,'submission.event.fileUploaded',0),(99,1048585,17,23,'2022-03-01 01:22:47',268435458,'submission.event.general.metadataUpdated',0),(100,1048585,17,23,'2022-03-01 01:22:48',268435457,'submission.event.submissionSubmitted',0),(101,1048585,17,3,'2022-03-01 01:22:54',268435462,'publication.event.published',0),(102,1048585,18,24,'2022-03-01 01:23:01',268435458,'submission.event.general.metadataUpdated',0),(103,515,18,24,'2022-03-01 01:23:09',1342177281,'submission.event.fileUploaded',0),(104,1048585,18,24,'2022-03-01 01:23:11',1342177281,'submission.event.fileUploaded',0),(105,1048585,18,24,'2022-03-01 01:23:14',268435458,'submission.event.general.metadataUpdated',0),(106,1048585,18,24,'2022-03-01 01:23:15',268435457,'submission.event.submissionSubmitted',0),(107,1048585,18,3,'2022-03-01 01:23:22',268435462,'publication.event.published',0),(108,1048585,19,25,'2022-03-01 01:23:28',268435458,'submission.event.general.metadataUpdated',0),(109,515,19,25,'2022-03-01 01:23:36',1342177281,'submission.event.fileUploaded',0),(110,1048585,19,25,'2022-03-01 01:23:38',1342177281,'submission.event.fileUploaded',0),(111,1048585,19,25,'2022-03-01 01:23:41',268435458,'submission.event.general.metadataUpdated',0),(112,1048585,19,25,'2022-03-01 01:23:42',268435457,'submission.event.submissionSubmitted',0),(113,1048585,19,3,'2022-03-01 01:23:48',268435462,'publication.event.published',0);
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileRevision','1','int'),(2,'fileStage','10','int'),(2,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(2,'revisedFileId',NULL,'string'),(2,'submissionId','1','int'),(2,'username','ccorino','string'),(3,'fileId','1','int'),(3,'fileRevision','1','int'),(3,'fileStage','10','int'),(3,'name','ccorino, The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'originalFileName','The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(3,'submissionId','1','int'),(3,'username','ccorino','string'),(7,'fileId','2','int'),(7,'fileRevision','1','int'),(7,'fileStage','10','int'),(7,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(7,'revisedFileId',NULL,'string'),(7,'submissionId','2','int'),(7,'username','ckwantes','string'),(8,'fileId','2','int'),(8,'fileRevision','1','int'),(8,'fileStage','10','int'),(8,'name','ckwantes, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(8,'originalFileName','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(8,'submissionId','2','int'),(8,'username','ckwantes','string'),(13,'fileId','3','int'),(13,'fileRevision','1','int'),(13,'fileStage','10','int'),(13,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(13,'revisedFileId',NULL,'string'),(13,'submissionId','3','int'),(13,'username','cmontgomerie','string'),(14,'fileId','3','int'),(14,'fileRevision','1','int'),(14,'fileStage','10','int'),(14,'name','cmontgomerie, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(14,'originalFileName','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(14,'submissionId','3','int'),(14,'username','cmontgomerie','string'),(19,'fileId','4','int'),(19,'fileRevision','1','int'),(19,'fileStage','10','int'),(19,'originalFileName','Genetic transformation of forest trees.pdf','string'),(19,'revisedFileId',NULL,'string'),(19,'submissionId','4','int'),(19,'username','ddiouf','string'),(20,'fileId','4','int'),(20,'fileRevision','1','int'),(20,'fileStage','10','int'),(20,'name','ddiouf, Genetic transformation of forest trees.pdf','string'),(20,'originalFileName','Genetic transformation of forest trees.pdf','string'),(20,'submissionId','4','int'),(20,'username','ddiouf','string'),(25,'fileId','5','int'),(25,'fileRevision','1','int'),(25,'fileStage','10','int'),(25,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(25,'revisedFileId',NULL,'string'),(25,'submissionId','5','int'),(25,'username','dphillips','string'),(26,'fileId','5','int'),(26,'fileRevision','1','int'),(26,'fileStage','10','int'),(26,'name','dphillips, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(26,'originalFileName','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(26,'submissionId','5','int'),(26,'username','dphillips','string'),(31,'fileId','6','int'),(31,'fileRevision','1','int'),(31,'fileStage','10','int'),(31,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(31,'revisedFileId',NULL,'string'),(31,'submissionId','6','int'),(31,'username','dsokoloff','string'),(32,'fileId','6','int'),(32,'fileRevision','1','int'),(32,'fileStage','10','int'),(32,'name','dsokoloff, Developing efficacy beliefs in the classroom.pdf','string'),(32,'originalFileName','Developing efficacy beliefs in the classroom.pdf','string'),(32,'submissionId','6','int'),(32,'username','dsokoloff','string'),(37,'fileId','7','int'),(37,'fileRevision','1','int'),(37,'fileStage','10','int'),(37,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(37,'revisedFileId',NULL,'string'),(37,'submissionId','7','int'),(37,'username','eostrom','string'),(38,'fileId','7','int'),(38,'fileRevision','1','int'),(38,'fileStage','10','int'),(38,'name','eostrom, Traditions and Trends in the Study of the Commons.pdf','string'),(38,'originalFileName','Traditions and Trends in the Study of the Commons.pdf','string'),(38,'submissionId','7','int'),(38,'username','eostrom','string'),(43,'fileId','8','int'),(43,'fileRevision','1','int'),(43,'fileStage','10','int'),(43,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(43,'revisedFileId',NULL,'string'),(43,'submissionId','8','int'),(43,'username','fpaglieri','string'),(44,'fileId','8','int'),(44,'fileRevision','1','int'),(44,'fileStage','10','int'),(44,'name','fpaglieri, Hansen & Pinto: Reason Reclaimed.pdf','string'),(44,'originalFileName','Hansen & Pinto: Reason Reclaimed.pdf','string'),(44,'submissionId','8','int'),(44,'username','fpaglieri','string'),(49,'fileId','9','int'),(49,'fileRevision','1','int'),(49,'fileStage','10','int'),(49,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(49,'revisedFileId',NULL,'string'),(49,'submissionId','9','int'),(49,'username','jmwandenga','string'),(50,'fileId','9','int'),(50,'fileRevision','1','int'),(50,'fileStage','10','int'),(50,'name','jmwandenga, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(50,'originalFileName','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(50,'submissionId','9','int'),(50,'username','jmwandenga','string'),(55,'fileId','10','int'),(55,'fileRevision','1','int'),(55,'fileStage','10','int'),(55,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(55,'revisedFileId',NULL,'string'),(55,'submissionId','10','int'),(55,'username','jnovak','string'),(56,'fileId','10','int'),(56,'fileRevision','1','int'),(56,'fileStage','10','int'),(56,'name','jnovak, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(56,'originalFileName','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(56,'submissionId','10','int'),(56,'username','jnovak','string'),(61,'fileId','11','int'),(61,'fileRevision','1','int'),(61,'fileStage','10','int'),(61,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(61,'revisedFileId',NULL,'string'),(61,'submissionId','11','int'),(61,'username','kalkhafaji','string'),(62,'fileId','11','int'),(62,'fileRevision','1','int'),(62,'fileStage','10','int'),(62,'name','kalkhafaji, Learning Sustainable Design through Service.pdf','string'),(62,'originalFileName','Learning Sustainable Design through Service.pdf','string'),(62,'submissionId','11','int'),(62,'username','kalkhafaji','string'),(67,'fileId','12','int'),(67,'fileRevision','1','int'),(67,'fileStage','10','int'),(67,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(67,'revisedFileId',NULL,'string'),(67,'submissionId','12','int'),(67,'username','lchristopher','string'),(68,'fileId','12','int'),(68,'fileRevision','1','int'),(68,'fileStage','10','int'),(68,'name','lchristopher, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(68,'originalFileName','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(68,'submissionId','12','int'),(68,'username','lchristopher','string'),(73,'fileId','13','int'),(73,'fileRevision','1','int'),(73,'fileStage','10','int'),(73,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(73,'revisedFileId',NULL,'string'),(73,'submissionId','13','int'),(73,'username','lkumiega','string'),(74,'fileId','13','int'),(74,'fileRevision','1','int'),(74,'fileStage','10','int'),(74,'name','lkumiega, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(74,'originalFileName','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(74,'submissionId','13','int'),(74,'username','lkumiega','string'),(79,'fileId','14','int'),(79,'fileRevision','1','int'),(79,'fileStage','10','int'),(79,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(79,'revisedFileId',NULL,'string'),(79,'submissionId','14','int'),(79,'username','pdaniel','string'),(80,'fileId','14','int'),(80,'fileRevision','1','int'),(80,'fileStage','10','int'),(80,'name','pdaniel, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(80,'originalFileName','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(80,'submissionId','14','int'),(80,'username','pdaniel','string'),(85,'fileId','15','int'),(85,'fileRevision','1','int'),(85,'fileStage','10','int'),(85,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(85,'revisedFileId',NULL,'string'),(85,'submissionId','15','int'),(85,'username','rbaiyewu','string'),(86,'fileId','15','int'),(86,'fileRevision','1','int'),(86,'fileStage','10','int'),(86,'name','rbaiyewu, Yam diseases and its management in Nigeria.pdf','string'),(86,'originalFileName','Yam diseases and its management in Nigeria.pdf','string'),(86,'submissionId','15','int'),(86,'username','rbaiyewu','string'),(91,'fileId','16','int'),(91,'fileRevision','1','int'),(91,'fileStage','10','int'),(91,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(91,'revisedFileId',NULL,'string'),(91,'submissionId','16','int'),(91,'username','rrossi','string'),(92,'fileId','16','int'),(92,'fileRevision','1','int'),(92,'fileStage','10','int'),(92,'name','rrossi, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(92,'originalFileName','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(92,'submissionId','16','int'),(92,'username','rrossi','string'),(97,'fileId','17','int'),(97,'fileRevision','1','int'),(97,'fileStage','10','int'),(97,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(97,'revisedFileId',NULL,'string'),(97,'submissionId','17','int'),(97,'username','vkarbasizaed','string'),(98,'fileId','17','int'),(98,'fileRevision','1','int'),(98,'fileStage','10','int'),(98,'name','vkarbasizaed, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(98,'originalFileName','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(98,'submissionId','17','int'),(98,'username','vkarbasizaed','string'),(103,'fileId','18','int'),(103,'fileRevision','1','int'),(103,'fileStage','10','int'),(103,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(103,'revisedFileId',NULL,'string'),(103,'submissionId','18','int'),(103,'username','vwilliamson','string'),(104,'fileId','18','int'),(104,'fileRevision','1','int'),(104,'fileStage','10','int'),(104,'name','vwilliamson, Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(104,'originalFileName','Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(104,'submissionId','18','int'),(104,'username','vwilliamson','string'),(109,'fileId','19','int'),(109,'fileRevision','1','int'),(109,'fileStage','10','int'),(109,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(109,'revisedFileId',NULL,'string'),(109,'submissionId','19','int'),(109,'username','zwoods','string'),(110,'fileId','19','int'),(110,'fileRevision','1','int'),(110,'fileStage','10','int'),(110,'name','zwoods, Finocchiaro: Arguments About Arguments.pdf','string'),(110,'originalFileName','Finocchiaro: Arguments About Arguments.pdf','string'),(110,'submissionId','19','int'),(110,'username','zwoods','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'mods34=>mods34-xml','plugins.metadata.mods34.mods34XmlOutput.displayName','plugins.metadata.mods34.mods34XmlOutput.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(*)','xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),(3,'article=>mods34','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),(4,'mods34=>article','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)','class::classes.submission.Submission'),(5,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.4.0.xsd)');
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
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'MODS 3.4','lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter',0,0,0),(3,3,0,'Extract metadata from a(n) Submission','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(4,4,0,'Inject metadata into a(n) Submission','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(5,5,0,'Crossref XML preprint export','plugins.importexport.crossref.filter.PreprintCrossrefXmlFilter',0,0,0);
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
  `setting_type` varchar(6) NOT NULL,
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
  `seq` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` tinyint(4) NOT NULL DEFAULT '0',
  `supplementary` tinyint(4) DEFAULT '0',
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
  `assoc_id` varchar(32) NOT NULL,
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
INSERT INTO `journal_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','emailSignature','<br/>________________________________________________________________________<br/><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>',NULL),(1,'','enableAuthorScreening','0',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','supportedFormLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportedLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportedSubmissionLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','publicknowledgePub Know Pre',NULL),(1,'en_US','acronym','JPKPKP',NULL),(1,'en_US','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.phppublicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.phppublicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.phppublicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source publishing system is suitable for libraries to host for their faculty members to use (see <a href=\"http://pkp.sfu.ca\">Public Knowledge Project</a>).',NULL),(1,'en_US','name','Public Knowledge Preprint Server',NULL),(1,'en_US','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this server. Use the <a href=\"http://localhost/index.phppublicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.phppublicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:167:\"The submission has not been previously published, nor is it before another server for consideration (or an explanation has been provided in Comments to the Moderator).\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:82:\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:99:\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\";}}',NULL),(1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##',NULL),(1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##',NULL),(1,'fr_CA','name','Serveur de prépublication de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##',NULL),(1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##',NULL),(1,'fr_CA','readerInformation','##default.contextSettings.forReaders##',NULL),(1,'fr_CA','submissionChecklist','a:5:{i:0;a:2:{s:5:\"order\";i:1;s:7:\"content\";s:212:\"La soumission n\'a pas déjà été publiée et n\'est pas considérée actuellement par un autre serveur. Si ce n\'est pas le cas, fournir une explication dans le champ « Commentaires au,à la rédacteur-trice ».\";}i:1;a:2:{s:5:\"order\";i:2;s:7:\"content\";s:121:\"Le fichier de la soumission est dans un des formats de fichier suivants : OpenOffice, Microsoft Word, RTF ou WordPerfect.\";}i:2;a:2:{s:5:\"order\";i:3;s:7:\"content\";s:62:\"Lorsque possible, les URL des références ont été fournies.\";}i:3;a:2:{s:5:\"order\";i:4;s:7:\"content\";s:58:\"##default.contextSettings.checklist.submissionAppearance##\";}i:4;a:2:{s:5:\"order\";i:5;s:7:\"content\";s:63:\"##default.contextSettings.checklist.bibliographicRequirements##\";}}',NULL);
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
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'publicknowledge',1,'en_US',1);
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
  `setting_type` varchar(6) NOT NULL,
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
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` tinyint(4) DEFAULT '0',
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
  `file_type` tinyint(4) DEFAULT NULL,
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
  `url` varchar(255) DEFAULT '',
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
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(16,1,NULL,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(21,1,NULL,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,NULL,'NMI_TYPE_SEARCH');
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
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
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
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
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
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (3,1,0,3,16777222,'2022-03-01 01:15:31',NULL,1048585,1),(4,1,0,3,16777223,'2022-03-01 01:15:31',NULL,1048585,1),(5,1,5,2,16777217,'2022-03-01 01:15:31',NULL,1048585,1),(7,1,4,2,16777217,'2022-03-01 01:15:31',NULL,1048585,1),(9,1,0,2,16777243,'2022-03-01 01:15:31',NULL,1048585,1),(10,1,0,2,16777245,'2022-03-01 01:15:31',NULL,1048585,1),(12,1,0,3,16777222,'2022-03-01 01:15:52',NULL,1048585,2),(13,1,0,3,16777223,'2022-03-01 01:15:52',NULL,1048585,2),(14,1,5,2,16777217,'2022-03-01 01:15:52',NULL,1048585,2),(16,1,4,2,16777217,'2022-03-01 01:15:52',NULL,1048585,2),(18,1,0,2,16777243,'2022-03-01 01:15:52',NULL,1048585,2),(19,1,0,2,16777245,'2022-03-01 01:15:52',NULL,1048585,2),(22,1,0,3,16777222,'2022-03-01 01:16:24',NULL,1048585,3),(23,1,0,3,16777223,'2022-03-01 01:16:24',NULL,1048585,3),(24,1,5,2,16777217,'2022-03-01 01:16:24',NULL,1048585,3),(26,1,4,2,16777217,'2022-03-01 01:16:24',NULL,1048585,3),(28,1,0,2,16777243,'2022-03-01 01:16:24',NULL,1048585,3),(29,1,0,2,16777245,'2022-03-01 01:16:24',NULL,1048585,3),(32,1,0,3,16777222,'2022-03-01 01:16:51',NULL,1048585,4),(33,1,0,3,16777223,'2022-03-01 01:16:51',NULL,1048585,4),(34,1,5,2,16777217,'2022-03-01 01:16:51',NULL,1048585,4),(36,1,4,2,16777217,'2022-03-01 01:16:51',NULL,1048585,4),(38,1,0,2,16777243,'2022-03-01 01:16:51',NULL,1048585,4),(39,1,0,2,16777245,'2022-03-01 01:16:51',NULL,1048585,4),(41,1,0,3,16777222,'2022-03-01 01:17:19',NULL,1048585,5),(42,1,0,3,16777223,'2022-03-01 01:17:19',NULL,1048585,5),(43,1,5,2,16777217,'2022-03-01 01:17:19',NULL,1048585,5),(45,1,4,2,16777217,'2022-03-01 01:17:20',NULL,1048585,5),(47,1,0,2,16777243,'2022-03-01 01:17:20',NULL,1048585,5),(48,1,0,2,16777245,'2022-03-01 01:17:20',NULL,1048585,5),(50,1,0,3,16777222,'2022-03-01 01:17:46',NULL,1048585,6),(51,1,0,3,16777223,'2022-03-01 01:17:46',NULL,1048585,6),(52,1,5,2,16777217,'2022-03-01 01:17:46',NULL,1048585,6),(54,1,4,2,16777217,'2022-03-01 01:17:46',NULL,1048585,6),(56,1,0,2,16777243,'2022-03-01 01:17:46',NULL,1048585,6),(57,1,0,2,16777245,'2022-03-01 01:17:46',NULL,1048585,6),(60,1,0,3,16777222,'2022-03-01 01:18:16',NULL,1048585,7),(61,1,0,3,16777223,'2022-03-01 01:18:16',NULL,1048585,7),(62,1,5,2,16777217,'2022-03-01 01:18:16',NULL,1048585,7),(64,1,4,2,16777217,'2022-03-01 01:18:16',NULL,1048585,7),(66,1,0,2,16777243,'2022-03-01 01:18:16',NULL,1048585,7),(67,1,0,2,16777245,'2022-03-01 01:18:16',NULL,1048585,7),(70,1,0,3,16777222,'2022-03-01 01:18:43',NULL,1048585,8),(71,1,0,3,16777223,'2022-03-01 01:18:43',NULL,1048585,8),(72,1,5,2,16777217,'2022-03-01 01:18:43',NULL,1048585,8),(74,1,4,2,16777217,'2022-03-01 01:18:43',NULL,1048585,8),(76,1,0,2,16777243,'2022-03-01 01:18:43',NULL,1048585,8),(77,1,0,2,16777245,'2022-03-01 01:18:43',NULL,1048585,8),(79,1,0,3,16777222,'2022-03-01 01:19:09',NULL,1048585,9),(80,1,0,3,16777223,'2022-03-01 01:19:09',NULL,1048585,9),(81,1,5,2,16777217,'2022-03-01 01:19:09',NULL,1048585,9),(83,1,4,2,16777217,'2022-03-01 01:19:09',NULL,1048585,9),(85,1,0,2,16777243,'2022-03-01 01:19:09',NULL,1048585,9),(86,1,0,2,16777245,'2022-03-01 01:19:09',NULL,1048585,9),(88,1,0,3,16777222,'2022-03-01 01:19:36',NULL,1048585,10),(89,1,0,3,16777223,'2022-03-01 01:19:36',NULL,1048585,10),(90,1,5,2,16777217,'2022-03-01 01:19:36',NULL,1048585,10),(92,1,4,2,16777217,'2022-03-01 01:19:36',NULL,1048585,10),(94,1,0,2,16777243,'2022-03-01 01:19:36',NULL,1048585,10),(95,1,0,2,16777245,'2022-03-01 01:19:36',NULL,1048585,10),(98,1,0,3,16777222,'2022-03-01 01:20:05',NULL,1048585,11),(99,1,0,3,16777223,'2022-03-01 01:20:05',NULL,1048585,11),(100,1,5,2,16777217,'2022-03-01 01:20:05',NULL,1048585,11),(102,1,4,2,16777217,'2022-03-01 01:20:05',NULL,1048585,11),(104,1,0,2,16777243,'2022-03-01 01:20:05',NULL,1048585,11),(105,1,0,2,16777245,'2022-03-01 01:20:05',NULL,1048585,11),(108,1,0,3,16777222,'2022-03-01 01:20:32',NULL,1048585,12),(109,1,0,3,16777223,'2022-03-01 01:20:32',NULL,1048585,12),(110,1,5,2,16777217,'2022-03-01 01:20:32',NULL,1048585,12),(112,1,4,2,16777217,'2022-03-01 01:20:32',NULL,1048585,12),(114,1,0,2,16777243,'2022-03-01 01:20:32',NULL,1048585,12),(115,1,0,2,16777245,'2022-03-01 01:20:32',NULL,1048585,12),(117,1,0,3,16777222,'2022-03-01 01:20:59',NULL,1048585,13),(118,1,0,3,16777223,'2022-03-01 01:20:59',NULL,1048585,13),(119,1,5,2,16777217,'2022-03-01 01:20:59',NULL,1048585,13),(121,1,4,2,16777217,'2022-03-01 01:20:59',NULL,1048585,13),(123,1,0,2,16777243,'2022-03-01 01:20:59',NULL,1048585,13),(124,1,0,2,16777245,'2022-03-01 01:20:59',NULL,1048585,13),(126,1,0,3,16777222,'2022-03-01 01:21:25',NULL,1048585,14),(127,1,0,3,16777223,'2022-03-01 01:21:25',NULL,1048585,14),(128,1,5,2,16777217,'2022-03-01 01:21:25',NULL,1048585,14),(130,1,4,2,16777217,'2022-03-01 01:21:25',NULL,1048585,14),(132,1,0,2,16777243,'2022-03-01 01:21:25',NULL,1048585,14),(133,1,0,2,16777245,'2022-03-01 01:21:25',NULL,1048585,14),(135,1,0,3,16777222,'2022-03-01 01:21:52',NULL,1048585,15),(136,1,0,3,16777223,'2022-03-01 01:21:52',NULL,1048585,15),(137,1,5,2,16777217,'2022-03-01 01:21:52',NULL,1048585,15),(139,1,4,2,16777217,'2022-03-01 01:21:52',NULL,1048585,15),(141,1,0,2,16777243,'2022-03-01 01:21:52',NULL,1048585,15),(142,1,0,2,16777245,'2022-03-01 01:21:52',NULL,1048585,15),(144,1,0,3,16777222,'2022-03-01 01:22:19',NULL,1048585,16),(145,1,0,3,16777223,'2022-03-01 01:22:19',NULL,1048585,16),(146,1,5,2,16777217,'2022-03-01 01:22:19',NULL,1048585,16),(148,1,4,2,16777217,'2022-03-01 01:22:20',NULL,1048585,16),(150,1,0,2,16777243,'2022-03-01 01:22:20',NULL,1048585,16),(151,1,0,2,16777245,'2022-03-01 01:22:20',NULL,1048585,16),(153,1,0,3,16777222,'2022-03-01 01:22:48',NULL,1048585,17),(154,1,0,3,16777223,'2022-03-01 01:22:48',NULL,1048585,17),(155,1,5,2,16777217,'2022-03-01 01:22:48',NULL,1048585,17),(157,1,4,2,16777217,'2022-03-01 01:22:48',NULL,1048585,17),(159,1,0,2,16777243,'2022-03-01 01:22:48',NULL,1048585,17),(160,1,0,2,16777245,'2022-03-01 01:22:48',NULL,1048585,17),(162,1,0,3,16777222,'2022-03-01 01:23:15',NULL,1048585,18),(163,1,0,3,16777223,'2022-03-01 01:23:15',NULL,1048585,18),(164,1,5,2,16777217,'2022-03-01 01:23:15',NULL,1048585,18),(166,1,4,2,16777217,'2022-03-01 01:23:15',NULL,1048585,18),(168,1,0,2,16777243,'2022-03-01 01:23:15',NULL,1048585,18),(169,1,0,2,16777245,'2022-03-01 01:23:15',NULL,1048585,18),(171,1,0,3,16777222,'2022-03-01 01:23:42',NULL,1048585,19),(172,1,0,3,16777223,'2022-03-01 01:23:42',NULL,1048585,19),(173,1,5,2,16777217,'2022-03-01 01:23:42',NULL,1048585,19),(175,1,4,2,16777217,'2022-03-01 01:23:42',NULL,1048585,19),(177,1,0,2,16777243,'2022-03-01 01:23:42',NULL,1048585,19),(178,1,0,2,16777245,'2022-03-01 01:23:42',NULL,1048585,19);
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
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','a:7:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:2;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:3;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:4;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:5;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:6;a:3:{s:9:\"className\";s:37:\"lib.pkp.classes.task.StatisticsReport\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}}','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('googlescholarplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','621d7337f3e92','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}','object');
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
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',1,0,'',0,''),(2,'en_US',2,'PDF',2,0,'',0,''),(3,'en_US',3,'PDF',3,0,'',0,''),(4,'en_US',4,'PDF',4,0,'',0,''),(5,'en_US',5,'PDF',5,0,'',0,''),(6,'en_US',6,'PDF',6,0,'',0,''),(7,'en_US',7,'PDF',7,0,'',0,''),(8,'en_US',8,'PDF',8,0,'',0,''),(9,'en_US',9,'PDF',9,0,'',0,''),(10,'en_US',10,'PDF',10,0,'',0,''),(11,'en_US',11,'PDF',11,0,'',0,''),(12,'en_US',12,'PDF',12,0,'',0,''),(13,'en_US',13,'PDF',13,0,'',0,''),(14,'en_US',14,'PDF',14,0,'',0,''),(15,'en_US',15,'PDF',15,0,'',0,''),(16,'en_US',16,'PDF',16,0,'',0,''),(17,'en_US',17,'PDF',17,0,'',0,''),(18,'en_US',18,'PDF',18,0,'',0,''),(19,'en_US',19,'PDF',19,0,'',0,'');
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','a:0:{}'),(1,'en_US','abstract','<p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The influence of lactation on the quantity and quality of cashmere production'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','a:0:{}'),(2,'','copyrightYear','2022'),(2,'en_US','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(2,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(2,'fr_CA','abstract',''),(2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','a:0:{}'),(3,'','copyrightYear','2022'),(3,'en_US','abstract','<p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.</p>'),(3,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(3,'fr_CA','abstract',''),(3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','a:0:{}'),(4,'','copyrightYear','2022'),(4,'en_US','abstract','<p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.</p>'),(4,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','Genetic transformation of forest trees'),(4,'fr_CA','abstract',''),(4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','a:0:{}'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','a:0:{}'),(6,'','copyrightYear','2022'),(6,'en_US','abstract','<p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.</p>'),(6,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','Developing efficacy beliefs in the classroom'),(6,'fr_CA','abstract',''),(6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','a:0:{}'),(7,'','copyrightYear','2022'),(7,'en_US','abstract','<p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.</p>'),(7,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Traditions and Trends in the Study of the Commons'),(7,'fr_CA','abstract',''),(7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','a:0:{}'),(8,'','copyrightYear','2022'),(8,'en_US','abstract','<p>None.</p>'),(8,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Hansen & Pinto: Reason Reclaimed'),(8,'fr_CA','abstract',''),(8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','a:0:{}'),(9,'','copyrightYear','2022'),(9,'en_US','abstract','<p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.</p>'),(9,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(9,'fr_CA','abstract',''),(9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','a:0:{}'),(10,'','copyrightYear','2022'),(10,'en_US','abstract','<p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.</p>'),(10,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(10,'fr_CA','abstract',''),(10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','a:0:{}'),(11,'','copyrightYear','2022'),(11,'en_US','abstract','<p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.</p>'),(11,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Learning Sustainable Design through Service'),(11,'fr_CA','abstract',''),(11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','a:0:{}'),(12,'','copyrightYear','2022'),(12,'en_US','abstract','<p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.</p>'),(12,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(12,'fr_CA','abstract',''),(12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','a:0:{}'),(13,'','copyrightYear','2022'),(13,'en_US','abstract','<p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.</p>'),(13,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(13,'fr_CA','abstract',''),(13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','a:0:{}'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','a:0:{}'),(15,'','copyrightYear','2022'),(15,'en_US','abstract','<p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.</p>'),(15,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Yam diseases and its management in Nigeria'),(15,'fr_CA','abstract',''),(15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','a:0:{}'),(16,'','copyrightYear','2022'),(16,'en_US','abstract','<p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.</p>'),(16,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(16,'fr_CA','abstract',''),(16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','a:0:{}'),(17,'','copyrightYear','2022'),(17,'en_US','abstract','<p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.</p>'),(17,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(17,'fr_CA','abstract',''),(17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title',''),(18,'','categoryIds','a:0:{}'),(18,'','copyrightYear','2022'),(18,'en_US','abstract','<p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.</p>'),(18,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(18,'en_US','prefix',''),(18,'en_US','subtitle',''),(18,'en_US','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(18,'fr_CA','abstract',''),(18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(18,'fr_CA','prefix',''),(18,'fr_CA','subtitle',''),(18,'fr_CA','title',''),(19,'','categoryIds','a:0:{}'),(19,'','copyrightYear','2022'),(19,'en_US','abstract','<p>None.</p>'),(19,'en_US','copyrightHolder','Public Knowledge Preprint Server'),(19,'en_US','prefix',''),(19,'en_US','subtitle',''),(19,'en_US','title','Finocchiaro: Arguments About Arguments'),(19,'fr_CA','abstract',''),(19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(19,'fr_CA','prefix',''),(19,'fr_CA','subtitle',''),(19,'fr_CA','title','');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2022-03-01 01:15:30','en_US',1,1,1,1,NULL,1),(2,0,'2022-03-01','2022-03-01 01:15:58','en_US',2,1,2,3,NULL,1),(3,0,'2022-03-01','2022-03-01 01:16:30','en_US',3,1,3,3,NULL,1),(4,0,'2022-03-01','2022-03-01 01:16:57','en_US',5,1,4,3,NULL,1),(5,0,'2022-03-01','2022-03-01 01:17:25','en_US',6,1,5,3,NULL,1),(6,0,'2022-03-01','2022-03-01 01:17:52','en_US',7,1,6,3,NULL,1),(7,0,'2022-03-01','2022-03-01 01:18:22','en_US',8,1,7,3,NULL,1),(8,0,'2022-03-01','2022-03-01 01:18:48','en_US',10,1,8,3,NULL,1),(9,0,'2022-03-01','2022-03-01 01:19:15','en_US',11,1,9,3,NULL,1),(10,0,'2022-03-01','2022-03-01 01:19:41','en_US',12,1,10,3,NULL,1),(11,0,'2022-03-01','2022-03-01 01:20:12','en_US',13,1,11,3,NULL,1),(12,0,'2022-03-01','2022-03-01 01:20:38','en_US',15,1,12,3,NULL,1),(13,0,'2022-03-01','2022-03-01 01:21:05','en_US',16,1,13,3,NULL,1),(14,0,'2022-03-01','2022-03-01 01:21:31','en_US',17,1,14,3,NULL,1),(15,0,'2022-03-01','2022-03-01 01:21:58','en_US',18,1,15,3,NULL,1),(16,0,'2022-03-01','2022-03-01 01:22:25','en_US',19,1,16,3,NULL,1),(17,0,'2022-03-01','2022-03-01 01:22:54','en_US',20,1,17,3,NULL,1),(18,0,'2022-03-01','2022-03-01 01:23:22','en_US',21,1,18,3,NULL,1),(19,0,'2022-03-01','2022-03-01 01:23:48','en_US',22,1,19,3,NULL,1);
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
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
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
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
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
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
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
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT '1',
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
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
  `round` tinyint(4) NOT NULL,
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.StatisticsReport','2022-03-01 01:13:17'),('plugins.generic.usageStats.UsageStatsLoader','2022-03-01 01:13:17');
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
  `setting_type` varchar(6) NOT NULL,
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
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `sections` VALUES (1,1,0,0,0,1,1,0,0,0,NULL);
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
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
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
INSERT INTO `sessions` VALUES ('4f6tpv7djgikjo7m94pbgcsa4s',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097447,1646097471,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097471;s:5:\"token\";s:32:\"1dee886654a7b80d8325934cfa427f46\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('6e75ea2rtvdjdhf7v6ic95fd26',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097530,1646097556,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097555;s:5:\"token\";s:32:\"72911ebf4dcbc06fc58218dc16a13853\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('7fmm5repmihdk2p14b3s95g00s',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097197,1646097207,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646097207;s:5:\"token\";s:32:\"7d7af3ec59810a8a777565a92f8f91b7\";}','localhost'),('7o32lu6nluu7j2da896a5f9o11',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097803,1646097828,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097828;s:5:\"token\";s:32:\"783daecfd572aa876e48f27e6f5421e4\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('aamu25ftaeqf3oo3j69qr838t7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097195,1646097195,0,'','localhost'),('aoumccohgbo953tlepulcfkrbh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097720,1646097745,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097745;s:5:\"token\";s:32:\"e7aa82e19df0029d2e0be1970ca258cf\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('apju1hk79dqr60butpprvagb39',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097503,1646097528,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097528;s:5:\"token\";s:32:\"687451ac29141a865b2c344b978b7eb2\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('b0rjqoesr9lju11imqospjpgmb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097748,1646097774,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097774;s:5:\"token\";s:32:\"b6c7c3fcc754207e79276c2e1d151fc8\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('c0cvn5lr3j75mmd2dadnna3hqd',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097333,1646097358,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097358;s:5:\"token\";s:32:\"1966a4a4c8e49dbe8ea84c800a45b2c1\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('e0menhuoh3qmvfr1a0b33akuof',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097311,1646097331,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097331;s:5:\"token\";s:32:\"84eeb330b232037f597395b63d29bf19\";}username|s:7:\"ccorino\";userId|s:1:\"7\";','localhost'),('fi0q3oo0f50g4bs5o8r8suit84',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097693,1646097718,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097718;s:5:\"token\";s:32:\"5c62f7a68f7bf3df331cb2b752e05e43\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('fr3jo8ke47mjmc0u1pktb23cbr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097583,1646097611,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097612;s:5:\"token\";s:32:\"e1af6c29df75b201e8d9cdb00267b5bd\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('fuc5jma9r3j6aulck3netltt19',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097361,1646097390,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097390;s:5:\"token\";s:32:\"0bd0529e0226c0227a2a6b628b655c08\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('ghf17fbte9d05k0j50lha8frh3',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097229,1646097235,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646097236;s:5:\"token\";s:32:\"6378b47aecc46fe8dbe3667f921a09d4\";}','localhost'),('h9a9t6ai4lnc2sd9t1sv0du616',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097613,1646097638,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097638;s:5:\"token\";s:32:\"71efc9fe343482ac0393c61977ae24ba\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('hb9h3mesv55cssvg8th4vlg7e8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097557,1646097581,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097581;s:5:\"token\";s:32:\"9f7af7f75e880a21b541190d20948ea2\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('ibsau3tmgkam2rl02sohb1k4dg',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097221,1646097229,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646097229;s:5:\"token\";s:32:\"d832f508f67594fb4ae1fd7b5d4350c1\";}','localhost'),('m72v3dibrti0eb2u4gp2g00mdc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097666,1646097691,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097691;s:5:\"token\";s:32:\"5331a7e83074792531554523b66993e1\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('m7n5h7bprijgc8m34fkho4aeru',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097640,1646097665,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097665;s:5:\"token\";s:32:\"cd3bc8f75e7028cbf6f09048938191c3\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('n2ul2kv2rns5m6p7rcfvejbuso',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097282,1646097288,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646097288;s:5:\"token\";s:32:\"09e1b3a87d4a10fa13ffb94ff1aff7de\";}','localhost'),('os1jq36b1dt6vgf5ugpjetepbq',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097473,1646097502,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097502;s:5:\"token\";s:32:\"9ac47bd484f155e719b9d0c847d4ca4f\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('ppesnsn08glq8npbnulmbk2q0f',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097288,1646097309,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646097309;s:5:\"token\";s:32:\"d89649bfed2c7ec377adbf8663b2ed10\";}','localhost'),('pvodqscliq1lk1b0dugkg34crc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097237,1646097281,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1646097281;s:5:\"token\";s:32:\"5117f8527c9a96b95ef1d6a4eaa47afd\";}','localhost'),('sn2h5s8l0scciq402n5ndlcb83',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097392,1646097417,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097417;s:5:\"token\";s:32:\"a0eeff5b413bb28a65ad8a67041d172c\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('t8dv3cc59ngi1rljmnt7b3k6pm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097776,1646097801,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097801;s:5:\"token\";s:32:\"e91f0f682446790fa0b6857d10edcdb6\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('t99780d60ri2mcojfs9eqdrrem',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097419,1646097445,0,'csrf|a:2:{s:9:\"timestamp\";i:1646097445;s:5:\"token\";s:32:\"0fe760b24568875f7ceead784236982c\";}username|s:7:\"dbarnes\";userId|s:1:\"3\";','localhost'),('uiql84lfm5bvgdb9hmo74l9fln',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1646097207,1646097221,0,'userId|s:1:\"1\";username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1646097221;s:5:\"token\";s:32:\"7dba54444bc99e818d997da1998918e4\";}','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(1024) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en_US',6,'a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"fr_CA\";}',NULL);
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
  `recommend_only` tinyint(4) NOT NULL DEFAULT '0',
  `can_change_metadata` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2022-03-01 01:15:17',0,1),(2,1,3,5,'2022-03-01 01:15:31',0,1),(3,1,3,4,'2022-03-01 01:15:31',0,1),(4,2,4,8,'2022-03-01 01:15:38',0,1),(5,2,3,5,'2022-03-01 01:15:52',0,1),(6,2,3,4,'2022-03-01 01:15:52',0,1),(7,3,4,9,'2022-03-01 01:16:06',0,1),(8,3,3,5,'2022-03-01 01:16:24',0,1),(9,3,3,4,'2022-03-01 01:16:24',0,1),(10,4,4,10,'2022-03-01 01:16:37',0,1),(11,4,3,5,'2022-03-01 01:16:51',0,1),(12,4,3,4,'2022-03-01 01:16:51',0,1),(13,5,4,11,'2022-03-01 01:17:05',0,1),(14,5,3,5,'2022-03-01 01:17:19',0,1),(15,5,3,4,'2022-03-01 01:17:19',0,1),(16,6,4,12,'2022-03-01 01:17:32',0,1),(17,6,3,5,'2022-03-01 01:17:46',0,1),(18,6,3,4,'2022-03-01 01:17:46',0,1),(19,7,4,13,'2022-03-01 01:17:59',0,1),(20,7,3,5,'2022-03-01 01:18:16',0,1),(21,7,3,4,'2022-03-01 01:18:16',0,1),(22,8,4,14,'2022-03-01 01:18:29',0,1),(23,8,3,5,'2022-03-01 01:18:43',0,1),(24,8,3,4,'2022-03-01 01:18:43',0,1),(25,9,4,15,'2022-03-01 01:18:55',0,1),(26,9,3,5,'2022-03-01 01:19:09',0,1),(27,9,3,4,'2022-03-01 01:19:09',0,1),(28,10,4,16,'2022-03-01 01:19:22',0,1),(29,10,3,5,'2022-03-01 01:19:36',0,1),(30,10,3,4,'2022-03-01 01:19:36',0,1),(31,11,4,17,'2022-03-01 01:19:48',0,1),(32,11,3,5,'2022-03-01 01:20:05',0,1),(33,11,3,4,'2022-03-01 01:20:05',0,1),(34,12,4,18,'2022-03-01 01:20:19',0,1),(35,12,3,5,'2022-03-01 01:20:32',0,1),(36,12,3,4,'2022-03-01 01:20:32',0,1),(37,13,4,19,'2022-03-01 01:20:45',0,1),(38,13,3,5,'2022-03-01 01:20:59',0,1),(39,13,3,4,'2022-03-01 01:20:59',0,1),(40,14,4,20,'2022-03-01 01:21:11',0,1),(41,14,3,5,'2022-03-01 01:21:25',0,1),(42,14,3,4,'2022-03-01 01:21:25',0,1),(43,15,4,21,'2022-03-01 01:21:39',0,1),(44,15,3,5,'2022-03-01 01:21:52',0,1),(45,15,3,4,'2022-03-01 01:21:52',0,1),(46,16,4,22,'2022-03-01 01:22:05',0,1),(47,16,3,5,'2022-03-01 01:22:19',0,1),(48,16,3,4,'2022-03-01 01:22:19',0,1),(49,17,4,23,'2022-03-01 01:22:33',0,1),(50,17,3,5,'2022-03-01 01:22:48',0,1),(51,17,3,4,'2022-03-01 01:22:48',0,1),(52,18,4,24,'2022-03-01 01:23:01',0,1),(53,18,3,5,'2022-03-01 01:23:15',0,1),(54,18,3,4,'2022-03-01 01:23:15',0,1),(55,19,4,25,'2022-03-01 01:23:28',0,1),(56,19,3,5,'2022-03-01 01:23:42',0,1),(57,19,3,4,'2022-03-01 01:23:42',0,1);
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
  `user_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`user_id`,`assoc_type`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_type`,`assoc_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,4,530),(1,1,5,530);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_artwork_files`
--

DROP TABLE IF EXISTS `submission_artwork_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text,
  `permission_terms` text,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_artwork_files`
--

LOCK TABLES `submission_artwork_files` WRITE;
/*!40000 ALTER TABLE `submission_artwork_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_artwork_files` ENABLE KEYS */;
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
  `comment_title` text,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
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
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','ccorino, The influence of lactation on the quantity and quality of cashmere production.pdf','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','ckwantes, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf','string'),(2,'fr_CA','name','','string'),(3,'en_US','name','cmontgomerie, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf','string'),(3,'fr_CA','name','','string'),(4,'en_US','name','ddiouf, Genetic transformation of forest trees.pdf','string'),(4,'fr_CA','name','','string'),(5,'en_US','name','dphillips, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf','string'),(5,'fr_CA','name','','string'),(6,'en_US','name','dsokoloff, Developing efficacy beliefs in the classroom.pdf','string'),(6,'fr_CA','name','','string'),(7,'en_US','name','eostrom, Traditions and Trends in the Study of the Commons.pdf','string'),(7,'fr_CA','name','','string'),(8,'en_US','name','fpaglieri, Hansen & Pinto: Reason Reclaimed.pdf','string'),(8,'fr_CA','name','','string'),(9,'en_US','name','jmwandenga, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf','string'),(9,'fr_CA','name','','string'),(10,'en_US','name','jnovak, Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf','string'),(10,'fr_CA','name','','string'),(11,'en_US','name','kalkhafaji, Learning Sustainable Design through Service.pdf','string'),(11,'fr_CA','name','','string'),(12,'en_US','name','lchristopher, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf','string'),(12,'fr_CA','name','','string'),(13,'en_US','name','lkumiega, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf','string'),(13,'fr_CA','name','','string'),(14,'en_US','name','pdaniel, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf','string'),(14,'fr_CA','name','','string'),(15,'en_US','name','rbaiyewu, Yam diseases and its management in Nigeria.pdf','string'),(15,'fr_CA','name','','string'),(16,'en_US','name','rrossi, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf','string'),(16,'fr_CA','name','','string'),(17,'en_US','name','vkarbasizaed, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf','string'),(17,'fr_CA','name','','string'),(18,'en_US','name','vwilliamson, Self-Organization in Multi-Level Institutions in Networked Environments.pdf','string'),(18,'fr_CA','name','','string'),(19,'en_US','name','zwoods, Finocchiaro: Arguments About Arguments.pdf','string'),(19,'fr_CA','name','','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,NULL,NULL,1,'application/pdf',1,14572,'The influence of lactation on the quantity and quality of cashmere production.pdf',10,NULL,NULL,0,'2022-03-01 01:15:24','2022-03-01 01:15:24',7,521,1),(2,1,NULL,NULL,2,'application/pdf',1,14572,'The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf',10,NULL,NULL,0,'2022-03-01 01:15:46','2022-03-01 01:15:46',8,521,2),(3,1,NULL,NULL,3,'application/pdf',1,14572,'Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf',10,NULL,NULL,0,'2022-03-01 01:16:14','2022-03-01 01:16:14',9,521,3),(4,1,NULL,NULL,4,'application/pdf',1,14572,'Genetic transformation of forest trees.pdf',10,NULL,NULL,0,'2022-03-01 01:16:45','2022-03-01 01:16:45',10,521,4),(5,1,NULL,NULL,5,'application/pdf',1,14572,'Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf',10,NULL,NULL,0,'2022-03-01 01:17:13','2022-03-01 01:17:13',11,521,5),(6,1,NULL,NULL,6,'application/pdf',1,14572,'Developing efficacy beliefs in the classroom.pdf',10,NULL,NULL,0,'2022-03-01 01:17:40','2022-03-01 01:17:40',12,521,6),(7,1,NULL,NULL,7,'application/pdf',1,14572,'Traditions and Trends in the Study of the Commons.pdf',10,NULL,NULL,0,'2022-03-01 01:18:06','2022-03-01 01:18:06',13,521,7),(8,1,NULL,NULL,8,'application/pdf',1,14572,'Hansen & Pinto: Reason Reclaimed.pdf',10,NULL,NULL,0,'2022-03-01 01:18:37','2022-03-01 01:18:37',14,521,8),(9,1,NULL,NULL,9,'application/pdf',1,14572,'Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf',10,NULL,NULL,0,'2022-03-01 01:19:03','2022-03-01 01:19:03',15,521,9),(10,1,NULL,NULL,10,'application/pdf',1,14572,'Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf',10,NULL,NULL,0,'2022-03-01 01:19:30','2022-03-01 01:19:30',16,521,10),(11,1,NULL,NULL,11,'application/pdf',1,14572,'Learning Sustainable Design through Service.pdf',10,NULL,NULL,0,'2022-03-01 01:19:56','2022-03-01 01:19:56',17,521,11),(12,1,NULL,NULL,12,'application/pdf',1,14572,'Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf',10,NULL,NULL,0,'2022-03-01 01:20:26','2022-03-01 01:20:26',18,521,12),(13,1,NULL,NULL,13,'application/pdf',1,14572,'Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf',10,NULL,NULL,0,'2022-03-01 01:20:52','2022-03-01 01:20:52',19,521,13),(14,1,NULL,NULL,14,'application/pdf',1,14572,'Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf',10,NULL,NULL,0,'2022-03-01 01:21:19','2022-03-01 01:21:19',20,521,14),(15,1,NULL,NULL,15,'application/pdf',1,14572,'Yam diseases and its management in Nigeria.pdf',10,NULL,NULL,0,'2022-03-01 01:21:47','2022-03-01 01:21:47',21,521,15),(16,1,NULL,NULL,16,'application/pdf',1,14572,'Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf',10,NULL,NULL,0,'2022-03-01 01:22:13','2022-03-01 01:22:13',22,521,16),(17,1,NULL,NULL,17,'application/pdf',1,14572,'Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in.pdf',10,NULL,NULL,0,'2022-03-01 01:22:41','2022-03-01 01:22:41',23,521,17),(18,1,NULL,NULL,18,'application/pdf',1,14572,'Self-Organization in Multi-Level Institutions in Networked Environments.pdf',10,NULL,NULL,0,'2022-03-01 01:23:09','2022-03-01 01:23:09',24,521,18),(19,1,NULL,NULL,19,'application/pdf',1,14572,'Finocchiaro: Arguments About Arguments.pdf',10,NULL,NULL,0,'2022-03-01 01:23:36','2022-03-01 01:23:36',25,521,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (515,'11-'),(654,'21st'),(340,'aalborg'),(786,'abattoir'),(825,'abnormal'),(424,'academic'),(523,'accepted'),(389,'accompanying'),(705,'achieving'),(467,'acid'),(540,'acids'),(249,'action'),(925,'actor'),(918,'actors'),(376,'added'),(421,'address'),(471,'adipose'),(129,'administered'),(352,'administration'),(740,'adopted'),(741,'advocated'),(814,'affected'),(25,'affects'),(782,'african'),(924,'agree'),(847,'aid'),(460,'aim'),(407,'al-khafaji'),(67,'alberta'),(140,'alexandria'),(643,'analyses'),(36,'analysis'),(498,'analyzed'),(496,'animals'),(718,'anthracnose'),(890,'antibiotics'),(861,'antimicrobial'),(574,'antonio'),(604,'appears'),(149,'applications'),(351,'applied'),(551,'aquifer'),(13,'archival'),(638,'areas'),(165,'argument'),(942,'arguments'),(759,'ash'),(461,'assess'),(545,'assessed'),(599,'assessments'),(650,'atlantic'),(15,'attitude'),(451,'australian'),(848,'authorities'),(403,'authority'),(343,'availability'),(476,'averaging'),(492,'backfat'),(164,'background'),(708,'baiyewu'),(773,'barcelona'),(660,'barriers'),(475,'barrows'),(555,'barton'),(404,'based'),(397,'basin'),(362,'basins'),(662,'basis'),(598,'bearings'),(785,'beef'),(99,'began'),(177,'beliefs'),(684,'belonging'),(31,'benchmark'),(45,'benefit'),(588,'blanco'),(51,'brazil'),(402,'brazos'),(810,'breeds'),(613,'buda'),(798,'bulls'),(453,'butyrate'),(513,'c18'),(517,'c20'),(101,'called'),(779,'cameroon'),(95,'canada'),(373,'capabilities'),(303,'cape'),(812,'carcass'),(793,'carcasses'),(544,'carefully'),(675,'carried'),(649,'case'),(898,'cases'),(816,'category'),(1,'catherine'),(777,'cattle'),(781,'central'),(655,'century'),(602,'cfs'),(446,'challenges'),(624,'change'),(433,'chapter'),(792,'characteristics'),(211,'children'),(50,'china'),(765,'chips'),(450,'christopher'),(514,'cis'),(216,'citizens'),(184,'claim'),(173,'claims'),(81,'classroom'),(897,'clinical'),(692,'close'),(500,'close-'),(651,'coast'),(881,'coli'),(865,'coliforms'),(286,'colleagues'),(494,'collected'),(577,'collection'),(927,'collective'),(923,'collectively'),(56,'collectivistic'),(206,'college'),(198,'com-mitments'),(714,'combating'),(178,'commitments'),(188,'common'),(260,'commons'),(40,'communication'),(686,'communities'),(669,'community'),(9,'comparative'),(917,'compare'),(34,'compared'),(46,'comparisons'),(192,'competencies'),(29,'compiled'),(392,'complete'),(843,'completely'),(370,'complex'),(499,'composition'),(71,'computer'),(894,'concentration'),(572,'concept'),(318,'conclusive'),(840,'condemned'),(384,'condensed'),(341,'condensing'),(557,'conditions'),(226,'conducted'),(214,'confident'),(319,'conflicting'),(906,'conjugative'),(633,'connection'),(549,'connectivity'),(932,'consensus'),(724,'considered'),(52,'consistent'),(187,'consists'),(525,'consortium'),(11,'construct'),(398,'contained'),(285,'contemporary'),(505,'content'),(62,'context'),(640,'continual'),(217,'continue'),(334,'continuous'),(671,'contributing'),(936,'contributors'),(853,'control'),(443,'coordinated'),(104,'core'),(207,'cork'),(329,'corporate'),(682,'council'),(28,'countries'),(698,'country'),(105,'courses'),(278,'coward'),(823,'cows'),(238,'cps'),(65,'craig'),(30,'create'),(235,'creative'),(587,'creek'),(166,'critique'),(743,'crop'),(766,'cubes'),(751,'cultivars'),(61,'cultural'),(24,'culture'),(687,'cultures'),(940,'cuny'),(98,'curriculum'),(159,'dana'),(645,'daniel'),(14,'data'),(385,'dataset'),(367,'datasets'),(266,'decades1'),(919,'decide'),(933,'decision'),(247,'decision-making'),(372,'decision-support'),(333,'decisions'),(169,'deep'),(678,'defining'),(22,'degree'),(679,'delivering'),(637,'demands'),(90,'demonstrate'),(673,'describes'),(412,'design'),(647,'designing'),(749,'destruction'),(730,'devastating'),(401,'develop'),(374,'developed'),(208,'developing'),(117,'development'),(138,'diaga'),(536,'dietary'),(481,'diets'),(532,'differed'),(891,'difference'),(199,'difficult'),(930,'difficulty'),(139,'diouf'),(448,'directions'),(170,'disagreement'),(269,'disciplines'),(623,'discontinuity'),(148,'discussed'),(680,'discussions'),(723,'disease'),(711,'diseases'),(591,'dissipated'),(267,'distinguished'),(837,'distress'),(332,'distribution'),(202,'diverge'),(658,'diversity'),(573,'divide'),(323,'dividend'),(307,'dividends'),(204,'domatilia'),(568,'downstream'),(585,'drainage'),(622,'dramatic'),(849,'draw'),(556,'drought'),(597,'droughts'),(728,'dry'),(526,'dry-cured'),(844,'due'),(626,'dynamic'),(321,'economists'),(516,'ecosenoic'),(827,'ectoparasites'),(735,'edible'),(84,'education'),(550,'edwards'),(64,'effect'),(42,'effectiveness'),(244,'effects'),(209,'efficacy'),(41,'efficiency'),(700,'egalitarianism'),(252,'elinor'),(657,'embracing'),(426,'emerging'),(683,'emphasises'),(309,'empirical'),(137,'employed'),(17,'employees'),(907,'encoding'),(826,'encountered'),(565,'endangered'),(360,'endeavors'),(150,'engineering'),(430,'engineers'),(233,'enhance'),(379,'enhanced'),(250,'enhancing'),(833,'enlarged'),(874,'enterobacteriacea'),(414,'environmental'),(916,'environments'),(210,'equip'),(12,'equivalence'),(880,'escherichia'),(571,'established'),(694,'ethnic'),(695,'ethno-linguistic'),(338,'evaluation'),(310,'evidence'),(21,'examine'),(133,'examined'),(668,'examines'),(63,'exerts'),(48,'exhibited'),(447,'exist'),(74,'existing'),(582,'exists'),(358,'expanding'),(261,'expe-'),(432,'experiences'),(156,'expression'),(608,'extended'),(610,'extensive'),(294,'fabio'),(5,'facets'),(35,'factor'),(38,'factors'),(876,'faeces'),(420,'failed'),(745,'fallowing'),(464,'fat'),(828,'fatigue'),(487,'fats'),(466,'fatty'),(375,'features'),(489,'fed'),(716,'field'),(877,'fifteen'),(473,'fifty-four'),(763,'finally'),(320,'financial'),(331,'financing'),(186,'find'),(54,'findings'),(941,'finocchiaro'),(316,'firm'),(596,'flow'),(603,'flowing'),(396,'flows'),(842,'flukes'),(345,'focus'),(172,'fogelin'),(167,'fogelins'),(183,'fogelin’s'),(143,'forest'),(760,'found'),(176,'framework'),(255,'frank'),(180,'fruitfully'),(807,'fulani'),(335,'function'),(761,'fungal'),(830,'fungal-like'),(314,'future'),(664,'gender'),(775,'general'),(155,'genes'),(141,'genetic'),(656,'genuinely'),(757,'gins'),(124,'goal'),(154,'governing'),(93,'government'),(91,'grade'),(616,'gradient'),(625,'gradients'),(219,'graduation'),(581,'groundwater'),(580,'groundwater-level'),(904,'group'),(378,'growing'),(264,'growth'),(806,'gudali'),(324,'guidance'),(801,'guinea'),(527,'ham'),(190,'hand'),(297,'hansen'),(747,'healthy'),(469,'heavy'),(802,'high'),(58,'higher'),(503,'highest'),(701,'highlights'),(136,'hired'),(119,'hiring'),(869,'hospital'),(875,'human'),(630,'hydraulic'),(579,'hydrogeologic'),(548,'hydrologic'),(593,'hydrologically'),(435,'identification'),(879,'identified'),(567,'immediately'),(388,'impacts'),(112,'implement'),(97,'implementation'),(922,'implemented'),(76,'implications'),(702,'importance'),(852,'improve'),(454,'improves'),(151,'improving'),(690,'include'),(400,'included'),(742,'includes'),(636,'increased'),(537,'increases'),(529,'index'),(254,'indiana'),(685,'individual'),(33,'individually'),(55,'individuals'),(750,'infected'),(762,'infection'),(868,'infections'),(462,'influence'),(605,'influenced'),(629,'influences'),(102,'information'),(215,'informed'),(103,'infused'),(522,'ing'),(632,'inherent'),(893,'inhibitory'),(87,'initiatives'),(382,'input'),(914,'institutions'),(232,'instruction'),(423,'integrates'),(79,'integration'),(677,'intention'),(648,'intercultural'),(672,'interculturality'),(291,'interest'),(174,'interlocutors'),(442,'internships'),(337,'intuitive'),(162,'investigating'),(330,'investment'),(327,'investors'),(246,'involve'),(693,'involvement'),(434,'involves'),(520,'iodine'),(871,'iran'),(69,'irvine'),(870,'isfahan'),(480,'isoenergetic'),(866,'isolated'),(878,'isolates'),(83,'issue'),(789,'january'),(6,'job'),(301,'john'),(114,'jurisdictions'),(859,'karbasizaed'),(406,'karim'),(883,'kelebsiella'),(220,'key'),(212,'knowledge'),(547,'kumiega'),(2,'kwantes'),(612,'kyle'),(257,'laerhoven'),(829,'lameness'),(663,'language'),(369,'large'),(419,'largely'),(788,'largest'),(706,'lasting'),(530,'layers'),(248,'leads'),(223,'learn'),(218,'learners'),(110,'learning'),(440,'led'),(449,'leo'),(832,'lesions'),(92,'level'),(519,'levels'),(428,'leveraged'),(445,'limitations'),(518,'linoleic'),(512,'linolenic'),(546,'lise'),(308,'literature'),(768,'live'),(841,'liver'),(755,'locally'),(270,'long'),(463,'long-term'),(592,'longer'),(795,'longissimus'),(279,'los'),(726,'losses'),(615,'low'),(509,'lowest'),(846,'lungs'),(834,'lymph'),(281,'mackenzie'),(756,'made'),(484,'maize'),(82,'major'),(274,'managed'),(325,'management'),(96,'mandated'),(790,'march'),(553,'marcos'),(409,'margaret'),(68,'mark'),(731,'marked'),(817,'markedly'),(734,'marketable'),(478,'matched'),(748,'material'),(809,'mbororo'),(240,'means'),(819,'meat'),(153,'mechanisms'),(123,'meet'),(715,'menace'),(653,'met'),(862,'metal'),(899,'metals'),(383,'methodology'),(895,'mic'),(284,'mid-1980s'),(699,'militate'),(892,'minimal'),(275,'mismanaged'),(194,'mistakenly'),(399,'model'),(348,'modeling'),(344,'models'),(405,'modifying'),(641,'monitoring'),(510,'monounsaturated'),(66,'montgomerie'),(769,'months'),(410,'morse'),(721,'mosaic'),(241,'motivate'),(251,'motivation'),(511,'mufa'),(913,'multi-level'),(909,'multidrug-resistance'),(667,'multiethnic'),(666,'multilingual'),(19,'multinational'),(889,'multiple'),(302,'mwandenga'),(709,'nairobi'),(23,'national'),(32,'nations'),(26,'nature'),(368,'necessarily'),(639,'necessitates'),(915,'networked'),(135,'newly'),(652,'nicaragua'),(712,'nigeria'),(8,'nine-nation'),(835,'nodes'),(838,'nodular'),(619,'non-drought'),(590,'normal'),(621,'north'),(867,'nosocomial'),(339,'novak'),(601,'numerical'),(222,'nurturing'),(774,'nutrition'),(541,'nutritional'),(855,'observed'),(317,'offer'),(485,'oil'),(586,'onion'),(179,'order'),(20,'organization'),(39,'organizational'),(438,'organizations'),(839,'organs'),(800,'origin'),(391,'original'),(253,'ostrom'),(659,'overcome'),(295,'paglieri'),(125,'paper'),(799,'parameters'),(524,'parma'),(196,'part'),(224,'participate'),(674,'participatory'),(437,'partner'),(265,'past'),(644,'patricia'),(905,'pattern'),(872,'patterns'),(703,'pedagogy'),(661,'people'),(201,'people’s'),(886,'percent'),(455,'performance'),(458,'period'),(609,'periods'),(354,'permit'),(365,'permits'),(44,'personal'),(902,'persons'),(934,'perverse'),(160,'phillips'),(470,'pig'),(457,'piglets'),(502,'pigs'),(298,'pinto'),(277,'places'),(563,'plan'),(357,'planning'),(746,'planting'),(158,'plants'),(864,'plasmid'),(884,'pneumoniae'),(77,'policy'),(507,'polyunsaturated'),(635,'population'),(736,'portions'),(243,'positive'),(888,'possess'),(326,'potential'),(617,'potentiometric'),(696,'power'),(322,'practical'),(78,'practice'),(791,'pre-slaughter'),(811,'predominant'),(824,'pregnant'),(431,'present'),(229,'presented'),(713,'presents'),(854,'prevent'),(53,'previous'),(559,'primary'),(416,'principles'),(191,'pro-cedural'),(236,'problem'),(929,'problematic'),(197,'procedural'),(764,'processing'),(805,'production'),(185,'productive'),(116,'professional'),(468,'profile'),(873,'profiles'),(578,'program'),(850,'programmes'),(147,'progress'),(441,'project-based'),(436,'projects'),(856,'promote'),(704,'promoting'),(631,'properties'),(538,'proportion'),(315,'prospects'),(564,'protect'),(371,'provide'),(94,'province'),(86,'provincial'),(130,'public'),(508,'pufa'),(611,'pumping'),(935,'punishing'),(181,'pursue'),(542,'quality'),(733,'quantity'),(569,'questions'),(570,'raised'),(707,'rana'),(477,'randomized'),(486,'rapeseed'),(634,'rapid'),(132,'rate'),(931,'reaching'),(815,'rearing'),(299,'reason'),(146,'recent'),(606,'recharge'),(300,'reclaimed'),(794,'recorded'),(908,'recovered'),(808,'red'),(732,'reduction'),(738,'reductions'),(501,'reflected'),(364,'reflects'),(182,'refute'),(719,'regarded'),(290,'region'),(355,'regional'),(292,'regions'),(697,'relations'),(903,'relationship'),(336,'rely'),(882,'remaining'),(390,'removed'),(57,'report'),(797,'represent'),(780,'representative'),(395,'represents'),(134,'require'),(111,'required'),(73,'requirements'),(59,'research'),(283,'researchers'),(387,'reservoir'),(366,'reservoirs'),(863,'resistance'),(752,'resistant'),(273,'resources'),(108,'respect'),(836,'respiratory'),(131,'response'),(27,'responses'),(595,'result'),(521,'result-'),(127,'results'),(37,'revealed'),(145,'review'),(280,'reyes'),(262,'rienced'),(353,'rights'),(361,'river'),(171,'robert'),(221,'role'),(296,'rome'),(771,'rosanna'),(772,'rossi'),(729,'rot'),(744,'rotation'),(350,'routinely'),(937,'ruled'),(784,'safety'),(493,'samples'),(552,'san'),(920,'sanction'),(926,'sanctioned'),(928,'sanctioning'),(921,'sanctions'),(7,'satisfaction'),(49,'satisfied'),(504,'saturated'),(803,'savannah'),(268,'scholars'),(113,'school'),(288,'sec-'),(575,'segments'),(386,'selected'),(213,'self-belief'),(234,'self-efficacy'),(912,'self-organization'),(594,'separated'),(100,'september'),(558,'serves'),(413,'service'),(422,'service-learning'),(393,'set'),(425,'setting'),(885,'seventy'),(725,'severe'),(506,'sfa'),(175,'share'),(163,'shared'),(328,'shareholding'),(767,'shelf'),(535,'show'),(821,'showed'),(230,'showing'),(242,'shown'),(614,'shows'),(313,'signal'),(311,'signaling'),(305,'signalling'),(900,'significant'),(533,'significantly'),(820,'similar'),(380,'simplifying'),(381,'simulation'),(600,'simulations'),(18,'single'),(776,'situation'),(72,'skill'),(88,'skills'),(831,'skin'),(491,'slaughter'),(778,'slaughtered'),(490,'slaughtering'),(620,'slopes'),(227,'social'),(225,'society'),(452,'sodium'),(205,'sokoloff'),(237,'solving'),(562,'source'),(561,'south-central'),(566,'species'),(272,'specific'),(106,'specifies'),(720,'spread'),(554,'springs'),(676,'staff'),(120,'standards'),(408,'stanford'),(363,'state'),(356,'statewide'),(717,'storage'),(739,'stored'),(887,'strains'),(118,'strategies'),(231,'strategy'),(394,'streamflows'),(851,'strengthen'),(628,'structural'),(47,'structures'),(439,'student'),(89,'students'),(271,'studied'),(228,'studies'),(10,'study'),(783,'sub-region'),(531,'subcutaneous'),(263,'substantial'),(444,'successful'),(60,'suggest'),(312,'suggests'),(126,'summarizes'),(488,'supplement-'),(465,'supplementation'),(482,'supplemented'),(560,'supply'),(43,'support'),(193,'supporters'),(689,'supporting'),(584,'surface'),(16,'survey'),(415,'sustainability'),(411,'sustainable'),(349,'system'),(346,'systems'),(665,'takes'),(483,'tallow'),(239,'taught'),(429,'teach'),(75,'teachers'),(122,'teachers’'),(543,'technological'),(80,'technology'),(109,'technology”'),(753,'tecto'),(860,'tehran'),(128,'telephone'),(495,'ten'),(347,'texas'),(306,'theory'),(168,'thesis'),(754,'thiabendazole'),(796,'thoracis'),(688,'time'),(276,'times'),(472,'tissue'),(85,'today'),(901,'tolerant'),(427,'tool'),(189,'topic'),(418,'topics'),(161,'toronto'),(289,'tors'),(822,'toughest'),(304,'town'),(857,'trade'),(258,'traditions'),(142,'transformation'),(804,'transhumance'),(497,'treatment'),(534,'treatments'),(144,'trees'),(642,'trend'),(259,'trends'),(845,'tuberculosis'),(737,'tubers'),(115,'turning'),(377,'types'),(152,'understanding'),(3,'university'),(691,'university’s'),(627,'unknown'),(528,'unsaturation'),(121,'upgrade'),(200,'uphold'),(670,'uraccan'),(858,'vajiheh'),(910,'valerie'),(245,'valuable'),(896,'values'),(256,'van'),(618,'variation'),(818,'varied'),(359,'variety'),(583,'vicinity'),(70,'victoria'),(195,'view'),(722,'virus'),(417,'vital'),(607,'vulnerable'),(681,'wales'),(342,'water'),(576,'water-level'),(456,'weaned'),(459,'weaning'),(813,'weight'),(479,'weights'),(589,'wet'),(474,'white'),(203,'widely'),(911,'williamson'),(4,'windsor'),(282,'wittfogel'),(646,'wolverhampton'),(758,'wood'),(939,'woods'),(157,'woody'),(287,'work'),(293,'world'),(710,'yam'),(727,'yams'),(787,'yaoundé'),(770,'year'),(938,'zita'),(107,'“expected'),(539,'“healthy”');
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
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(8,3,2),(8,3,6),(15,3,3),(22,3,2),(29,3,2),(36,3,3),(36,3,8),(43,3,2),(50,3,2),(57,3,3),(64,3,3),(64,3,7),(71,3,4),(78,3,2),(85,3,2),(87,3,28),(87,3,37),(87,3,80),(92,3,2),(99,3,3),(106,3,2),(113,3,2),(1,4,3),(113,4,3),(2,5,0),(2,6,1),(3,6,14),(3,6,70),(2,7,2),(3,7,15),(3,7,60),(3,7,71),(2,8,3),(2,9,4),(2,10,5),(37,10,2),(38,10,0),(73,10,1),(80,10,43),(86,10,4),(87,10,18),(2,11,6),(3,11,43),(2,12,7),(3,12,44),(3,13,0),(3,14,1),(80,14,39),(80,14,47),(80,14,64),(80,14,127),(80,14,203),(101,14,110),(3,15,2),(3,16,3),(10,16,62),(3,17,4),(3,17,48),(3,18,5),(3,19,6),(3,20,7),(3,21,8),(3,22,9),(80,22,176),(3,23,10),(3,23,64),(10,23,7),(71,23,3),(3,24,11),(87,24,15),(3,25,12),(3,26,13),(3,26,69),(80,26,157),(3,27,16),(3,28,17),(3,29,18),(3,30,19),(3,31,20),(3,32,21),(3,32,57),(3,33,22),(115,33,3),(3,34,23),(108,34,15),(108,34,36),(3,35,24),(3,35,38),(3,36,25),(80,36,45),(80,36,63),(3,37,26),(3,38,27),(87,38,61),(3,39,28),(3,39,30),(3,39,33),(3,39,40),(3,40,29),(3,40,41),(10,40,27),(3,41,31),(3,42,32),(3,43,34),(10,43,80),(31,43,49),(3,44,35),(3,44,45),(3,45,36),(3,45,46),(3,46,37),(3,47,39),(3,48,42),(3,49,47),(3,49,50),(3,50,49),(3,51,51),(3,52,52),(108,52,62),(3,53,53),(3,54,54),(3,54,62),(31,54,27),(3,55,55),(3,56,56),(3,57,58),(3,58,59),(73,58,96),(3,59,61),(31,59,26),(31,59,40),(87,59,35),(87,59,81),(101,59,1),(3,60,63),(24,60,33),(80,60,98),(3,61,65),(3,62,66),(31,62,31),(3,63,67),(3,64,68),(73,64,87),(8,65,0),(8,66,1),(8,67,3),(10,67,18),(10,67,38),(10,67,68),(8,68,4),(8,69,5),(8,70,7),(9,71,0),(10,71,54),(10,71,72),(9,72,1),(9,73,2),(9,74,3),(52,74,25),(9,75,4),(10,75,40),(10,75,79),(10,75,84),(9,76,5),(31,76,65),(52,76,17),(80,76,87),(9,77,6),(52,77,16),(52,77,22),(9,78,7),(10,79,0),(10,80,1),(10,80,10),(10,80,28),(10,81,2),(30,81,3),(31,81,70),(10,82,3),(31,82,0),(80,82,9),(80,82,85),(10,83,4),(52,83,14),(10,84,5),(31,84,2),(66,84,8),(87,84,7),(10,85,6),(10,86,8),(10,87,9),(10,88,11),(10,88,55),(10,88,73),(31,88,6),(10,89,12),(10,89,34),(87,89,39),(10,90,13),(10,91,14),(10,92,15),(80,92,164),(80,92,195),(10,93,16),(10,94,17),(10,94,67),(10,95,19),(10,96,20),(10,97,21),(10,98,22),(10,98,29),(10,98,43),(86,98,2),(87,98,43),(87,98,53),(87,98,65),(10,99,23),(10,100,24),(10,101,25),(10,102,26),(10,103,30),(10,104,31),(10,105,32),(10,106,33),(10,107,35),(10,108,36),(10,109,37),(10,110,39),(31,110,38),(31,110,50),(31,110,56),(65,110,0),(10,111,41),(23,111,3),(24,111,19),(24,111,41),(10,112,42),(10,113,44),(10,113,65),(10,113,74),(31,113,24),(10,114,45),(10,114,66),(10,114,75),(10,115,46),(10,116,47),(10,117,48),(38,117,6),(66,117,3),(87,117,31),(87,117,63),(10,118,49),(10,118,81),(87,118,44),(94,118,5),(94,118,50),(10,119,50),(10,120,51),(10,121,52),(10,122,53),(10,123,56),(10,124,57),(31,124,1),(10,125,58),(31,125,15),(10,126,59),(10,127,60),(73,127,112),(108,127,82),(10,128,61),(10,129,63),(10,130,64),(10,131,69),(80,131,165),(10,132,70),(10,133,71),(10,134,76),(10,135,77),(10,136,78),(10,137,82),(10,137,83),(94,137,6),(15,138,0),(15,139,1),(15,140,2),(16,141,0),(17,141,3),(17,141,9),(16,142,1),(17,142,4),(87,142,92),(16,143,2),(17,143,5),(17,143,12),(16,144,3),(17,144,6),(17,144,13),(17,145,0),(51,145,3),(94,145,0),(17,146,1),(52,146,8),(17,147,2),(17,148,7),(31,148,71),(66,148,58),(17,149,8),(59,149,42),(59,149,44),(17,150,10),(66,150,7),(17,151,11),(73,151,135),(17,152,14),(87,152,51),(17,153,15),(17,154,16),(17,155,17),(17,156,18),(17,157,19),(17,158,20),(22,159,0),(22,160,1),(22,161,3),(23,162,0),(24,162,16),(23,163,1),(24,163,17),(24,163,29),(24,163,38),(23,164,2),(24,164,6),(24,164,18),(24,164,23),(24,164,42),(23,165,4),(24,165,12),(24,165,21),(24,165,44),(23,166,5),(23,167,6),(23,168,7),(23,169,8),(23,170,9),(24,171,0),(24,172,1),(24,172,34),(24,173,2),(24,174,3),(24,175,4),(24,176,5),(31,176,58),(24,177,7),(24,177,26),(24,177,39),(24,177,50),(30,177,2),(31,177,20),(24,178,8),(24,178,31),(24,179,9),(31,179,21),(24,180,10),(24,181,11),(24,182,13),(24,183,14),(24,184,15),(24,185,20),(24,185,43),(24,186,22),(24,187,24),(24,188,25),(101,188,48),(101,188,82),(24,189,27),(24,189,53),(24,190,28),(24,190,54),(24,191,30),(24,192,32),(24,193,35),(24,194,36),(24,195,37),(24,196,40),(31,196,39),(24,197,45),(24,198,46),(24,199,47),(24,200,48),(24,201,49),(24,202,51),(24,203,52),(94,203,16),(29,204,0),(29,205,1),(29,206,3),(29,207,4),(30,208,0),(59,208,56),(80,208,11),(30,209,1),(31,209,19),(31,210,3),(31,211,4),(31,211,46),(31,211,60),(31,212,5),(31,213,7),(31,214,8),(31,215,9),(38,215,32),(31,216,10),(31,216,11),(31,217,12),(87,217,10),(31,218,13),(31,219,14),(31,220,16),(31,221,17),(31,222,18),(31,223,22),(31,223,69),(31,224,23),(31,225,25),(31,226,28),(80,226,44),(31,227,29),(31,227,63),(66,227,14),(87,227,91),(31,228,30),(31,229,32),(59,229,55),(94,229,13),(31,230,33),(31,231,34),(31,232,35),(31,233,36),(31,234,37),(31,234,55),(31,234,67),(31,235,41),(31,236,42),(31,237,43),(31,238,44),(31,238,52),(31,239,45),(31,240,47),(31,241,48),(31,242,51),(31,243,53),(31,244,54),(59,244,79),(73,244,138),(31,245,57),(31,246,59),(31,247,61),(31,248,62),(31,249,64),(31,250,66),(31,251,68),(36,252,0),(36,253,1),(36,254,2),(36,254,7),(36,255,4),(36,256,5),(36,257,6),(37,258,0),(37,259,1),(37,260,3),(38,260,1),(38,260,28),(38,261,2),(38,262,3),(38,263,4),(38,264,5),(72,264,3),(80,264,185),(38,265,7),(80,265,79),(80,265,101),(38,266,8),(38,267,9),(38,268,10),(38,268,34),(38,269,11),(38,269,35),(38,270,12),(38,271,13),(38,271,26),(38,272,14),(38,272,27),(58,272,5),(38,273,15),(38,274,16),(38,275,17),(38,276,18),(38,277,19),(38,278,20),(38,279,21),(38,280,22),(38,281,23),(38,282,24),(38,283,25),(38,284,29),(38,285,30),(38,286,31),(38,287,33),(38,288,36),(38,289,37),(38,290,38),(87,290,25),(87,290,76),(108,290,88),(38,291,39),(115,291,36),(38,292,40),(38,293,41),(66,293,38),(43,294,0),(43,295,1),(43,296,3),(44,297,0),(44,298,1),(44,299,2),(44,300,3),(50,301,0),(57,301,0),(50,302,1),(50,303,3),(78,303,3),(50,304,4),(78,304,4),(51,305,0),(51,306,1),(52,306,1),(51,307,2),(52,307,3),(51,308,4),(51,309,5),(52,309,9),(51,310,6),(52,310,10),(52,310,13),(52,311,0),(52,312,2),(80,312,67),(52,313,4),(52,314,5),(66,314,24),(66,314,59),(80,314,204),(52,315,6),(52,316,7),(52,317,11),(52,318,12),(52,319,15),(52,320,18),(52,321,19),(52,322,20),(52,323,21),(52,323,37),(52,324,23),(52,325,24),(52,325,36),(58,325,7),(59,325,20),(59,325,52),(80,325,89),(93,325,2),(94,325,4),(94,325,49),(52,326,26),(80,326,76),(108,326,85),(52,327,27),(52,328,28),(52,329,29),(52,330,30),(52,331,31),(52,332,32),(52,333,33),(52,333,38),(115,333,16),(115,333,35),(52,334,34),(52,335,35),(52,336,39),(52,337,40),(52,338,41),(57,339,1),(57,340,2),(58,341,0),(58,342,1),(58,342,6),(59,342,1),(59,342,8),(59,342,19),(59,342,25),(59,342,51),(59,342,64),(59,342,80),(59,342,106),(80,342,4),(80,342,163),(80,342,187),(58,343,2),(59,343,2),(59,343,107),(80,343,90),(58,344,3),(58,345,4),(59,345,50),(58,346,8),(59,346,53),(59,347,0),(59,347,105),(80,347,7),(59,348,3),(59,348,18),(59,348,35),(59,348,38),(59,348,108),(59,349,4),(59,349,11),(59,349,36),(59,349,61),(59,349,78),(59,349,102),(59,349,109),(101,349,50),(101,349,62),(59,350,5),(59,351,6),(59,351,94),(59,352,7),(59,353,9),(59,353,65),(59,353,81),(59,354,10),(59,355,12),(101,355,127),(59,356,13),(59,357,14),(59,358,15),(66,358,61),(59,359,16),(59,360,17),(59,361,21),(59,361,82),(59,361,99),(59,361,112),(80,361,58),(80,361,116),(59,362,22),(59,363,23),(59,364,24),(59,364,62),(59,365,26),(59,366,27),(59,366,67),(59,367,28),(59,367,49),(59,368,29),(59,369,30),(73,369,15),(59,370,31),(59,371,32),(80,371,202),(101,371,2),(59,372,33),(59,373,34),(59,374,37),(59,374,74),(59,375,39),(59,376,40),(59,377,41),(59,378,43),(59,379,45),(59,380,46),(59,381,47),(59,382,48),(59,382,88),(59,383,54),(59,383,93),(59,384,57),(59,384,91),(59,384,96),(59,385,58),(59,385,71),(59,385,89),(59,385,92),(59,385,110),(59,386,59),(59,386,77),(101,386,32),(59,387,60),(59,387,101),(59,388,63),(59,389,66),(59,390,68),(59,391,69),(59,391,85),(59,392,70),(59,392,86),(59,393,72),(80,393,128),(59,394,73),(59,395,75),(59,396,76),(59,397,83),(59,397,113),(59,398,84),(59,399,87),(59,399,97),(66,399,27),(66,399,39),(66,399,53),(66,399,62),(80,399,97),(87,399,46),(87,399,49),(59,400,90),(59,401,95),(59,402,98),(59,402,111),(59,403,100),(59,404,103),(66,404,32),(59,405,104),(64,406,0),(64,407,1),(64,408,2),(64,408,6),(66,408,34),(64,409,4),(64,410,5),(65,411,1),(66,411,2),(66,411,22),(66,411,30),(66,411,37),(65,412,2),(66,412,23),(66,412,31),(66,412,48),(65,413,3),(66,413,15),(66,414,0),(66,415,1),(66,416,4),(66,417,5),(66,418,6),(66,419,9),(66,420,10),(66,421,11),(80,421,36),(66,422,12),(66,422,28),(66,423,13),(66,424,16),(66,425,17),(115,425,1),(115,425,6),(66,426,18),(66,427,19),(66,428,20),(66,429,21),(66,429,29),(66,430,25),(66,430,36),(66,431,26),(66,432,33),(66,433,35),(66,434,40),(66,435,41),(66,436,42),(66,437,43),(66,437,51),(66,438,44),(66,438,52),(66,439,45),(66,440,46),(66,441,47),(66,442,49),(66,443,50),(66,444,54),(66,445,55),(66,446,56),(87,446,0),(66,447,57),(87,447,11),(66,448,60),(71,449,0),(71,450,1),(71,451,2),(72,452,0),(72,453,1),(72,454,2),(72,455,4),(72,456,5),(72,457,6),(72,458,7),(94,458,96),(72,459,8),(73,460,0),(101,460,0),(101,460,115),(73,461,2),(73,462,3),(80,462,175),(100,462,0),(73,463,4),(73,463,114),(100,463,1),(73,464,5),(73,464,134),(73,464,141),(101,464,70),(73,465,6),(73,465,116),(73,465,125),(73,466,7),(73,466,42),(73,466,48),(73,466,58),(73,466,66),(73,466,71),(73,466,118),(73,466,131),(100,466,5),(73,467,8),(73,467,43),(73,467,49),(73,467,59),(73,467,67),(73,467,72),(73,467,79),(73,467,84),(73,467,89),(73,467,119),(100,467,6),(73,468,9),(73,468,120),(107,468,5),(108,468,65),(73,469,10),(73,469,121),(100,469,8),(107,469,1),(108,469,1),(108,469,51),(108,469,58),(108,469,74),(73,470,11),(73,470,122),(73,470,133),(73,471,12),(73,471,123),(73,472,13),(73,472,108),(73,472,124),(73,473,14),(73,474,16),(101,474,52),(73,475,17),(73,476,18),(73,477,19),(73,478,20),(73,479,21),(73,480,22),(73,481,23),(73,482,24),(73,482,51),(73,483,25),(73,484,26),(73,485,27),(73,485,29),(73,485,127),(73,486,28),(73,486,126),(73,487,30),(73,487,52),(73,487,117),(100,487,4),(73,488,31),(73,489,32),(73,489,55),(73,489,62),(73,489,75),(73,490,33),(73,491,34),(101,491,30),(73,492,35),(73,492,45),(73,492,53),(73,492,92),(73,492,107),(100,492,10),(73,493,36),(73,494,37),(80,494,65),(73,495,38),(73,496,39),(73,497,40),(73,497,86),(73,498,41),(73,499,44),(73,499,50),(100,499,7),(101,499,38),(73,500,46),(73,501,47),(73,502,54),(100,502,9),(73,503,56),(73,503,63),(73,503,76),(73,504,57),(73,505,60),(73,505,64),(73,505,74),(73,505,77),(101,505,71),(73,506,61),(73,507,65),(73,508,68),(73,509,69),(73,510,70),(73,511,73),(73,512,78),(73,513,80),(73,513,97),(73,514,81),(73,515,82),(73,516,83),(73,517,85),(73,518,88),(73,519,90),(73,519,95),(80,519,139),(80,519,152),(73,520,91),(73,521,93),(73,522,94),(73,523,98),(73,524,99),(73,525,100),(73,526,101),(73,527,102),(73,528,103),(73,529,104),(73,530,105),(73,531,106),(73,532,109),(73,533,110),(80,533,149),(73,534,111),(73,535,113),(73,536,115),(100,536,3),(73,537,128),(94,537,93),(73,538,129),(73,539,130),(73,540,132),(73,541,136),(73,542,137),(73,542,140),(101,542,12),(101,542,36),(101,542,69),(73,543,139),(73,544,142),(73,545,143),(78,546,0),(78,547,1),(79,548,0),(80,548,25),(80,548,61),(80,548,177),(79,549,1),(79,550,2),(80,550,0),(80,550,32),(80,550,92),(79,551,3),(80,551,1),(80,551,33),(80,551,93),(80,551,173),(79,552,4),(80,552,18),(80,552,27),(80,552,80),(80,552,102),(80,552,134),(80,552,179),(80,552,198),(79,553,5),(80,553,19),(80,553,81),(80,553,103),(80,553,135),(80,553,180),(80,553,199),(79,554,6),(79,554,8),(80,554,10),(80,554,20),(80,554,30),(80,554,82),(80,554,84),(80,554,105),(80,554,136),(80,554,145),(80,554,182),(80,554,200),(79,555,7),(80,555,29),(80,555,83),(80,555,104),(80,555,144),(80,555,181),(79,556,9),(80,556,34),(80,556,66),(80,556,106),(80,556,140),(80,556,153),(79,557,10),(80,557,35),(80,557,62),(80,557,107),(101,557,23),(101,557,84),(80,558,2),(87,558,72),(80,559,3),(80,560,5),(101,560,121),(80,561,6),(80,562,8),(80,562,156),(80,563,12),(80,564,13),(94,564,81),(80,565,14),(80,566,15),(80,567,16),(80,568,17),(80,569,21),(80,569,37),(80,570,22),(80,571,23),(80,572,24),(80,573,26),(80,573,49),(80,573,54),(80,573,69),(80,573,109),(80,574,28),(80,575,31),(80,575,74),(80,576,38),(80,577,40),(80,578,41),(80,578,197),(80,579,42),(80,579,205),(80,580,46),(80,581,48),(80,581,68),(80,581,77),(80,581,91),(80,581,108),(80,581,194),(80,582,50),(80,583,51),(80,583,124),(80,584,52),(80,584,133),(80,584,147),(80,585,53),(80,586,55),(80,586,113),(80,587,56),(80,587,114),(80,588,57),(80,588,115),(80,589,59),(80,590,60),(80,591,70),(80,592,71),(80,593,72),(80,594,73),(80,595,75),(80,596,78),(80,597,86),(80,598,88),(80,599,94),(80,600,95),(80,601,96),(80,602,99),(80,603,100),(80,604,110),(80,604,117),(80,605,111),(80,606,112),(80,606,121),(80,607,118),(80,608,119),(80,609,120),(80,609,142),(80,609,155),(80,610,122),(80,611,123),(80,612,125),(80,612,137),(80,612,143),(80,612,166),(80,612,189),(80,613,126),(80,613,190),(80,613,201),(80,614,129),(80,615,130),(101,615,72),(80,616,131),(80,617,132),(80,617,146),(80,617,160),(80,618,138),(80,619,141),(80,619,154),(80,620,148),(80,621,150),(80,622,151),(80,623,158),(80,623,174),(80,624,159),(80,625,161),(80,626,162),(80,627,167),(80,628,168),(80,629,169),(80,630,170),(80,631,171),(80,632,172),(80,633,178),(80,634,183),(80,635,184),(80,636,186),(80,637,188),(80,638,191),(80,639,192),(80,640,193),(80,641,196),(80,642,206),(80,643,207),(85,644,0),(85,645,1),(85,646,3),(86,647,0),(86,648,1),(87,648,42),(87,648,64),(86,649,3),(87,649,17),(86,650,5),(87,650,20),(86,651,6),(87,651,21),(86,652,7),(87,652,22),(87,653,1),(87,654,2),(87,655,3),(87,656,4),(87,657,5),(87,658,6),(87,659,8),(87,660,9),(87,661,12),(87,662,13),(87,662,47),(87,662,86),(87,663,14),(87,664,16),(87,665,19),(87,666,23),(87,667,24),(87,668,26),(87,669,27),(87,669,50),(87,670,29),(87,671,30),(87,672,32),(87,672,88),(87,673,33),(87,674,34),(87,674,84),(87,675,36),(101,675,41),(87,676,38),(87,677,40),(87,678,41),(87,679,45),(87,680,48),(87,681,52),(87,682,54),(87,683,55),(87,684,56),(87,685,57),(115,685,30),(87,686,58),(87,686,71),(87,687,59),(87,688,60),(87,689,62),(87,690,66),(87,691,67),(87,692,68),(87,693,69),(87,694,70),(87,695,73),(87,696,74),(87,697,75),(87,698,77),(87,699,78),(87,700,79),(87,701,82),(87,702,83),(87,703,85),(87,704,87),(87,705,89),(87,706,90),(92,707,0),(92,708,1),(92,709,3),(93,710,0),(94,710,3),(94,710,20),(94,710,34),(94,710,82),(94,710,89),(93,711,1),(94,711,2),(94,711,12),(94,711,19),(94,711,33),(94,711,55),(94,711,70),(101,711,125),(93,712,3),(94,712,9),(94,713,1),(94,714,7),(94,714,53),(94,715,8),(94,716,10),(94,716,18),(94,716,54),(94,717,11),(94,717,32),(94,717,69),(94,717,79),(94,717,86),(94,718,14),(94,719,15),(94,720,17),(94,721,21),(94,722,22),(94,723,23),(94,724,24),(94,724,30),(101,724,19),(94,725,25),(94,725,46),(94,726,26),(94,727,27),(94,727,37),(94,727,48),(94,728,28),(94,728,35),(94,728,75),(94,729,29),(94,729,36),(94,730,31),(94,731,38),(94,732,39),(94,733,40),(94,734,41),(94,735,42),(94,736,43),(94,737,44),(94,737,83),(94,737,90),(94,738,45),(94,739,47),(94,740,51),(94,741,52),(94,742,56),(94,743,57),(94,743,65),(94,744,58),(94,745,59),(94,746,60),(94,747,61),(108,747,12),(108,747,38),(108,747,60),(94,748,62),(94,749,63),(94,750,64),(94,751,66),(94,751,68),(94,752,67),(94,753,71),(94,754,72),(94,755,73),(94,756,74),(115,756,23),(94,757,76),(94,758,77),(94,759,78),(94,760,80),(94,761,84),(94,762,85),(108,762,87),(94,763,87),(94,764,88),(94,765,91),(94,766,92),(94,767,94),(94,768,95),(94,769,97),(94,770,98),(101,770,67),(99,771,0),(99,772,1),(99,773,2),(100,774,2),(101,775,3),(101,776,4),(101,777,5),(101,777,25),(101,777,43),(101,777,63),(101,777,117),(101,778,6),(101,778,35),(101,778,80),(101,779,7),(101,779,18),(101,780,8),(101,781,9),(101,782,10),(101,783,11),(101,784,13),(101,785,14),(101,785,120),(101,786,15),(101,787,16),(101,788,17),(101,789,20),(101,790,21),(101,791,22),(101,792,24),(101,793,26),(101,793,31),(101,793,99),(101,794,27),(101,795,28),(101,795,39),(101,796,29),(101,796,40),(101,797,33),(101,798,34),(101,799,37),(101,800,42),(101,801,44),(101,802,45),(115,802,28),(101,803,46),(101,804,47),(101,805,49),(101,805,118),(101,806,51),(101,806,75),(101,807,53),(101,808,54),(101,809,55),(101,810,56),(101,810,74),(101,811,57),(101,812,58),(101,813,59),(101,814,60),(101,814,108),(101,815,61),(101,816,64),(101,817,65),(101,818,66),(101,819,68),(101,819,78),(101,820,73),(101,821,76),(101,822,77),(101,823,79),(101,824,81),(101,825,83),(101,826,85),(101,827,86),(101,828,87),(101,829,88),(101,830,89),(101,831,90),(101,832,91),(101,832,98),(101,833,92),(101,834,93),(101,835,94),(101,836,95),(101,837,96),(101,838,97),(101,839,100),(101,840,101),(101,840,105),(101,841,102),(101,842,103),(101,843,104),(101,844,106),(115,844,18),(101,845,107),(101,846,109),(101,847,111),(101,848,112),(101,849,113),(101,850,114),(101,851,116),(101,852,119),(101,853,122),(101,854,123),(101,855,124),(101,856,126),(101,857,128),(106,858,0),(106,859,1),(106,860,3),(107,861,0),(108,861,0),(108,861,67),(107,862,2),(108,862,2),(108,862,59),(107,863,3),(108,863,3),(108,863,34),(108,863,68),(108,863,73),(107,864,4),(108,864,5),(108,864,64),(108,864,71),(107,865,6),(108,865,7),(108,865,84),(107,866,7),(108,866,9),(108,866,29),(108,866,55),(108,866,79),(107,867,8),(108,867,10),(108,867,18),(108,867,30),(108,867,80),(108,867,86),(107,868,9),(108,868,11),(108,868,19),(108,868,31),(108,868,81),(107,869,10),(108,869,56),(107,870,11),(107,871,12),(108,872,4),(108,873,6),(108,874,8),(108,875,13),(108,875,39),(108,876,14),(108,876,40),(108,876,50),(108,877,16),(108,878,17),(108,879,20),(108,880,21),(108,881,22),(108,882,23),(108,883,24),(108,884,25),(108,885,26),(108,886,27),(108,887,28),(108,887,37),(108,887,47),(108,887,54),(108,887,78),(108,888,32),(108,889,33),(108,890,35),(108,890,76),(108,891,41),(108,892,42),(108,893,43),(108,894,44),(108,895,45),(108,896,46),(108,897,48),(108,898,49),(108,899,52),(108,899,75),(108,900,53),(108,901,57),(108,902,61),(108,903,63),(108,904,66),(115,904,37),(108,905,69),(108,906,70),(108,907,72),(108,908,77),(108,909,83),(113,910,0),(113,911,1),(114,912,0),(114,913,1),(114,914,2),(114,915,3),(114,916,4),(115,917,0),(115,918,2),(115,918,9),(115,918,31),(115,919,4),(115,920,5),(115,921,7),(115,922,8),(115,923,10),(115,923,24),(115,924,11),(115,925,12),(115,926,13),(115,927,14),(115,927,33),(115,928,15),(115,928,26),(115,928,34),(115,929,17),(115,930,19),(115,931,20),(115,932,21),(115,933,22),(115,934,25),(115,935,27),(115,936,29),(115,937,32),(120,938,0),(120,939,1),(120,940,2),(121,941,0),(121,942,1),(121,942,2);
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
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,2,1,0),(2,2,2,0),(3,2,4,0),(4,2,16,0),(5,2,8,0),(6,2,32,0),(7,2,64,0),(8,3,1,0),(9,3,2,0),(10,3,4,0),(11,3,16,0),(12,3,8,0),(13,3,32,0),(14,3,64,0),(15,4,1,0),(16,4,2,0),(17,4,4,0),(18,4,16,0),(19,4,8,0),(20,4,32,0),(21,4,64,0),(22,5,1,0),(23,5,2,0),(24,5,4,0),(25,5,16,0),(26,5,8,0),(27,5,32,0),(28,5,64,0),(29,6,1,0),(30,6,2,0),(31,6,4,0),(32,6,16,0),(33,6,8,0),(34,6,32,0),(35,6,64,0),(36,7,1,0),(37,7,2,0),(38,7,4,0),(39,7,16,0),(40,7,8,0),(41,7,32,0),(42,7,64,0),(43,8,1,0),(44,8,2,0),(45,8,4,0),(46,8,16,0),(47,8,8,0),(48,8,32,0),(49,8,64,0),(50,9,1,0),(51,9,2,0),(52,9,4,0),(53,9,16,0),(54,9,8,0),(55,9,32,0),(56,9,64,0),(57,10,1,0),(58,10,2,0),(59,10,4,0),(60,10,16,0),(61,10,8,0),(62,10,32,0),(63,10,64,0),(64,11,1,0),(65,11,2,0),(66,11,4,0),(67,11,16,0),(68,11,8,0),(69,11,32,0),(70,11,64,0),(71,12,1,0),(72,12,2,0),(73,12,4,0),(74,12,16,0),(75,12,8,0),(76,12,32,0),(77,12,64,0),(78,13,1,0),(79,13,2,0),(80,13,4,0),(81,13,16,0),(82,13,8,0),(83,13,32,0),(84,13,64,0),(85,14,1,0),(86,14,2,0),(87,14,4,0),(88,14,16,0),(89,14,8,0),(90,14,32,0),(91,14,64,0),(92,15,1,0),(93,15,2,0),(94,15,4,0),(95,15,16,0),(96,15,8,0),(97,15,32,0),(98,15,64,0),(99,16,1,0),(100,16,2,0),(101,16,4,0),(102,16,16,0),(103,16,8,0),(104,16,32,0),(105,16,64,0),(106,17,1,0),(107,17,2,0),(108,17,4,0),(109,17,16,0),(110,17,8,0),(111,17,32,0),(112,17,64,0),(113,18,1,0),(114,18,2,0),(115,18,4,0),(116,18,16,0),(117,18,8,0),(118,18,32,0),(119,18,64,0),(120,19,1,0),(121,19,2,0),(122,19,4,0),(123,19,16,0),(124,19,8,0),(125,19,32,0),(126,19,64,0);
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
  `setting_value` text,
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
-- Table structure for table `submission_supplementary_files`
--

DROP TABLE IF EXISTS `submission_supplementary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_supplementary_files`
--

LOCK TABLES `submission_supplementary_files` WRITE;
/*!40000 ALTER TABLE `submission_supplementary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_supplementary_files` ENABLE KEYS */;
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
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `work_type` tinyint(4) DEFAULT '0',
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
INSERT INTO `submissions` VALUES (1,NULL,1,NULL,1,'2022-03-01 01:15:31','2022-03-01 01:15:31','2022-03-01 01:15:31',5,1,0,0),(2,NULL,1,NULL,2,'2022-03-01 01:15:59','2022-03-01 01:15:52','2022-03-01 01:15:52',5,3,0,0),(3,NULL,1,NULL,3,'2022-03-01 01:16:30','2022-03-01 01:16:24','2022-03-01 01:16:24',5,3,0,0),(4,NULL,1,NULL,4,'2022-03-01 01:16:57','2022-03-01 01:16:51','2022-03-01 01:16:51',5,3,0,0),(5,NULL,1,NULL,5,'2022-03-01 01:17:25','2022-03-01 01:17:19','2022-03-01 01:17:19',5,3,0,0),(6,NULL,1,NULL,6,'2022-03-01 01:17:52','2022-03-01 01:17:46','2022-03-01 01:17:46',5,3,0,0),(7,NULL,1,NULL,7,'2022-03-01 01:18:22','2022-03-01 01:18:16','2022-03-01 01:18:16',5,3,0,0),(8,NULL,1,NULL,8,'2022-03-01 01:18:48','2022-03-01 01:18:43','2022-03-01 01:18:43',5,3,0,0),(9,NULL,1,NULL,9,'2022-03-01 01:19:15','2022-03-01 01:19:09','2022-03-01 01:19:09',5,3,0,0),(10,NULL,1,NULL,10,'2022-03-01 01:19:42','2022-03-01 01:19:36','2022-03-01 01:19:36',5,3,0,0),(11,NULL,1,NULL,11,'2022-03-01 01:20:12','2022-03-01 01:20:05','2022-03-01 01:20:05',5,3,0,0),(12,NULL,1,NULL,12,'2022-03-01 01:20:38','2022-03-01 01:20:32','2022-03-01 01:20:32',5,3,0,0),(13,NULL,1,NULL,13,'2022-03-01 01:21:05','2022-03-01 01:20:59','2022-03-01 01:20:59',5,3,0,0),(14,NULL,1,NULL,14,'2022-03-01 01:21:32','2022-03-01 01:21:25','2022-03-01 01:21:25',5,3,0,0),(15,NULL,1,NULL,15,'2022-03-01 01:21:59','2022-03-01 01:21:52','2022-03-01 01:21:52',5,3,0,0),(16,NULL,1,NULL,16,'2022-03-01 01:22:25','2022-03-01 01:22:19','2022-03-01 01:22:19',5,3,0,0),(17,NULL,1,NULL,17,'2022-03-01 01:22:54','2022-03-01 01:22:48','2022-03-01 01:22:48',5,3,0,0),(18,NULL,1,NULL,18,'2022-03-01 01:23:22','2022-03-01 01:23:15','2022-03-01 01:23:15',5,3,0,0),(19,NULL,1,NULL,19,'2022-03-01 01:23:48','2022-03-01 01:23:42','2022-03-01 01:23:42',5,3,0,0);
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
  `file_type` tinyint(4) DEFAULT NULL
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
  `setting_type` varchar(6) NOT NULL,
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
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '1',
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT '0',
  `permit_metadata_edit` tinyint(4) NOT NULL DEFAULT '0',
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
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
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
INSERT INTO `user_settings` VALUES (1,'en_US','givenName',0,0,'admin','string'),(1,'en_US','familyName',0,0,'admin','string'),(2,'en_US','biography',0,0,'','string'),(2,'fr_CA','biography',0,0,'','string'),(2,'en_US','signature',0,0,'','string'),(2,'fr_CA','signature',0,0,'','string'),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México','string'),(2,'fr_CA','affiliation',0,0,'','string'),(2,'en_US','givenName',0,0,'Ramiro','string'),(2,'fr_CA','givenName',0,0,'','string'),(2,'en_US','familyName',0,0,'Vaca','string'),(2,'fr_CA','familyName',0,0,'','string'),(2,'en_US','preferredPublicName',0,0,'','string'),(2,'fr_CA','preferredPublicName',0,0,'','string'),(2,'','orcid',0,0,'','string'),(3,'en_US','biography',0,0,'','string'),(3,'fr_CA','biography',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'fr_CA','signature',0,0,'','string'),(3,'en_US','affiliation',0,0,'University of Melbourne','string'),(3,'fr_CA','affiliation',0,0,'','string'),(3,'en_US','givenName',0,0,'Daniel','string'),(3,'fr_CA','givenName',0,0,'','string'),(3,'en_US','familyName',0,0,'Barnes','string'),(3,'fr_CA','familyName',0,0,'','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'fr_CA','preferredPublicName',0,0,'','string'),(3,'','orcid',0,0,'','string'),(4,'en_US','biography',0,0,'','string'),(4,'fr_CA','biography',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'fr_CA','signature',0,0,'','string'),(4,'en_US','affiliation',0,0,'University of Chicago','string'),(4,'fr_CA','affiliation',0,0,'','string'),(4,'en_US','givenName',0,0,'David','string'),(4,'fr_CA','givenName',0,0,'','string'),(4,'en_US','familyName',0,0,'Buskins','string'),(4,'fr_CA','familyName',0,0,'','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'fr_CA','preferredPublicName',0,0,'','string'),(4,'','orcid',0,0,'','string'),(5,'en_US','biography',0,0,'','string'),(5,'fr_CA','biography',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'fr_CA','signature',0,0,'','string'),(5,'en_US','affiliation',0,0,'University of Toronto','string'),(5,'fr_CA','affiliation',0,0,'','string'),(5,'en_US','givenName',0,0,'Stephanie','string'),(5,'fr_CA','givenName',0,0,'','string'),(5,'en_US','familyName',0,0,'Berardo','string'),(5,'fr_CA','familyName',0,0,'','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'fr_CA','preferredPublicName',0,0,'','string'),(5,'','orcid',0,0,'','string'),(6,'en_US','biography',0,0,'','string'),(6,'fr_CA','biography',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'fr_CA','signature',0,0,'','string'),(6,'en_US','affiliation',0,0,'Kyoto University','string'),(6,'fr_CA','affiliation',0,0,'','string'),(6,'en_US','givenName',0,0,'Minoti','string'),(6,'fr_CA','givenName',0,0,'','string'),(6,'en_US','familyName',0,0,'Inoue','string'),(6,'fr_CA','familyName',0,0,'','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'fr_CA','preferredPublicName',0,0,'','string'),(6,'','orcid',0,0,'','string'),(7,'en_US','affiliation',0,0,'University of Bologna','string'),(7,'en_US','givenName',0,0,'Carlo','string'),(7,'en_US','familyName',0,0,'Corino','string'),(8,'en_US','affiliation',0,0,'University of Windsor','string'),(8,'en_US','givenName',0,0,'Catherine','string'),(8,'en_US','familyName',0,0,'Kwantes','string'),(9,'en_US','affiliation',0,0,'University of Alberta','string'),(9,'en_US','givenName',0,0,'Craig','string'),(9,'en_US','familyName',0,0,'Montgomerie','string'),(10,'en_US','affiliation',0,0,'Alexandria University','string'),(10,'en_US','givenName',0,0,'Diaga','string'),(10,'en_US','familyName',0,0,'Diouf','string'),(11,'en_US','affiliation',0,0,'University of Toronto','string'),(11,'en_US','givenName',0,0,'Dana','string'),(11,'en_US','familyName',0,0,'Phillips','string'),(12,'en_US','affiliation',0,0,'University College Cork','string'),(12,'en_US','givenName',0,0,'Domatilia','string'),(12,'en_US','familyName',0,0,'Sokoloff','string'),(13,'en_US','affiliation',0,0,'Indiana University','string'),(13,'en_US','givenName',0,0,'Elinor','string'),(13,'en_US','familyName',0,0,'Ostrom','string'),(14,'en_US','affiliation',0,0,'University of Rome','string'),(14,'en_US','givenName',0,0,'Fabio','string'),(14,'en_US','familyName',0,0,'Paglieri','string'),(15,'en_US','affiliation',0,0,'University of Cape Town','string'),(15,'en_US','givenName',0,0,'John','string'),(15,'en_US','familyName',0,0,'Mwandenga','string'),(16,'en_US','affiliation',0,0,'Aalborg University','string'),(16,'en_US','givenName',0,0,'John','string'),(16,'en_US','familyName',0,0,'Novak','string'),(17,'en_US','affiliation',0,0,'Stanford University','string'),(17,'en_US','givenName',0,0,'Karim','string'),(17,'en_US','familyName',0,0,'Al-Khafaji','string'),(18,'en_US','affiliation',0,0,'Australian National University','string'),(18,'en_US','givenName',0,0,'Leo','string'),(18,'en_US','familyName',0,0,'Christopher','string'),(19,'en_US','affiliation',0,0,'University of Cape Town','string'),(19,'en_US','givenName',0,0,'Lise','string'),(19,'en_US','familyName',0,0,'Kumiega','string'),(20,'en_US','affiliation',0,0,'University of Wolverhampton','string'),(20,'en_US','givenName',0,0,'Patricia','string'),(20,'en_US','familyName',0,0,'Daniel','string'),(21,'en_US','affiliation',0,0,'University of Nairobi','string'),(21,'en_US','givenName',0,0,'Rana','string'),(21,'en_US','familyName',0,0,'Baiyewu','string'),(22,'en_US','affiliation',0,0,'Barcelona University','string'),(22,'en_US','givenName',0,0,'Rosanna','string'),(22,'en_US','familyName',0,0,'Rossi','string'),(23,'en_US','affiliation',0,0,'University of Tehran','string'),(23,'en_US','givenName',0,0,'Vajiheh','string'),(23,'en_US','familyName',0,0,'Karbasizaed','string'),(24,'en_US','affiliation',0,0,'University of Windsor','string'),(24,'en_US','givenName',0,0,'Valerie','string'),(24,'en_US','familyName',0,0,'Williamson','string'),(25,'en_US','affiliation',0,0,'CUNY','string'),(25,'en_US','givenName',0,0,'Zita','string'),(25,'en_US','familyName',0,0,'Woods','string');
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
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$ZmzDRGPnT6/CwVnN3TQ33u5VqpfVkpj./ZxgbTuyPLpGsGGXbnR36','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2022-03-01 01:13:14',NULL,'2022-03-01 01:14:48',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$CKClcEMKLE9vdFdSR0m0fOlkMhUq28.c2xmKVuuYpmPT0xv0unVdi','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2022-03-01 01:14:05',NULL,'2022-03-01 01:14:39',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$AXWBzaU5.5XG7EpVrn6LJO.4N19mfq6jh4KFAWvoRw/Z5G11ETfCm','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2022-03-01 01:14:11',NULL,'2022-03-01 01:23:43',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$PnXNLGc.x7i2KwlJmahs5u2kuKeWobkwklxF7t.fQxeWSGtjEnfTG','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2022-03-01 01:14:18',NULL,'2022-03-01 01:14:18',0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$NwwdptH6QK.PcQdpXtDJ1uWQGppvjXH2mGLGAml3k9x6RQrSs6WZO','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2022-03-01 01:14:24',NULL,'2022-03-01 01:14:24',0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$eb0UNXwuNrJc/Spovo6/YOrPhhhVYamfo6IQSfK7Dwr4x1UokQMtq','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2022-03-01 01:14:31',NULL,'2022-03-01 01:14:31',0,NULL,NULL,0,NULL,1),(7,'ccorino','$2y$10$VDSkn9pcC6cQ7rqyKvioQeWBFApFF3s9YwG0XHllqsFV30JVrmCyK','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2022-03-01 01:15:14',NULL,'2022-03-01 01:15:14',0,NULL,NULL,0,NULL,1),(8,'ckwantes','$2y$10$ToqHHLfTEO3lD/Y1B1q2hOAUMAOKY/GkEoyMVlbyFXA5SqToRHj6u','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-01 01:15:35',NULL,'2022-03-01 01:15:36',0,NULL,NULL,0,NULL,1),(9,'cmontgomerie','$2y$10$R97ijRmFUMBTuBGUXxZk7OGaYFwp1vQ91YkR75Jw4NaGvMwi8ND/a','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-01 01:16:04',NULL,'2022-03-01 01:16:04',0,NULL,NULL,0,NULL,1),(10,'ddiouf','$2y$10$s9xb2oa3zHRDn72Tg.b78OYZPdUq.Iuh8M.kmnlWnN86cJ43zQaNy','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','',NULL,NULL,'2022-03-01 01:16:34',NULL,'2022-03-01 01:16:35',0,NULL,NULL,0,NULL,1),(11,'dphillips','$2y$10$4MMGfEp/qO04mpOQi3zoO.hAfyfGGZHh/e9LnKAWG7FhscYPmWJXy','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-01 01:17:02',NULL,'2022-03-01 01:17:02',0,NULL,NULL,0,NULL,1),(12,'dsokoloff','$2y$10$iX07W2TvjN2Ui90BSK6EbeWyINBrdSSgsxivIkfUeGnuaVDitB3uC','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','',NULL,NULL,'2022-03-01 01:17:29',NULL,'2022-03-01 01:17:30',0,NULL,NULL,0,NULL,1),(13,'eostrom','$2y$10$7t5cE0HLF2yfRAprgOL24uDU37KOE/b.arqrFuuLoEHBng.NdtvSi','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-03-01 01:17:56',NULL,'2022-03-01 01:17:56',0,NULL,NULL,0,NULL,1),(14,'fpaglieri','$2y$10$PEMvmBr7i65yOVTqDL4r..DEJpCY5OKKAbVWs5DdDoaxZhFbdYMg.','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','',NULL,NULL,'2022-03-01 01:18:26',NULL,'2022-03-01 01:18:26',0,NULL,NULL,0,NULL,1),(15,'jmwandenga','$2y$10$ccC9GWi.gOTE3m6qi/oSSu62tM/3hq5g06JBEl8eaUAEOcHtuGuaq','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2022-03-01 01:18:53',NULL,'2022-03-01 01:18:53',0,NULL,NULL,0,NULL,1),(16,'jnovak','$2y$10$NKlPNYJ/ptIDl6Igcd2hEO.RuEzp95ZuX7XjO/FyZG0Zkl8HjIcve','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','',NULL,NULL,'2022-03-01 01:19:20',NULL,'2022-03-01 01:19:20',0,NULL,NULL,0,NULL,1),(17,'kalkhafaji','$2y$10$x5s.kIHdFEwiCqcE47VSPescoVsHD7j64MwGimp1bK0vkwGBdlowW','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-03-01 01:19:46',NULL,'2022-03-01 01:19:46',0,NULL,NULL,0,NULL,1),(18,'lchristopher','$2y$10$78Y3a.UrCf8FTccLtTD4N.34KxyXGGUyJsOOPru/q1TpyI3lFaIT.','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','',NULL,NULL,'2022-03-01 01:20:16',NULL,'2022-03-01 01:20:16',0,NULL,NULL,0,NULL,1),(19,'lkumiega','$2y$10$ZyzEvswS3SMjSeniEsXrwOJaKHLXZMwiAzCdg.gtnWw21nF8zk5FS','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','',NULL,NULL,'2022-03-01 01:20:42',NULL,'2022-03-01 01:20:42',0,NULL,NULL,0,NULL,1),(20,'pdaniel','$2y$10$NQNESxf7AuEsLLIfW6m5qegBBNYJyelN8RX1de5jpX0CYDjnagJeK','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','',NULL,NULL,'2022-03-01 01:21:09',NULL,'2022-03-01 01:21:09',0,NULL,NULL,0,NULL,1),(21,'rbaiyewu','$2y$10$yoUDNYlBDKqATgB3oLBB3Ob2T24/jRG.4ZzV3/i/buxu6TizZVvjm','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','',NULL,NULL,'2022-03-01 01:21:36',NULL,'2022-03-01 01:21:37',0,NULL,NULL,0,NULL,1),(22,'rrossi','$2y$10$T/t1tnxBIGtLKu3y/7D7BeCjq6GJ9eJeJBAGxK/ZER1Urvyam3fCa','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','',NULL,NULL,'2022-03-01 01:22:03',NULL,'2022-03-01 01:22:03',0,NULL,NULL,0,NULL,1),(23,'vkarbasizaed','$2y$10$b0YcQ8vhg4zTSflLdEPPh.SZr/IDYiRiSdeBsMm0x8EXcV5k5cwG2','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','',NULL,NULL,'2022-03-01 01:22:31',NULL,'2022-03-01 01:22:31',0,NULL,NULL,0,NULL,1),(24,'vwilliamson','$2y$10$HtZYIJSAbHU6U3Ovbhtazur2R/ZIRXKhV2Ewt/hFhBTK4bqhIgt.S','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2022-03-01 01:22:58',NULL,'2022-03-01 01:22:59',0,NULL,NULL,0,NULL,1),(25,'zwoods','$2y$10$O7/S0j5CQSDgdMxUb.AY3esKXvOr6Wz6LaYuVk2HvW5qQp0Jp24Va','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2022-03-01 01:23:26',NULL,'2022-03-01 01:23:26',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2022-03-01 01:13:14',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.metadata','mods34','',0,0),(1,0,1,0,'2022-03-01 01:13:14',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,2,0,0,'2022-03-01 01:13:14',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.generic','crossrefDeposit','CrossrefDepositPlugin',1,0),(1,2,0,0,'2022-03-01 01:13:14',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,1,0,'2022-03-01 01:13:14',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,1,2,18,'2022-03-01 01:13:14',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,1,0,0,'2022-03-01 01:13:14',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.generic','usageEvent','',0,0),(2,2,0,0,'2022-03-01 01:13:14',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,1,0,0,'2022-03-01 01:13:14',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2022-03-01 01:13:14',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,2,1,4,'2022-03-01 01:13:12',1,'core','ops','',0,1);
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

-- Dump completed on 2022-03-01  1:23:48
