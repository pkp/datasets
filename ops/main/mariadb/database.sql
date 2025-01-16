/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ops-ci
-- ------------------------------------------------------
-- Server version	10.11.10-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about announcements, including localized properties like names and contents.';
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
  `announcement_type_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about announcement types, including localized properties like their names.';
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
  `context_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Announcement types allow for announcements to optionally be categorized.';
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
  `assoc_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
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
  `author_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES
(1,1,'en','affiliation','University of Bologna'),
(2,1,'','country','IT'),
(3,1,'en','familyName','Corino'),
(4,1,'en','givenName','Carlo'),
(5,2,'en','affiliation','University of Windsor'),
(6,2,'','country','CA'),
(7,2,'en','familyName','Kwantes'),
(8,2,'en','givenName','Catherine'),
(9,3,'en','affiliation',NULL),
(10,3,'fr_CA','affiliation',NULL),
(11,3,'en','biography',NULL),
(12,3,'fr_CA','biography',NULL),
(13,3,'','country','FI'),
(14,3,'en','familyName','Kekkonen'),
(15,3,'fr_CA','familyName',NULL),
(16,3,'en','givenName','Urho'),
(17,3,'fr_CA','givenName',NULL),
(18,3,'en','preferredPublicName',NULL),
(19,3,'fr_CA','preferredPublicName',NULL),
(31,5,'en','affiliation','University of Alberta'),
(32,5,'','country','CA'),
(33,5,'en','familyName','Montgomerie'),
(34,5,'en','givenName','Craig'),
(35,6,'en','affiliation','University of Victoria'),
(36,6,'','country','CA'),
(37,6,'en','familyName','Irvine'),
(38,6,'en','givenName','Mark'),
(39,7,'en','affiliation','University of Alberta'),
(40,7,'','country','CA'),
(41,7,'en','familyName','Montgomerie'),
(42,7,'en','givenName','Craig'),
(43,8,'en','affiliation','University of Victoria'),
(44,8,'','country','CA'),
(45,8,'en','familyName','Irvine'),
(46,8,'en','givenName','Mark'),
(47,9,'en','affiliation','Alexandria University'),
(48,9,'','country','EG'),
(49,9,'en','familyName','Diouf'),
(50,9,'en','givenName','Diaga'),
(51,10,'en','affiliation','University of Toronto'),
(52,10,'','country','CA'),
(53,10,'en','familyName','Phillips'),
(54,10,'en','givenName','Dana'),
(55,11,'en','affiliation','University College Cork'),
(56,11,'','country','IE'),
(57,11,'en','familyName','Sokoloff'),
(58,11,'en','givenName','Domatilia'),
(59,12,'en','affiliation','Indiana University'),
(60,12,'','country','US'),
(61,12,'en','familyName','Ostrom'),
(62,12,'en','givenName','Elinor'),
(63,13,'en','affiliation','Indiana University'),
(64,13,'','country','US'),
(65,13,'en','familyName','van Laerhoven'),
(66,13,'en','givenName','Frank'),
(67,14,'en','affiliation','University of Rome'),
(68,14,'','country','IT'),
(69,14,'en','familyName','Paglieri'),
(70,14,'en','givenName','Fabio'),
(71,15,'en','affiliation','University of Cape Town'),
(72,15,'','country','ZA'),
(73,15,'en','familyName','Mwandenga'),
(74,15,'en','givenName','John'),
(75,16,'en','affiliation','Aalborg University'),
(76,16,'','country','DK'),
(77,16,'en','familyName','Novak'),
(78,16,'en','givenName','John'),
(79,17,'en','affiliation','Stanford University'),
(80,17,'','country','US'),
(81,17,'en','familyName','Al-Khafaji'),
(82,17,'en','givenName','Karim'),
(83,18,'en','affiliation','Stanford University'),
(84,18,'','country','US'),
(85,18,'en','familyName','Morse'),
(86,18,'en','givenName','Margaret'),
(87,19,'en','affiliation','Australian National University'),
(88,19,'','country','AU'),
(89,19,'en','familyName','Christopher'),
(90,19,'en','givenName','Leo'),
(91,20,'en','affiliation','University of Cape Town'),
(92,20,'','country','ZA'),
(93,20,'en','familyName','Kumiega'),
(94,20,'en','givenName','Lise'),
(95,21,'en','affiliation','University of Wolverhampton'),
(96,21,'','country','GB'),
(97,21,'en','familyName','Daniel'),
(98,21,'en','givenName','Patricia'),
(99,22,'en','affiliation','University of Nairobi'),
(100,22,'','country','KE'),
(101,22,'en','familyName','Baiyewu'),
(102,22,'en','givenName','Rana'),
(103,23,'en','affiliation','Barcelona University'),
(104,23,'','country','ES'),
(105,23,'en','familyName','Rossi'),
(106,23,'en','givenName','Rosanna'),
(107,24,'en','affiliation','University of Tehran'),
(108,24,'','country','IR'),
(109,24,'en','familyName','Karbasizaed'),
(110,24,'en','givenName','Vajiheh'),
(111,25,'en','affiliation','University of Windsor'),
(112,25,'','country','CA'),
(113,25,'en','familyName','Williamson'),
(114,25,'en','givenName','Valerie'),
(115,26,'en','affiliation','CUNY'),
(116,26,'','country','US'),
(117,26,'en','familyName','Woods'),
(118,26,'en','givenName','Zita');
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
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id` (`publication_id`),
  CONSTRAINT `authors_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES
(1,'ccorino@mailinator.com',1,1,0,4),
(2,'ckwantes@mailinator.com',1,2,0,4),
(3,'notanemailukk@mailinator.com',1,2,1,4),
(5,'cmontgomerie@mailinator.com',1,3,0,4),
(6,'mirvine@mailinator.com',1,3,0,4),
(7,'cmontgomerie@mailinator.com',1,4,0,4),
(8,'mirvine@mailinator.com',1,4,0,4),
(9,'ddiouf@mailinator.com',1,5,0,4),
(10,'dphillips@mailinator.com',1,6,0,4),
(11,'dsokoloff@mailinator.com',1,7,0,4),
(12,'eostrom@mailinator.com',1,8,0,4),
(13,'fvanlaerhoven@mailinator.com',1,8,0,4),
(14,'fpaglieri@mailinator.com',1,9,0,4),
(15,'jmwandenga@mailinator.com',1,10,0,4),
(16,'jnovak@mailinator.com',1,11,0,4),
(17,'kalkhafaji@mailinator.com',1,12,0,4),
(18,'mmorse@mailinator.com',1,12,0,4),
(19,'lchristopher@mailinator.com',1,13,0,4),
(20,'lkumiega@mailinator.com',1,14,0,4),
(21,'pdaniel@mailinator.com',1,15,0,4),
(22,'rbaiyewu@mailinator.com',1,16,0,4),
(23,'rrossi@mailinator.com',1,17,0,4),
(24,'vkarbasizaed@mailinator.com',1,18,0,4),
(25,'vwilliamson@mailinator.com',1,19,0,4),
(26,'zwoods@mailinator.com',1,20,0,4);
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
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,1,NULL,1,'history',NULL),
(2,1,NULL,2,'biology',NULL),
(3,1,NULL,3,'social-sciences',NULL),
(4,1,NULL,4,'mathematics',NULL),
(5,1,1,10000,'cultural-history',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES
(1,1,'','sortOption','title-ASC'),
(2,1,'en','title','History'),
(3,1,'fr_CA','title',''),
(4,1,'en','description',''),
(5,1,'fr_CA','description',''),
(6,2,'','sortOption','title-ASC'),
(7,2,'en','title','Biology'),
(8,2,'fr_CA','title',''),
(9,2,'en','description',''),
(10,2,'fr_CA','description',''),
(11,3,'','sortOption','title-ASC'),
(12,3,'en','title','Social sciences'),
(13,3,'fr_CA','title',''),
(14,3,'en','description',''),
(15,3,'fr_CA','description',''),
(16,4,'','sortOption','title-ASC'),
(17,4,'en','title','Mathematics'),
(18,4,'fr_CA','title',''),
(19,4,'en','description',''),
(20,4,'fr_CA','description',''),
(21,5,'','sortOption','title-ASC'),
(22,5,'en','title','Cultural History'),
(23,5,'fr_CA','title',''),
(24,5,'en','description',''),
(25,5,'fr_CA','description','');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Additional data about citations, including localized content.';
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
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A citation made by an associated publication.';
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
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES
(3,6,1),
(4,6,2),
(34,10,1),
(35,10,2),
(36,10,3),
(37,10,4),
(38,10,5),
(39,10,6),
(40,10,7),
(41,10,8),
(66,14,1),
(67,14,2),
(68,14,3),
(69,14,4),
(70,14,5),
(71,14,6),
(72,14,7),
(73,14,8),
(76,26,1),
(77,26,2),
(81,30,1),
(82,30,2),
(83,30,3),
(85,42,1),
(90,46,1),
(91,46,2),
(92,46,3),
(93,46,4),
(96,50,1),
(97,50,2),
(99,54,1),
(110,58,1),
(111,58,2),
(112,58,3),
(113,58,4),
(114,58,5),
(115,58,6),
(116,58,7),
(117,58,8),
(118,58,9),
(119,58,10),
(122,66,1),
(123,66,2),
(127,74,1),
(128,74,2),
(129,74,3),
(132,78,1),
(133,78,2);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES
(3,3,'en','name','employees'),
(4,4,'en','name','survey'),
(34,34,'en','name','Integrating Technology'),
(35,35,'en','name','Computer Skills'),
(36,36,'en','name','Survey'),
(37,37,'en','name','Alberta'),
(38,38,'en','name','National'),
(39,39,'en','name','Provincial'),
(40,40,'en','name','Professional Development'),
(41,41,'en','name','employees'),
(66,66,'en','name','Integrating Technology'),
(67,67,'en','name','Computer Skills'),
(68,68,'en','name','Survey'),
(69,69,'en','name','Alberta'),
(70,70,'en','name','National'),
(71,71,'en','name','Provincial'),
(72,72,'en','name','Professional Development'),
(73,73,'en','name','employees'),
(76,76,'en','name','education'),
(77,77,'en','name','citizenship'),
(81,81,'en','name','Common pool resource'),
(82,82,'en','name','common property'),
(83,83,'en','name','intellectual developments'),
(85,85,'en','name','water'),
(90,90,'en','name','Development'),
(91,91,'en','name','engineering education'),
(92,92,'en','name','service learning'),
(93,93,'en','name','sustainability'),
(96,96,'en','name','pigs'),
(97,97,'en','name','food security'),
(99,99,'en','name','water'),
(110,110,'en','name','21st Century'),
(111,111,'en','name','Diversity'),
(112,112,'en','name','Multilingual'),
(113,113,'en','name','Multiethnic'),
(114,114,'en','name','Participatory Pedagogy'),
(115,115,'en','name','Language'),
(116,116,'en','name','Culture'),
(117,117,'en','name','Gender'),
(118,118,'en','name','Egalitarianism'),
(119,119,'en','name','Social Transformation'),
(122,122,'en','name','cattle'),
(123,123,'en','name','food security'),
(127,127,'en','name','Self-Organization'),
(128,128,'en','name','Multi-Level Institutions'),
(129,129,'en','name','Goverance'),
(132,132,'en','name','education'),
(133,133,'en','name','citizenship');
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
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES
(1,'interest',0,NULL),
(5,'submissionAgency',1048588,1),
(9,'submissionAgency',1048588,2),
(13,'submissionAgency',1048588,3),
(17,'submissionAgency',1048588,4),
(21,'submissionAgency',1048588,5),
(25,'submissionAgency',1048588,6),
(29,'submissionAgency',1048588,7),
(33,'submissionAgency',1048588,8),
(37,'submissionAgency',1048588,9),
(41,'submissionAgency',1048588,10),
(45,'submissionAgency',1048588,11),
(49,'submissionAgency',1048588,12),
(53,'submissionAgency',1048588,13),
(57,'submissionAgency',1048588,14),
(61,'submissionAgency',1048588,15),
(65,'submissionAgency',1048588,16),
(69,'submissionAgency',1048588,17),
(73,'submissionAgency',1048588,18),
(77,'submissionAgency',1048588,19),
(81,'submissionAgency',1048588,20),
(4,'submissionDiscipline',1048588,1),
(8,'submissionDiscipline',1048588,2),
(12,'submissionDiscipline',1048588,3),
(16,'submissionDiscipline',1048588,4),
(20,'submissionDiscipline',1048588,5),
(24,'submissionDiscipline',1048588,6),
(28,'submissionDiscipline',1048588,7),
(32,'submissionDiscipline',1048588,8),
(36,'submissionDiscipline',1048588,9),
(40,'submissionDiscipline',1048588,10),
(44,'submissionDiscipline',1048588,11),
(48,'submissionDiscipline',1048588,12),
(52,'submissionDiscipline',1048588,13),
(56,'submissionDiscipline',1048588,14),
(60,'submissionDiscipline',1048588,15),
(64,'submissionDiscipline',1048588,16),
(68,'submissionDiscipline',1048588,17),
(72,'submissionDiscipline',1048588,18),
(76,'submissionDiscipline',1048588,19),
(80,'submissionDiscipline',1048588,20),
(2,'submissionKeyword',1048588,1),
(6,'submissionKeyword',1048588,2),
(10,'submissionKeyword',1048588,3),
(14,'submissionKeyword',1048588,4),
(18,'submissionKeyword',1048588,5),
(22,'submissionKeyword',1048588,6),
(26,'submissionKeyword',1048588,7),
(30,'submissionKeyword',1048588,8),
(34,'submissionKeyword',1048588,9),
(38,'submissionKeyword',1048588,10),
(42,'submissionKeyword',1048588,11),
(46,'submissionKeyword',1048588,12),
(50,'submissionKeyword',1048588,13),
(54,'submissionKeyword',1048588,14),
(58,'submissionKeyword',1048588,15),
(62,'submissionKeyword',1048588,16),
(66,'submissionKeyword',1048588,17),
(70,'submissionKeyword',1048588,18),
(74,'submissionKeyword',1048588,19),
(78,'submissionKeyword',1048588,20),
(3,'submissionSubject',1048588,1),
(7,'submissionSubject',1048588,2),
(11,'submissionSubject',1048588,3),
(15,'submissionSubject',1048588,4),
(19,'submissionSubject',1048588,5),
(23,'submissionSubject',1048588,6),
(27,'submissionSubject',1048588,7),
(31,'submissionSubject',1048588,8),
(35,'submissionSubject',1048588,9),
(39,'submissionSubject',1048588,10),
(43,'submissionSubject',1048588,11),
(47,'submissionSubject',1048588,12),
(51,'submissionSubject',1048588,13),
(55,'submissionSubject',1048588,14),
(59,'submissionSubject',1048588,15),
(63,'submissionSubject',1048588,16),
(67,'submissionSubject',1048588,17),
(71,'submissionSubject',1048588,18),
(75,'submissionSubject',1048588,19),
(79,'submissionSubject',1048588,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
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
  `tombstone_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about data object tombstones, including localized content.';
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
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
  `doi_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about DOIs, including the registration agency.';
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
  `status` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Stores all DOIs used in the system.';
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
  `decision` smallint(6) NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES
(1,4,NULL,5,NULL,3,8,'2025-01-16 05:20:30'),
(2,4,NULL,5,NULL,3,16,'2025-01-16 05:20:35'),
(3,4,NULL,5,NULL,3,8,'2025-01-16 05:20:40');
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
  `sender_id` bigint(20) DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `email_log_sender_id` (`sender_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `email_log_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES
(1,1048585,1,NULL,'2025-01-16 05:18:18',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(2,1048585,1,NULL,'2025-01-16 05:18:18',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">The influence of lactation on the quantity and quality of cashmere production</a><br />Carlo Corino</p><p><b>Abstract</b></p>The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P&gt;0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P&lt;0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P&lt;0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P&lt;0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=1\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(3,1048585,1,NULL,'2025-01-16 05:18:18',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(4,1048585,2,NULL,'2025-01-16 05:19:15',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(5,1048585,2,NULL,'2025-01-16 05:19:15',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence</a><br />Catherine Kwantes, Urho Kekkonen</p><p><b>Abstract</b></p><p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p><p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=2\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(6,1048585,2,NULL,'2025-01-16 05:19:15',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(7,1048585,2,NULL,'2025-01-16 05:19:15',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Urho Kekkonen\" <notanemailukk@mailinator.com>','','','Submission Acknowledgement','<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(8,1048585,3,NULL,'2025-01-16 05:19:42',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(9,1048585,3,NULL,'2025-01-16 05:19:42',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice</a><br />Craig Montgomerie, Mark Irvine</p><p><b>Abstract</b></p>The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=3\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(10,1048585,3,NULL,'2025-01-16 05:19:42',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(11,1048585,3,NULL,'2025-01-16 05:19:42',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission Acknowledgement','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(12,1048585,4,NULL,'2025-01-16 05:20:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(13,1048585,4,NULL,'2025-01-16 05:20:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">Genetic transformation of forest trees</a><br />Diaga Diouf</p><p><b>Abstract</b></p>In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=4\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(14,1048585,4,NULL,'2025-01-16 05:20:25',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(15,1048585,4,3,'2025-01-16 05:20:30',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(16,1048585,4,3,'2025-01-16 05:20:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),
(17,1048585,4,3,'2025-01-16 05:20:40',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, Genetic transformation of forest trees, the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),
(18,1048585,5,NULL,'2025-01-16 05:21:00',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(19,1048585,5,NULL,'2025-01-16 05:21:00',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement</a><br />Dana Phillips</p><p><b>Abstract</b></p>Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=5\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(20,1048585,5,NULL,'2025-01-16 05:21:01',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(21,1048585,6,NULL,'2025-01-16 05:21:34',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(22,1048585,6,NULL,'2025-01-16 05:21:34',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">Developing efficacy beliefs in the classroom</a><br />Domatilia Sokoloff</p><p><b>Abstract</b></p>A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=6\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(23,1048585,6,NULL,'2025-01-16 05:21:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(24,1048585,7,NULL,'2025-01-16 05:21:57',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(25,1048585,7,NULL,'2025-01-16 05:21:57',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">Developing efficacy beliefs in the classroom</a><br />Elinor Ostrom, Frank van Laerhoven</p><p><b>Abstract</b></p>The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=7\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(26,1048585,7,NULL,'2025-01-16 05:21:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(27,1048585,7,NULL,'2025-01-16 05:21:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission Acknowledgement','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(28,1048585,8,NULL,'2025-01-16 05:22:20',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(29,1048585,8,NULL,'2025-01-16 05:22:21',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">Hansen & Pinto: Reason Reclaimed</a><br />Fabio Paglieri</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=8\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(30,1048585,8,NULL,'2025-01-16 05:22:21',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(31,1048585,9,NULL,'2025-01-16 05:22:43',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(32,1048585,9,NULL,'2025-01-16 05:22:43',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9\">Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence</a><br />John Mwandenga</p><p><b>Abstract</b></p>The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=9\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(33,1048585,9,NULL,'2025-01-16 05:22:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(34,1048585,10,NULL,'2025-01-16 05:23:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(35,1048585,10,NULL,'2025-01-16 05:23:06',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">Condensing Water Availability Models to Focus on Specific Water Management Systems</a><br />John Novak</p><p><b>Abstract</b></p>The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=10\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(36,1048585,10,NULL,'2025-01-16 05:23:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(37,1048585,11,NULL,'2025-01-16 05:23:30',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(38,1048585,11,NULL,'2025-01-16 05:23:30',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">Learning Sustainable Design through Service</a><br />Karim Al-Khafaji, Margaret Morse</p><p><b>Abstract</b></p>Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=11\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(39,1048585,11,NULL,'2025-01-16 05:23:30',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(40,1048585,11,NULL,'2025-01-16 05:23:30',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission Acknowledgement','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(41,1048585,12,NULL,'2025-01-16 05:23:53',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(42,1048585,12,NULL,'2025-01-16 05:23:53',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">Sodium butyrate improves growth performance of weaned piglets during the first period after weaning</a><br />Leo Christopher</p><p><b>Abstract</b></p>The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=12\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(43,1048585,12,NULL,'2025-01-16 05:23:53',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(44,1048585,13,NULL,'2025-01-16 05:24:16',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(45,1048585,13,NULL,'2025-01-16 05:24:16',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions</a><br />Lise Kumiega</p><p><b>Abstract</b></p>The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=13\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(46,1048585,13,NULL,'2025-01-16 05:24:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(47,1048585,14,NULL,'2025-01-16 05:24:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(48,1048585,14,NULL,'2025-01-16 05:24:39',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua</a><br />Patricia Daniel</p><p><b>Abstract</b></p>One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=14\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(49,1048585,14,NULL,'2025-01-16 05:24:39',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(50,1048585,15,NULL,'2025-01-16 05:25:02',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(51,1048585,15,NULL,'2025-01-16 05:25:03',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">Yam diseases and its management in Nigeria</a><br />Rana Baiyewu</p><p><b>Abstract</b></p>This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=15\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(52,1048585,15,NULL,'2025-01-16 05:25:03',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(53,1048585,16,NULL,'2025-01-16 05:25:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(54,1048585,16,NULL,'2025-01-16 05:25:25',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat</a><br />Rosanna Rossi</p><p><b>Abstract</b></p>Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=16\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(55,1048585,16,NULL,'2025-01-16 05:25:26',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(56,1048585,17,NULL,'2025-01-16 05:25:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(57,1048585,17,NULL,'2025-01-16 05:25:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran</a><br />Vajiheh Karbasizaed</p><p><b>Abstract</b></p>The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (&gt;56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=17\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(58,1048585,17,NULL,'2025-01-16 05:25:48',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(59,1048585,18,NULL,'2025-01-16 05:26:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(60,1048585,18,NULL,'2025-01-16 05:26:11',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">Self-Organization in Multi-Level Institutions in Networked Environments</a><br />Valerie Williamson</p><p><b>Abstract</b></p>We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=18\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(61,1048585,18,NULL,'2025-01-16 05:26:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(62,1048585,19,NULL,'2025-01-16 05:26:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear David Buskins,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(63,1048585,19,NULL,'2025-01-16 05:26:35',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stephanie Berardo\" <sberardo@mailinator.com>','','','You have been assigned as a moderator on a submission to Public Knowledge Preprint Server','<p>Dear Stephanie Berardo,</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19\">Finocchiaro: Arguments About Arguments</a><br />Zita Woods</p><p><b>Abstract</b></p>None.<p>Please login to <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/editorial?workflowSubmissionId=19\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(64,1048585,19,NULL,'2025-01-16 05:26:35',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES
(1,1,4),
(2,2,5),
(3,3,7),
(4,4,4),
(5,5,5),
(6,6,8),
(7,8,4),
(8,9,5),
(9,10,9),
(10,12,4),
(11,13,5),
(12,14,10),
(13,15,10),
(14,16,10),
(15,17,10),
(16,18,4),
(17,19,5),
(18,20,11),
(19,21,4),
(20,22,5),
(21,23,12),
(22,24,4),
(23,25,5),
(24,26,13),
(25,28,4),
(26,29,5),
(27,30,14),
(28,31,4),
(29,32,5),
(30,33,15),
(31,34,4),
(32,35,5),
(33,36,16),
(34,37,4),
(35,38,5),
(36,39,17),
(37,41,4),
(38,42,5),
(39,43,18),
(40,44,4),
(41,45,5),
(42,46,19),
(43,47,4),
(44,48,5),
(45,49,20),
(46,50,4),
(47,51,5),
(48,52,21),
(49,53,4),
(50,54,5),
(51,55,22),
(52,56,4),
(53,57,5),
(54,58,23),
(55,59,4),
(56,60,5),
(57,61,24),
(58,62,4),
(59,63,5),
(60,64,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES
(1,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(28) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES
(1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(3,'USER_REGISTER','en','User Created','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),
(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Server Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$serverSignature}'),
(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),
(9,'SUBMISSION_ACK','en','Submission Acknowledgement (Pending Moderation)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),
(11,'POSTED_ACK','en','Posted Acknowledgement','Preprint Posted Acknowledgement','{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}'),
(13,'POSTED_NEW_VERSION_ACK','en','New Version Posted','New Version Posted Acknowledgement','<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$serverName}. The new version is now <a href=\"{$submissionPublishedUrl}\">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}'),
(15,'SUBMISSION_ACK_CAN_POST','en','Submission Acknowledgement (No Moderation Required)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href=\"{$authorSubmissionUrl}\">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),
(17,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission Acknowledgement','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$serverName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$serverSignature}'),
(19,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),
(21,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has passed moderation at {$serverName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$serverName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$serverName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(23,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),
(25,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(27,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),
(29,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Preprint Server activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href=\"{$editorialStatsLink}\">trends</a> and <a href=\"{$publicationStatsLink}\">posted preprint stats</a>. A full copy of this month\'s trends is attached.<br />\n<br />\nSincerely,<br />\n{$serverSignature}'),
(31,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),
(33,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$serverName}','Please enter your message.'),
(35,'EDITOR_ASSIGN_PRODUCTION','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),
(37,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),
(39,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),
(41,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),
(43,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),
(45,'ORCID_COLLECT_AUTHOR_ID','en','','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(47,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(49,'USER_ROLE_ASSIGNMENT_INVITATION','en','','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$serverName}</p>        <p>At {$serverName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$serverName}</p>        <p>Feel free to contact me with any questions about the process.</p>        <p><a href=\'{$acceptUrl}\' class=\'btn btn-accept\'>Accept Invitation</a></p>        <p><a href=\'{$declineUrl}\' class=\'btn btn-decline\'>Decline Invitation</a></p>        <p>Kind regards,</p>        <p>{$serverName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),
(51,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$serverName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$serverName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$serverName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$serverName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),
(79,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(80,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),
(81,'USER_VALIDATE_CONTEXT','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}'),
(82,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','',''),
(83,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),
(84,'POSTED_ACK','fr_CA','','',''),
(85,'POSTED_NEW_VERSION_ACK','fr_CA','','',''),
(86,'SUBMISSION_ACK_CAN_POST','fr_CA','','Accusé de réception de la soumission',''),
(87,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),
(88,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','',''),
(89,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','',''),
(90,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$serverName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),
(91,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e modérateur-trice évaluera votre soumission dans les détails afin de décider si votre soumission sera rejetée ou pourra être envoyée en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),
(92,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$serverName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),
(93,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','',''),
(94,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','',''),
(95,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$serverName}','Prière de saisir votre message.'),
(96,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Rédacteur-trice assigné','',''),
(97,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$serverUrl}\">{$serverName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),
(98,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),
(99,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),
(100,'CHANGE_EMAIL','fr_CA','','',''),
(101,'ORCID_COLLECT_AUTHOR_ID','fr_CA','','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(102,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(103,'USER_ROLE_ASSIGNMENT_INVITATION','fr_CA','','',''),
(104,'USER_ROLE_END','fr_CA','','','');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
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
  `user_id` bigint(20) DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES
(1,1048585,1,7,'2025-01-16 05:18:05',268435458,'submission.event.general.metadataUpdated',0),
(2,1048585,1,7,'2025-01-16 05:18:05',268435458,'submission.event.general.metadataUpdated',0),
(3,515,1,7,'2025-01-16 05:18:15',1342177281,'submission.event.fileUploaded',0),
(4,1048585,1,7,'2025-01-16 05:18:15',1342177288,'submission.event.fileRevised',0),
(5,515,1,7,'2025-01-16 05:18:17',1342177296,'submission.event.fileEdited',0),
(6,1048585,1,7,'2025-01-16 05:18:18',268435457,'submission.event.submissionSubmitted',0),
(7,1048585,2,8,'2025-01-16 05:18:26',268435458,'submission.event.general.metadataUpdated',0),
(8,1048585,2,8,'2025-01-16 05:18:26',268435458,'submission.event.general.metadataUpdated',0),
(9,1048585,2,8,'2025-01-16 05:18:42',268435458,'submission.event.general.metadataUpdated',0),
(10,515,2,8,'2025-01-16 05:18:49',1342177281,'submission.event.fileUploaded',0),
(11,1048585,2,8,'2025-01-16 05:18:49',1342177288,'submission.event.fileRevised',0),
(12,515,2,8,'2025-01-16 05:18:51',1342177296,'submission.event.fileEdited',0),
(13,1048585,2,8,'2025-01-16 05:19:15',268435457,'submission.event.submissionSubmitted',0),
(14,1048585,2,3,'2025-01-16 05:19:23',268435462,'publication.event.published',0),
(15,1048585,3,9,'2025-01-16 05:19:29',268435458,'submission.event.general.metadataUpdated',0),
(16,1048585,3,9,'2025-01-16 05:19:29',268435458,'submission.event.general.metadataUpdated',0),
(17,515,3,9,'2025-01-16 05:19:39',1342177281,'submission.event.fileUploaded',0),
(18,1048585,3,9,'2025-01-16 05:19:39',1342177288,'submission.event.fileRevised',0),
(19,515,3,9,'2025-01-16 05:19:41',1342177296,'submission.event.fileEdited',0),
(20,1048585,3,9,'2025-01-16 05:19:42',268435457,'submission.event.submissionSubmitted',0),
(21,1048585,3,3,'2025-01-16 05:19:46',268435462,'publication.event.published',0),
(22,1048585,3,3,'2025-01-16 05:19:51',268435463,'publication.event.unpublished',0),
(23,1048585,3,3,'2025-01-16 05:19:53',268435458,'submission.event.general.metadataUpdated',0),
(24,1048585,3,3,'2025-01-16 05:19:55',268435462,'publication.event.published',0),
(25,1048585,3,3,'2025-01-16 05:19:57',268435458,'submission.event.general.metadataUpdated',0),
(26,1048585,3,3,'2025-01-16 05:19:57',268435464,'publication.event.versionCreated',0),
(27,1048585,3,3,'2025-01-16 05:20:03',268435458,'submission.event.general.metadataUpdated',0),
(28,1048585,3,3,'2025-01-16 05:20:06',268435462,'publication.event.versionPublished',0),
(29,1048585,4,10,'2025-01-16 05:20:12',268435458,'submission.event.general.metadataUpdated',0),
(30,1048585,4,10,'2025-01-16 05:20:12',268435458,'submission.event.general.metadataUpdated',0),
(31,515,4,10,'2025-01-16 05:20:22',1342177281,'submission.event.fileUploaded',0),
(32,1048585,4,10,'2025-01-16 05:20:22',1342177288,'submission.event.fileRevised',0),
(33,515,4,10,'2025-01-16 05:20:24',1342177296,'submission.event.fileEdited',0),
(34,1048585,4,10,'2025-01-16 05:20:25',268435457,'submission.event.submissionSubmitted',0),
(35,1048585,4,3,'2025-01-16 05:20:30',805306371,'editor.submission.decision.decline.log',0),
(36,1048585,4,3,'2025-01-16 05:20:35',805306371,'editor.submission.decision.revertDecline.log',0),
(37,1048585,4,3,'2025-01-16 05:20:40',805306371,'editor.submission.decision.decline.log',0),
(38,1048585,5,11,'2025-01-16 05:20:48',268435458,'submission.event.general.metadataUpdated',0),
(39,1048585,5,11,'2025-01-16 05:20:48',268435458,'submission.event.general.metadataUpdated',0),
(40,515,5,11,'2025-01-16 05:20:57',1342177281,'submission.event.fileUploaded',0),
(41,1048585,5,11,'2025-01-16 05:20:57',1342177288,'submission.event.fileRevised',0),
(42,515,5,11,'2025-01-16 05:21:00',1342177296,'submission.event.fileEdited',0),
(43,1048585,5,11,'2025-01-16 05:21:00',268435457,'submission.event.submissionSubmitted',0),
(44,1048585,5,3,'2025-01-16 05:21:04',268435462,'publication.event.published',0),
(45,1048585,5,3,'2025-01-16 05:21:11',268435463,'publication.event.unpublished',0),
(46,1048585,5,3,'2025-01-16 05:21:16',268435462,'publication.event.published',0),
(47,1048585,6,12,'2025-01-16 05:21:21',268435458,'submission.event.general.metadataUpdated',0),
(48,1048585,6,12,'2025-01-16 05:21:22',268435458,'submission.event.general.metadataUpdated',0),
(49,515,6,12,'2025-01-16 05:21:31',1342177281,'submission.event.fileUploaded',0),
(50,1048585,6,12,'2025-01-16 05:21:31',1342177288,'submission.event.fileRevised',0),
(51,515,6,12,'2025-01-16 05:21:34',1342177296,'submission.event.fileEdited',0),
(52,1048585,6,12,'2025-01-16 05:21:34',268435457,'submission.event.submissionSubmitted',0),
(53,1048585,6,3,'2025-01-16 05:21:38',268435462,'publication.event.published',0),
(54,1048585,7,13,'2025-01-16 05:21:44',268435458,'submission.event.general.metadataUpdated',0),
(55,1048585,7,13,'2025-01-16 05:21:45',268435458,'submission.event.general.metadataUpdated',0),
(56,515,7,13,'2025-01-16 05:21:54',1342177281,'submission.event.fileUploaded',0),
(57,1048585,7,13,'2025-01-16 05:21:54',1342177288,'submission.event.fileRevised',0),
(58,515,7,13,'2025-01-16 05:21:56',1342177296,'submission.event.fileEdited',0),
(59,1048585,7,13,'2025-01-16 05:21:57',268435457,'submission.event.submissionSubmitted',0),
(60,1048585,7,3,'2025-01-16 05:22:02',268435462,'publication.event.published',0),
(61,1048585,8,14,'2025-01-16 05:22:08',268435458,'submission.event.general.metadataUpdated',0),
(62,1048585,8,14,'2025-01-16 05:22:08',268435458,'submission.event.general.metadataUpdated',0),
(63,515,8,14,'2025-01-16 05:22:18',1342177281,'submission.event.fileUploaded',0),
(64,1048585,8,14,'2025-01-16 05:22:18',1342177288,'submission.event.fileRevised',0),
(65,515,8,14,'2025-01-16 05:22:20',1342177296,'submission.event.fileEdited',0),
(66,1048585,8,14,'2025-01-16 05:22:21',268435457,'submission.event.submissionSubmitted',0),
(67,1048585,8,3,'2025-01-16 05:22:25',268435462,'publication.event.published',0),
(68,1048585,9,15,'2025-01-16 05:22:31',268435458,'submission.event.general.metadataUpdated',0),
(69,1048585,9,15,'2025-01-16 05:22:31',268435458,'submission.event.general.metadataUpdated',0),
(70,515,9,15,'2025-01-16 05:22:40',1342177281,'submission.event.fileUploaded',0),
(71,1048585,9,15,'2025-01-16 05:22:40',1342177288,'submission.event.fileRevised',0),
(72,515,9,15,'2025-01-16 05:22:43',1342177296,'submission.event.fileEdited',0),
(73,1048585,9,15,'2025-01-16 05:22:43',268435457,'submission.event.submissionSubmitted',0),
(74,1048585,9,3,'2025-01-16 05:22:48',268435462,'publication.event.published',0),
(75,1048585,10,16,'2025-01-16 05:22:54',268435458,'submission.event.general.metadataUpdated',0),
(76,1048585,10,16,'2025-01-16 05:22:54',268435458,'submission.event.general.metadataUpdated',0),
(77,515,10,16,'2025-01-16 05:23:03',1342177281,'submission.event.fileUploaded',0),
(78,1048585,10,16,'2025-01-16 05:23:03',1342177288,'submission.event.fileRevised',0),
(79,515,10,16,'2025-01-16 05:23:06',1342177296,'submission.event.fileEdited',0),
(80,1048585,10,16,'2025-01-16 05:23:06',268435457,'submission.event.submissionSubmitted',0),
(81,1048585,10,3,'2025-01-16 05:23:11',268435462,'publication.event.published',0),
(82,1048585,11,17,'2025-01-16 05:23:17',268435458,'submission.event.general.metadataUpdated',0),
(83,1048585,11,17,'2025-01-16 05:23:17',268435458,'submission.event.general.metadataUpdated',0),
(84,515,11,17,'2025-01-16 05:23:27',1342177281,'submission.event.fileUploaded',0),
(85,1048585,11,17,'2025-01-16 05:23:27',1342177288,'submission.event.fileRevised',0),
(86,515,11,17,'2025-01-16 05:23:29',1342177296,'submission.event.fileEdited',0),
(87,1048585,11,17,'2025-01-16 05:23:30',268435457,'submission.event.submissionSubmitted',0),
(88,1048585,11,3,'2025-01-16 05:23:34',268435462,'publication.event.published',0),
(89,1048585,12,18,'2025-01-16 05:23:40',268435458,'submission.event.general.metadataUpdated',0),
(90,1048585,12,18,'2025-01-16 05:23:40',268435458,'submission.event.general.metadataUpdated',0),
(91,515,12,18,'2025-01-16 05:23:50',1342177281,'submission.event.fileUploaded',0),
(92,1048585,12,18,'2025-01-16 05:23:50',1342177288,'submission.event.fileRevised',0),
(93,515,12,18,'2025-01-16 05:23:52',1342177296,'submission.event.fileEdited',0),
(94,1048585,12,18,'2025-01-16 05:23:53',268435457,'submission.event.submissionSubmitted',0),
(95,1048585,12,3,'2025-01-16 05:23:57',268435462,'publication.event.published',0),
(96,1048585,13,19,'2025-01-16 05:24:03',268435458,'submission.event.general.metadataUpdated',0),
(97,1048585,13,19,'2025-01-16 05:24:04',268435458,'submission.event.general.metadataUpdated',0),
(98,515,13,19,'2025-01-16 05:24:13',1342177281,'submission.event.fileUploaded',0),
(99,1048585,13,19,'2025-01-16 05:24:13',1342177288,'submission.event.fileRevised',0),
(100,515,13,19,'2025-01-16 05:24:16',1342177296,'submission.event.fileEdited',0),
(101,1048585,13,19,'2025-01-16 05:24:16',268435457,'submission.event.submissionSubmitted',0),
(102,1048585,13,3,'2025-01-16 05:24:20',268435462,'publication.event.published',0),
(103,1048585,14,20,'2025-01-16 05:24:26',268435458,'submission.event.general.metadataUpdated',0),
(104,1048585,14,20,'2025-01-16 05:24:27',268435458,'submission.event.general.metadataUpdated',0),
(105,515,14,20,'2025-01-16 05:24:36',1342177281,'submission.event.fileUploaded',0),
(106,1048585,14,20,'2025-01-16 05:24:36',1342177288,'submission.event.fileRevised',0),
(107,515,14,20,'2025-01-16 05:24:39',1342177296,'submission.event.fileEdited',0),
(108,1048585,14,20,'2025-01-16 05:24:39',268435457,'submission.event.submissionSubmitted',0),
(109,1048585,14,3,'2025-01-16 05:24:44',268435462,'publication.event.published',0),
(110,1048585,15,21,'2025-01-16 05:24:50',268435458,'submission.event.general.metadataUpdated',0),
(111,1048585,15,21,'2025-01-16 05:24:50',268435458,'submission.event.general.metadataUpdated',0),
(112,515,15,21,'2025-01-16 05:25:00',1342177281,'submission.event.fileUploaded',0),
(113,1048585,15,21,'2025-01-16 05:25:00',1342177288,'submission.event.fileRevised',0),
(114,515,15,21,'2025-01-16 05:25:02',1342177296,'submission.event.fileEdited',0),
(115,1048585,15,21,'2025-01-16 05:25:03',268435457,'submission.event.submissionSubmitted',0),
(116,1048585,15,3,'2025-01-16 05:25:07',268435462,'publication.event.published',0),
(117,1048585,16,22,'2025-01-16 05:25:13',268435458,'submission.event.general.metadataUpdated',0),
(118,1048585,16,22,'2025-01-16 05:25:13',268435458,'submission.event.general.metadataUpdated',0),
(119,515,16,22,'2025-01-16 05:25:23',1342177281,'submission.event.fileUploaded',0),
(120,1048585,16,22,'2025-01-16 05:25:23',1342177288,'submission.event.fileRevised',0),
(121,515,16,22,'2025-01-16 05:25:25',1342177296,'submission.event.fileEdited',0),
(122,1048585,16,22,'2025-01-16 05:25:25',268435457,'submission.event.submissionSubmitted',0),
(123,1048585,16,3,'2025-01-16 05:25:30',268435462,'publication.event.published',0),
(124,1048585,17,23,'2025-01-16 05:25:36',268435458,'submission.event.general.metadataUpdated',0),
(125,1048585,17,23,'2025-01-16 05:25:36',268435458,'submission.event.general.metadataUpdated',0),
(126,515,17,23,'2025-01-16 05:25:45',1342177281,'submission.event.fileUploaded',0),
(127,1048585,17,23,'2025-01-16 05:25:45',1342177288,'submission.event.fileRevised',0),
(128,515,17,23,'2025-01-16 05:25:48',1342177296,'submission.event.fileEdited',0),
(129,1048585,17,23,'2025-01-16 05:25:48',268435457,'submission.event.submissionSubmitted',0),
(130,1048585,17,3,'2025-01-16 05:25:53',268435462,'publication.event.published',0),
(131,1048585,18,24,'2025-01-16 05:25:59',268435458,'submission.event.general.metadataUpdated',0),
(132,1048585,18,24,'2025-01-16 05:25:59',268435458,'submission.event.general.metadataUpdated',0),
(133,515,18,24,'2025-01-16 05:26:09',1342177281,'submission.event.fileUploaded',0),
(134,1048585,18,24,'2025-01-16 05:26:09',1342177288,'submission.event.fileRevised',0),
(135,515,18,24,'2025-01-16 05:26:11',1342177296,'submission.event.fileEdited',0),
(136,1048585,18,24,'2025-01-16 05:26:12',268435457,'submission.event.submissionSubmitted',0),
(137,1048585,18,3,'2025-01-16 05:26:16',268435462,'publication.event.published',0),
(138,1048585,19,25,'2025-01-16 05:26:22',268435458,'submission.event.general.metadataUpdated',0),
(139,1048585,19,25,'2025-01-16 05:26:22',268435458,'submission.event.general.metadataUpdated',0),
(140,515,19,25,'2025-01-16 05:26:32',1342177281,'submission.event.fileUploaded',0),
(141,1048585,19,25,'2025-01-16 05:26:32',1342177288,'submission.event.fileRevised',0),
(142,515,19,25,'2025-01-16 05:26:34',1342177296,'submission.event.fileEdited',0),
(143,1048585,19,25,'2025-01-16 05:26:35',268435457,'submission.event.submissionSubmitted',0),
(144,1048585,19,3,'2025-01-16 05:26:39',268435462,'publication.event.published',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES
(1,3,'','fileId','1'),
(2,3,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(3,3,'','fileStage','10'),
(4,3,'','submissionFileId','1'),
(5,3,'','submissionId','1'),
(6,3,'','username','ccorino'),
(7,4,'','fileId','1'),
(8,4,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(9,4,'','fileStage','10'),
(10,4,'','submissionFileId','1'),
(11,4,'','submissionId','1'),
(12,4,'','username','ccorino'),
(13,5,'','fileId','1'),
(14,5,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(15,5,'','fileStage','10'),
(16,5,'','submissionFileId','1'),
(17,5,'','submissionId','1'),
(18,5,'','username','ccorino'),
(19,10,'','fileId','2'),
(20,10,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(21,10,'','fileStage','10'),
(22,10,'','submissionFileId','2'),
(23,10,'','submissionId','2'),
(24,10,'','username','ckwantes'),
(25,11,'','fileId','2'),
(26,11,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(27,11,'','fileStage','10'),
(28,11,'','submissionFileId','2'),
(29,11,'','submissionId','2'),
(30,11,'','username','ckwantes'),
(31,12,'','fileId','2'),
(32,12,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(33,12,'','fileStage','10'),
(34,12,'','submissionFileId','2'),
(35,12,'','submissionId','2'),
(36,12,'','username','ckwantes'),
(37,17,'','fileId','3'),
(38,17,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(39,17,'','fileStage','10'),
(40,17,'','submissionFileId','3'),
(41,17,'','submissionId','3'),
(42,17,'','username','cmontgomerie'),
(43,18,'','fileId','3'),
(44,18,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(45,18,'','fileStage','10'),
(46,18,'','submissionFileId','3'),
(47,18,'','submissionId','3'),
(48,18,'','username','cmontgomerie'),
(49,19,'','fileId','3'),
(50,19,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(51,19,'','fileStage','10'),
(52,19,'','submissionFileId','3'),
(53,19,'','submissionId','3'),
(54,19,'','username','cmontgomerie'),
(55,31,'','fileId','4'),
(56,31,'en','filename','Genetic transformation of forest trees.pdf'),
(57,31,'','fileStage','10'),
(58,31,'','submissionFileId','4'),
(59,31,'','submissionId','4'),
(60,31,'','username','ddiouf'),
(61,32,'','fileId','4'),
(62,32,'en','filename','Genetic transformation of forest trees.pdf'),
(63,32,'','fileStage','10'),
(64,32,'','submissionFileId','4'),
(65,32,'','submissionId','4'),
(66,32,'','username','ddiouf'),
(67,33,'','fileId','4'),
(68,33,'en','filename','Genetic transformation of forest trees.pdf'),
(69,33,'','fileStage','10'),
(70,33,'','submissionFileId','4'),
(71,33,'','submissionId','4'),
(72,33,'','username','ddiouf'),
(73,35,'','editorName','Daniel Barnes'),
(74,36,'','editorName','Daniel Barnes'),
(75,37,'','editorName','Daniel Barnes'),
(76,40,'','fileId','5'),
(77,40,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(78,40,'','fileStage','10'),
(79,40,'','submissionFileId','5'),
(80,40,'','submissionId','5'),
(81,40,'','username','dphillips'),
(82,41,'','fileId','5'),
(83,41,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(84,41,'','fileStage','10'),
(85,41,'','submissionFileId','5'),
(86,41,'','submissionId','5'),
(87,41,'','username','dphillips'),
(88,42,'','fileId','5'),
(89,42,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(90,42,'','fileStage','10'),
(91,42,'','submissionFileId','5'),
(92,42,'','submissionId','5'),
(93,42,'','username','dphillips'),
(94,49,'','fileId','6'),
(95,49,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(96,49,'','fileStage','10'),
(97,49,'','submissionFileId','6'),
(98,49,'','submissionId','6'),
(99,49,'','username','dsokoloff'),
(100,50,'','fileId','6'),
(101,50,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(102,50,'','fileStage','10'),
(103,50,'','submissionFileId','6'),
(104,50,'','submissionId','6'),
(105,50,'','username','dsokoloff'),
(106,51,'','fileId','6'),
(107,51,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(108,51,'','fileStage','10'),
(109,51,'','submissionFileId','6'),
(110,51,'','submissionId','6'),
(111,51,'','username','dsokoloff'),
(112,56,'','fileId','7'),
(113,56,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(114,56,'','fileStage','10'),
(115,56,'','submissionFileId','7'),
(116,56,'','submissionId','7'),
(117,56,'','username','eostrom'),
(118,57,'','fileId','7'),
(119,57,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(120,57,'','fileStage','10'),
(121,57,'','submissionFileId','7'),
(122,57,'','submissionId','7'),
(123,57,'','username','eostrom'),
(124,58,'','fileId','7'),
(125,58,'en','filename','Developing efficacy beliefs in the classroom.pdf'),
(126,58,'','fileStage','10'),
(127,58,'','submissionFileId','7'),
(128,58,'','submissionId','7'),
(129,58,'','username','eostrom'),
(130,63,'','fileId','8'),
(131,63,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(132,63,'','fileStage','10'),
(133,63,'','submissionFileId','8'),
(134,63,'','submissionId','8'),
(135,63,'','username','fpaglieri'),
(136,64,'','fileId','8'),
(137,64,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(138,64,'','fileStage','10'),
(139,64,'','submissionFileId','8'),
(140,64,'','submissionId','8'),
(141,64,'','username','fpaglieri'),
(142,65,'','fileId','8'),
(143,65,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),
(144,65,'','fileStage','10'),
(145,65,'','submissionFileId','8'),
(146,65,'','submissionId','8'),
(147,65,'','username','fpaglieri'),
(148,70,'','fileId','9'),
(149,70,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(150,70,'','fileStage','10'),
(151,70,'','submissionFileId','9'),
(152,70,'','submissionId','9'),
(153,70,'','username','jmwandenga'),
(154,71,'','fileId','9'),
(155,71,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(156,71,'','fileStage','10'),
(157,71,'','submissionFileId','9'),
(158,71,'','submissionId','9'),
(159,71,'','username','jmwandenga'),
(160,72,'','fileId','9'),
(161,72,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(162,72,'','fileStage','10'),
(163,72,'','submissionFileId','9'),
(164,72,'','submissionId','9'),
(165,72,'','username','jmwandenga'),
(166,77,'','fileId','10'),
(167,77,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(168,77,'','fileStage','10'),
(169,77,'','submissionFileId','10'),
(170,77,'','submissionId','10'),
(171,77,'','username','jnovak'),
(172,78,'','fileId','10'),
(173,78,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(174,78,'','fileStage','10'),
(175,78,'','submissionFileId','10'),
(176,78,'','submissionId','10'),
(177,78,'','username','jnovak'),
(178,79,'','fileId','10'),
(179,79,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(180,79,'','fileStage','10'),
(181,79,'','submissionFileId','10'),
(182,79,'','submissionId','10'),
(183,79,'','username','jnovak'),
(184,84,'','fileId','11'),
(185,84,'en','filename','Learning Sustainable Design through Service.pdf'),
(186,84,'','fileStage','10'),
(187,84,'','submissionFileId','11'),
(188,84,'','submissionId','11'),
(189,84,'','username','kalkhafaji'),
(190,85,'','fileId','11'),
(191,85,'en','filename','Learning Sustainable Design through Service.pdf'),
(192,85,'','fileStage','10'),
(193,85,'','submissionFileId','11'),
(194,85,'','submissionId','11'),
(195,85,'','username','kalkhafaji'),
(196,86,'','fileId','11'),
(197,86,'en','filename','Learning Sustainable Design through Service.pdf'),
(198,86,'','fileStage','10'),
(199,86,'','submissionFileId','11'),
(200,86,'','submissionId','11'),
(201,86,'','username','kalkhafaji'),
(202,91,'','fileId','12'),
(203,91,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(204,91,'','fileStage','10'),
(205,91,'','submissionFileId','12'),
(206,91,'','submissionId','12'),
(207,91,'','username','lchristopher'),
(208,92,'','fileId','12'),
(209,92,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(210,92,'','fileStage','10'),
(211,92,'','submissionFileId','12'),
(212,92,'','submissionId','12'),
(213,92,'','username','lchristopher'),
(214,93,'','fileId','12'),
(215,93,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(216,93,'','fileStage','10'),
(217,93,'','submissionFileId','12'),
(218,93,'','submissionId','12'),
(219,93,'','username','lchristopher'),
(220,98,'','fileId','13'),
(221,98,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(222,98,'','fileStage','10'),
(223,98,'','submissionFileId','13'),
(224,98,'','submissionId','13'),
(225,98,'','username','lkumiega'),
(226,99,'','fileId','13'),
(227,99,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(228,99,'','fileStage','10'),
(229,99,'','submissionFileId','13'),
(230,99,'','submissionId','13'),
(231,99,'','username','lkumiega'),
(232,100,'','fileId','13'),
(233,100,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(234,100,'','fileStage','10'),
(235,100,'','submissionFileId','13'),
(236,100,'','submissionId','13'),
(237,100,'','username','lkumiega'),
(238,105,'','fileId','14'),
(239,105,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(240,105,'','fileStage','10'),
(241,105,'','submissionFileId','14'),
(242,105,'','submissionId','14'),
(243,105,'','username','pdaniel'),
(244,106,'','fileId','14'),
(245,106,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(246,106,'','fileStage','10'),
(247,106,'','submissionFileId','14'),
(248,106,'','submissionId','14'),
(249,106,'','username','pdaniel'),
(250,107,'','fileId','14'),
(251,107,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(252,107,'','fileStage','10'),
(253,107,'','submissionFileId','14'),
(254,107,'','submissionId','14'),
(255,107,'','username','pdaniel'),
(256,112,'','fileId','15'),
(257,112,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(258,112,'','fileStage','10'),
(259,112,'','submissionFileId','15'),
(260,112,'','submissionId','15'),
(261,112,'','username','rbaiyewu'),
(262,113,'','fileId','15'),
(263,113,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(264,113,'','fileStage','10'),
(265,113,'','submissionFileId','15'),
(266,113,'','submissionId','15'),
(267,113,'','username','rbaiyewu'),
(268,114,'','fileId','15'),
(269,114,'en','filename','Yam diseases and its management in Nigeria.pdf'),
(270,114,'','fileStage','10'),
(271,114,'','submissionFileId','15'),
(272,114,'','submissionId','15'),
(273,114,'','username','rbaiyewu'),
(274,119,'','fileId','16'),
(275,119,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(276,119,'','fileStage','10'),
(277,119,'','submissionFileId','16'),
(278,119,'','submissionId','16'),
(279,119,'','username','rrossi'),
(280,120,'','fileId','16'),
(281,120,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(282,120,'','fileStage','10'),
(283,120,'','submissionFileId','16'),
(284,120,'','submissionId','16'),
(285,120,'','username','rrossi'),
(286,121,'','fileId','16'),
(287,121,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(288,121,'','fileStage','10'),
(289,121,'','submissionFileId','16'),
(290,121,'','submissionId','16'),
(291,121,'','username','rrossi'),
(292,126,'','fileId','17'),
(293,126,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(294,126,'','fileStage','10'),
(295,126,'','submissionFileId','17'),
(296,126,'','submissionId','17'),
(297,126,'','username','vkarbasizaed'),
(298,127,'','fileId','17'),
(299,127,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(300,127,'','fileStage','10'),
(301,127,'','submissionFileId','17'),
(302,127,'','submissionId','17'),
(303,127,'','username','vkarbasizaed'),
(304,128,'','fileId','17'),
(305,128,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(306,128,'','fileStage','10'),
(307,128,'','submissionFileId','17'),
(308,128,'','submissionId','17'),
(309,128,'','username','vkarbasizaed'),
(310,133,'','fileId','18'),
(311,133,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(312,133,'','fileStage','10'),
(313,133,'','submissionFileId','18'),
(314,133,'','submissionId','18'),
(315,133,'','username','vwilliamson'),
(316,134,'','fileId','18'),
(317,134,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(318,134,'','fileStage','10'),
(319,134,'','submissionFileId','18'),
(320,134,'','submissionId','18'),
(321,134,'','username','vwilliamson'),
(322,135,'','fileId','18'),
(323,135,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(324,135,'','fileStage','10'),
(325,135,'','submissionFileId','18'),
(326,135,'','submissionId','18'),
(327,135,'','username','vwilliamson'),
(328,140,'','fileId','19'),
(329,140,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(330,140,'','fileStage','10'),
(331,140,'','submissionFileId','19'),
(332,140,'','submissionId','19'),
(333,140,'','username','zwoods'),
(334,141,'','fileId','19'),
(335,141,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(336,141,'','fileStage','10'),
(337,141,'','submissionFileId','19'),
(338,141,'','submissionId','19'),
(339,141,'','username','zwoods'),
(340,142,'','fileId','19'),
(341,142,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),
(342,142,'','fileStage','10'),
(343,142,'','submissionFileId','19'),
(344,142,'','submissionId','19'),
(345,142,'','username','zwoods');
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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A log of all failed jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES
(1,'database','queue','{\"uuid\":\"836f5da8-ac43-4f19-b97c-22dcd4049d16\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:1;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:18:28'),
(2,'database','queue','{\"uuid\":\"5bc65c10-d7a4-40a2-ba19-209a034fb559\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:2;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:19:07'),
(3,'database','queue','{\"uuid\":\"b47ced58-51bc-4784-b361-5582bbef0325\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:2;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:19:37'),
(4,'database','queue','{\"uuid\":\"83b96279-e39d-4e29-9645-83253e4a5083\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:3;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:19:51'),
(5,'database','queue','{\"uuid\":\"a0cf7626-c4dc-4a89-a70d-eac745fbe69f\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:3;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:20:08'),
(6,'database','queue','{\"uuid\":\"cc4a5159-c3d5-4962-a4d1-25a45a60089e\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:3;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:20:20'),
(7,'database','queue','{\"uuid\":\"3ee9a2d6-bdb6-4a50-8d1f-4f7f9dc7b648\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:4;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:20:34'),
(8,'database','queue','{\"uuid\":\"588957b8-2258-4ba0-852d-3d16b7f1ae58\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:5;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:21:10'),
(9,'database','queue','{\"uuid\":\"5f3960b9-5c02-456e-852e-9bbd8fdaf70b\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:5;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:21:29'),
(10,'database','queue','{\"uuid\":\"547cdd3e-0522-499d-b336-e8e38add7b5e\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:6;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:21:44'),
(11,'database','queue','{\"uuid\":\"aafd2b07-e2d1-4502-a96e-282a0f559467\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:6;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:21:52'),
(12,'database','queue','{\"uuid\":\"0055e5fc-de91-4e70-9875-e4ea3b3b4697\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:7;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:22:08'),
(13,'database','queue','{\"uuid\":\"381b2c78-8f93-448d-9492-31a0649ab1f7\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:7;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:22:15'),
(14,'database','queue','{\"uuid\":\"e389379d-4f4a-4bc5-8dd7-d3ab1b4c1411\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:8;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:22:31'),
(15,'database','queue','{\"uuid\":\"ebbb33a9-4b57-43b9-bde1-3f7bfd86c2ed\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:8;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:22:38'),
(16,'database','queue','{\"uuid\":\"74293746-0789-4299-80a5-f46bbe564449\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:9;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:22:53'),
(17,'database','queue','{\"uuid\":\"80a788e3-2fec-48bb-89d4-c28cad24d223\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:9;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:23:01'),
(18,'database','queue','{\"uuid\":\"cf5989cc-a18f-4872-b4ea-68abe6afb652\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:10;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:23:17'),
(19,'database','queue','{\"uuid\":\"e8bfd73e-a146-45aa-a844-06cdb3aad826\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:10;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:23:24'),
(20,'database','queue','{\"uuid\":\"5b67b4ea-1ceb-48f5-b6df-cd7592c1ce5b\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:11;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:23:39'),
(21,'database','queue','{\"uuid\":\"152ba861-539a-4c2a-bae8-6dd6fb13140c\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:11;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:23:48'),
(22,'database','queue','{\"uuid\":\"f8f71824-39fa-4513-a396-8373026cb02b\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:12;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:24:02'),
(23,'database','queue','{\"uuid\":\"51993261-bcf5-4550-a78d-6d7226caca7a\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:12;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:24:11'),
(24,'database','queue','{\"uuid\":\"4a7529a2-ea3a-4e58-8789-b1db98f75c6a\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:13;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:24:26'),
(25,'database','queue','{\"uuid\":\"79028384-dafe-4a9c-8652-75ada480aba0\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:13;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:24:34'),
(26,'database','queue','{\"uuid\":\"6d69e1d0-469e-4d1b-bc0b-92d1b6b83534\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:14;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:24:50'),
(27,'database','queue','{\"uuid\":\"34d1a22c-6e96-421e-bd89-16bc50f5607f\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:14;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:24:57'),
(28,'database','queue','{\"uuid\":\"c83f5d4d-26c6-41fa-91da-3262f0f6ddc5\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:15;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:25:13'),
(29,'database','queue','{\"uuid\":\"0692b86f-6d01-4a56-bc05-01d22d31ba0e\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:15;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:25:20'),
(30,'database','queue','{\"uuid\":\"ed342c9d-6016-458f-9b09-111ce80632d5\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:16;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:25:36'),
(31,'database','queue','{\"uuid\":\"85a5e7ce-d3a0-41c3-b8af-99c814c6e755\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:16;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:25:43'),
(32,'database','queue','{\"uuid\":\"42369b45-c99e-41e0-8095-75d6d7b8868a\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:17;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:25:59'),
(33,'database','queue','{\"uuid\":\"c16c7811-a81b-4811-add9-f57a70cca15d\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:17;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:26:06'),
(34,'database','queue','{\"uuid\":\"55169eb6-4098-4d30-8ca1-93adbaaa9a68\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:18;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/metadata\\/MetadataChangedJob.php\",\"line\":57,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:26:22'),
(35,'database','queue','{\"uuid\":\"b9f6a4be-0b16-44f6-b33e-b9e63bbbc6fe\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:18;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}','{\"message\":\"PKP\\\\orcid\\\\OrcidManager::getApiType(): Return value must be of type string, null returned\",\"code\":0,\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":363,\"trace\":[{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/OrcidManager.php\",\"line\":211,\"function\":\"getApiType\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/orcid\\/actions\\/PKPSendSubmissionToOrcid.php\",\"line\":40,\"function\":\"isMemberApiEnabled\",\"class\":\"PKP\\\\orcid\\\\OrcidManager\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/classes\\/search\\/PreprintSearchIndex.php\",\"line\":82,\"function\":\"execute\",\"class\":\"PKP\\\\orcid\\\\actions\\\\PKPSendSubmissionToOrcid\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/jobs\\/submissions\\/UpdateSubmissionSearchJob.php\",\"line\":66,\"function\":\"submissionMetadataChanged\",\"class\":\"APP\\\\search\\\\PreprintSearchIndex\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":36,\"function\":\"handle\",\"class\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Util.php\",\"line\":43,\"function\":\"Illuminate\\\\Container\\\\{closure}\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":95,\"function\":\"unwrapIfClosure\",\"class\":\"Illuminate\\\\Container\\\\Util\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/BoundMethod.php\",\"line\":35,\"function\":\"callBoundMethod\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Container\\/Container.php\",\"line\":694,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\BoundMethod\",\"type\":\"::\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":126,\"function\":\"call\",\"class\":\"Illuminate\\\\Container\\\\Container\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Bus\\\\{closure}\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Bus\\/Dispatcher.php\",\"line\":130,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":124,\"function\":\"dispatchNow\",\"class\":\"Illuminate\\\\Bus\\\\Dispatcher\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":144,\"function\":\"Illuminate\\\\Queue\\\\{closure}\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":119,\"function\":\"Illuminate\\\\Pipeline\\\\{closure}\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":123,\"function\":\"then\",\"class\":\"Illuminate\\\\Pipeline\\\\Pipeline\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/CallQueuedHandler.php\",\"line\":71,\"function\":\"dispatchThroughMiddleware\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Jobs\\/Job.php\",\"line\":102,\"function\":\"call\",\"class\":\"Illuminate\\\\Queue\\\\CallQueuedHandler\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":441,\"function\":\"fire\",\"class\":\"Illuminate\\\\Queue\\\\Jobs\\\\Job\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":391,\"function\":\"process\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/lib\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Queue\\/Worker.php\",\"line\":335,\"function\":\"runJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":101,\"function\":\"runNextJob\",\"class\":\"Illuminate\\\\Queue\\\\Worker\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/queue\\/JobRunner.php\",\"line\":220,\"function\":\"runJobInQueue\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"},{\"file\":\"\\/home\\/runner\\/ops\\/lib\\/pkp\\/classes\\/core\\/PKPQueueProvider.php\",\"line\":139,\"function\":\"processJobs\",\"class\":\"PKP\\\\queue\\\\JobRunner\",\"type\":\"->\"},{\"function\":\"PKP\\\\core\\\\{closure}\",\"class\":\"PKP\\\\core\\\\PKPQueueProvider\",\"type\":\"->\"}]}','2025-01-16 05:26:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'contexts/1/submissions/1/678896976ed4e.pdf','application/pdf'),
(2,'contexts/1/submissions/2/678896b974711.pdf','application/pdf'),
(3,'contexts/1/submissions/3/678896eb403dc.pdf','application/pdf'),
(4,'contexts/1/submissions/4/678897164edb8.pdf','application/pdf'),
(5,'contexts/1/submissions/5/67889739ef48d.pdf','application/pdf'),
(6,'contexts/1/submissions/6/6788975bb25d5.pdf','application/pdf'),
(7,'contexts/1/submissions/7/6788977297e22.pdf','application/pdf'),
(8,'contexts/1/submissions/8/6788978a0648e.pdf','application/pdf'),
(9,'contexts/1/submissions/9/678897a0e0e34.pdf','application/pdf'),
(10,'contexts/1/submissions/10/678897b7ee02f.pdf','application/pdf'),
(11,'contexts/1/submissions/11/678897cf02435.pdf','application/pdf'),
(12,'contexts/1/submissions/12/678897e699f08.pdf','application/pdf'),
(13,'contexts/1/submissions/13/678897fdc1ad1.pdf','application/pdf'),
(14,'contexts/1/submissions/14/67889814bf65b.pdf','application/pdf'),
(15,'contexts/1/submissions/15/6788982c14d57.pdf','application/pdf'),
(16,'contexts/1/submissions/16/67889843033a9.pdf','application/pdf'),
(17,'contexts/1/submissions/17/67889859e20d4.pdf','application/pdf'),
(18,'contexts/1/submissions/18/6788987104013.pdf','application/pdf'),
(19,'contexts/1/submissions/19/678898882a33a.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES
(1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),
(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PREPRINT)'),
(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),
(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),
(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),
(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),
(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),
(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),
(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),
(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),
(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),
(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about filters, including localized content.';
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
  `filter_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  KEY `filters_context_id` (`context_id`),
  KEY `filters_parent_filter_id` (`parent_filter_id`),
  CONSTRAINT `filters_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_parent_filter_id_foreign` FOREIGN KEY (`parent_filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES
(1,1,NULL,'Crossref XML preprint export','APP\\plugins\\generic\\crossref\\filter\\PreprintCrossrefXmlFilter',0,NULL,0),
(2,2,NULL,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPreprintAdapter',0,NULL,0),
(3,3,NULL,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\PreprintNativeXmlFilter',0,NULL,0),
(4,4,NULL,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFilter',0,NULL,0),
(5,5,NULL,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,NULL,0),
(6,6,NULL,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,NULL,0),
(7,8,NULL,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFileFilter',0,NULL,0),
(8,7,NULL,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,NULL,0),
(9,9,NULL,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PreprintGalleyNativeXmlFilter',0,NULL,0),
(10,10,NULL,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintGalleyFilter',0,NULL,0),
(11,11,NULL,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,NULL,0),
(12,12,NULL,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,NULL,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES
(1,1,'en','name','Preprint Text','string'),
(2,1,'fr_CA','name','Texte de la prépublication','string'),
(3,2,'en','name','Research Instrument','string'),
(4,2,'fr_CA','name','##default.genres.researchInstrument##','string'),
(5,3,'en','name','Research Materials','string'),
(6,3,'fr_CA','name','##default.genres.researchMaterials##','string'),
(7,4,'en','name','Research Results','string'),
(8,4,'fr_CA','name','##default.genres.researchResults##','string'),
(9,5,'en','name','Transcripts','string'),
(10,5,'fr_CA','name','##default.genres.transcripts##','string'),
(11,6,'en','name','Data Analysis','string'),
(12,6,'fr_CA','name','##default.genres.dataAnalysis##','string'),
(13,7,'en','name','Data Set','string'),
(14,7,'fr_CA','name','##default.genres.dataSet##','string'),
(15,8,'en','name','Source Texts','string'),
(16,8,'fr_CA','name','##default.genres.sourceTexts##','string'),
(17,9,'en','name','Multimedia','string'),
(18,9,'fr_CA','name','Multimédias','string'),
(19,10,'en','name','Image','string'),
(20,10,'fr_CA','name','Image','string'),
(21,11,'en','name','HTML Stylesheet','string'),
(22,11,'fr_CA','name','Feuille de style HTML','string'),
(23,12,'en','name','Other','string'),
(24,12,'fr_CA','name','Autre','string');
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
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `required` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES
(1,1,0,1,1,0,0,1,'SUBMISSION'),
(2,1,1,1,3,0,1,0,'RESEARCHINSTRUMENT'),
(3,1,2,1,3,0,1,0,'RESEARCHMATERIALS'),
(4,1,3,1,3,0,1,0,'RESEARCHRESULTS'),
(5,1,4,1,3,0,1,0,'TRANSCRIPTS'),
(6,1,5,1,3,0,1,0,'DATAANALYSIS'),
(7,1,6,1,3,0,1,0,'DATASET'),
(8,1,7,1,3,0,1,0,'SOURCETEXTS'),
(9,1,8,1,1,1,1,0,'MULTIMEDIA'),
(10,1,9,1,2,1,0,0,'IMAGE'),
(11,1,10,1,1,1,0,0,'STYLE'),
(12,1,11,1,3,0,1,0,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlight_settings`
--

DROP TABLE IF EXISTS `highlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highlight_settings` (
  `highlight_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `highlight_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`highlight_setting_id`),
  UNIQUE KEY `highlight_settings_unique` (`highlight_id`,`locale`,`setting_name`),
  KEY `highlight_settings_highlight_id` (`highlight_id`),
  CONSTRAINT `highlight_settings_highlight_id_foreign` FOREIGN KEY (`highlight_id`) REFERENCES `highlights` (`highlight_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about highlights, including localized properties like title and description.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlight_settings`
--

LOCK TABLES `highlight_settings` WRITE;
/*!40000 ALTER TABLE `highlight_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlight_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highlights` (
  `highlight_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) DEFAULT NULL,
  `sequence` bigint(20) NOT NULL,
  `url` varchar(2047) NOT NULL,
  PRIMARY KEY (`highlight_id`),
  KEY `highlights_context_id` (`context_id`),
  CONSTRAINT `highlights_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Highlights are featured items that can be presented to users, for example on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlights`
--

LOCK TABLES `highlights` WRITE;
/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records IP address ranges and associates them with institutions.';
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
  `institution_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about institutions, including localized properties like names.';
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
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `invitation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_hash` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `inviter_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `status` enum('INITIALIZED','PENDING','ACCEPTED','DECLINED','CANCELLED') NOT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'When present, the email address of the invitation recipient; when null, user_id must be set and the email can be fetched from the users table.',
  `context_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `invitations_user_id` (`user_id`),
  KEY `invitations_inviter_id` (`inviter_id`),
  KEY `invitations_context_id` (`context_id`),
  KEY `invitations_status_context_id_user_id_type_index` (`status`,`context_id`,`user_id`,`type`),
  KEY `invitations_expiry_date_index` (`expiry_date`),
  CONSTRAINT `invitations_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES
(2,'$2y$10$APYNkJf0TDSPJBMqUmx2KuoxnG76Yj2jslWcAawiNGfCZdi6Rf4Nq','userRoleAssignment',NULL,1,'2025-01-19 05:15:54','{\"userOrcid\":null,\"givenName\":{\"en\":\"Ramiro\",\"fr_CA\":\"Ramiro\"},\"familyName\":{\"en\":\"Vaca\",\"fr_CA\":\"Vaca\"},\"affiliation\":{\"en\":\"Universidad Nacional Aut\\u00f3noma de M\\u00e9xico\",\"fr_CA\":\"Mexico\"},\"userCountry\":\"MX\",\"username\":\"rvaca\",\"password\":\"$2y$10$BDpjTw1UNj21dp9RORRKr.OvLhQ\\/6c.x1c\\/O3kf7RMAfHlBEg1K5G\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"rvaca@mailinator.com\",\"inviteStagePayload\":{\"userOrcid\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"rvaca@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','rvaca@mailinator.com',1,'2025-01-16 05:15:53','2025-01-16 05:16:03'),
(4,'$2y$10$sQstVAimMjpLGFFpnJahLeMVQS72DKn7.pxC0c4Qs59vEPYTsGIti','userRoleAssignment',NULL,1,'2025-01-19 05:16:14','{\"userOrcid\":null,\"givenName\":{\"en\":\"Daniel\",\"fr_CA\":\"Daniel\"},\"familyName\":{\"en\":\"Barnes\",\"fr_CA\":\"Barnes\"},\"affiliation\":{\"en\":\"University of Melbourne\",\"fr_CA\":\"Australia\"},\"userCountry\":\"AU\",\"username\":\"dbarnes\",\"password\":\"$2y$10$xL2rppHSYHRfQzvGxojqSu6xHMNiKOH60rTOMk1BjQ1d0v\\/N.jpFu\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbarnes@mailinator.com\",\"inviteStagePayload\":{\"userOrcid\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":2,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"dbarnes@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','dbarnes@mailinator.com',1,'2025-01-16 05:16:13','2025-01-16 05:16:23'),
(6,'$2y$10$9qeOlvBcIdfLyfCUs5RX/emZc0JyKWIGyu9Fsasi00afdsaTXApY.','userRoleAssignment',NULL,1,'2025-01-19 05:16:34','{\"userOrcid\":null,\"givenName\":{\"en\":\"David\",\"fr_CA\":\"David\"},\"familyName\":{\"en\":\"Buskins\",\"fr_CA\":\"Buskins\"},\"affiliation\":{\"en\":\"University of Chicago\",\"fr_CA\":\"United States\"},\"userCountry\":\"US\",\"username\":\"dbuskins\",\"password\":\"$2y$10$omi46ORdyDfcOVGtOmXOEuvUZs8IbN4ZgE0ECm9yFmyZEr6vMNdFe\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"dbuskins@mailinator.com\",\"inviteStagePayload\":{\"userOrcid\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"dbuskins@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','dbuskins@mailinator.com',1,'2025-01-16 05:16:33','2025-01-16 05:16:43'),
(8,'$2y$10$voU.DOd0K1jqUXp0VUtQB.EOSV2/85qOWEV/L1MnVu9hbJCEbf94a','userRoleAssignment',NULL,1,'2025-01-19 05:16:55','{\"userOrcid\":null,\"givenName\":{\"en\":\"Stephanie\",\"fr_CA\":\"Stephanie\"},\"familyName\":{\"en\":\"Berardo\",\"fr_CA\":\"Berardo\"},\"affiliation\":{\"en\":\"University of Toronto\",\"fr_CA\":\"Canada\"},\"userCountry\":\"CA\",\"username\":\"sberardo\",\"password\":\"$2y$10$X8VSrp.qYc3IfxWAT7lJRugijCK6sIgemZa13V9dehmy30nGIlkm6\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"sberardo@mailinator.com\",\"inviteStagePayload\":{\"userOrcid\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"sberardo@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','sberardo@mailinator.com',1,'2025-01-16 05:16:55','2025-01-16 05:17:05'),
(10,'$2y$10$K2fofMgUNiCAoaQdvDvYF.Vu9sQ/ETuxUKYnh99xNeNvS8JVy87HC','userRoleAssignment',NULL,1,'2025-01-19 05:17:18','{\"userOrcid\":null,\"givenName\":{\"en\":\"Minoti\",\"fr_CA\":\"Minoti\"},\"familyName\":{\"en\":\"Inoue\",\"fr_CA\":\"Inoue\"},\"affiliation\":{\"en\":\"Kyoto University\",\"fr_CA\":\"Japan\"},\"userCountry\":\"JP\",\"username\":\"minoue\",\"password\":\"$2y$10$pKknJL0h\\/6l85LPWZwOsPeujfa33GfpgJgnekv74AEyYmOrLxYSx6\",\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":true,\"sendEmailAddress\":\"minoue@mailinator.com\",\"inviteStagePayload\":{\"userOrcid\":null,\"givenName\":null,\"familyName\":null,\"affiliation\":null,\"userCountry\":null,\"username\":null,\"password\":null,\"emailSubject\":null,\"emailBody\":null,\"userGroupsToAdd\":[{\"userGroupId\":3,\"dateStart\":\"2025-01-16\",\"dateEnd\":null,\"masthead\":true}],\"passwordHashed\":null,\"sendEmailAddress\":\"minoue@mailinator.com\",\"inviteStagePayload\":null,\"shouldUseInviteData\":null},\"shouldUseInviteData\":null}','ACCEPTED','minoue@mailinator.com',1,'2025-01-16 05:17:17','2025-01-16 05:17:28');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
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
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All pending or in-progress jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES
(116,'queue','{\"uuid\":\"a7d2c8e4-f9cb-455c-9610-0b2787023583\",\"displayName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":180,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\",\"command\":\"O:46:\\\"PKP\\\\jobs\\\\submissions\\\\UpdateSubmissionSearchJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:19;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}',1,NULL,1737005204,1737005199),
(117,'queue','{\"uuid\":\"7eda1665-0c45-49f7-92d3-b430e645b7ca\",\"displayName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":3,\"failOnTimeout\":true,\"backoff\":\"5\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\",\"command\":\"O:36:\\\"PKP\\\\jobs\\\\metadata\\\\MetadataChangedJob\\\":3:{s:15:\\\"\\u0000*\\u0000submissionId\\\";i:19;s:10:\\\"connection\\\";s:8:\\\"database\\\";s:5:\\\"queue\\\";s:5:\\\"queue\\\";}\"}}',2,NULL,1737005204,1737005199);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about library files, including localized content such as names.';
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
  `public_access` smallint(6) DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
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
  `metrics_context_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Daily statistics for views of the homepage.';
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
  `metrics_counter_submission_daily_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
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
  `metrics_counter_submission_institution_daily_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
  `metrics_counter_submission_institution_monthly_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `month` int(11) NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
  `metrics_counter_submission_monthly_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `month` int(11) NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
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
  `metrics_submission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `file_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Daily statistics for views and downloads of published submissions and galleys.';
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
  `metrics_submission_geo_daily_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `msgd_context_id` (`context_id`),
  KEY `msgd_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and galleys.';
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
  `metrics_submission_geo_monthly_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int(11) NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
  KEY `msgm_context_id` (`context_id`),
  KEY `msgm_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and galleys.';
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
  `navigation_menu_item_assignment_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
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
  `seq` bigint(20) DEFAULT 0,
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  KEY `navigation_menu_item_assignments_parent_id` (`parent_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Links navigation menu items to navigation menus.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES
(1,1,1,NULL,0),
(2,1,2,NULL,1),
(3,1,3,NULL,2),
(4,1,4,3,0),
(5,1,5,3,1),
(6,1,6,3,2),
(7,1,7,3,3),
(8,2,8,NULL,0),
(9,2,9,NULL,1),
(10,2,10,NULL,2),
(11,2,11,10,0),
(12,2,12,10,1),
(13,2,13,10,2),
(14,2,14,10,3),
(15,3,15,NULL,0),
(16,3,16,NULL,1),
(17,3,17,NULL,2),
(18,3,18,17,0),
(19,3,19,17,1),
(20,3,20,17,2),
(21,3,21,17,3),
(22,3,22,17,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about navigation menu items, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES
(1,1,'','titleLocaleKey','navigation.register','string'),
(2,2,'','titleLocaleKey','navigation.login','string'),
(3,3,'','titleLocaleKey','{$loggedInUsername}','string'),
(4,4,'','titleLocaleKey','navigation.dashboard','string'),
(5,5,'','titleLocaleKey','common.viewProfile','string'),
(6,6,'','titleLocaleKey','navigation.admin','string'),
(7,7,'','titleLocaleKey','user.logOut','string'),
(8,8,'','titleLocaleKey','navigation.register','string'),
(9,9,'','titleLocaleKey','navigation.login','string'),
(10,10,'','titleLocaleKey','{$loggedInUsername}','string'),
(11,11,'','titleLocaleKey','navigation.dashboard','string'),
(12,12,'','titleLocaleKey','common.viewProfile','string'),
(13,13,'','titleLocaleKey','navigation.admin','string'),
(14,14,'','titleLocaleKey','user.logOut','string'),
(15,15,'','titleLocaleKey','manager.announcements','string'),
(16,16,'','titleLocaleKey','navigation.archives','string'),
(17,17,'','titleLocaleKey','navigation.about','string'),
(18,18,'','titleLocaleKey','about.aboutContext','string'),
(19,19,'','titleLocaleKey','about.submissions','string'),
(20,20,'','titleLocaleKey','common.editorialMasthead','string'),
(21,21,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(22,22,'','titleLocaleKey','about.contact','string'),
(23,23,'','titleLocaleKey','common.search','string');
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
  `context_id` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`),
  KEY `navigation_menu_items_context_id` (`context_id`),
  CONSTRAINT `navigation_menu_items_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Navigation menu items are single elements within a navigation menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES
(1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),
(2,NULL,NULL,'NMI_TYPE_USER_LOGIN'),
(3,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),
(4,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),
(5,NULL,NULL,'NMI_TYPE_USER_PROFILE'),
(6,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),
(7,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),
(8,1,NULL,'NMI_TYPE_USER_REGISTER'),
(9,1,NULL,'NMI_TYPE_USER_LOGIN'),
(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),
(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),
(12,1,NULL,'NMI_TYPE_USER_PROFILE'),
(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),
(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),
(15,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(16,1,NULL,'NMI_TYPE_ARCHIVES'),
(17,1,NULL,'NMI_TYPE_ABOUT'),
(18,1,NULL,'NMI_TYPE_ABOUT'),
(19,1,NULL,'NMI_TYPE_SUBMISSIONS'),
(20,1,NULL,'NMI_TYPE_MASTHEAD'),
(21,1,NULL,'NMI_TYPE_PRIVACY'),
(22,1,NULL,'NMI_TYPE_CONTACT'),
(23,1,NULL,'NMI_TYPE_SEARCH');
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
  `context_id` bigint(20) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`),
  KEY `navigation_menus_context_id` (`context_id`),
  CONSTRAINT `navigation_menus_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES
(1,NULL,'user','User Navigation Menu'),
(2,1,'user','User Navigation Menu'),
(3,1,'primary','Primary Navigation Menu');
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
  `contents` text DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Notes allow users to annotate associated entities, such as submissions.';
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
  `notification_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(28) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about notifications, including localized properties.';
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
  `context_id` bigint(20) DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context_id`),
  CONSTRAINT `notification_subscription_settings_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES
(1,'blocked_emailed_notification','8',7,1,'int'),
(2,'blocked_emailed_notification','8',8,1,'int'),
(3,'blocked_emailed_notification','8',9,1,'int'),
(4,'blocked_emailed_notification','8',10,1,'int'),
(5,'blocked_emailed_notification','8',11,1,'int'),
(6,'blocked_emailed_notification','8',12,1,'int'),
(7,'blocked_emailed_notification','8',13,1,'int'),
(8,'blocked_emailed_notification','8',14,1,'int'),
(9,'blocked_emailed_notification','8',15,1,'int'),
(10,'blocked_emailed_notification','8',16,1,'int'),
(11,'blocked_emailed_notification','8',17,1,'int'),
(12,'blocked_emailed_notification','8',18,1,'int'),
(13,'blocked_emailed_notification','8',19,1,'int'),
(14,'blocked_emailed_notification','8',20,1,'int'),
(15,'blocked_emailed_notification','8',21,1,'int'),
(16,'blocked_emailed_notification','8',22,1,'int'),
(17,'blocked_emailed_notification','8',23,1,'int'),
(18,'blocked_emailed_notification','8',24,1,'int'),
(19,'blocked_emailed_notification','8',25,1,'int');
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
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES
(5,1,NULL,3,16777222,'2025-01-16 05:18:18',NULL,1048585,1),
(6,1,NULL,3,16777223,'2025-01-16 05:18:18',NULL,1048585,1),
(7,1,4,2,16777217,'2025-01-16 05:18:18',NULL,1048585,1),
(8,1,5,2,16777217,'2025-01-16 05:18:18',NULL,1048585,1),
(9,1,NULL,2,16777243,'2025-01-16 05:18:18',NULL,1048585,1),
(10,1,NULL,2,16777245,'2025-01-16 05:18:18',NULL,1048585,1),
(11,1,NULL,3,16777222,'2025-01-16 05:19:15',NULL,1048585,2),
(12,1,NULL,3,16777223,'2025-01-16 05:19:15',NULL,1048585,2),
(13,1,4,2,16777217,'2025-01-16 05:19:15',NULL,1048585,2),
(14,1,5,2,16777217,'2025-01-16 05:19:15',NULL,1048585,2),
(15,1,NULL,2,16777243,'2025-01-16 05:19:15',NULL,1048585,2),
(16,1,NULL,2,16777245,'2025-01-16 05:19:15',NULL,1048585,2),
(17,1,NULL,3,16777222,'2025-01-16 05:19:42',NULL,1048585,3),
(18,1,NULL,3,16777223,'2025-01-16 05:19:42',NULL,1048585,3),
(19,1,4,2,16777217,'2025-01-16 05:19:42',NULL,1048585,3),
(20,1,5,2,16777217,'2025-01-16 05:19:42',NULL,1048585,3),
(21,1,NULL,2,16777243,'2025-01-16 05:19:42',NULL,1048585,3),
(22,1,NULL,2,16777245,'2025-01-16 05:19:42',NULL,1048585,3),
(23,1,4,3,16777259,'2025-01-16 05:19:58',NULL,1048585,3),
(24,1,5,3,16777259,'2025-01-16 05:19:58',NULL,1048585,3),
(25,1,9,3,16777259,'2025-01-16 05:19:58',NULL,1048585,3),
(26,1,NULL,3,16777222,'2025-01-16 05:20:25',NULL,1048585,4),
(27,1,NULL,3,16777223,'2025-01-16 05:20:25',NULL,1048585,4),
(28,1,4,2,16777217,'2025-01-16 05:20:25',NULL,1048585,4),
(29,1,5,2,16777217,'2025-01-16 05:20:25',NULL,1048585,4),
(30,1,NULL,2,16777243,'2025-01-16 05:20:25',NULL,1048585,4),
(31,1,NULL,2,16777245,'2025-01-16 05:20:25',NULL,1048585,4),
(33,1,10,2,16777234,'2025-01-16 05:20:40',NULL,1048585,4),
(34,1,NULL,3,16777222,'2025-01-16 05:21:00',NULL,1048585,5),
(35,1,NULL,3,16777223,'2025-01-16 05:21:00',NULL,1048585,5),
(36,1,4,2,16777217,'2025-01-16 05:21:00',NULL,1048585,5),
(37,1,5,2,16777217,'2025-01-16 05:21:00',NULL,1048585,5),
(38,1,NULL,2,16777243,'2025-01-16 05:21:01',NULL,1048585,5),
(39,1,NULL,2,16777245,'2025-01-16 05:21:01',NULL,1048585,5),
(40,1,NULL,3,16777222,'2025-01-16 05:21:34',NULL,1048585,6),
(41,1,NULL,3,16777223,'2025-01-16 05:21:34',NULL,1048585,6),
(42,1,4,2,16777217,'2025-01-16 05:21:34',NULL,1048585,6),
(43,1,5,2,16777217,'2025-01-16 05:21:34',NULL,1048585,6),
(44,1,NULL,2,16777243,'2025-01-16 05:21:34',NULL,1048585,6),
(45,1,NULL,2,16777245,'2025-01-16 05:21:34',NULL,1048585,6),
(46,1,NULL,3,16777222,'2025-01-16 05:21:57',NULL,1048585,7),
(47,1,NULL,3,16777223,'2025-01-16 05:21:57',NULL,1048585,7),
(48,1,4,2,16777217,'2025-01-16 05:21:57',NULL,1048585,7),
(49,1,5,2,16777217,'2025-01-16 05:21:57',NULL,1048585,7),
(50,1,NULL,2,16777243,'2025-01-16 05:21:58',NULL,1048585,7),
(51,1,NULL,2,16777245,'2025-01-16 05:21:58',NULL,1048585,7),
(52,1,NULL,3,16777222,'2025-01-16 05:22:20',NULL,1048585,8),
(53,1,NULL,3,16777223,'2025-01-16 05:22:20',NULL,1048585,8),
(54,1,4,2,16777217,'2025-01-16 05:22:20',NULL,1048585,8),
(55,1,5,2,16777217,'2025-01-16 05:22:20',NULL,1048585,8),
(56,1,NULL,2,16777243,'2025-01-16 05:22:21',NULL,1048585,8),
(57,1,NULL,2,16777245,'2025-01-16 05:22:21',NULL,1048585,8),
(58,1,NULL,3,16777222,'2025-01-16 05:22:43',NULL,1048585,9),
(59,1,NULL,3,16777223,'2025-01-16 05:22:43',NULL,1048585,9),
(60,1,4,2,16777217,'2025-01-16 05:22:43',NULL,1048585,9),
(61,1,5,2,16777217,'2025-01-16 05:22:43',NULL,1048585,9),
(62,1,NULL,2,16777243,'2025-01-16 05:22:43',NULL,1048585,9),
(63,1,NULL,2,16777245,'2025-01-16 05:22:43',NULL,1048585,9),
(64,1,NULL,3,16777222,'2025-01-16 05:23:06',NULL,1048585,10),
(65,1,NULL,3,16777223,'2025-01-16 05:23:06',NULL,1048585,10),
(66,1,4,2,16777217,'2025-01-16 05:23:06',NULL,1048585,10),
(67,1,5,2,16777217,'2025-01-16 05:23:06',NULL,1048585,10),
(68,1,NULL,2,16777243,'2025-01-16 05:23:07',NULL,1048585,10),
(69,1,NULL,2,16777245,'2025-01-16 05:23:07',NULL,1048585,10),
(70,1,NULL,3,16777222,'2025-01-16 05:23:30',NULL,1048585,11),
(71,1,NULL,3,16777223,'2025-01-16 05:23:30',NULL,1048585,11),
(72,1,4,2,16777217,'2025-01-16 05:23:30',NULL,1048585,11),
(73,1,5,2,16777217,'2025-01-16 05:23:30',NULL,1048585,11),
(74,1,NULL,2,16777243,'2025-01-16 05:23:30',NULL,1048585,11),
(75,1,NULL,2,16777245,'2025-01-16 05:23:30',NULL,1048585,11),
(76,1,NULL,3,16777222,'2025-01-16 05:23:53',NULL,1048585,12),
(77,1,NULL,3,16777223,'2025-01-16 05:23:53',NULL,1048585,12),
(78,1,4,2,16777217,'2025-01-16 05:23:53',NULL,1048585,12),
(79,1,5,2,16777217,'2025-01-16 05:23:53',NULL,1048585,12),
(80,1,NULL,2,16777243,'2025-01-16 05:23:53',NULL,1048585,12),
(81,1,NULL,2,16777245,'2025-01-16 05:23:53',NULL,1048585,12),
(82,1,NULL,3,16777222,'2025-01-16 05:24:16',NULL,1048585,13),
(83,1,NULL,3,16777223,'2025-01-16 05:24:16',NULL,1048585,13),
(84,1,4,2,16777217,'2025-01-16 05:24:16',NULL,1048585,13),
(85,1,5,2,16777217,'2025-01-16 05:24:16',NULL,1048585,13),
(86,1,NULL,2,16777243,'2025-01-16 05:24:16',NULL,1048585,13),
(87,1,NULL,2,16777245,'2025-01-16 05:24:16',NULL,1048585,13),
(88,1,NULL,3,16777222,'2025-01-16 05:24:39',NULL,1048585,14),
(89,1,NULL,3,16777223,'2025-01-16 05:24:39',NULL,1048585,14),
(90,1,4,2,16777217,'2025-01-16 05:24:39',NULL,1048585,14),
(91,1,5,2,16777217,'2025-01-16 05:24:39',NULL,1048585,14),
(92,1,NULL,2,16777243,'2025-01-16 05:24:39',NULL,1048585,14),
(93,1,NULL,2,16777245,'2025-01-16 05:24:39',NULL,1048585,14),
(94,1,NULL,3,16777222,'2025-01-16 05:25:02',NULL,1048585,15),
(95,1,NULL,3,16777223,'2025-01-16 05:25:02',NULL,1048585,15),
(96,1,4,2,16777217,'2025-01-16 05:25:02',NULL,1048585,15),
(97,1,5,2,16777217,'2025-01-16 05:25:02',NULL,1048585,15),
(98,1,NULL,2,16777243,'2025-01-16 05:25:03',NULL,1048585,15),
(99,1,NULL,2,16777245,'2025-01-16 05:25:03',NULL,1048585,15),
(100,1,NULL,3,16777222,'2025-01-16 05:25:25',NULL,1048585,16),
(101,1,NULL,3,16777223,'2025-01-16 05:25:25',NULL,1048585,16),
(102,1,4,2,16777217,'2025-01-16 05:25:25',NULL,1048585,16),
(103,1,5,2,16777217,'2025-01-16 05:25:25',NULL,1048585,16),
(104,1,NULL,2,16777243,'2025-01-16 05:25:26',NULL,1048585,16),
(105,1,NULL,2,16777245,'2025-01-16 05:25:26',NULL,1048585,16),
(106,1,NULL,3,16777222,'2025-01-16 05:25:48',NULL,1048585,17),
(107,1,NULL,3,16777223,'2025-01-16 05:25:48',NULL,1048585,17),
(108,1,4,2,16777217,'2025-01-16 05:25:48',NULL,1048585,17),
(109,1,5,2,16777217,'2025-01-16 05:25:48',NULL,1048585,17),
(110,1,NULL,2,16777243,'2025-01-16 05:25:48',NULL,1048585,17),
(111,1,NULL,2,16777245,'2025-01-16 05:25:48',NULL,1048585,17),
(112,1,NULL,3,16777222,'2025-01-16 05:26:11',NULL,1048585,18),
(113,1,NULL,3,16777223,'2025-01-16 05:26:11',NULL,1048585,18),
(114,1,4,2,16777217,'2025-01-16 05:26:11',NULL,1048585,18),
(115,1,5,2,16777217,'2025-01-16 05:26:11',NULL,1048585,18),
(116,1,NULL,2,16777243,'2025-01-16 05:26:12',NULL,1048585,18),
(117,1,NULL,2,16777245,'2025-01-16 05:26:12',NULL,1048585,18),
(118,1,NULL,3,16777222,'2025-01-16 05:26:34',NULL,1048585,19),
(119,1,NULL,3,16777223,'2025-01-16 05:26:34',NULL,1048585,19),
(120,1,4,2,16777217,'2025-01-16 05:26:34',NULL,1048585,19),
(121,1,5,2,16777217,'2025-01-16 05:26:34',NULL,1048585,19),
(122,1,NULL,2,16777243,'2025-01-16 05:26:35',NULL,1048585,19),
(123,1,NULL,2,16777245,'2025-01-16 05:26:35',NULL,1048585,19);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
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
  `plugin_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) DEFAULT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_context_id` (`context_id`),
  KEY `plugin_settings_plugin_name` (`plugin_name`),
  CONSTRAINT `plugin_settings_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES
(1,'defaultthemeplugin',NULL,'enabled','1','bool'),
(2,'usageeventplugin',NULL,'enabled','1','bool'),
(3,'tinymceplugin',NULL,'enabled','1','bool'),
(4,'languagetoggleblockplugin',NULL,'enabled','1','bool'),
(5,'languagetoggleblockplugin',NULL,'seq','4','int'),
(6,'developedbyblockplugin',NULL,'enabled','0','bool'),
(7,'developedbyblockplugin',NULL,'seq','0','int'),
(8,'tinymceplugin',1,'enabled','1','bool'),
(9,'defaultthemeplugin',1,'enabled','1','bool'),
(10,'languagetoggleblockplugin',1,'enabled','1','bool'),
(11,'languagetoggleblockplugin',1,'seq','4','int'),
(12,'developedbyblockplugin',1,'enabled','0','bool'),
(13,'developedbyblockplugin',1,'seq','0','int'),
(14,'pdfjsviewerplugin',1,'enabled','1','bool'),
(15,'googlescholarplugin',1,'enabled','1','bool'),
(16,'webfeedplugin',1,'enabled','1','bool'),
(17,'webfeedplugin',1,'displayPage','homepage','string'),
(18,'webfeedplugin',1,'displayItems','1','bool'),
(19,'webfeedplugin',1,'recentItems','30','int'),
(20,'webfeedplugin',1,'includeIdentifiers','0','bool'),
(21,'defaultthemeplugin',1,'typography','notoSans','string'),
(22,'defaultthemeplugin',1,'baseColour','#1E6292','string'),
(23,'defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),
(24,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),
(25,'defaultthemeplugin',1,'displayStats','none','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Associates publications (and thus submissions) with categories.';
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
  `publication_galley_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`publication_galley_setting_id`),
  UNIQUE KEY `publication_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_galley_settings_galley_id_foreign` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about publication galleys, including localized properties such as labels.';
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
  `locale` varchar(28) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Publication galleys are representations of publications in a particular format, such as a PDF file.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES
(1,'en',1,'PDF',1,0,NULL,0,NULL,NULL),
(2,'en',2,'PDF',2,0,NULL,0,NULL,NULL),
(3,'en',3,'PDF',3,0,NULL,0,NULL,NULL),
(4,'en',4,'PDF',3,0,NULL,0,NULL,NULL),
(5,'en',5,'PDF',4,0,NULL,0,NULL,NULL),
(6,'en',6,'PDF',5,0,NULL,0,NULL,NULL),
(7,'en',7,'PDF',6,0,NULL,0,NULL,NULL),
(8,'en',8,'PDF',7,0,NULL,0,NULL,NULL),
(9,'en',9,'PDF',8,0,NULL,0,NULL,NULL),
(10,'en',10,'PDF',9,0,NULL,0,NULL,NULL),
(11,'en',11,'PDF',10,0,NULL,0,NULL,NULL),
(12,'en',12,'PDF',11,0,NULL,0,NULL,NULL),
(13,'en',13,'PDF',12,0,NULL,0,NULL,NULL),
(14,'en',14,'PDF',13,0,NULL,0,NULL,NULL),
(15,'en',15,'PDF',14,0,NULL,0,NULL,NULL),
(16,'en',16,'PDF',15,0,NULL,0,NULL,NULL),
(17,'en',17,'PDF',16,0,NULL,0,NULL,NULL),
(18,'en',18,'PDF',17,0,NULL,0,NULL,NULL),
(19,'en',19,'PDF',18,0,NULL,0,NULL,NULL),
(20,'en',20,'PDF',19,0,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES
(1,1,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),
(2,1,'en','title','The influence of lactation on the quantity and quality of cashmere production'),
(3,2,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),
(4,2,'en','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),
(5,2,'en','copyrightHolder','Public Knowledge Preprint Server'),
(6,2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(7,2,'','copyrightYear','2025'),
(8,3,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),
(9,3,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),
(10,3,'en','copyrightHolder','Public Knowledge Preprint Server'),
(11,3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(12,3,'','copyrightYear','2025'),
(13,4,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),
(14,4,'en','copyrightHolder','Craig Montgomerie'),
(15,4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(16,4,'','copyrightYear','2025'),
(17,4,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),
(18,5,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),
(19,5,'en','title','Genetic transformation of forest trees'),
(20,6,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),
(21,6,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),
(22,6,'en','copyrightHolder','Public Knowledge Preprint Server'),
(23,6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(24,6,'','copyrightYear','2025'),
(25,7,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),
(26,7,'en','title','Developing efficacy beliefs in the classroom'),
(27,7,'en','copyrightHolder','Public Knowledge Preprint Server'),
(28,7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(29,7,'','copyrightYear','2025'),
(30,8,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),
(31,8,'en','title','Developing efficacy beliefs in the classroom'),
(32,8,'en','copyrightHolder','Public Knowledge Preprint Server'),
(33,8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(34,8,'','copyrightYear','2025'),
(35,9,'en','abstract','None.'),
(36,9,'en','title','Hansen & Pinto: Reason Reclaimed'),
(37,9,'en','copyrightHolder','Public Knowledge Preprint Server'),
(38,9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(39,9,'','copyrightYear','2025'),
(40,10,'en','abstract','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.'),
(41,10,'en','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),
(42,10,'en','copyrightHolder','Public Knowledge Preprint Server'),
(43,10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(44,10,'','copyrightYear','2025'),
(45,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),
(46,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),
(47,11,'en','copyrightHolder','Public Knowledge Preprint Server'),
(48,11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(49,11,'','copyrightYear','2025'),
(50,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),
(51,12,'en','title','Learning Sustainable Design through Service'),
(52,12,'en','copyrightHolder','Public Knowledge Preprint Server'),
(53,12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(54,12,'','copyrightYear','2025'),
(55,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),
(56,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),
(57,13,'en','copyrightHolder','Public Knowledge Preprint Server'),
(58,13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(59,13,'','copyrightYear','2025'),
(60,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),
(61,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),
(62,14,'en','copyrightHolder','Public Knowledge Preprint Server'),
(63,14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(64,14,'','copyrightYear','2025'),
(65,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),
(66,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),
(67,15,'en','copyrightHolder','Public Knowledge Preprint Server'),
(68,15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(69,15,'','copyrightYear','2025'),
(70,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),
(71,16,'en','title','Yam diseases and its management in Nigeria'),
(72,16,'en','copyrightHolder','Public Knowledge Preprint Server'),
(73,16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(74,16,'','copyrightYear','2025'),
(75,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),
(76,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),
(77,17,'en','copyrightHolder','Public Knowledge Preprint Server'),
(78,17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(79,17,'','copyrightYear','2025'),
(80,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),
(81,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),
(82,18,'en','copyrightHolder','Public Knowledge Preprint Server'),
(83,18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(84,18,'','copyrightYear','2025'),
(85,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),
(86,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),
(87,19,'en','copyrightHolder','Public Knowledge Preprint Server'),
(88,19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(89,19,'','copyrightYear','2025'),
(90,20,'en','abstract','None.'),
(91,20,'en','title','Finocchiaro: Arguments About Arguments'),
(92,20,'en','copyrightHolder','Public Knowledge Preprint Server'),
(93,20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),
(94,20,'','copyrightYear','2025');
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
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES
(1,0,NULL,'2025-01-16 05:18:05',1,1,1,1,NULL,1,NULL),
(2,0,'2025-01-16','2025-01-16 05:19:23',2,1,2,3,NULL,1,NULL),
(3,0,'2025-01-16','2025-01-16 05:19:55',5,1,3,3,NULL,1,NULL),
(4,0,'2025-01-16','2025-01-16 05:20:06',7,1,3,3,NULL,2,NULL),
(5,0,NULL,'2025-01-16 05:20:12',9,1,4,1,NULL,1,NULL),
(6,0,'2025-01-16','2025-01-16 05:21:15',10,1,5,3,NULL,1,NULL),
(7,0,'2025-01-16','2025-01-16 05:21:38',11,1,6,3,NULL,1,NULL),
(8,0,'2025-01-16','2025-01-16 05:22:02',12,1,7,3,NULL,1,NULL),
(9,0,'2025-01-16','2025-01-16 05:22:25',14,1,8,3,NULL,1,NULL),
(10,0,'2025-01-16','2025-01-16 05:22:48',15,1,9,3,NULL,1,NULL),
(11,0,'2025-01-16','2025-01-16 05:23:11',16,1,10,3,NULL,1,NULL),
(12,0,'2025-01-16','2025-01-16 05:23:34',17,1,11,3,NULL,1,NULL),
(13,0,'2025-01-16','2025-01-16 05:23:57',19,1,12,3,NULL,1,NULL),
(14,0,'2025-01-16','2025-01-16 05:24:20',20,1,13,3,NULL,1,NULL),
(15,0,'2025-01-16','2025-01-16 05:24:43',21,1,14,3,NULL,1,NULL),
(16,0,'2025-01-16','2025-01-16 05:25:07',22,1,15,3,NULL,1,NULL),
(17,0,'2025-01-16','2025-01-16 05:25:29',23,1,16,3,NULL,1,NULL),
(18,0,'2025-01-16','2025-01-16 05:25:53',24,1,17,3,NULL,1,NULL),
(19,0,'2025-01-16','2025-01-16 05:26:16',25,1,18,3,NULL,1,NULL),
(20,0,'2025-01-16','2025-01-16 05:26:39',26,1,19,3,NULL,1,NULL);
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
  `seq` double NOT NULL DEFAULT 0,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
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
  `query_participant_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='The users assigned to a discussion.';
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
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `date_cancelled` datetime DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `considered` smallint(6) DEFAULT NULL,
  `request_resent` smallint(6) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Data about peer review assignments for all submissions.';
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
  `review_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of the submission files made available to each assigned reviewer.';
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
  `review_form_element_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about review form elements, including localized content such as question text.';
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
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Each review form element represents a single question on a review form.';
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
  `review_form_response_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
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
  `review_form_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about review forms, including localized content such as names.';
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
  `seq` double DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
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
  `review_round_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
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
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_settings` (
  `section_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`section_setting_id`),
  UNIQUE KEY `section_settings_unique` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`),
  CONSTRAINT `section_settings_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about sections, including localized properties such as section titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES
(1,1,'en','title','Preprints'),
(2,1,'en','abbrev','PRE'),
(3,1,'','path','preprints'),
(4,1,'en','policy','<p>Section default policy</p>'),
(5,1,'fr_CA','title',''),
(6,1,'fr_CA','abbrev',''),
(7,1,'en','description',''),
(8,1,'fr_CA','description',''),
(9,1,'en','identifyType',''),
(10,1,'fr_CA','identifyType',''),
(11,1,'fr_CA','policy','');
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
  `seq` double NOT NULL DEFAULT 0,
  `editor_restricted` tinyint(4) NOT NULL DEFAULT 0,
  `meta_indexed` tinyint(4) NOT NULL DEFAULT 0,
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT 1,
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT 0,
  `hide_title` tinyint(4) NOT NULL DEFAULT 0,
  `hide_author` tinyint(4) NOT NULL DEFAULT 0,
  `is_inactive` tinyint(4) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_server_id` (`server_id`),
  KEY `sections_review_form_id` (`review_form_id`),
  CONSTRAINT `sections_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL,
  CONSTRAINT `sections_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Submissions can be organized into sections, which determine the front-end presentation and provide options for selective harvesting in the OAI-PMH interface.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES
(1,1,NULL,0,0,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_settings`
--

DROP TABLE IF EXISTS `server_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_settings` (
  `server_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`server_setting_id`),
  UNIQUE KEY `server_settings_unique` (`server_id`,`locale`,`setting_name`),
  KEY `server_settings_server_id` (`server_id`),
  CONSTRAINT `server_settings_server_id` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about server settings, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES
(1,1,'en','acronym','JPKPKP'),
(3,1,'en','authorGuidelines','<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p> When you\'re satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>'),
(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##'),
(5,1,'en','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.'),
(6,1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##'),
(7,1,'en','beginSubmissionHelp','<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),
(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Public Knowledge Preprint Server. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),
(9,1,'','contactEmail','rvaca@mailinator.com'),
(10,1,'','contactName','Ramiro Vaca'),
(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>'),
(12,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),
(13,1,'','country','IS'),
(14,1,'','defaultReviewMode','2'),
(15,1,'en','description','<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>'),
(16,1,'fr_CA','description','<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>'),
(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),
(18,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),
(19,1,'','copySubmissionAckPrimaryContact','0'),
(20,1,'','copySubmissionAckAddress',''),
(21,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),
(22,1,'','enableDois','1'),
(23,1,'','doiSuffixType','default'),
(24,1,'','registrationAgency',''),
(25,1,'','disableSubmissions','0'),
(26,1,'','editorialStatsEmail','1'),
(27,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>'),
(28,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),
(29,1,'','itemsPerPage','25'),
(30,1,'','keywords','request'),
(31,1,'en','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"https://pkp.sfu.ca\">Public Knowledge Project</a>).'),
(32,1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##'),
(33,1,'en','name','Public Knowledge Preprint Server'),
(34,1,'fr_CA','name','Serveur de prépublication de la connaissance du public'),
(35,1,'','notifyAllAuthors','1'),
(36,1,'','numPageLinks','10'),
(37,1,'','numWeeksPerResponse','4'),
(38,1,'','numWeeksPerReview','4'),
(39,1,'','numReviewersPerSubmission','0'),
(40,1,'en','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),
(41,1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##'),
(42,1,'','orcidCity',''),
(43,1,'','orcidClientId',''),
(44,1,'','orcidClientSecret',''),
(45,1,'','orcidEnabled','0'),
(46,1,'','orcidLogLevel','ERROR'),
(47,1,'','orcidSendMailToAuthorsOnPublication','0'),
(48,1,'en','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>'),
(49,1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##'),
(50,1,'en','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.'),
(51,1,'fr_CA','readerInformation','##default.contextSettings.forReaders##'),
(52,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>'),
(53,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),
(54,1,'','submissionAcknowledgement','allAuthors'),
(55,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>'),
(56,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),
(57,1,'','submitWithCategories','0'),
(58,1,'','supportedAddedSubmissionLocales','[\"en\",\"fr_CA\"]'),
(59,1,'','supportedDefaultSubmissionLocale','en'),
(60,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),
(61,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),
(62,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),
(63,1,'','supportedSubmissionMetadataLocales','[\"en\",\"fr_CA\"]'),
(64,1,'','themePluginPath','default'),
(65,1,'en','uploadFilesHelp','<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>'),
(66,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),
(67,1,'','enableGeoUsageStats','disabled'),
(68,1,'','enableInstitutionUsageStats','0'),
(69,1,'','isSushiApiPublic','1'),
(72,1,'','enableAuthorScreening','0'),
(73,1,'','enabledDoiTypes','[\"publication\"]'),
(74,1,'','postedAcknowledgement','1'),
(75,1,'','enableOai','1'),
(76,1,'','doiVersioning','1'),
(77,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),
(78,1,'en','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.'),
(79,1,'en','abbreviation','publicknowledgePub Know Pre'),
(80,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),
(81,1,'','supportEmail','rvaca@mailinator.com'),
(82,1,'','supportName','Ramiro Vaca');
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
  `seq` double NOT NULL DEFAULT 0 COMMENT 'Used to order lists of servers',
  `primary_locale` varchar(28) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the server is considered "live" and will appear on the website. (Note that disabled servers may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `servers_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of preprint servers managed by the installation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES
(1,'publicknowledge',1,'en',1);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `last_activity` int(11) NOT NULL,
  `payload` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('0Q9khR6mgywVWOosLSEcxh25Vs2lMYoSFhv0X9e6',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004512,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVXNKU3N0REY1MGhmdHhyQzdvSGpYZHN1MFFwWlB4YTAxMEJWbkpXQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFo4Q1Q0MHhvM2V6Z3FGeDY1RTRGcWVoZnpxeEdpUTM3LnFPN3JvdFdyVHg4MnJTMFBQSEllIjt9'),
('4Vt07i9KEG6fXniS22cR22ElCmxZSN8cAxkwGwzK',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005199,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoib0FzN2tIbHlLd3M5RGNpYVZOcTJkbzZMQkRkSzNUT3VZSkcwQ1BFSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRnNGtwcldqVkt6SnJaZS5zTXFELi51Q3Iwek1LTjNMUGFDOTVMNzM4cjkwZWxNajdFbWVuUyI7fQ=='),
('6FmGeVaM25D2uq5Conj5LjF6k3aagslPmSaJsKYW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005195,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid2hJbkR1QkI0elBFU1NHWDYzTEN0bWhCV1NnVlp5ODFBUlJRWGFaWCI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('7JYnp6IOZAlE2cKz67AlY7IC0Q1ju9VS0y1rGHvB',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004872,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYUJCRmpYb3Q0anRsYTRkZ09pY1BSVHdVYkdMRzFJTm13WloxMVN6WCI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('8Y7uM09rDpNqwvhh0W0ClF8WswqX0p342sMGsFgE',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004604,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkZRZmQzc1pnUEhTekNrbzZiVXl2WGxvZUY2NlVKanRsbjBKRVFpMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('AA4g7EO2LOzB7RZtBLyfXgTrAni6S4lyjasLN5Ju',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004895,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNllpOEFUcG92bmNhZXRXa09BU05PUDRIMUU2WmQwaGR4Q240WWlCcSI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('Ad27WFFnFEp5fUTTpLDmcu27KYRrqZdygaZmwS7L',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004556,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic1lWbzVNZWNHZHVBM0Vka2M5Q0xKOGVUUTUzWHJCREJCNmx3SlVPVyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('aGJnVUMSpecfqlJCGdnDV9AZtaNfyPu1jrAdcSJ2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004872,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOTV5OW9MeEhrdmtyTVZsMjZzd29yOXB4VElybFVOSFFDWDV2bDFiUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('B4oRDvLpE2S0PgmRouEOZe8pdJFlU4HbADjDDEoV',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004825,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiYkxEM2lPckl3NzB1NnZWanlOWUNNcElqZGtYVUFVTUxPOEFuYnRxWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjEwO3M6NjoidXNlcklkIjtpOjEwO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRPQjBWbXkyRW13UFJ1SFVZUFNQOWYuS2dqaGFyckp3VFV6eVowN3VKS0VlbkJ5eGs0NkdZbSI7fQ=='),
('bFIWxEOUHgsNGeZ5bUAcs5Ico1kdKCVNWsWrbauf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005130,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV1dtOUxzZTRtTUJ1cjNKUk5PRnFPbEx2dEpzUVBCZk43a3hHd216MCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRrMUdnNmlKTExDYlo3Y25NNFladVdPLnRvU254aFNXRW1nNElOZHZqN25oLkxHWWNwRUVaQyI7fQ=='),
('BRB4hZGLMJ1IKP5JLyLE6O4VBcVFkpXFC1aUJILU',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004922,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieGFBVmFhWWhaR1l1M3BocDR6VDZRSG5lejhHTFEyclVnYjJRYmJvNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ0MDBiTWtUWUsydmJYaHV3TXI1UmNlcDhVaWJiNk1PV0U2SUtxQm9jOXQ5NG8vakE3S0kySyI7fQ=='),
('C1qaYoiqwBR6ocVM2vrHHSBVUqTZRfjryPgnDYiM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004617,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU1dPRGRqWkRlaGx0R2x6YnlFWUhYdll6R2tyS3VJMDh1WDlqQWl2TyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('CJI3tIoaZLru2nRYmwZWE8OI2vE6pTVGRXyZmiCk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004842,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQ1pqTEZrMGFpU1NlUHlyQTZlTUxlcWdNQU9nUm1QSDc0dTlTQ3dPYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRxbkN1NVpPQjI4VG1JaEF3Tk5yZTB1VGtSNEhIUmNqZjJBejlwU21xaFYyZWZlcDlMYzdsUyI7fQ=='),
('D9qzqmfkMi8LQvheUXtiQzyjLdPk43CdeDEWnvYV',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004525,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZWUwM2N2YktUeFEwbkY4d2tKazdPek5Cd3FSSWh0d2VaVXB6THV4TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEZMLy9oSTUxUjcubzltbVBzQ0FCYi4xc3RHU1ZDYkE2Wk55eHJwTTBIRk1ocm5qbDMxWG5XIjt9'),
('DfIBJASgZlILXEfSGC5TmCT8DDBdsANhrt8UfrkK',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005057,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN0RBck05SDBJeTFDZEJhb2VkUHk4YmZNVWU5TldVRHdIY1A0YXhVRCI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('DpXg33JRc9IQhOObR8nOzNmCplDYKmhddLV4EGfC',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004787,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWUFLdzFjcVRkaGhqVXZwM1oxVXByZVB3aE1LN2pkT1ZNWVlCRVhVbyI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('E6SMm3v3UK3kD5OhSguXR0IGz8z2Coat8lK3LAK9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005149,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieTB6bVZKTjJHa3U2Y05UTGxYa0Y1b3ZyVWh1QXpsbjJXM1JiaUdOcyI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('eMCNn8LE7GCOALLHzmKgp8x2g08S8gFRb3fBaymw',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004596,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidXJheXlBQWVYd2FJcWxBVHF5U3Rsc01jTjlvbE12Y1lHRGs5V0tKSyI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('exVnfi3C0ZGHAu0fOk2NJc6vISUSzSvx6wLc2N5n',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004679,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUFJUWWw4ejBCcVVucllHYXNMM2hlN0FoWlMxT3BRNHZsdUVOYU1NZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDFGZjBjamZWSnJ4VXB0WVp4RVVmUnV5RHdCL1k4S0k0VEZyVmlMODUwTVlmVUFKZTNCd21LIjt9'),
('gwOdyomFzca6tiLlQIa1hBY3mXcf1Wtpns91lOdQ',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005014,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZFlueUtlQ0xoOVRBS3NjOUdjTHRXSll5V3dFUThQdFI2Mko3M0FpYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRFbVloRGRBSXFLZmR4bHBRZTd5QUNPSC8uV01KMVVzQUJsWWgvUmpkL0h1UXAvbUouS1dGMiI7fQ=='),
('GX1m5nVUsUB1tjUma2FiM4k1Lg8eqxZnrYPwQU6t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004763,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaVVuZ1JLdkZBcmlsRjY2Y21rY0NIWjBhUlE0cktDZXA5aVVPdzNLaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRHcFZ3OFhsbDFISTJpODRSaXB2OU51STJaSllJbjUyQ3VyTnpiZ3BKMHRKTU5UWWMzMW9ydSI7fQ=='),
('hFpFjAEaZSkRS3NYGDXj9uFVxiTjM7dnIOxYtsWz',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004865,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMms0M093a3pQMTdGWXRHMzZXTjJIN2RTU2tyc0xoQUI3UVpuaDFZUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRBSjNjYkhKS2VhTFRpQzRMVUlaUVBPRVdId0F3a05EVVRKQ1JuLmJudHZ1Ym13cXlZdXEyVyI7fQ=='),
('HhNZf0dODRvQSnEq8yeXBtj0AaTmpBumXypSnBEb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005107,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTWpTaVlra3BSRkhvOVZoZkVwc21Td0I1cWlMZllUTVZwRUNTYW1DbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRpdzRMRlo3RDBodzBjTDFuWjA4blVldlZnQlY3V05SbGpvMTQ1Mkx5U2N1N1hGaElOQzlYYSI7fQ=='),
('HsL1uJWmnIoplncWsTH9W5iaPJjnB7Nw3Lf4g8uR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005034,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNTBVWlZNM1k2SmxpSDJLbG54Nlk5NExWc2ZxUmhiSHZxV3RTb2xuTiI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('Iex1HVB64jgmH5ztw6RmwGVF9vaM4TZ5sbKYy1Ul',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005176,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiR0VvYjlVNlVYcVpPRzJ3a0poSlZ1eG1BdHNTYmxGa3hWNG1DR0NPUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRnSnZzNFhUYXdvQkNweUxDOG9mc1UuMVlOMTZ2WTJKWVdWSHNWbHhLVFNDenM3b2VNUWhleSI7fQ=='),
('jEyEOMXxyxtk0J8KwyOSyhoLwFbk3tbis8xLWwvf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004626,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVRqaGJER1ViUEpvMkVDT1hBcEdxOVNZV3B3N1MzbXFETlNwRzlZZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('JMaEnzK8QGL3UgxSasZKUo4bSs86L7ha5IydhUPT',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004640,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDhCVFU2d2F2ZHY4VDBQZnZyQ2p5Rk5hUFc5ZDBDZnZJQ08zWW8ybCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('K9jzQYJlEOwrvOw6bhAHgwUoaUi6SNmTQbMfquJb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004532,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoia2RXSGVSSU9HbXRrRGtKbmJPZlJreVhvTFRlOXFoazlsY3FlaGtnOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJE9NLzZpOEFYQTlUNkxyNi5CZlFOTmVkaGgzWUxIVkVWQ2V4eWJ6c0NteURXZ0h0TkZYRzZhIjt9'),
('KiAeI5mOFdx95ko04nci7jovzRcDZKTME8GwhjFs',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004899,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUGFndEFtZkV2Tlk0NXJUYVlhbnhWVG9DakZQYm5WN3JrSnNEQnlIayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvZjllRUU2eXBtM1Z6SVZQT1hBcEpPY2VSa3JJTjU1ZVNzc2lJMzRWUmZVRmVPQ1I4MVRzVyI7fQ=='),
('KxEVcXcFmVu4yIqxVEZI1YF5w1Ib4oPU0ob5ZwzH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004649,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGxzdUd1NDNmSVVXRVlaZjNDWkZ0d1ltTjBrWUhraFBlSmU0ajNqbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('L875h7QOQmjAO9m9NE1WmwfoejfaDL5L9OkFpKmD',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004493,'YToyOntzOjY6Il90b2tlbiI7czo0MDoidHpjMGV2bVlFd2FzZjFqN3daeW5KVHB2UFp4aXJiZzkyMDhRNk9YWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('LbC0BWH0eTB5gKmfPFXP8SJM115gbgPdURiHIZVW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004563,'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGxFZHNlZmRCWDBVcDhkQktjZVc3aUNFUGZWZHF3N0lhdUR5MUNTaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('Mar2PoyHKPLZIglEuZgcaaR7aSzTErvC776PtFL1',8,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004759,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiTW41UXNlV2V2VEs4NnJIWHRCNUxOaW9SRFlpM21UNFFIRVlTajhlQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJja3dhbnRlcyI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6ODtzOjY6InVzZXJJZCI7aTo4O3M6NToiZW1haWwiO3M6MjM6ImNrd2FudGVzQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEJJQUhPRFA5Lno2c1owLjRJL0NKRXVaWEFjZjdTalozUE5PTlBvRTRHaEdWdEdHQk8xbzNLIjt9'),
('mYXzrhv5csrpc9gHtBLcRanf8CduPpTnvrV8QXWD',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005103,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUkEzR0hHZllQYU9FNDV2VEJpUWZkN3FjM1pRV1dmcU5XQjFoclVMSSI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('OaWtr82oOAwk7ZbBldbPEtxVxsUJFPLwiW3M8QCZ',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004806,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoieEFFNVA2SDRCZlFaQ3lSVTVnVHlFalZqc1BidjluY0k1OFhXeVR1UCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRtQ0dxOUlONW9EcXloVUNPOWVqcTAucWx0T0EyTW1DRVFvcUNXMFFjcHdIOWNkSExJZHhvSyI7fQ=='),
('ocIRyAdwTaNme9mkKoTAIAGdBIAmQPG3VXhWTms7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005153,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYTNBdjhRZnYxSVhTZ3hUWWJVY3pNa1l3RXh5d0xObWFSOUVBOUd0TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQua21jRDVxNERGTFQwRkppSjVnSHp1VkxFbGlZb1NmYXNJcW5aVE1MN1AuZnBpT3d0R1Y4eSI7fQ=='),
('oEKwFQ3Tq2BaIAg5dKZTV5LSumOFfykoGJHvjUGo',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004698,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNHBweGo0SmZGeEhlT3E2dGFDOEU4T3NYaVE2aWwza25OWUI3eEJpbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJjY29yaW5vIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTo3O3M6NjoidXNlcklkIjtpOjc7czo1OiJlbWFpbCI7czoyMjoiY2Nvcmlub0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRFRkVjd21qMVVGLlJLam9YenRtdXZ1SmhvR3NNUlZhYlpXOG0uVUpHanphMjU4YjlzRTRXcSI7fQ=='),
('oOrHyhnG4H8xXFa4yJdf31DpkXzuRwpf6d3c2FT5',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004658,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZDdwRU5nQWpIN1dPOHNPdTh4MG5sMW9pdlhXSE1XZ0ZRNTlMNllyWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHhweUNvNUx4UjVTZzZGSlZpWE5wNC5yZ0x1dklxUTJ4M0g1eEs4ejdRdXg4eEZRcW9CUWRTIjt9'),
('oRCRWbDPXGxjR4jxcQbl9H0Q6zZTfVzfX5OvwZuf',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004538,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRXY4emNSZHZNZHNxTkFFd2JEeTNrTnlmWlUxV1RZeFplaG1jaHY1dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDZ0SGxLb0dxMXhRUWZqWi9RNlZmZnVXbW9WU09SdUlDd295d0M5UGplTEZ6NWt2MzJ1bmVTIjt9'),
('PpnxejQ1ZUiq7T5pHnSAI73c0WPFuAypOG7MRa0r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005172,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidEVMTDRreG9VcGczdXpRaDdpTEJsd0hEMVVGeW1FZExzTUpndzE0UCI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('QEsAAYXGBIK466DaTRVDkjNpZbH7n4iQMBN6mFf5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004964,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY0FRQ2pPTExDajJlaXkwN3NVb1JHOURsZlVVRjc2QVdHRUtFYWRSciI7czo4OiJ1c2VybmFtZSI7czoxMDoiam13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiam13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('r1nld9OPtXNymGHwwmEuliHLBcWKBSe9bDv6v7Qf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004861,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSUxLT2dHZFVsRnR3YXBXSWpmTE5NdUVnWWpmempyZExUQzJURk5lMCI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('rR7xd3Qzipe7nM6WF8MWv2NH7cfD0wl9a3HvY0wG',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004583,'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGZqS01tODFjNFdBMkY0ZkREN1VHajcxWmVPbGZIR21PRVVTNXlncCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('SYVofHhDmeesb4dnr5R3Lclkrs9AeKZvLu96pXPI',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004876,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibVVKd1ZPSzJvNWJJZzE0cWtJQ01IOTRPQk5UeFVPYVZ3c0VtM0c0eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRYeUJxb0F3TDdzYkdqdFdsTjJRNDh1WC5RQnIvQkNlLkZZT0lkSVlCZm83TU8uUFBEclNKSyI7fQ=='),
('TzJU1CX1RVfjj3PwGOQmX2hCjLD6vFZmwEJI7bD4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004576,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiODRlMGFkdU1JcTFWcERDVlBUblBqZ2tYSk5LT3dYWm5KemRETjNIbCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),
('VMG9T5WJWebMbwbhIuZTRYL6h8tq3KPeTveVwyRJ',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004991,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaGt6UnoxUUJycGp4cHNUcUVDb0R0WXJSaUFwZTBXRHJaa1d6ZnIzUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR2bkZia0ZIZHlWR3c1bGM0QmlGcUguOVgxckZkR01VUVY0bFhldTBWc21jQ1BmaDd2OUVzVyI7fQ=='),
('VMMWEXf5P4bzNsmOMUkJFfm1PraF6KuMSUn4loHH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004493,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTUlkdFFvNTk1cGw5SmR5dkU4RVZHTFpWNXFqSWFVcnRVWjhPSVlHcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('vPTzh0hgdsPj5HheSCZo7ID5IhWGjzxB1qgzsYbv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004918,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZG0wUHh6eVNHWXBVdXVNRTdFRXZIWWI3VnlOaFQwN1JSMWpROHdtcyI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('W6f2CdoudM7wHYY5oeFli2qtBIiAiF5dU1VsXLGm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005126,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVlRtYm84a2RibEdMeEV0OTVUaTFXQ0RrblBWRG5wRGtFODdUelQ1ciI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('wFUIdrK5Rk8vl5aT7VkRYwk6bocS1bPwAsIUn5Gq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004941,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibU9JWXpMcmNaNml3TEpCaUJWMDZnZkpQVnJ0bzNTZGZnWEZhUG4zSCI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('wJfFLYmICkxLEP8wfRUdSED7SanN67nbApSsgMv3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004987,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWUpzbHU4TXVDTjc4TGg0eHNDVHVUbjdWU0VCZU9OUEM0ZWlYRERncSI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('wvxddOpG5qrqGumkNsTi8AJLTL0uqHPNZPrnGQlz',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004650,'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWVpcTBvRHlPc1BqZ3MwSEhBZ0xYNktzT1NWbW5RaHFLNzR1UjZ5YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),
('WWgKMkK3poPQMe7aG5GIQECxuDpBloM1HRu8c6ir',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004968,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidUgxUEpidGQ0OExkbGFHeDlXcWpCRlJGYUw4U1NLTHh3UjRISnVIbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRaUHlEWnVKWFhwaWx1M1ZudHcxdUdlUlBEWmU5TGJwLjVEOHZZZ2NISm1QQi5kbXBnQ09oaSI7fQ=='),
('WZsVj6LFo3BjIK4WgRdISPfHWq7LOVOSs1ll0fba',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005061,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiQXh4UHVWN3FRUHQ5S2VJZUZGdjNITTBIb2ZhNDRSYmRKU00zbUFmYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRtZW5PMTR4TW40OTRPRUVsUjFoTFJlaXdjTVVzTW0uOWo3WHEucHBUTU1vczJUVXdKV0ZPMiI7fQ=='),
('X1QIe24ALRijKi2X4vH1Vzg6h9ipzULYKF1uhJP4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005084,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiM3lsZlpnTjZsbjdoRjJLemVEcmRRMGRwdEVvQzF1a1ZnS2xSbzVucSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ1eEsvZ05xWVdjbmxCZnJRUTV4RjlPRUJXWDlERWl5Qk1Dbzl3Y2xjcGd0NTdxOVp4NlBycSI7fQ=='),
('XI1yX9GjpAsee47B5ITxafIXKfMD5mkhQmRSJJ7D',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004945,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUDlJd2lZOGk4RU1mSGNoaHlRbXFHM3pFbjBwNlFOaGJhNmN0QkM1TSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxcEJ2QngwblZqZGRVRVI2cFZWUEllb3A3bU40SHRPaDFoZ2poWEVpY0I4enhQakhWS2JXTyI7fQ=='),
('xpuUZMhLwpawkfICFLTHOruDmS6kEXzzIpmjEhoU',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005010,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaTI5YmJLVHhLR3hoUzZPY2FCd05sSGk2Sjg5b1Jzb0lvMWpRdW9tTiI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),
('XsuYKkToQH8GvWQPNqnsQI46Q1Kj8nc30jZJ8bvp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005080,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN3hSZjVKTjhRbFZyRzFDZENRTHRheUZGZm1XdHBORWR4eU00TGs2MiI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),
('YTVCXyFu37Pf76GMq9k5eEb0eqjEYqhu2QkuYRRh',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737005038,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoib3JMaFVwT1pqWnpKTFhOTDZxZmtsQTZqdVhFaDduWnFTY0pBaGdIOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRnVUgyYzVieGJLNmxsSzRUakJaT2IuY0h2UjZHZFV0R1NMdWpTMWRHL2wuLjBLaDl2aXpRVyI7fQ=='),
('ZerdLNHmqY6Y4UafMKCOb0edGR9YULrBE7uV1Xxj',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.0.0 Safari/537.36',1737004782,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN0J6SFJNbTlnbU5lblRhQUNaR2dkc2xYREN6anEzaktXbkFJRkdkVCI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `site_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `redirect_context_id` bigint(20) DEFAULT NULL COMMENT 'If not null, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(28) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_context_id` (`redirect_context_id`),
  CONSTRAINT `site_redirect_context_id_foreign` FOREIGN KEY (`redirect_context_id`) REFERENCES `servers` (`server_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES
(1,NULL,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES
(1,'contactEmail','en','pkpadmin@mailinator.com'),
(2,'contactName','en','Open Preprint Systems'),
(3,'contactName','fr_CA','Open Preprint Systems'),
(4,'compressStatsLogs','','0'),
(5,'enableGeoUsageStats','','disabled'),
(6,'enableInstitutionUsageStats','','0'),
(7,'keepDailyUsageStats','','0'),
(8,'isSiteSushiPlatform','','0'),
(9,'isSushiApiPublic','','1'),
(10,'disableSharedReviewerStatistics','','0'),
(11,'orcidClientId','',''),
(12,'orcidClientSecret','',''),
(13,'orcidEnabled','','0'),
(14,'themePluginPath','','default'),
(15,'uniqueSiteId','','AC395690-FD1E-41F0-A891-8702AFA622D9');
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
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES
(1,1,4,7,'2025-01-16 05:18:05',0,1),
(2,1,3,4,'2025-01-16 05:18:18',0,1),
(3,1,3,5,'2025-01-16 05:18:18',0,1),
(4,2,4,8,'2025-01-16 05:18:26',0,1),
(5,2,3,4,'2025-01-16 05:19:15',0,1),
(6,2,3,5,'2025-01-16 05:19:15',0,1),
(7,3,4,9,'2025-01-16 05:19:29',0,1),
(8,3,3,4,'2025-01-16 05:19:42',0,1),
(9,3,3,5,'2025-01-16 05:19:42',0,1),
(10,4,4,10,'2025-01-16 05:20:12',0,1),
(11,4,3,4,'2025-01-16 05:20:25',0,1),
(12,4,3,5,'2025-01-16 05:20:25',0,1),
(13,5,4,11,'2025-01-16 05:20:48',0,1),
(14,5,3,4,'2025-01-16 05:21:00',0,1),
(15,5,3,5,'2025-01-16 05:21:00',0,1),
(16,6,4,12,'2025-01-16 05:21:21',0,1),
(17,6,3,4,'2025-01-16 05:21:34',0,1),
(18,6,3,5,'2025-01-16 05:21:34',0,1),
(19,7,4,13,'2025-01-16 05:21:44',0,1),
(20,7,3,4,'2025-01-16 05:21:57',0,1),
(21,7,3,5,'2025-01-16 05:21:57',0,1),
(22,8,4,14,'2025-01-16 05:22:08',0,1),
(23,8,3,4,'2025-01-16 05:22:20',0,1),
(24,8,3,5,'2025-01-16 05:22:20',0,1),
(25,9,4,15,'2025-01-16 05:22:31',0,1),
(26,9,3,4,'2025-01-16 05:22:43',0,1),
(27,9,3,5,'2025-01-16 05:22:43',0,1),
(28,10,4,16,'2025-01-16 05:22:54',0,1),
(29,10,3,4,'2025-01-16 05:23:06',0,1),
(30,10,3,5,'2025-01-16 05:23:06',0,1),
(31,11,4,17,'2025-01-16 05:23:17',0,1),
(32,11,3,4,'2025-01-16 05:23:30',0,1),
(33,11,3,5,'2025-01-16 05:23:30',0,1),
(34,12,4,18,'2025-01-16 05:23:40',0,1),
(35,12,3,4,'2025-01-16 05:23:53',0,1),
(36,12,3,5,'2025-01-16 05:23:53',0,1),
(37,13,4,19,'2025-01-16 05:24:03',0,1),
(38,13,3,4,'2025-01-16 05:24:16',0,1),
(39,13,3,5,'2025-01-16 05:24:16',0,1),
(40,14,4,20,'2025-01-16 05:24:26',0,1),
(41,14,3,4,'2025-01-16 05:24:39',0,1),
(42,14,3,5,'2025-01-16 05:24:39',0,1),
(43,15,4,21,'2025-01-16 05:24:50',0,1),
(44,15,3,4,'2025-01-16 05:25:02',0,1),
(45,15,3,5,'2025-01-16 05:25:02',0,1),
(46,16,4,22,'2025-01-16 05:25:13',0,1),
(47,16,3,4,'2025-01-16 05:25:25',0,1),
(48,16,3,5,'2025-01-16 05:25:25',0,1),
(49,17,4,23,'2025-01-16 05:25:36',0,1),
(50,17,3,4,'2025-01-16 05:25:48',0,1),
(51,17,3,5,'2025-01-16 05:25:48',0,1),
(52,18,4,24,'2025-01-16 05:25:59',0,1),
(53,18,3,4,'2025-01-16 05:26:11',0,1),
(54,18,3,5,'2025-01-16 05:26:11',0,1),
(55,19,4,25,'2025-01-16 05:26:22',0,1),
(56,19,3,4,'2025-01-16 05:26:34',0,1),
(57,19,3,5,'2025-01-16 05:26:34',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES
(1,1,1,530,4,3),
(2,1,1,530,5,3);
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
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Comments on a submission, e.g. peer review comments';
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES
(1,1,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf'),
(2,1,'fr_CA','name',''),
(3,2,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),
(4,2,'fr_CA','name',''),
(5,3,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),
(6,3,'fr_CA','name',''),
(7,4,'en','name','Genetic transformation of forest trees.pdf'),
(8,4,'fr_CA','name',''),
(9,5,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),
(10,5,'fr_CA','name',''),
(11,6,'en','name','Developing efficacy beliefs in the classroom.pdf'),
(12,6,'fr_CA','name',''),
(13,7,'en','name','Developing efficacy beliefs in the classroom.pdf'),
(14,7,'fr_CA','name',''),
(15,8,'en','name','Hansen & Pinto: Reason Reclaimed.pdf'),
(16,8,'fr_CA','name',''),
(17,9,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),
(18,9,'fr_CA','name',''),
(19,10,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),
(20,10,'fr_CA','name',''),
(21,11,'en','name','Learning Sustainable Design through Service.pdf'),
(22,11,'fr_CA','name',''),
(23,12,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),
(24,12,'fr_CA','name',''),
(25,13,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),
(26,13,'fr_CA','name',''),
(27,14,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),
(28,14,'fr_CA','name',''),
(29,15,'en','name','Yam diseases and its management in Nigeria.pdf'),
(30,15,'fr_CA','name',''),
(31,16,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),
(32,16,'fr_CA','name',''),
(33,17,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),
(34,17,'fr_CA','name',''),
(35,18,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),
(36,18,'fr_CA','name',''),
(37,19,'en','name','Finocchiaro: Arguments About Arguments.pdf'),
(38,19,'fr_CA','name','');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES
(1,1,1,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:18:15','2025-01-16 05:18:17',7,521,1),
(2,2,2,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:18:49','2025-01-16 05:18:51',8,521,2),
(3,3,3,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:19:39','2025-01-16 05:19:41',9,521,3),
(4,4,4,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:20:22','2025-01-16 05:20:24',10,521,5),
(5,5,5,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:20:57','2025-01-16 05:21:00',11,521,6),
(6,6,6,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:21:31','2025-01-16 05:21:34',12,521,7),
(7,7,7,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:21:54','2025-01-16 05:21:56',13,521,8),
(8,8,8,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:22:18','2025-01-16 05:22:20',14,521,9),
(9,9,9,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:22:40','2025-01-16 05:22:43',15,521,10),
(10,10,10,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:23:03','2025-01-16 05:23:06',16,521,11),
(11,11,11,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:23:27','2025-01-16 05:23:29',17,521,12),
(12,12,12,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:23:50','2025-01-16 05:23:52',18,521,13),
(13,13,13,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:24:13','2025-01-16 05:24:16',19,521,14),
(14,14,14,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:24:36','2025-01-16 05:24:39',20,521,15),
(15,15,15,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:25:00','2025-01-16 05:25:02',21,521,16),
(16,16,16,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:25:23','2025-01-16 05:25:25',22,521,17),
(17,17,17,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:25:45','2025-01-16 05:25:48',23,521,18),
(18,18,18,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:26:09','2025-01-16 05:26:11',24,521,19),
(19,19,19,NULL,1,10,NULL,NULL,NULL,'2025-01-16 05:26:32','2025-01-16 05:26:34',25,521,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=999 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES
(49,'133rd'),
(375,'1980s'),
(731,'21st'),
(438,'aalborg'),
(853,'abattoir'),
(888,'abnormal'),
(518,'academic'),
(605,'accepted'),
(486,'accompanying'),
(779,'achieving'),
(81,'acid'),
(620,'acids'),
(345,'action'),
(981,'actor'),
(974,'actors'),
(473,'added'),
(516,'address'),
(60,'adg'),
(560,'adipose'),
(78,'adiposity'),
(224,'administered'),
(450,'administration'),
(810,'adopted'),
(811,'advocated'),
(878,'affected'),
(122,'affects'),
(850,'african'),
(980,'agree'),
(909,'aid'),
(555,'aim'),
(167,'alberta'),
(239,'alexandria'),
(35,'allocated'),
(720,'analyses'),
(133,'analysis'),
(584,'analyzed'),
(582,'animals'),
(792,'anthracnose'),
(950,'antibiotics'),
(921,'antimicrobial'),
(656,'antonio'),
(683,'appears'),
(248,'applications'),
(449,'applied'),
(632,'aquifer'),
(111,'archival'),
(97,'areas'),
(264,'argument'),
(998,'arguments'),
(828,'ash'),
(556,'assess'),
(624,'assessed'),
(678,'assessments'),
(727,'atlantic'),
(113,'attitude'),
(547,'australian'),
(164,'author'),
(910,'authorities'),
(500,'authority'),
(441,'availability'),
(29,'average'),
(564,'averaging'),
(578,'backfat'),
(263,'background'),
(782,'baiyewu'),
(842,'barcelona'),
(18,'barley'),
(737,'barriers'),
(32,'barrows'),
(636,'barton'),
(501,'based'),
(494,'basin'),
(460,'basins'),
(19,'basis'),
(677,'bearings'),
(852,'beef'),
(13,'beet'),
(196,'began'),
(48,'beginning'),
(310,'belief'),
(275,'beliefs'),
(759,'belonging'),
(128,'benchmark'),
(142,'benefit'),
(668,'blanco'),
(4,'bologna'),
(148,'brazil'),
(499,'brazos'),
(875,'breeds'),
(692,'buda'),
(865,'bulls'),
(549,'butyrate'),
(597,'c18'),
(600,'c20'),
(198,'called'),
(848,'cameroon'),
(192,'canada'),
(470,'capabilities'),
(401,'cape'),
(877,'carcass'),
(860,'carcasses'),
(623,'carefully'),
(1,'carlo'),
(750,'carried'),
(726,'case'),
(957,'cases'),
(9,'cashmere'),
(880,'category'),
(100,'catherine'),
(846,'cattle'),
(289,'cedural'),
(643,'central'),
(732,'century'),
(681,'cfs'),
(540,'challenges'),
(702,'change'),
(527,'chapter'),
(859,'characteristics'),
(308,'children'),
(147,'china'),
(834,'chips'),
(546,'christopher'),
(88,'chroma'),
(598,'cis'),
(313,'citizens'),
(348,'citizenship'),
(281,'claim'),
(271,'claims'),
(178,'classroom'),
(956,'clinical'),
(585,'close'),
(728,'coast'),
(941,'coli'),
(925,'coliforms'),
(377,'colleagues'),
(580,'collected'),
(658,'collection'),
(983,'collective'),
(979,'collectively'),
(153,'collectivistic'),
(303,'college'),
(86,'colour'),
(788,'combating'),
(276,'commitments'),
(285,'common'),
(352,'commons'),
(137,'communication'),
(761,'communities'),
(744,'community'),
(107,'comparative'),
(973,'compare'),
(131,'compared'),
(143,'comparisons'),
(290,'competencies'),
(126,'compiled'),
(489,'complete'),
(905,'completely'),
(468,'complex'),
(82,'composition'),
(168,'computer'),
(954,'concentration'),
(654,'concept'),
(93,'concluded'),
(416,'conclusive'),
(902,'condemned'),
(481,'condensed'),
(439,'condensing'),
(638,'conditions'),
(323,'conducted'),
(311,'confident'),
(417,'conflicting'),
(963,'conjugative'),
(711,'connection'),
(630,'connectivity'),
(988,'consensus'),
(77,'consequence'),
(798,'considered'),
(149,'consistent'),
(284,'consists'),
(607,'consortium'),
(109,'construct'),
(495,'contained'),
(376,'contemporary'),
(589,'content'),
(158,'context'),
(717,'continual'),
(314,'continue'),
(432,'continuous'),
(746,'contributing'),
(991,'contributors'),
(39,'control'),
(537,'coordinated'),
(201,'core'),
(2,'corino'),
(304,'cork'),
(427,'corporate'),
(757,'council'),
(125,'countries'),
(772,'country'),
(202,'courses'),
(368,'coward'),
(886,'cows'),
(334,'cps'),
(165,'craig'),
(127,'create'),
(331,'creative'),
(667,'creek'),
(265,'critique'),
(813,'crop'),
(835,'cubes'),
(820,'cultivars'),
(157,'cultural'),
(121,'culture'),
(762,'cultures'),
(996,'cuny'),
(608,'cured'),
(195,'curriculum'),
(68,'cuts'),
(24,'dairy'),
(258,'dana'),
(722,'daniel'),
(112,'data'),
(482,'dataset'),
(465,'datasets'),
(50,'day'),
(357,'decades'),
(975,'decide'),
(342,'decision'),
(431,'decisions'),
(268,'deep'),
(753,'defining'),
(79,'degree'),
(754,'delivering'),
(715,'demands'),
(187,'demonstrate'),
(748,'describes'),
(507,'design'),
(724,'designing'),
(818,'destruction'),
(802,'devastating'),
(498,'develop'),
(471,'developed'),
(305,'developing'),
(213,'development'),
(388,'developments'),
(237,'diaga'),
(42,'diet'),
(616,'dietary'),
(27,'diets'),
(613,'differed'),
(951,'difference'),
(56,'differences'),
(296,'difficult'),
(986,'difficulty'),
(26,'diluted'),
(238,'diouf'),
(542,'directions'),
(269,'disagreement'),
(360,'disciplines'),
(701,'discontinuity'),
(247,'discussed'),
(755,'discussions'),
(797,'disease'),
(785,'diseases'),
(671,'dissipated'),
(358,'distinguished'),
(899,'distress'),
(430,'distribution'),
(299,'diverge'),
(735,'diversity'),
(655,'divide'),
(421,'dividend'),
(405,'dividends'),
(301,'domatilia'),
(650,'downstream'),
(665,'drainage'),
(700,'dramatic'),
(911,'draw'),
(637,'drought'),
(676,'droughts'),
(44,'dry'),
(906,'due'),
(704,'dynamic'),
(90,'economical'),
(419,'economists'),
(599,'ecosenoic'),
(890,'ectoparasites'),
(805,'edible'),
(181,'education'),
(631,'edwards'),
(160,'effect'),
(139,'effectiveness'),
(11,'effects'),
(306,'efficacy'),
(138,'efficiency'),
(774,'egalitarianism'),
(349,'elinor'),
(734,'embracing'),
(520,'emerging'),
(758,'emphasises'),
(407,'empirical'),
(232,'employed'),
(115,'employees'),
(964,'encoding'),
(889,'encountered'),
(647,'endangered'),
(458,'endeavors'),
(249,'engineering'),
(524,'engineers'),
(330,'enhance'),
(476,'enhanced'),
(346,'enhancing'),
(895,'enlarged'),
(934,'enterobacteriacea'),
(509,'environmental'),
(972,'environments'),
(307,'equip'),
(110,'equivalence'),
(940,'escherichia'),
(653,'established'),
(767,'ethnic'),
(768,'ethno'),
(436,'evaluation'),
(408,'evidence'),
(119,'examine'),
(228,'examined'),
(743,'examines'),
(159,'exerts'),
(145,'exhibited'),
(541,'exist'),
(171,'existing'),
(662,'exists'),
(456,'expanding'),
(353,'expe'),
(204,'expected'),
(36,'exper'),
(526,'experiences'),
(52,'experimental'),
(255,'expression'),
(687,'extended'),
(689,'extensive'),
(392,'fabio'),
(103,'facets'),
(132,'factor'),
(135,'factors'),
(936,'faeces'),
(515,'failed'),
(163,'fake'),
(815,'fallowing'),
(70,'fat'),
(891,'fatigue'),
(574,'fats'),
(80,'fatty'),
(61,'fcr'),
(472,'features'),
(23,'fed'),
(53,'feed'),
(790,'field'),
(937,'fifteen'),
(562,'fifty'),
(832,'finally'),
(418,'financial'),
(429,'financing'),
(283,'find'),
(151,'findings'),
(997,'finocchiaro'),
(414,'firm'),
(675,'flow'),
(682,'flowing'),
(493,'flows'),
(904,'flukes'),
(443,'focus'),
(266,'fogelin'),
(625,'food'),
(242,'forest'),
(829,'found'),
(274,'framework'),
(389,'frank'),
(278,'fruitfully'),
(872,'fulani'),
(433,'function'),
(830,'fungal'),
(412,'future'),
(739,'gender'),
(844,'general'),
(254,'genes'),
(240,'genetic'),
(733,'genuinely'),
(33,'gilts'),
(826,'gins'),
(219,'goal'),
(993,'goverance'),
(253,'governing'),
(190,'government'),
(188,'grade'),
(695,'gradient'),
(703,'gradients'),
(316,'graduation'),
(661,'groundwater'),
(54,'group'),
(38,'groups'),
(475,'growing'),
(58,'growth'),
(871,'gudali'),
(422,'guidance'),
(867,'guinea'),
(71,'ham'),
(287,'hand'),
(395,'hansen'),
(619,'healthy'),
(21,'heavy'),
(868,'high'),
(65,'higher'),
(587,'highest'),
(775,'highlights'),
(231,'hired'),
(215,'hiring'),
(34,'homogeneously'),
(929,'hospital'),
(935,'human'),
(708,'hydraulic'),
(660,'hydrogeologic'),
(629,'hydrologic'),
(673,'hydrologically'),
(28,'hypor'),
(529,'identification'),
(939,'identified'),
(37,'imental'),
(649,'immediately'),
(485,'impacts'),
(208,'implement'),
(194,'implementation'),
(978,'implemented'),
(173,'implications'),
(776,'importance'),
(914,'improve'),
(550,'improves'),
(250,'improving'),
(765,'include'),
(497,'included'),
(812,'includes'),
(714,'increased'),
(617,'increases'),
(610,'index'),
(351,'indiana'),
(760,'individual'),
(130,'individually'),
(152,'individuals'),
(819,'infected'),
(831,'infection'),
(928,'infections'),
(5,'influence'),
(684,'influenced'),
(707,'influences'),
(199,'information'),
(312,'informed'),
(200,'infused'),
(62,'ing'),
(710,'inherent'),
(953,'inhibitory'),
(30,'initial'),
(184,'initiatives'),
(479,'input'),
(970,'institutions'),
(329,'instruction'),
(517,'integrates'),
(233,'integrating'),
(176,'integration'),
(387,'intellectual'),
(752,'intention'),
(725,'intercultural'),
(747,'interculturality'),
(96,'interest'),
(272,'interlocutors'),
(536,'internships'),
(435,'intuitive'),
(261,'investigating'),
(428,'investment'),
(425,'investors'),
(341,'involve'),
(766,'involvement'),
(528,'involves'),
(603,'iodine'),
(931,'iran'),
(235,'irvine'),
(930,'isfahan'),
(568,'isoenergetic'),
(926,'isolated'),
(938,'isolates'),
(180,'issue'),
(856,'january'),
(104,'job'),
(399,'john'),
(210,'jurisdictions'),
(919,'karbasizaed'),
(503,'karim'),
(162,'kekkonen'),
(943,'kelebsiella'),
(317,'key'),
(504,'khafaji'),
(309,'knowledge'),
(628,'kumiega'),
(101,'kwantes'),
(691,'kyle'),
(6,'lactation'),
(391,'laerhoven'),
(892,'lameness'),
(738,'language'),
(467,'large'),
(514,'largely'),
(855,'largest'),
(780,'lasting'),
(611,'layers'),
(344,'leads'),
(67,'lean'),
(320,'learn'),
(315,'learners'),
(206,'learning'),
(534,'led'),
(545,'leo'),
(894,'lesions'),
(189,'level'),
(602,'levels'),
(522,'leveraged'),
(539,'limitations'),
(769,'linguistic'),
(601,'linoleic'),
(596,'linolenic'),
(627,'lise'),
(406,'literature'),
(837,'live'),
(903,'liver'),
(824,'locally'),
(361,'long'),
(672,'longer'),
(862,'longissimus'),
(369,'los'),
(72,'losses'),
(694,'low'),
(69,'lower'),
(593,'lowest'),
(908,'lungs'),
(896,'lymph'),
(371,'mackenzie'),
(825,'made'),
(571,'maize'),
(179,'major'),
(343,'making'),
(364,'managed'),
(423,'management'),
(193,'mandated'),
(857,'march'),
(634,'marcos'),
(543,'margaret'),
(234,'mark'),
(75,'marked'),
(881,'markedly'),
(804,'marketable'),
(566,'matched'),
(817,'material'),
(45,'matter'),
(874,'mbororo'),
(336,'means'),
(883,'meat'),
(252,'mechanisms'),
(218,'meet'),
(789,'menace'),
(730,'met'),
(922,'metal'),
(958,'metals'),
(480,'methodology'),
(955,'mic'),
(374,'mid'),
(773,'militate'),
(952,'minimal'),
(365,'mismanaged'),
(292,'mistakenly'),
(295,'mitments'),
(496,'model'),
(446,'modeling'),
(442,'models'),
(74,'moderate'),
(502,'modifying'),
(718,'monitoring'),
(594,'monounsaturated'),
(166,'montgomerie'),
(838,'months'),
(544,'morse'),
(795,'mosaic'),
(337,'motivate'),
(347,'motivation'),
(595,'mufa'),
(969,'multi'),
(966,'multidrug'),
(742,'multiethnic'),
(741,'multilingual'),
(117,'multinational'),
(949,'multiple'),
(400,'mwandenga'),
(783,'nairobi'),
(106,'nation'),
(120,'national'),
(129,'nations'),
(123,'nature'),
(466,'necessarily'),
(716,'necessitates'),
(971,'networked'),
(230,'newly'),
(729,'nicaragua'),
(786,'nigeria'),
(897,'nodes'),
(900,'nodular'),
(670,'normal'),
(699,'north'),
(927,'nosocomial'),
(437,'novak'),
(680,'numerical'),
(319,'nurturing'),
(843,'nutrition'),
(621,'nutritional'),
(57,'observed'),
(415,'offer'),
(572,'oil'),
(666,'onion'),
(277,'order'),
(118,'organization'),
(136,'organizational'),
(532,'organizations'),
(901,'organs'),
(866,'origin'),
(488,'original'),
(350,'ostrom'),
(736,'overcome'),
(393,'paglieri'),
(220,'paper'),
(59,'parameters'),
(606,'parma'),
(293,'part'),
(94,'partially'),
(321,'participate'),
(749,'participatory'),
(531,'partner'),
(356,'past'),
(721,'patricia'),
(962,'pattern'),
(932,'patterns'),
(16,'pbps'),
(777,'pedagogy'),
(298,'people'),
(946,'percent'),
(66,'percentages'),
(551,'performance'),
(47,'period'),
(688,'periods'),
(452,'permit'),
(463,'permits'),
(141,'personal'),
(960,'persons'),
(989,'perverse'),
(259,'phillips'),
(95,'pig'),
(553,'piglets'),
(22,'pigs'),
(396,'pinto'),
(367,'places'),
(645,'plan'),
(455,'planning'),
(816,'planting'),
(257,'plants'),
(924,'plasmid'),
(944,'pneumoniae'),
(91,'point'),
(174,'policy'),
(591,'polyunsaturated'),
(384,'pool'),
(713,'population'),
(806,'portions'),
(339,'positive'),
(948,'possess'),
(424,'potential'),
(696,'potentiometric'),
(770,'power'),
(420,'practical'),
(175,'practice'),
(858,'pre'),
(876,'predominant'),
(887,'pregnant'),
(525,'present'),
(326,'presented'),
(787,'presents'),
(12,'pressed'),
(915,'prevent'),
(150,'previous'),
(640,'primary'),
(511,'principles'),
(288,'pro'),
(76,'prob'),
(332,'problem'),
(985,'problematic'),
(294,'procedural'),
(833,'processing'),
(10,'production'),
(282,'productive'),
(98,'products'),
(212,'professional'),
(559,'profile'),
(933,'profiles'),
(659,'program'),
(912,'programmes'),
(246,'progress'),
(535,'project'),
(530,'projects'),
(916,'promote'),
(778,'promoting'),
(709,'properties'),
(386,'property'),
(618,'proportion'),
(413,'prospects'),
(646,'protect'),
(469,'provide'),
(191,'province'),
(183,'provincial'),
(225,'public'),
(592,'pufa'),
(14,'pulp'),
(690,'pumping'),
(990,'punishing'),
(279,'pursue'),
(8,'quality'),
(7,'quantity'),
(651,'questions'),
(652,'raised'),
(781,'rana'),
(565,'randomized'),
(573,'rapeseed'),
(712,'rapid'),
(227,'rate'),
(43,'ratio'),
(987,'reaching'),
(99,'readily'),
(879,'rearing'),
(397,'reason'),
(87,'receiving'),
(245,'recent'),
(685,'recharge'),
(398,'reclaimed'),
(861,'recorded'),
(965,'recovered'),
(873,'red'),
(803,'reduction'),
(808,'reductions'),
(586,'reflected'),
(462,'reflects'),
(280,'refute'),
(84,'regard'),
(793,'regarded'),
(381,'region'),
(453,'regional'),
(382,'regions'),
(771,'relations'),
(961,'relationship'),
(434,'rely'),
(942,'remaining'),
(487,'removed'),
(46,'replaced'),
(17,'replacing'),
(154,'report'),
(864,'represent'),
(849,'representative'),
(492,'represents'),
(229,'require'),
(207,'required'),
(170,'requirements'),
(155,'research'),
(373,'researchers'),
(484,'reservoir'),
(464,'reservoirs'),
(923,'resistance'),
(821,'resistant'),
(385,'resource'),
(363,'resources'),
(205,'respect'),
(898,'respiratory'),
(226,'response'),
(124,'responses'),
(604,'result'),
(222,'results'),
(134,'revealed'),
(244,'review'),
(370,'reyes'),
(354,'rienced'),
(451,'rights'),
(459,'river'),
(270,'robert'),
(318,'role'),
(394,'rome'),
(840,'rosanna'),
(841,'rossi'),
(801,'rot'),
(814,'rotation'),
(448,'routinely'),
(992,'ruled'),
(851,'safety'),
(579,'samples'),
(633,'san'),
(976,'sanction'),
(982,'sanctioned'),
(984,'sanctioning'),
(977,'sanctions'),
(105,'satisfaction'),
(146,'satisfied'),
(588,'saturated'),
(869,'savannah'),
(359,'scholars'),
(209,'school'),
(73,'seasoning'),
(379,'sec'),
(626,'security'),
(657,'segments'),
(483,'selected'),
(85,'semimembranosus'),
(674,'separated'),
(197,'september'),
(639,'serves'),
(508,'service'),
(490,'set'),
(519,'setting'),
(945,'seventy'),
(799,'severe'),
(590,'sfa'),
(273,'share'),
(262,'shared'),
(426,'shareholding'),
(836,'shelf'),
(615,'show'),
(63,'showed'),
(327,'showing'),
(338,'shown'),
(693,'shows'),
(411,'signal'),
(409,'signaling'),
(403,'signalling'),
(55,'significant'),
(64,'significantly'),
(15,'silage'),
(884,'similar'),
(477,'simplifying'),
(478,'simulation'),
(679,'simulations'),
(116,'single'),
(845,'situation'),
(169,'skill'),
(185,'skills'),
(893,'skin'),
(577,'slaughter'),
(847,'slaughtered'),
(576,'slaughtering'),
(698,'slopes'),
(324,'social'),
(322,'society'),
(548,'sodium'),
(302,'sokoloff'),
(333,'solving'),
(644,'source'),
(642,'south'),
(648,'species'),
(362,'specific'),
(203,'specifies'),
(794,'spread'),
(635,'springs'),
(751,'staff'),
(216,'standards'),
(505,'stanford'),
(461,'state'),
(454,'statewide'),
(791,'storage'),
(809,'stored'),
(947,'strains'),
(214,'strategies'),
(328,'strategy'),
(491,'streamflows'),
(913,'strengthen'),
(706,'structural'),
(144,'structures'),
(533,'student'),
(186,'students'),
(20,'studied'),
(325,'studies'),
(108,'study'),
(612,'subcutaneous'),
(355,'substantial'),
(538,'successful'),
(156,'suggest'),
(410,'suggests'),
(221,'summarizes'),
(575,'supplement'),
(558,'supplementation'),
(569,'supplemented'),
(641,'supply'),
(140,'support'),
(291,'supporters'),
(764,'supporting'),
(664,'surface'),
(114,'survey'),
(510,'sustainability'),
(506,'sustainable'),
(41,'sweet'),
(447,'system'),
(444,'systems'),
(740,'takes'),
(570,'tallow'),
(335,'taught'),
(523,'teach'),
(172,'teachers'),
(622,'technological'),
(177,'technology'),
(822,'tecto'),
(920,'tehran'),
(223,'telephone'),
(581,'ten'),
(557,'term'),
(445,'texas'),
(404,'theory'),
(267,'thesis'),
(823,'thiabendazole'),
(863,'thoracis'),
(763,'time'),
(366,'times'),
(561,'tissue'),
(182,'today'),
(959,'tolerant'),
(521,'tool'),
(286,'topic'),
(513,'topics'),
(260,'toronto'),
(380,'tors'),
(885,'toughest'),
(402,'town'),
(917,'trade'),
(40,'traditional'),
(241,'transformation'),
(870,'transhumance'),
(583,'treatment'),
(614,'treatments'),
(243,'trees'),
(719,'trend'),
(51,'trial'),
(907,'tuberculosis'),
(807,'tubers'),
(211,'turning'),
(474,'types'),
(83,'unaffected'),
(251,'understanding'),
(3,'university'),
(705,'unknown'),
(609,'unsaturation'),
(217,'upgrade'),
(297,'uphold'),
(745,'uraccan'),
(161,'urho'),
(918,'vajiheh'),
(967,'valerie'),
(340,'valuable'),
(89,'values'),
(390,'van'),
(697,'variation'),
(882,'varied'),
(457,'variety'),
(663,'vicinity'),
(236,'victoria'),
(92,'view'),
(796,'virus'),
(512,'vital'),
(686,'vulnerable'),
(756,'wales'),
(440,'water'),
(552,'weaned'),
(554,'weaning'),
(31,'weight'),
(567,'weights'),
(669,'wet'),
(25,'whey'),
(563,'white'),
(300,'widely'),
(968,'williamson'),
(102,'windsor'),
(372,'wittfogel'),
(723,'wolverhampton'),
(827,'wood'),
(995,'woods'),
(256,'woody'),
(378,'work'),
(383,'world'),
(784,'yam'),
(800,'yams'),
(854,'yaoundé'),
(839,'year'),
(994,'zita');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10713 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES
(287,1,1,0),
(288,1,2,1),
(289,1,3,2),
(290,1,4,3),
(291,2,5,0),
(292,2,6,1),
(293,2,7,2),
(294,2,8,3),
(295,2,9,4),
(296,2,10,5),
(297,3,11,0),
(298,3,12,1),
(299,3,13,2),
(300,3,14,3),
(301,3,15,4),
(302,3,16,5),
(303,3,17,6),
(304,3,18,7),
(305,3,19,8),
(306,3,20,9),
(307,3,21,10),
(308,3,22,11),
(309,3,23,12),
(310,3,24,13),
(311,3,25,14),
(312,3,26,15),
(313,3,27,16),
(314,3,28,17),
(315,3,22,18),
(316,3,29,19),
(317,3,30,20),
(318,3,31,21),
(319,3,32,22),
(320,3,33,23),
(321,3,34,24),
(322,3,35,25),
(323,3,36,26),
(324,3,37,27),
(325,3,38,28),
(326,3,39,29),
(327,3,22,30),
(328,3,23,31),
(329,3,40,32),
(330,3,41,33),
(331,3,25,34),
(332,3,26,35),
(333,3,42,36),
(334,3,43,37),
(335,3,25,38),
(336,3,44,39),
(337,3,45,40),
(338,3,16,41),
(339,3,46,42),
(340,3,18,43),
(341,3,19,44),
(342,3,47,45),
(343,3,48,46),
(344,3,49,47),
(345,3,50,48),
(346,3,51,49),
(347,3,19,50),
(348,3,16,51),
(349,3,46,52),
(350,3,18,53),
(351,3,19,54),
(352,3,52,55),
(353,3,47,56),
(354,3,27,57),
(355,3,53,58),
(356,3,24,59),
(357,3,25,60),
(358,3,26,61),
(359,3,54,62),
(360,3,55,63),
(361,3,56,64),
(362,3,57,65),
(363,3,58,66),
(364,3,59,67),
(365,3,60,68),
(366,3,61,69),
(367,3,22,70),
(368,3,27,71),
(369,3,62,72),
(370,3,16,73),
(371,3,63,74),
(372,3,64,75),
(373,3,65,76),
(374,3,66,77),
(375,3,67,78),
(376,3,68,79),
(377,3,69,80),
(378,3,66,81),
(379,3,70,82),
(380,3,68,83),
(381,3,71,84),
(382,3,31,85),
(383,3,72,86),
(384,3,73,87),
(385,3,74,88),
(386,3,64,89),
(387,3,75,90),
(388,3,16,91),
(389,3,23,92),
(390,3,22,93),
(391,3,76,94),
(392,3,77,95),
(393,3,69,96),
(394,3,78,97),
(395,3,79,98),
(396,3,80,99),
(397,3,81,100),
(398,3,82,101),
(399,3,71,102),
(400,3,70,103),
(401,3,83,104),
(402,3,27,105),
(403,3,84,106),
(404,3,85,107),
(405,3,86,108),
(406,3,22,109),
(407,3,87,110),
(408,3,16,111),
(409,3,63,112),
(410,3,69,113),
(411,3,88,114),
(412,3,89,115),
(413,3,90,116),
(414,3,91,117),
(415,3,92,118),
(416,3,93,119),
(417,3,16,120),
(418,3,94,121),
(419,3,17,122),
(420,3,18,123),
(421,3,24,124),
(422,3,25,125),
(423,3,21,126),
(424,3,95,127),
(425,3,10,128),
(426,3,96,129),
(427,3,97,130),
(428,3,98,131),
(429,3,99,132),
(870,9,100,0),
(871,9,101,1),
(872,9,3,2),
(873,9,102,3),
(874,9,161,4),
(875,9,162,5),
(876,10,103,0),
(877,10,104,1),
(878,10,105,2),
(879,10,106,3),
(880,10,107,4),
(881,10,108,5),
(882,10,109,6),
(883,10,110,7),
(884,11,111,0),
(885,11,112,1),
(886,11,113,2),
(887,11,114,3),
(888,11,115,4),
(889,11,116,5),
(890,11,117,6),
(891,11,118,7),
(892,11,119,8),
(893,11,79,9),
(894,11,120,10),
(895,11,121,11),
(896,11,122,12),
(897,11,123,13),
(898,11,104,14),
(899,11,105,15),
(900,11,124,16),
(901,11,125,17),
(902,11,126,18),
(903,11,127,19),
(904,11,128,20),
(905,11,129,21),
(906,11,130,22),
(907,11,131,23),
(908,11,132,24),
(909,11,133,25),
(910,11,134,26),
(911,11,135,27),
(912,11,136,28),
(913,11,137,29),
(914,11,136,30),
(915,11,138,31),
(916,11,139,32),
(917,11,136,33),
(918,11,140,34),
(919,11,141,35),
(920,11,142,36),
(921,11,143,37),
(922,11,132,38),
(923,11,144,39),
(924,11,136,40),
(925,11,137,41),
(926,11,145,42),
(927,11,109,43),
(928,11,110,44),
(929,11,141,45),
(930,11,142,46),
(931,11,146,47),
(932,11,115,48),
(933,11,147,49),
(934,11,146,50),
(935,11,148,51),
(936,11,149,52),
(937,11,150,53),
(938,11,151,54),
(939,11,152,55),
(940,11,153,56),
(941,11,129,57),
(942,11,154,58),
(943,11,65,59),
(944,11,105,60),
(945,11,155,61),
(946,11,151,62),
(947,11,156,63),
(948,11,120,64),
(949,11,157,65),
(950,11,158,66),
(951,11,159,67),
(952,11,160,68),
(953,11,123,69),
(954,11,104,70),
(955,11,105,71),
(956,13,115,0),
(957,13,114,1),
(1958,25,165,0),
(1959,25,166,1),
(1960,25,3,2),
(1961,25,167,3),
(1962,25,234,4),
(1963,25,235,5),
(1964,25,3,6),
(1965,25,236,7),
(1966,26,168,0),
(1967,26,169,1),
(1968,26,170,2),
(1969,26,171,3),
(1970,26,172,4),
(1971,26,173,5),
(1972,26,174,6),
(1973,26,175,7),
(1974,27,176,0),
(1975,27,177,1),
(1976,27,178,2),
(1977,27,179,3),
(1978,27,180,4),
(1979,27,181,5),
(1980,27,182,6),
(1981,27,120,7),
(1982,27,183,8),
(1983,27,184,9),
(1984,27,177,10),
(1985,27,185,11),
(1986,27,186,12),
(1987,27,187,13),
(1988,27,188,14),
(1989,27,189,15),
(1990,27,190,16),
(1991,27,191,17),
(1992,27,167,18),
(1993,27,192,19),
(1994,27,193,20),
(1995,27,194,21),
(1996,27,195,22),
(1997,27,196,23),
(1998,27,197,24),
(1999,27,198,25),
(2000,27,199,26),
(2001,27,137,27),
(2002,27,177,28),
(2003,27,195,29),
(2004,27,200,30),
(2005,27,201,31),
(2006,27,202,32),
(2007,27,203,33),
(2008,27,186,34),
(2009,27,204,35),
(2010,27,205,36),
(2011,27,177,37),
(2012,27,167,38),
(2013,27,206,39),
(2014,27,172,40),
(2015,27,207,41),
(2016,27,208,42),
(2017,27,195,43),
(2018,27,209,44),
(2019,27,210,45),
(2020,27,211,46),
(2021,27,212,47),
(2022,27,213,48),
(2023,27,214,49),
(2024,27,215,50),
(2025,27,216,51),
(2026,27,217,52),
(2027,27,172,53),
(2028,27,168,54),
(2029,27,185,55),
(2030,27,218,56),
(2031,27,219,57),
(2032,27,220,58),
(2033,27,221,59),
(2034,27,222,60),
(2035,27,223,61),
(2036,27,114,62),
(2037,27,224,63),
(2038,27,225,64),
(2039,27,209,65),
(2040,27,210,66),
(2041,27,191,67),
(2042,27,167,68),
(2043,27,226,69),
(2044,27,227,70),
(2045,27,228,71),
(2046,27,168,72),
(2047,27,185,73),
(2048,27,209,74),
(2049,27,210,75),
(2050,27,229,76),
(2051,27,230,77),
(2052,27,231,78),
(2053,27,172,79),
(2054,27,140,80),
(2055,27,214,81),
(2056,27,232,82),
(2057,27,232,83),
(2058,27,172,84),
(2059,29,233,0),
(2060,29,177,1),
(2061,29,168,2),
(2062,29,185,3),
(2063,29,114,4),
(2064,29,167,5),
(2065,29,120,6),
(2066,29,183,7),
(2067,29,212,8),
(2068,29,213,9),
(2069,29,115,10),
(2128,33,237,0),
(2129,33,238,1),
(2130,33,239,2),
(2131,33,3,3),
(2132,34,240,0),
(2133,34,241,1),
(2134,34,242,2),
(2135,34,243,3),
(2136,35,244,0),
(2137,35,245,1),
(2138,35,246,2),
(2139,35,240,3),
(2140,35,241,4),
(2141,35,242,5),
(2142,35,243,6),
(2143,35,247,7),
(2144,35,248,8),
(2145,35,240,9),
(2146,35,249,10),
(2147,35,250,11),
(2148,35,242,12),
(2149,35,243,13),
(2150,35,251,14),
(2151,35,252,15),
(2152,35,253,16),
(2153,35,254,17),
(2154,35,255,18),
(2155,35,256,19),
(2156,35,257,20),
(2647,49,258,0),
(2648,49,259,1),
(2649,49,3,2),
(2650,49,260,3),
(2651,50,261,0),
(2652,50,262,1),
(2653,50,263,2),
(2654,50,207,3),
(2655,50,264,4),
(2656,50,265,5),
(2657,50,266,6),
(2658,50,267,7),
(2659,50,268,8),
(2660,50,269,9),
(2661,51,270,0),
(2662,51,266,1),
(2663,51,271,2),
(2664,51,272,3),
(2665,51,273,4),
(2666,51,274,5),
(2667,51,263,6),
(2668,51,275,7),
(2669,51,276,8),
(2670,51,277,9),
(2671,51,278,10),
(2672,51,279,11),
(2673,51,264,12),
(2674,51,280,13),
(2675,51,266,14),
(2676,51,281,15),
(2677,51,261,16),
(2678,51,262,17),
(2679,51,263,18),
(2680,51,207,19),
(2681,51,282,20),
(2682,51,264,21),
(2683,51,283,22),
(2684,51,263,23),
(2685,51,284,24),
(2686,51,285,25),
(2687,51,275,26),
(2688,51,286,27),
(2689,51,287,28),
(2690,51,262,29),
(2691,51,288,30),
(2692,51,289,31),
(2693,51,276,32),
(2694,51,290,33),
(2695,51,156,34),
(2696,51,266,35),
(2697,51,291,36),
(2698,51,292,37),
(2699,51,92,38),
(2700,51,262,39),
(2701,51,275,40),
(2702,51,293,41),
(2703,51,207,42),
(2704,51,263,43),
(2705,51,282,44),
(2706,51,264,45),
(2707,51,294,46),
(2708,51,295,47),
(2709,51,296,48),
(2710,51,297,49),
(2711,51,298,50),
(2712,51,275,51),
(2713,51,299,52),
(2714,51,300,53),
(2715,51,286,54),
(2716,51,287,55),
(3137,57,301,0),
(3138,57,302,1),
(3139,57,3,2),
(3140,57,303,3),
(3141,57,304,4),
(3142,58,305,0),
(3143,58,306,1),
(3144,58,275,2),
(3145,58,178,3),
(3146,59,179,0),
(3147,59,219,1),
(3148,59,181,2),
(3149,59,307,3),
(3150,59,308,4),
(3151,59,309,5),
(3152,59,185,6),
(3153,59,310,7),
(3154,59,311,8),
(3155,59,312,9),
(3156,59,313,10),
(3157,59,313,11),
(3158,59,314,12),
(3159,59,315,13),
(3160,59,316,14),
(3161,59,220,15),
(3162,59,317,16),
(3163,59,318,17),
(3164,59,319,18),
(3165,59,306,19),
(3166,59,275,20),
(3167,59,277,21),
(3168,59,320,22),
(3169,59,321,23),
(3170,59,209,24),
(3171,59,322,25),
(3172,59,155,26),
(3173,59,151,27),
(3174,59,323,28),
(3175,59,324,29),
(3176,59,325,30),
(3177,59,158,31),
(3178,59,326,32),
(3179,59,327,33),
(3180,59,328,34),
(3181,59,329,35),
(3182,59,330,36),
(3183,59,306,37),
(3184,59,206,38),
(3185,59,293,39),
(3186,59,155,40),
(3187,59,331,41),
(3188,59,332,42),
(3189,59,333,43),
(3190,59,334,44),
(3191,59,335,45),
(3192,59,308,46),
(3193,59,336,47),
(3194,59,337,48),
(3195,59,140,49),
(3196,59,206,50),
(3197,59,338,51),
(3198,59,334,52),
(3199,59,339,53),
(3200,59,11,54),
(3201,59,306,55),
(3202,59,206,56),
(3203,59,340,57),
(3204,59,274,58),
(3205,59,341,59),
(3206,59,308,60),
(3207,59,342,61),
(3208,59,343,62),
(3209,59,344,63),
(3210,59,324,64),
(3211,59,345,65),
(3212,59,173,66),
(3213,59,346,67),
(3214,59,306,68),
(3215,59,347,69),
(3216,59,320,70),
(3217,59,178,71),
(3218,59,247,72),
(3219,61,181,0),
(3220,61,348,1),
(3531,65,349,0),
(3532,65,350,1),
(3533,65,351,2),
(3534,65,3,3),
(3535,65,389,4),
(3536,65,390,5),
(3537,65,391,6),
(3538,65,351,7),
(3539,65,3,8),
(3540,66,305,0),
(3541,66,306,1),
(3542,66,275,2),
(3543,66,178,3),
(3544,67,108,0),
(3545,67,352,1),
(3546,67,353,2),
(3547,67,354,3),
(3548,67,355,4),
(3549,67,58,5),
(3550,67,213,6),
(3551,67,356,7),
(3552,67,357,8),
(3553,67,358,9),
(3554,67,359,10),
(3555,67,360,11),
(3556,67,361,12),
(3557,67,20,13),
(3558,67,362,14),
(3559,67,363,15),
(3560,67,364,16),
(3561,67,365,17),
(3562,67,366,18),
(3563,67,367,19),
(3564,67,368,20),
(3565,67,369,21),
(3566,67,370,22),
(3567,67,371,23),
(3568,67,372,24),
(3569,67,373,25),
(3570,67,20,26),
(3571,67,362,27),
(3572,67,352,28),
(3573,67,374,29),
(3574,67,375,30),
(3575,67,376,31),
(3576,67,377,32),
(3577,67,312,33),
(3578,67,378,34),
(3579,67,359,35),
(3580,67,360,36),
(3581,67,379,37),
(3582,67,380,38),
(3583,67,381,39),
(3584,67,96,40),
(3585,67,382,41),
(3586,67,383,42),
(3587,69,285,0),
(3588,69,384,1),
(3589,69,385,2),
(3590,69,285,3),
(3591,69,386,4),
(3592,69,387,5),
(3593,69,388,6),
(3634,73,392,0),
(3635,73,393,1),
(3636,73,3,2),
(3637,73,394,3),
(3638,74,395,0),
(3639,74,396,1),
(3640,74,397,2),
(3641,74,398,3),
(3912,81,399,0),
(3913,81,400,1),
(3914,81,3,2),
(3915,81,401,3),
(3916,81,402,4),
(3917,82,403,0),
(3918,82,404,1),
(3919,82,405,2),
(3920,82,244,3),
(3921,82,406,4),
(3922,82,407,5),
(3923,82,408,6),
(3924,83,409,0),
(3925,83,404,1),
(3926,83,410,2),
(3927,83,405,3),
(3928,83,411,4),
(3929,83,412,5),
(3930,83,413,6),
(3931,83,414,7),
(3932,83,245,8),
(3933,83,407,9),
(3934,83,408,10),
(3935,83,415,11),
(3936,83,416,12),
(3937,83,408,13),
(3938,83,180,14),
(3939,83,417,15),
(3940,83,174,16),
(3941,83,173,17),
(3942,83,418,18),
(3943,83,419,19),
(3944,83,420,20),
(3945,83,421,21),
(3946,83,174,22),
(3947,83,422,23),
(3948,83,423,24),
(3949,83,171,25),
(3950,83,424,26),
(3951,83,425,27),
(3952,83,426,28),
(3953,83,427,29),
(3954,83,428,30),
(3955,83,429,31),
(3956,83,430,32),
(3957,83,431,33),
(3958,83,432,34),
(3959,83,433,35),
(3960,83,423,36),
(3961,83,421,37),
(3962,83,431,38),
(3963,83,434,39),
(3964,83,435,40),
(3965,83,436,41),
(4611,89,399,0),
(4612,89,437,1),
(4613,89,438,2),
(4614,89,3,3),
(4615,90,439,0),
(4616,90,440,1),
(4617,90,441,2),
(4618,90,442,3),
(4619,90,443,4),
(4620,90,362,5),
(4621,90,440,6),
(4622,90,423,7),
(4623,90,444,8),
(4624,91,445,0),
(4625,91,440,1),
(4626,91,441,2),
(4627,91,446,3),
(4628,91,447,4),
(4629,91,448,5),
(4630,91,449,6),
(4631,91,450,7),
(4632,91,440,8),
(4633,91,451,9),
(4634,91,452,10),
(4635,91,447,11),
(4636,91,453,12),
(4637,91,454,13),
(4638,91,455,14),
(4639,91,456,15),
(4640,91,457,16),
(4641,91,458,17),
(4642,91,446,18),
(4643,91,440,19),
(4644,91,423,20),
(4645,91,459,21),
(4646,91,460,22),
(4647,91,461,23),
(4648,91,462,24),
(4649,91,440,25),
(4650,91,463,26),
(4651,91,464,27),
(4652,91,465,28),
(4653,91,466,29),
(4654,91,467,30),
(4655,91,468,31),
(4656,91,469,32),
(4657,91,342,33),
(4658,91,140,34),
(4659,91,470,35),
(4660,91,446,36),
(4661,91,447,37),
(4662,91,471,38),
(4663,91,446,39),
(4664,91,472,40),
(4665,91,473,41),
(4666,91,474,42),
(4667,91,248,43),
(4668,91,475,44),
(4669,91,248,45),
(4670,91,476,46),
(4671,91,477,47),
(4672,91,478,48),
(4673,91,479,49),
(4674,91,465,50),
(4675,91,443,51),
(4676,91,440,52),
(4677,91,423,53),
(4678,91,444,54),
(4679,91,480,55),
(4680,91,326,56),
(4681,91,305,57),
(4682,91,481,58),
(4683,91,482,59),
(4684,91,483,60),
(4685,91,484,61),
(4686,91,447,62),
(4687,91,462,63),
(4688,91,485,64),
(4689,91,440,65),
(4690,91,451,66),
(4691,91,486,67),
(4692,91,464,68),
(4693,91,487,69),
(4694,91,488,70),
(4695,91,489,71),
(4696,91,482,72),
(4697,91,490,73),
(4698,91,491,74),
(4699,91,471,75),
(4700,91,492,76),
(4701,91,493,77),
(4702,91,483,78),
(4703,91,447,79),
(4704,91,11,80),
(4705,91,440,81),
(4706,91,451,82),
(4707,91,459,83),
(4708,91,494,84),
(4709,91,495,85),
(4710,91,488,86),
(4711,91,489,87),
(4712,91,496,88),
(4713,91,479,89),
(4714,91,482,90),
(4715,91,497,91),
(4716,91,481,92),
(4717,91,482,93),
(4718,91,480,94),
(4719,91,449,95),
(4720,91,498,96),
(4721,91,481,97),
(4722,91,496,98),
(4723,91,499,99),
(4724,91,459,100),
(4725,91,500,101),
(4726,91,484,102),
(4727,91,447,103),
(4728,91,501,104),
(4729,91,502,105),
(4730,91,445,106),
(4731,91,440,107),
(4732,91,441,108),
(4733,91,446,109),
(4734,91,447,110),
(4735,91,482,111),
(4736,91,499,112),
(4737,91,459,113),
(4738,91,494,114),
(4739,93,440,0),
(5156,97,503,0),
(5157,97,504,1),
(5158,97,505,2),
(5159,97,3,3),
(5160,97,543,4),
(5161,97,544,5),
(5162,97,505,6),
(5163,97,3,7),
(5164,98,206,0),
(5165,98,506,1),
(5166,98,507,2),
(5167,98,508,3),
(5168,99,509,0),
(5169,99,510,1),
(5170,99,506,2),
(5171,99,213,3),
(5172,99,511,4),
(5173,99,512,5),
(5174,99,513,6),
(5175,99,249,7),
(5176,99,181,8),
(5177,99,514,9),
(5178,99,515,10),
(5179,99,516,11),
(5180,99,508,12),
(5181,99,206,13),
(5182,99,517,14),
(5183,99,324,15),
(5184,99,508,16),
(5185,99,518,17),
(5186,99,519,18),
(5187,99,520,19),
(5188,99,521,20),
(5189,99,522,21),
(5190,99,523,22),
(5191,99,506,23),
(5192,99,507,24),
(5193,99,412,25),
(5194,99,524,26),
(5195,99,525,27),
(5196,99,496,28),
(5197,99,508,29),
(5198,99,206,30),
(5199,99,523,31),
(5200,99,506,32),
(5201,99,507,33),
(5202,99,501,34),
(5203,99,526,35),
(5204,99,505,36),
(5205,99,527,37),
(5206,99,524,38),
(5207,99,506,39),
(5208,99,383,40),
(5209,99,496,41),
(5210,99,528,42),
(5211,99,529,43),
(5212,99,530,44),
(5213,99,531,45),
(5214,99,532,46),
(5215,99,533,47),
(5216,99,534,48),
(5217,99,535,49),
(5218,99,501,50),
(5219,99,507,51),
(5220,99,536,52),
(5221,99,537,53),
(5222,99,531,54),
(5223,99,532,55),
(5224,99,496,56),
(5225,99,538,57),
(5226,99,539,58),
(5227,99,540,59),
(5228,99,541,60),
(5229,99,247,61),
(5230,99,412,62),
(5231,99,542,63),
(5232,99,456,64),
(5233,99,496,65),
(5234,101,213,0),
(5235,101,249,1),
(5236,101,181,2),
(5237,101,508,3),
(5238,101,206,4),
(5239,101,510,5),
(6055,105,545,0),
(6056,105,546,1),
(6057,105,547,2),
(6058,105,120,3),
(6059,105,3,4),
(6060,106,548,0),
(6061,106,549,1),
(6062,106,550,2),
(6063,106,58,3),
(6064,106,551,4),
(6065,106,552,5),
(6066,106,553,6),
(6067,106,47,7),
(6068,106,554,8),
(6069,107,555,0),
(6070,107,108,1),
(6071,107,556,2),
(6072,107,5,3),
(6073,107,361,4),
(6074,107,557,5),
(6075,107,70,6),
(6076,107,558,7),
(6077,107,80,8),
(6078,107,81,9),
(6079,107,559,10),
(6080,107,21,11),
(6081,107,95,12),
(6082,107,560,13),
(6083,107,561,14),
(6084,107,562,15),
(6085,107,467,16),
(6086,107,563,17),
(6087,107,32,18),
(6088,107,564,19),
(6089,107,565,20),
(6090,107,566,21),
(6091,107,567,22),
(6092,107,568,23),
(6093,107,27,24),
(6094,107,569,25),
(6095,107,570,26),
(6096,107,571,27),
(6097,107,572,28),
(6098,107,573,29),
(6099,107,572,30),
(6100,107,574,31),
(6101,107,575,32),
(6102,107,23,33),
(6103,107,576,34),
(6104,107,577,35),
(6105,107,578,36),
(6106,107,579,37),
(6107,107,580,38),
(6108,107,581,39),
(6109,107,582,40),
(6110,107,583,41),
(6111,107,584,42),
(6112,107,80,43),
(6113,107,81,44),
(6114,107,82,45),
(6115,107,578,46),
(6116,107,585,47),
(6117,107,586,48),
(6118,107,80,49),
(6119,107,81,50),
(6120,107,82,51),
(6121,107,569,52),
(6122,107,574,53),
(6123,107,578,54),
(6124,107,22,55),
(6125,107,23,56),
(6126,107,587,57),
(6127,107,588,58),
(6128,107,80,59),
(6129,107,81,60),
(6130,107,589,61),
(6131,107,590,62),
(6132,107,23,63),
(6133,107,587,64),
(6134,107,589,65),
(6135,107,591,66),
(6136,107,80,67),
(6137,107,81,68),
(6138,107,592,69),
(6139,107,593,70),
(6140,107,594,71),
(6141,107,80,72),
(6142,107,81,73),
(6143,107,595,74),
(6144,107,589,75),
(6145,107,23,76),
(6146,107,587,77),
(6147,107,589,78),
(6148,107,596,79),
(6149,107,81,80),
(6150,107,597,81),
(6151,107,598,82),
(6152,107,599,83),
(6153,107,81,84),
(6154,107,600,85),
(6155,107,583,86),
(6156,107,160,87),
(6157,107,601,88),
(6158,107,81,89),
(6159,107,602,90),
(6160,107,603,91),
(6161,107,578,92),
(6162,107,604,93),
(6163,107,62,94),
(6164,107,602,95),
(6165,107,65,96),
(6166,107,597,97),
(6167,107,605,98),
(6168,107,606,99),
(6169,107,607,100),
(6170,107,44,101),
(6171,107,608,102),
(6172,107,71,103),
(6173,107,609,104),
(6174,107,610,105),
(6175,107,611,106),
(6176,107,612,107),
(6177,107,578,108),
(6178,107,561,109),
(6179,107,613,110),
(6180,107,64,111),
(6181,107,614,112),
(6182,107,222,113),
(6183,107,615,114),
(6184,107,361,115),
(6185,107,557,116),
(6186,107,616,117),
(6187,107,558,118),
(6188,107,574,119),
(6189,107,80,120),
(6190,107,81,121),
(6191,107,559,122),
(6192,107,21,123),
(6193,107,95,124),
(6194,107,560,125),
(6195,107,561,126),
(6196,107,558,127),
(6197,107,573,128),
(6198,107,572,129),
(6199,107,617,130),
(6200,107,618,131),
(6201,107,619,132),
(6202,107,80,133),
(6203,107,620,134),
(6204,107,95,135),
(6205,107,70,136),
(6206,107,250,137),
(6207,107,621,138),
(6208,107,8,139),
(6209,107,11,140),
(6210,107,622,141),
(6211,107,8,142),
(6212,107,70,143),
(6213,107,623,144),
(6214,107,624,145),
(6215,109,22,0),
(6216,109,625,1),
(6217,109,626,2),
(7358,113,627,0),
(7359,113,628,1),
(7360,113,3,2),
(7361,113,401,3),
(7362,113,402,4),
(7363,114,629,0),
(7364,114,630,1),
(7365,114,631,2),
(7366,114,632,3),
(7367,114,633,4),
(7368,114,634,5),
(7369,114,635,6),
(7370,114,636,7),
(7371,114,635,8),
(7372,114,637,9),
(7373,114,638,10),
(7374,115,631,0),
(7375,115,632,1),
(7376,115,639,2),
(7377,115,640,3),
(7378,115,440,4),
(7379,115,641,5),
(7380,115,642,6),
(7381,115,643,7),
(7382,115,445,8),
(7383,115,644,9),
(7384,115,179,10),
(7385,115,635,11),
(7386,115,305,12),
(7387,115,645,13),
(7388,115,646,14),
(7389,115,647,15),
(7390,115,648,16),
(7391,115,649,17),
(7392,115,650,18),
(7393,115,633,19),
(7394,115,634,20),
(7395,115,635,21),
(7396,115,651,22),
(7397,115,652,23),
(7398,115,653,24),
(7399,115,654,25),
(7400,115,629,26),
(7401,115,655,27),
(7402,115,633,28),
(7403,115,656,29),
(7404,115,636,30),
(7405,115,635,31),
(7406,115,657,32),
(7407,115,631,33),
(7408,115,632,34),
(7409,115,637,35),
(7410,115,638,36),
(7411,115,516,37),
(7412,115,651,38),
(7413,115,440,39),
(7414,115,189,40),
(7415,115,112,41),
(7416,115,658,42),
(7417,115,659,43),
(7418,115,660,44),
(7419,115,108,45),
(7420,115,323,46),
(7421,115,133,47),
(7422,115,661,48),
(7423,115,189,49),
(7424,115,112,50),
(7425,115,661,51),
(7426,115,655,52),
(7427,115,662,53),
(7428,115,663,54),
(7429,115,664,55),
(7430,115,665,56),
(7431,115,655,57),
(7432,115,666,58),
(7433,115,667,59),
(7434,115,668,60),
(7435,115,459,61),
(7436,115,669,62),
(7437,115,670,63),
(7438,115,629,64),
(7439,115,638,65),
(7440,115,133,66),
(7441,115,112,67),
(7442,115,580,68),
(7443,115,637,69),
(7444,115,410,70),
(7445,115,661,71),
(7446,115,655,72),
(7447,115,671,73),
(7448,115,672,74),
(7449,115,673,75),
(7450,115,674,76),
(7451,115,657,77),
(7452,115,604,78),
(7453,115,424,79),
(7454,115,661,80),
(7455,115,675,81),
(7456,115,356,82),
(7457,115,633,83),
(7458,115,634,84),
(7459,115,635,85),
(7460,115,636,86),
(7461,115,635,87),
(7462,115,179,88),
(7463,115,676,89),
(7464,115,173,90),
(7465,115,677,91),
(7466,115,423,92),
(7467,115,441,93),
(7468,115,661,94),
(7469,115,631,95),
(7470,115,632,96),
(7471,115,678,97),
(7472,115,679,98),
(7473,115,680,99),
(7474,115,496,100),
(7475,115,156,101),
(7476,115,681,102),
(7477,115,682,103),
(7478,115,356,104),
(7479,115,633,105),
(7480,115,634,106),
(7481,115,636,107),
(7482,115,635,108),
(7483,115,637,109),
(7484,115,638,110),
(7485,115,661,111),
(7486,115,655,112),
(7487,115,683,113),
(7488,115,684,114),
(7489,115,685,115),
(7490,115,666,116),
(7491,115,667,117),
(7492,115,668,118),
(7493,115,459,119),
(7494,115,683,120),
(7495,115,686,121),
(7496,115,687,122),
(7497,115,688,123),
(7498,115,685,124),
(7499,115,689,125),
(7500,115,690,126),
(7501,115,663,127),
(7502,115,691,128),
(7503,115,692,129),
(7504,115,112,130),
(7505,115,490,131),
(7506,115,693,132),
(7507,115,694,133),
(7508,115,695,134),
(7509,115,696,135),
(7510,115,664,136),
(7511,115,633,137),
(7512,115,634,138),
(7513,115,635,139),
(7514,115,691,140),
(7515,115,697,141),
(7516,115,602,142),
(7517,115,637,143),
(7518,115,637,144),
(7519,115,688,145),
(7520,115,691,146),
(7521,115,636,147),
(7522,115,635,148),
(7523,115,696,149),
(7524,115,664,150),
(7525,115,698,151),
(7526,115,64,152),
(7527,115,699,153),
(7528,115,700,154),
(7529,115,602,155),
(7530,115,637,156),
(7531,115,637,157),
(7532,115,688,158),
(7533,115,644,159),
(7534,115,123,160),
(7535,115,701,161),
(7536,115,702,162),
(7537,115,696,163),
(7538,115,703,164),
(7539,115,704,165),
(7540,115,440,166),
(7541,115,189,167),
(7542,115,226,168),
(7543,115,691,169),
(7544,115,705,170),
(7545,115,706,171),
(7546,115,707,172),
(7547,115,708,173),
(7548,115,709,174),
(7549,115,710,175),
(7550,115,632,176),
(7551,115,701,177),
(7552,115,5,178),
(7553,115,79,179),
(7554,115,629,180),
(7555,115,711,181),
(7556,115,633,182),
(7557,115,634,183),
(7558,115,636,184),
(7559,115,635,185),
(7560,115,712,186),
(7561,115,713,187),
(7562,115,58,188),
(7563,115,714,189),
(7564,115,440,190),
(7565,115,715,191),
(7566,115,691,192),
(7567,115,692,193),
(7568,115,97,194),
(7569,115,716,195),
(7570,115,717,196),
(7571,115,661,197),
(7572,115,189,198),
(7573,115,718,199),
(7574,115,659,200),
(7575,115,633,201),
(7576,115,634,202),
(7577,115,635,203),
(7578,115,692,204),
(7579,115,469,205),
(7580,115,112,206),
(7581,115,412,207),
(7582,115,660,208),
(7583,115,719,209),
(7584,115,720,210),
(7585,117,440,0),
(8074,121,721,0),
(8075,121,722,1),
(8076,121,3,2),
(8077,121,723,3),
(8078,122,724,0),
(8079,122,725,1),
(8080,122,195,2),
(8081,122,726,3),
(8082,122,108,4),
(8083,122,727,5),
(8084,122,728,6),
(8085,122,729,7),
(8086,123,540,0),
(8087,123,730,1),
(8088,123,731,2),
(8089,123,732,3),
(8090,123,733,4),
(8091,123,734,5),
(8092,123,735,6),
(8093,123,181,7),
(8094,123,736,8),
(8095,123,737,9),
(8096,123,314,10),
(8097,123,541,11),
(8098,123,298,12),
(8099,123,19,13),
(8100,123,738,14),
(8101,123,121,15),
(8102,123,739,16),
(8103,123,726,17),
(8104,123,108,18),
(8105,123,740,19),
(8106,123,727,20),
(8107,123,728,21),
(8108,123,729,22),
(8109,123,741,23),
(8110,123,742,24),
(8111,123,381,25),
(8112,123,743,26),
(8113,123,744,27),
(8114,123,3,28),
(8115,123,745,29),
(8116,123,746,30),
(8117,123,213,31),
(8118,123,747,32),
(8119,123,748,33),
(8120,123,749,34),
(8121,123,155,35),
(8122,123,750,36),
(8123,123,3,37),
(8124,123,751,38),
(8125,123,186,39),
(8126,123,752,40),
(8127,123,753,41),
(8128,123,725,42),
(8129,123,195,43),
(8130,123,214,44),
(8131,123,754,45),
(8132,123,496,46),
(8133,123,19,47),
(8134,123,755,48),
(8135,123,496,49),
(8136,123,744,50),
(8137,123,251,51),
(8138,123,756,52),
(8139,123,195,53),
(8140,123,757,54),
(8141,123,758,55),
(8142,123,759,56),
(8143,123,760,57),
(8144,123,761,58),
(8145,123,762,59),
(8146,123,763,60),
(8147,123,135,61),
(8148,123,764,62),
(8149,123,213,63),
(8150,123,725,64),
(8151,123,195,65),
(8152,123,765,66),
(8153,123,3,67),
(8154,123,585,68),
(8155,123,766,69),
(8156,123,767,70),
(8157,123,761,71),
(8158,123,639,72),
(8159,123,768,73),
(8160,123,769,74),
(8161,123,770,75),
(8162,123,771,76),
(8163,123,381,77),
(8164,123,772,78),
(8165,123,773,79),
(8166,123,774,80),
(8167,123,3,81),
(8168,123,155,82),
(8169,123,775,83),
(8170,123,776,84),
(8171,123,749,85),
(8172,123,777,86),
(8173,123,19,87),
(8174,123,778,88),
(8175,123,747,89),
(8176,123,779,90),
(8177,123,780,91),
(8178,123,324,92),
(8179,123,241,93),
(8180,125,731,0),
(8181,125,732,1),
(8182,125,735,2),
(8183,125,741,3),
(8184,125,742,4),
(8185,125,749,5),
(8186,125,777,6),
(8187,125,738,7),
(8188,125,121,8),
(8189,125,739,9),
(8190,125,774,10),
(8191,125,324,11),
(8192,125,241,12),
(8728,129,781,0),
(8729,129,782,1),
(8730,129,3,2),
(8731,129,783,3),
(8732,130,784,0),
(8733,130,785,1),
(8734,130,423,2),
(8735,130,786,3),
(8736,131,244,0),
(8737,131,787,1),
(8738,131,785,2),
(8739,131,784,3),
(8740,131,423,4),
(8741,131,214,5),
(8742,131,232,6),
(8743,131,788,7),
(8744,131,789,8),
(8745,131,786,9),
(8746,131,790,10),
(8747,131,791,11),
(8748,131,785,12),
(8749,131,326,13),
(8750,131,792,14),
(8751,131,793,15),
(8752,131,300,16),
(8753,131,794,17),
(8754,131,790,18),
(8755,131,785,19),
(8756,131,784,20),
(8757,131,795,21),
(8758,131,796,22),
(8759,131,797,23),
(8760,131,798,24),
(8761,131,799,25),
(8762,131,72,26),
(8763,131,800,27),
(8764,131,44,28),
(8765,131,801,29),
(8766,131,798,30),
(8767,131,802,31),
(8768,131,791,32),
(8769,131,785,33),
(8770,131,784,34),
(8771,131,44,35),
(8772,131,801,36),
(8773,131,800,37),
(8774,131,75,38),
(8775,131,803,39),
(8776,131,7,40),
(8777,131,804,41),
(8778,131,805,42),
(8779,131,806,43),
(8780,131,807,44),
(8781,131,808,45),
(8782,131,799,46),
(8783,131,809,47),
(8784,131,800,48),
(8785,131,423,49),
(8786,131,214,50),
(8787,131,810,51),
(8788,131,811,52),
(8789,131,788,53),
(8790,131,790,54),
(8791,131,785,55),
(8792,131,812,56),
(8793,131,813,57),
(8794,131,814,58),
(8795,131,815,59),
(8796,131,816,60),
(8797,131,619,61),
(8798,131,817,62),
(8799,131,818,63),
(8800,131,819,64),
(8801,131,813,65),
(8802,131,820,66),
(8803,131,821,67),
(8804,131,820,68),
(8805,131,791,69),
(8806,131,785,70),
(8807,131,822,71),
(8808,131,823,72),
(8809,131,824,73),
(8810,131,825,74),
(8811,131,44,75),
(8812,131,826,76),
(8813,131,827,77),
(8814,131,828,78),
(8815,131,791,79),
(8816,131,829,80),
(8817,131,646,81),
(8818,131,784,82),
(8819,131,807,83),
(8820,131,830,84),
(8821,131,831,85),
(8822,131,791,86),
(8823,131,832,87),
(8824,131,833,88),
(8825,131,784,89),
(8826,131,807,90),
(8827,131,834,91),
(8828,131,835,92),
(8829,131,617,93),
(8830,131,836,94),
(8831,131,837,95),
(8832,131,47,96),
(8833,131,838,97),
(8834,131,839,98),
(9580,137,840,0),
(9581,137,841,1),
(9582,137,842,2),
(9583,137,3,3),
(9584,138,5,0),
(9585,138,361,1),
(9586,138,557,2),
(9587,138,843,3),
(9588,138,616,4),
(9589,138,574,5),
(9590,138,80,6),
(9591,138,81,7),
(9592,138,82,8),
(9593,138,21,9),
(9594,138,22,10),
(9595,138,578,11),
(9596,139,555,0),
(9597,139,155,1),
(9598,139,469,2),
(9599,139,844,3),
(9600,139,845,4),
(9601,139,846,5),
(9602,139,847,6),
(9603,139,848,7),
(9604,139,849,8),
(9605,139,643,9),
(9606,139,850,10),
(9607,139,381,11),
(9608,139,8,12),
(9609,139,851,13),
(9610,139,852,14),
(9611,139,853,15),
(9612,139,854,16),
(9613,139,855,17),
(9614,139,848,18),
(9615,139,798,19),
(9616,139,856,20),
(9617,139,857,21),
(9618,139,858,22),
(9619,139,577,23),
(9620,139,638,24),
(9621,139,859,25),
(9622,139,846,26),
(9623,139,860,27),
(9624,139,861,28),
(9625,139,862,29),
(9626,139,863,30),
(9627,139,577,31),
(9628,139,860,32),
(9629,139,483,33),
(9630,139,864,34),
(9631,139,865,35),
(9632,139,847,36),
(9633,139,8,37),
(9634,139,59,38),
(9635,139,82,39),
(9636,139,862,40),
(9637,139,863,41),
(9638,139,750,42),
(9639,139,866,43),
(9640,139,846,44),
(9641,139,867,45),
(9642,139,868,46),
(9643,139,869,47),
(9644,139,870,48),
(9645,139,285,49),
(9646,139,10,50),
(9647,139,447,51),
(9648,139,871,52),
(9649,139,563,53),
(9650,139,872,54),
(9651,139,873,55),
(9652,139,874,56),
(9653,139,875,57),
(9654,139,876,58),
(9655,139,877,59),
(9656,139,31,60),
(9657,139,878,61),
(9658,139,879,62),
(9659,139,447,63),
(9660,139,846,64),
(9661,139,880,65),
(9662,139,881,66),
(9663,139,882,67),
(9664,139,839,68),
(9665,139,883,69),
(9666,139,8,70),
(9667,139,70,71),
(9668,139,589,72),
(9669,139,694,73),
(9670,139,884,74),
(9671,139,875,75),
(9672,139,871,76),
(9673,139,63,77),
(9674,139,885,78),
(9675,139,883,79),
(9676,139,886,80),
(9677,139,847,81),
(9678,139,887,82),
(9679,139,285,83),
(9680,139,888,84),
(9681,139,638,85),
(9682,139,889,86),
(9683,139,890,87),
(9684,139,891,88),
(9685,139,892,89),
(9686,139,830,90),
(9687,139,893,91),
(9688,139,894,92),
(9689,139,895,93),
(9690,139,896,94),
(9691,139,897,95),
(9692,139,898,96),
(9693,139,899,97),
(9694,139,900,98),
(9695,139,894,99),
(9696,139,860,100),
(9697,139,901,101),
(9698,139,902,102),
(9699,139,903,103),
(9700,139,904,104),
(9701,139,905,105),
(9702,139,902,106),
(9703,139,906,107),
(9704,139,907,108),
(9705,139,878,109),
(9706,139,908,110),
(9707,139,112,111),
(9708,139,909,112),
(9709,139,910,113),
(9710,139,911,114),
(9711,139,912,115),
(9712,139,555,116),
(9713,139,913,117),
(9714,139,846,118),
(9715,139,10,119),
(9716,139,914,120),
(9717,139,852,121),
(9718,139,641,122),
(9719,139,39,123),
(9720,139,915,124),
(9721,139,57,125),
(9722,139,785,126),
(9723,139,916,127),
(9724,139,453,128),
(9725,139,917,129),
(9726,141,846,0),
(9727,141,625,1),
(9728,141,626,2),
(10264,145,918,0),
(10265,145,919,1),
(10266,145,3,2),
(10267,145,920,3),
(10268,146,921,0),
(10269,146,21,1),
(10270,146,922,2),
(10271,146,923,3),
(10272,146,924,4),
(10273,146,559,5),
(10274,146,925,6),
(10275,146,926,7),
(10276,146,927,8),
(10277,146,928,9),
(10278,146,929,10),
(10279,146,930,11),
(10280,146,931,12),
(10281,147,921,0),
(10282,147,21,1),
(10283,147,922,2),
(10284,147,923,3),
(10285,147,932,4),
(10286,147,924,5),
(10287,147,933,6),
(10288,147,925,7),
(10289,147,934,8),
(10290,147,926,9),
(10291,147,927,10),
(10292,147,928,11),
(10293,147,619,12),
(10294,147,935,13),
(10295,147,936,14),
(10296,147,131,15),
(10297,147,937,16),
(10298,147,938,17),
(10299,147,927,18),
(10300,147,928,19),
(10301,147,939,20),
(10302,147,940,21),
(10303,147,941,22),
(10304,147,942,23),
(10305,147,943,24),
(10306,147,944,25),
(10307,147,945,26),
(10308,147,946,27),
(10309,147,947,28),
(10310,147,926,29),
(10311,147,927,30),
(10312,147,928,31),
(10313,147,948,32),
(10314,147,949,33),
(10315,147,923,34),
(10316,147,950,35),
(10317,147,131,36),
(10318,147,947,37),
(10319,147,619,38),
(10320,147,935,39),
(10321,147,936,40),
(10322,147,951,41),
(10323,147,952,42),
(10324,147,953,43),
(10325,147,954,44),
(10326,147,955,45),
(10327,147,89,46),
(10328,147,947,47),
(10329,147,956,48),
(10330,147,957,49),
(10331,147,936,50),
(10332,147,21,51),
(10333,147,958,52),
(10334,147,55,53),
(10335,147,947,54),
(10336,147,926,55),
(10337,147,929,56),
(10338,147,959,57),
(10339,147,21,58),
(10340,147,922,59),
(10341,147,619,60),
(10342,147,960,61),
(10343,147,149,62),
(10344,147,961,63),
(10345,147,924,64),
(10346,147,559,65),
(10347,147,54,66),
(10348,147,921,67),
(10349,147,923,68),
(10350,147,962,69),
(10351,147,963,70),
(10352,147,924,71),
(10353,147,964,72),
(10354,147,923,73),
(10355,147,21,74),
(10356,147,958,75),
(10357,147,950,76),
(10358,147,965,77),
(10359,147,947,78),
(10360,147,926,79),
(10361,147,927,80),
(10362,147,928,81),
(10363,147,222,82),
(10364,147,966,83),
(10365,147,923,84),
(10366,147,925,85),
(10367,147,424,86),
(10368,147,927,87),
(10369,147,831,88),
(10370,147,381,89),
(10636,153,967,0),
(10637,153,968,1),
(10638,153,3,2),
(10639,153,102,3),
(10640,154,118,0),
(10641,154,969,1),
(10642,154,189,2),
(10643,154,970,3),
(10644,154,971,4),
(10645,154,972,5),
(10646,155,973,0),
(10647,155,519,1),
(10648,155,974,2),
(10649,155,130,3),
(10650,155,975,4),
(10651,155,976,5),
(10652,155,519,6),
(10653,155,977,7),
(10654,155,978,8),
(10655,155,974,9),
(10656,155,979,10),
(10657,155,980,11),
(10658,155,981,12),
(10659,155,982,13),
(10660,155,983,14),
(10661,155,984,15),
(10662,155,431,16),
(10663,155,985,17),
(10664,155,906,18),
(10665,155,986,19),
(10666,155,987,20),
(10667,155,988,21),
(10668,155,342,22),
(10669,155,825,23),
(10670,155,979,24),
(10671,155,989,25),
(10672,155,984,26),
(10673,155,990,27),
(10674,155,868,28),
(10675,155,991,29),
(10676,155,760,30),
(10677,155,974,31),
(10678,155,992,32),
(10679,155,983,33),
(10680,155,984,34),
(10681,155,431,35),
(10682,155,96,36),
(10683,155,54,37),
(10684,157,118,0),
(10685,157,969,1),
(10686,157,189,2),
(10687,157,970,3),
(10688,157,993,4),
(10697,161,994,0),
(10698,161,995,1),
(10699,161,996,2),
(10700,161,994,3),
(10701,161,995,4),
(10702,161,996,5),
(10703,162,997,0),
(10704,162,998,1),
(10705,162,998,2),
(10706,162,997,3),
(10707,162,998,4),
(10708,162,998,5),
(10709,165,181,0),
(10710,165,348,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES
(1,1,1,NULL),
(2,1,2,NULL),
(3,1,4,NULL),
(4,1,16,NULL),
(5,1,17,NULL),
(6,1,8,NULL),
(7,1,32,NULL),
(8,1,64,NULL),
(9,2,1,NULL),
(10,2,2,NULL),
(11,2,4,NULL),
(12,2,16,NULL),
(13,2,17,NULL),
(14,2,8,NULL),
(15,2,32,NULL),
(16,2,64,NULL),
(25,3,1,NULL),
(26,3,2,NULL),
(27,3,4,NULL),
(28,3,16,NULL),
(29,3,17,NULL),
(30,3,8,NULL),
(31,3,32,NULL),
(32,3,64,NULL),
(33,4,1,NULL),
(34,4,2,NULL),
(35,4,4,NULL),
(36,4,16,NULL),
(37,4,17,NULL),
(38,4,8,NULL),
(39,4,32,NULL),
(40,4,64,NULL),
(49,5,1,NULL),
(50,5,2,NULL),
(51,5,4,NULL),
(52,5,16,NULL),
(53,5,17,NULL),
(54,5,8,NULL),
(55,5,32,NULL),
(56,5,64,NULL),
(57,6,1,NULL),
(58,6,2,NULL),
(59,6,4,NULL),
(60,6,16,NULL),
(61,6,17,NULL),
(62,6,8,NULL),
(63,6,32,NULL),
(64,6,64,NULL),
(65,7,1,NULL),
(66,7,2,NULL),
(67,7,4,NULL),
(68,7,16,NULL),
(69,7,17,NULL),
(70,7,8,NULL),
(71,7,32,NULL),
(72,7,64,NULL),
(73,8,1,NULL),
(74,8,2,NULL),
(75,8,4,NULL),
(76,8,16,NULL),
(77,8,17,NULL),
(78,8,8,NULL),
(79,8,32,NULL),
(80,8,64,NULL),
(81,9,1,NULL),
(82,9,2,NULL),
(83,9,4,NULL),
(84,9,16,NULL),
(85,9,17,NULL),
(86,9,8,NULL),
(87,9,32,NULL),
(88,9,64,NULL),
(89,10,1,NULL),
(90,10,2,NULL),
(91,10,4,NULL),
(92,10,16,NULL),
(93,10,17,NULL),
(94,10,8,NULL),
(95,10,32,NULL),
(96,10,64,NULL),
(97,11,1,NULL),
(98,11,2,NULL),
(99,11,4,NULL),
(100,11,16,NULL),
(101,11,17,NULL),
(102,11,8,NULL),
(103,11,32,NULL),
(104,11,64,NULL),
(105,12,1,NULL),
(106,12,2,NULL),
(107,12,4,NULL),
(108,12,16,NULL),
(109,12,17,NULL),
(110,12,8,NULL),
(111,12,32,NULL),
(112,12,64,NULL),
(113,13,1,NULL),
(114,13,2,NULL),
(115,13,4,NULL),
(116,13,16,NULL),
(117,13,17,NULL),
(118,13,8,NULL),
(119,13,32,NULL),
(120,13,64,NULL),
(121,14,1,NULL),
(122,14,2,NULL),
(123,14,4,NULL),
(124,14,16,NULL),
(125,14,17,NULL),
(126,14,8,NULL),
(127,14,32,NULL),
(128,14,64,NULL),
(129,15,1,NULL),
(130,15,2,NULL),
(131,15,4,NULL),
(132,15,16,NULL),
(133,15,17,NULL),
(134,15,8,NULL),
(135,15,32,NULL),
(136,15,64,NULL),
(137,16,1,NULL),
(138,16,2,NULL),
(139,16,4,NULL),
(140,16,16,NULL),
(141,16,17,NULL),
(142,16,8,NULL),
(143,16,32,NULL),
(144,16,64,NULL),
(145,17,1,NULL),
(146,17,2,NULL),
(147,17,4,NULL),
(148,17,16,NULL),
(149,17,17,NULL),
(150,17,8,NULL),
(151,17,32,NULL),
(152,17,64,NULL),
(153,18,1,NULL),
(154,18,2,NULL),
(155,18,4,NULL),
(156,18,16,NULL),
(157,18,17,NULL),
(158,18,8,NULL),
(159,18,32,NULL),
(160,18,64,NULL),
(161,19,1,NULL),
(162,19,2,NULL),
(163,19,4,NULL),
(164,19,16,NULL),
(165,19,17,NULL),
(166,19,8,NULL),
(167,19,32,NULL),
(168,19,64,NULL);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Localized data about submissions';
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
  `stage_id` bigint(20) NOT NULL DEFAULT 5,
  `locale` varchar(28) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_current_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_current_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(1,1,1,'2025-01-16 05:18:18','2025-01-16 05:18:18','2025-01-16 05:18:18',5,'en',1,'',0),
(2,1,2,'2025-01-16 05:19:23','2025-01-16 05:19:15','2025-01-16 05:19:15',5,'en',3,'',0),
(3,1,4,'2025-01-16 05:20:06','2025-01-16 05:19:42','2025-01-16 05:19:42',5,'en',3,'',0),
(4,1,5,'2025-01-16 05:20:25','2025-01-16 05:20:25','2025-01-16 05:20:25',5,'en',4,'',0),
(5,1,6,'2025-01-16 05:21:16','2025-01-16 05:21:00','2025-01-16 05:21:00',5,'en',3,'',0),
(6,1,7,'2025-01-16 05:21:38','2025-01-16 05:21:34','2025-01-16 05:21:34',5,'en',3,'',0),
(7,1,8,'2025-01-16 05:22:02','2025-01-16 05:21:57','2025-01-16 05:21:57',5,'en',3,'',0),
(8,1,9,'2025-01-16 05:22:25','2025-01-16 05:22:20','2025-01-16 05:22:20',5,'en',3,'',0),
(9,1,10,'2025-01-16 05:22:48','2025-01-16 05:22:43','2025-01-16 05:22:43',5,'en',3,'',0),
(10,1,11,'2025-01-16 05:23:11','2025-01-16 05:23:06','2025-01-16 05:23:06',5,'en',3,'',0),
(11,1,12,'2025-01-16 05:23:34','2025-01-16 05:23:30','2025-01-16 05:23:30',5,'en',3,'',0),
(12,1,13,'2025-01-16 05:23:57','2025-01-16 05:23:53','2025-01-16 05:23:53',5,'en',3,'',0),
(13,1,14,'2025-01-16 05:24:20','2025-01-16 05:24:16','2025-01-16 05:24:16',5,'en',3,'',0),
(14,1,15,'2025-01-16 05:24:44','2025-01-16 05:24:39','2025-01-16 05:24:39',5,'en',3,'',0),
(15,1,16,'2025-01-16 05:25:07','2025-01-16 05:25:02','2025-01-16 05:25:02',5,'en',3,'',0),
(16,1,17,'2025-01-16 05:25:30','2025-01-16 05:25:25','2025-01-16 05:25:25',5,'en',3,'',0),
(17,1,18,'2025-01-16 05:25:53','2025-01-16 05:25:48','2025-01-16 05:25:48',5,'en',3,'',0),
(18,1,19,'2025-01-16 05:26:16','2025-01-16 05:26:11','2025-01-16 05:26:11',5,'en',3,'',0),
(19,1,20,'2025-01-16 05:26:39','2025-01-16 05:26:34','2025-01-16 05:26:34',5,'en',3,'',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
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
  `usage_stats_temp_institution_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usitr_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  `usage_stats_temp_total_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  `usage_stats_temp_unique_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  KEY `usii_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  `usage_stats_temp_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
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
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  KEY `usir_load_id_context_id_ip` (`load_id`,`context_id`,`ip`),
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  `user_group_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES
(1,2,'','nameLocaleKey','default.groups.name.manager'),
(2,2,'','abbrevLocaleKey','default.groups.abbrev.manager'),
(3,2,'en','name','Preprint Server manager'),
(4,2,'en','abbrev','PSM'),
(5,2,'fr_CA','name','##default.groups.name.manager##'),
(6,2,'fr_CA','abbrev','##default.groups.abbrev.manager##'),
(7,3,'','nameLocaleKey','default.groups.name.sectionEditor'),
(8,3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),
(9,3,'en','name','Moderator'),
(10,3,'en','abbrev','MOD'),
(11,3,'fr_CA','name','##default.groups.name.sectionEditor##'),
(12,3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##'),
(13,4,'','nameLocaleKey','default.groups.name.author'),
(14,4,'','abbrevLocaleKey','default.groups.abbrev.author'),
(15,4,'en','name','Author'),
(16,4,'en','abbrev','AU'),
(17,4,'fr_CA','name','Auteur-e'),
(18,4,'fr_CA','abbrev','AU'),
(19,5,'','nameLocaleKey','default.groups.name.reader'),
(20,5,'','abbrevLocaleKey','default.groups.abbrev.reader'),
(21,5,'en','name','Reader'),
(22,5,'en','abbrev','Read'),
(23,5,'fr_CA','name','Lecteur-trice'),
(24,5,'fr_CA','abbrev','Lect'),
(25,6,'','nameLocaleKey','default.groups.name.editorialBoardMember'),
(26,6,'','abbrevLocaleKey','default.groups.abbrev.editorialBoardMember'),
(27,6,'en','name','Editorial Board Member'),
(28,6,'en','abbrev','EBM'),
(29,6,'fr_CA','name','##default.groups.name.editorialBoardMember##'),
(30,6,'fr_CA','abbrev','##default.groups.abbrev.editorialBoardMember##');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES
(1,1,2,1),
(2,1,2,5),
(3,1,3,1),
(4,1,3,5),
(5,1,4,1),
(6,1,4,5);
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
  `context_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0,
  `permit_settings` smallint(6) NOT NULL DEFAULT 0,
  `masthead` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_role_id` (`role_id`),
  CONSTRAINT `user_groups_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES
(1,NULL,1,1,1,0,0,1,0),
(2,1,16,1,1,0,1,1,0),
(3,1,17,1,1,0,1,0,1),
(4,1,65536,1,1,1,1,0,0),
(5,1,1048576,1,1,1,0,0,0),
(6,1,4097,1,1,0,0,0,1);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
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
  `user_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES
(1,1,'en','familyName','admin'),
(2,1,'en','givenName','admin'),
(3,2,'en','affiliation','Universidad Nacional Autónoma de México'),
(4,2,'fr_CA','affiliation','Mexico'),
(5,2,'en','familyName','Vaca'),
(6,2,'fr_CA','familyName','Vaca'),
(7,2,'en','givenName','Ramiro'),
(8,2,'fr_CA','givenName','Ramiro'),
(9,3,'en','affiliation','University of Melbourne'),
(10,3,'fr_CA','affiliation','Australia'),
(11,3,'en','familyName','Barnes'),
(12,3,'fr_CA','familyName','Barnes'),
(13,3,'en','givenName','Daniel'),
(14,3,'fr_CA','givenName','Daniel'),
(15,4,'en','affiliation','University of Chicago'),
(16,4,'fr_CA','affiliation','United States'),
(17,4,'en','familyName','Buskins'),
(18,4,'fr_CA','familyName','Buskins'),
(19,4,'en','givenName','David'),
(20,4,'fr_CA','givenName','David'),
(21,5,'en','affiliation','University of Toronto'),
(22,5,'fr_CA','affiliation','Canada'),
(23,5,'en','familyName','Berardo'),
(24,5,'fr_CA','familyName','Berardo'),
(25,5,'en','givenName','Stephanie'),
(26,5,'fr_CA','givenName','Stephanie'),
(27,6,'en','affiliation','Kyoto University'),
(28,6,'fr_CA','affiliation','Japan'),
(29,6,'en','familyName','Inoue'),
(30,6,'fr_CA','familyName','Inoue'),
(31,6,'en','givenName','Minoti'),
(32,6,'fr_CA','givenName','Minoti'),
(33,7,'en','affiliation','University of Bologna'),
(34,7,'en','familyName','Corino'),
(35,7,'en','givenName','Carlo'),
(36,8,'en','affiliation','University of Windsor'),
(37,8,'en','familyName','Kwantes'),
(38,8,'en','givenName','Catherine'),
(39,9,'en','affiliation','University of Alberta'),
(40,9,'en','familyName','Montgomerie'),
(41,9,'en','givenName','Craig'),
(42,10,'en','affiliation','Alexandria University'),
(43,10,'en','familyName','Diouf'),
(44,10,'en','givenName','Diaga'),
(45,11,'en','affiliation','University of Toronto'),
(46,11,'en','familyName','Phillips'),
(47,11,'en','givenName','Dana'),
(48,12,'en','affiliation','University College Cork'),
(49,12,'en','familyName','Sokoloff'),
(50,12,'en','givenName','Domatilia'),
(51,13,'en','affiliation','Indiana University'),
(52,13,'en','familyName','Ostrom'),
(53,13,'en','givenName','Elinor'),
(54,14,'en','affiliation','University of Rome'),
(55,14,'en','familyName','Paglieri'),
(56,14,'en','givenName','Fabio'),
(57,15,'en','affiliation','University of Cape Town'),
(58,15,'en','familyName','Mwandenga'),
(59,15,'en','givenName','John'),
(60,16,'en','affiliation','Aalborg University'),
(61,16,'en','familyName','Novak'),
(62,16,'en','givenName','John'),
(63,17,'en','affiliation','Stanford University'),
(64,17,'en','familyName','Al-Khafaji'),
(65,17,'en','givenName','Karim'),
(66,18,'en','affiliation','Australian National University'),
(67,18,'en','familyName','Christopher'),
(68,18,'en','givenName','Leo'),
(69,19,'en','affiliation','University of Cape Town'),
(70,19,'en','familyName','Kumiega'),
(71,19,'en','givenName','Lise'),
(72,20,'en','affiliation','University of Wolverhampton'),
(73,20,'en','familyName','Daniel'),
(74,20,'en','givenName','Patricia'),
(75,21,'en','affiliation','University of Nairobi'),
(76,21,'en','familyName','Baiyewu'),
(77,21,'en','givenName','Rana'),
(78,22,'en','affiliation','Barcelona University'),
(79,22,'en','familyName','Rossi'),
(80,22,'en','givenName','Rosanna'),
(81,23,'en','affiliation','University of Tehran'),
(82,23,'en','familyName','Karbasizaed'),
(83,23,'en','givenName','Vajiheh'),
(84,24,'en','affiliation','University of Windsor'),
(85,24,'en','familyName','Williamson'),
(86,24,'en','givenName','Valerie'),
(87,25,'en','affiliation','CUNY'),
(88,25,'en','familyName','Woods'),
(89,25,'en','givenName','Zita');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `masthead` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_user_group_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES
(1,1,1,'2025-01-16 05:14:53',NULL,NULL),
(2,2,1,NULL,NULL,NULL),
(3,2,2,'2025-01-16 00:00:00',NULL,1),
(4,2,3,'2025-01-16 00:00:00',NULL,1),
(5,3,4,'2025-01-16 00:00:00',NULL,1),
(6,3,5,'2025-01-16 00:00:00',NULL,1),
(7,3,6,'2025-01-16 00:00:00',NULL,1),
(8,5,7,'2025-01-16 05:18:03',NULL,NULL),
(9,4,7,'2025-01-16 05:18:05',NULL,NULL),
(10,5,8,'2025-01-16 05:18:22',NULL,NULL),
(11,4,8,'2025-01-16 05:18:26',NULL,NULL),
(12,5,9,'2025-01-16 05:19:27',NULL,NULL),
(13,4,9,'2025-01-16 05:19:29',NULL,NULL),
(14,5,10,'2025-01-16 05:20:10',NULL,NULL),
(15,4,10,'2025-01-16 05:20:12',NULL,NULL),
(16,5,11,'2025-01-16 05:20:46',NULL,NULL),
(17,4,11,'2025-01-16 05:20:48',NULL,NULL),
(18,5,12,'2025-01-16 05:21:19',NULL,NULL),
(19,4,12,'2025-01-16 05:21:21',NULL,NULL),
(20,5,13,'2025-01-16 05:21:42',NULL,NULL),
(21,4,13,'2025-01-16 05:21:44',NULL,NULL),
(22,5,14,'2025-01-16 05:22:06',NULL,NULL),
(23,4,14,'2025-01-16 05:22:08',NULL,NULL),
(24,5,15,'2025-01-16 05:22:29',NULL,NULL),
(25,4,15,'2025-01-16 05:22:31',NULL,NULL),
(26,5,16,'2025-01-16 05:22:51',NULL,NULL),
(27,4,16,'2025-01-16 05:22:54',NULL,NULL),
(28,5,17,'2025-01-16 05:23:15',NULL,NULL),
(29,4,17,'2025-01-16 05:23:17',NULL,NULL),
(30,5,18,'2025-01-16 05:23:38',NULL,NULL),
(31,4,18,'2025-01-16 05:23:40',NULL,NULL),
(32,5,19,'2025-01-16 05:24:01',NULL,NULL),
(33,4,19,'2025-01-16 05:24:03',NULL,NULL),
(34,5,20,'2025-01-16 05:24:24',NULL,NULL),
(35,4,20,'2025-01-16 05:24:26',NULL,NULL),
(36,5,21,'2025-01-16 05:24:48',NULL,NULL),
(37,4,21,'2025-01-16 05:24:50',NULL,NULL),
(38,5,22,'2025-01-16 05:25:11',NULL,NULL),
(39,4,22,'2025-01-16 05:25:13',NULL,NULL),
(40,5,23,'2025-01-16 05:25:33',NULL,NULL),
(41,4,23,'2025-01-16 05:25:36',NULL,NULL),
(42,5,24,'2025-01-16 05:25:57',NULL,NULL),
(43,4,24,'2025-01-16 05:25:59',NULL,NULL),
(44,5,25,'2025-01-16 05:26:20',NULL,NULL),
(45,4,25,'2025-01-16 05:26:22',NULL,NULL);
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
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$10$1Ff0cjfVJrxUptYZxEUfRuyDwB/Y8KI4TFrViL850MYfUAJe3BwmK','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-01-16 05:14:53',NULL,'2025-01-16 05:17:38',NULL,NULL,NULL,0,NULL,1,NULL),
(2,'rvaca','$2y$10$BDpjTw1UNj21dp9RORRKr.OvLhQ/6c.x1c/O3kf7RMAfHlBEg1K5G','rvaca@mailinator.com',NULL,NULL,NULL,NULL,'MX','[]',NULL,NULL,'2025-01-16 05:16:03',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(3,'dbarnes','$2y$10$g4kprWjVKzJrZe.sMqD..uCr0zMKN3LPaC95L738r90elMj7EmenS','dbarnes@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2025-01-16 05:16:23',NULL,'2025-01-16 05:26:35',NULL,NULL,NULL,0,NULL,1,NULL),
(4,'dbuskins','$2y$10$omi46ORdyDfcOVGtOmXOEuvUZs8IbN4ZgE0ECm9yFmyZEr6vMNdFe','dbuskins@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-01-16 05:16:43',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(5,'sberardo','$2y$10$X8VSrp.qYc3IfxWAT7lJRugijCK6sIgemZa13V9dehmy30nGIlkm6','sberardo@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-01-16 05:17:05',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(6,'minoue','$2y$10$pKknJL0h/6l85LPWZwOsPeujfa33GfpgJgnekv74AEyYmOrLxYSx6','minoue@mailinator.com',NULL,NULL,NULL,NULL,'JP','[]',NULL,NULL,'2025-01-16 05:17:28',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),
(7,'ccorino','$2y$10$EFEcwmj1UF.RKjoXztmuvuJhoGsMRVabZW8m.UJGjza258b9sE4Wq','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2025-01-16 05:18:03',NULL,'2025-01-16 05:18:03',NULL,NULL,NULL,0,NULL,1,NULL),
(8,'ckwantes','$2y$10$BIAHODP9.z6sZ0.4I/CJEuZXAcf7SjZ3PNONPoE4GhGVtGGBO1o3K','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-01-16 05:18:22',NULL,'2025-01-16 05:18:22',NULL,NULL,NULL,0,NULL,1,NULL),
(9,'cmontgomerie','$2y$10$i8VJUEhLnaIBOo98pSvcW.bB4JMPM4Dg8DIJ0/igDs.B5WywNeFa.','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-01-16 05:19:27',NULL,'2025-01-16 05:19:27',NULL,NULL,NULL,0,NULL,1,NULL),
(10,'ddiouf','$2y$10$OB0Vmy2EmwPRuHUYPSP9f.KgjharrJwTUzyZ07uJKEenByxk46GYm','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2025-01-16 05:20:10',NULL,'2025-01-16 05:20:10',NULL,NULL,NULL,0,NULL,1,NULL),
(11,'dphillips','$2y$10$ujX66bXwD7MVpht0STJa6eJYcQR4EHN9zTjpNewspKOBja0qTALfu','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-01-16 05:20:46',NULL,'2025-01-16 05:20:46',NULL,NULL,NULL,0,NULL,1,NULL),
(12,'dsokoloff','$2y$10$w2ejpY8ihDS/k8rMEDVV/O1kgXL9kdHRAurLCl.LaNxk3nJ4HLKpS','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2025-01-16 05:21:19',NULL,'2025-01-16 05:21:19',NULL,NULL,NULL,0,NULL,1,NULL),
(13,'eostrom','$2y$10$AYYF9gsD03vqJo02jXfFrusYhiegqJL.vzAUNyAxCmOboq5URYlTy','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-01-16 05:21:42',NULL,'2025-01-16 05:21:42',NULL,NULL,NULL,0,NULL,1,NULL),
(14,'fpaglieri','$2y$10$U/DIt1WTxmL6JebYHW50RO/1vaktDhBScdUGAfistlVigxMKmz5mS','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2025-01-16 05:22:05',NULL,'2025-01-16 05:22:06',NULL,NULL,NULL,0,NULL,1,NULL),
(15,'jmwandenga','$2y$10$b5Vpn.jXdnN8sBKnmk2MJuLNChVsdSBH5S35fBZwlwQPSZ4NPWKSO','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-01-16 05:22:28',NULL,'2025-01-16 05:22:29',NULL,NULL,NULL,0,NULL,1,NULL),
(16,'jnovak','$2y$10$zc4P.vS4X5yTxMJkRAdy.epMs4hAn/Fb20N0MFtpnzPmJoGH5X75C','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2025-01-16 05:22:51',NULL,'2025-01-16 05:22:52',NULL,NULL,NULL,0,NULL,1,NULL),
(17,'kalkhafaji','$2y$10$pFBzuOTAjyYfwojHds1cneJYilVAyiTSmsZL14K/YOiOHi0oklC7G','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-01-16 05:23:14',NULL,'2025-01-16 05:23:15',NULL,NULL,NULL,0,NULL,1,NULL),
(18,'lchristopher','$2y$10$M0r9gTPDNZThdaprTiiI9e7wdtj5tt7.wMt3ft9fnyUW/Z6C6Ng9K','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2025-01-16 05:23:38',NULL,'2025-01-16 05:23:38',NULL,NULL,NULL,0,NULL,1,NULL),
(19,'lkumiega','$2y$10$JWCfkvrMx3BPP68aYGNjbuVSxUV7ZGLBgi5lTzr0N.p3CtfSK9zVG','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-01-16 05:24:01',NULL,'2025-01-16 05:24:01',NULL,NULL,NULL,0,NULL,1,NULL),
(20,'pdaniel','$2y$10$K5uC4NAbCh.44d3DbAF0ZeWFJ/xjSP3yyKxQ1hFYIX5r68RbaWcA2','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2025-01-16 05:24:24',NULL,'2025-01-16 05:24:24',NULL,NULL,NULL,0,NULL,1,NULL),
(21,'rbaiyewu','$2y$10$0oXXJhKDmC9igiGqrxbU8Oi7rHHQj51rCbILGL6rngf8KVNReZ2ja','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2025-01-16 05:24:48',NULL,'2025-01-16 05:24:48',NULL,NULL,NULL,0,NULL,1,NULL),
(22,'rrossi','$2y$10$Yy6ZrhMj1iTz5/CS8a.38OdLnLxEuCEkZ0ytQOjQfp5N29XITztQ6','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2025-01-16 05:25:11',NULL,'2025-01-16 05:25:11',NULL,NULL,NULL,0,NULL,1,NULL),
(23,'vkarbasizaed','$2y$10$tPgbwClPA4dyHDpJGDbiP.nJdwiUpfA9CB7/skYyz7rSqbmV1bUpi','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2025-01-16 05:25:33',NULL,'2025-01-16 05:25:34',NULL,NULL,NULL,0,NULL,1,NULL),
(24,'vwilliamson','$2y$10$tv./n.WfzM2P1aEHsuBEmO2WgCwGFd0NLDNDJvBe907hTRe0.Ttiy','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-01-16 05:25:57',NULL,'2025-01-16 05:25:57',NULL,NULL,NULL,0,NULL,1,NULL),
(25,'zwoods','$2y$10$36IFcLjcU6CozVqfp5tjW.po/pEDRwXRWBvIIwbKDK9erT9sf5hVm','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-01-16 05:26:20',NULL,'2025-01-16 05:26:20',NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `version_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES
(1,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.metadata','dc11','',0,0),
(2,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),
(3,1,0,1,0,'2025-01-16 05:14:53',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),
(4,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),
(5,0,1,0,0,'2025-01-16 05:14:53',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),
(6,1,0,1,0,'2025-01-16 05:14:53',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),
(7,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),
(8,1,2,0,0,'2025-01-16 05:14:53',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),
(9,1,1,0,0,'2025-01-16 05:14:53',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),
(10,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.generic','usageEvent','',0,0),
(11,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),
(12,2,2,0,0,'2025-01-16 05:14:53',1,'plugins.generic','crossref','',0,0),
(13,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),
(14,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.importexport','native','',0,0),
(15,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.oaiMetadataFormats','dc','',0,0),
(16,1,0,0,0,'2025-01-16 05:14:53',1,'plugins.themes','default','DefaultThemePlugin',1,0),
(17,3,5,0,0,'2025-01-16 05:14:49',1,'core','ops','',0,1);
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

-- Dump completed on 2025-01-16  5:26:39
